import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'details_logic.dart';
import 'details_state.dart';

// class DetailsPage extends GetView<DetailsLogic> {
//   DetailsPage({super.key});
//
//   final DetailsState state = Get.find<DetailsLogic>().state;
//
//   @override
//   Widget build(BuildContext context) {
//     // var html=controller
//     return Container(child: Text('${controller.count}'));
//   }
// }

@immutable
class DetailsPage extends StatefulWidget {
  DetailsPage({super.key});

  String htmlUrl = Get.arguments['htmlUrl'];
  String title = Get.arguments['title'];

  @override
  State<StatefulWidget> createState() => _HtmlWidgetState();
}

class _HtmlWidgetState extends State<DetailsPage> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller =
        WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setNavigationDelegate(
            NavigationDelegate(
              onProgress: (int progress) {
                CircularProgressIndicator(
                  value: progress.toDouble(),
                  backgroundColor: Colors.green,
                );
                // Update loading bar.
              },
              onPageStarted: (String url) {},
              onPageFinished: (String url) {},
              onHttpError: (HttpResponseError error) {},
              onWebResourceError: (WebResourceError error) {},
              onNavigationRequest: (NavigationRequest request) {
                if (request.url.startsWith('https://www.youtube.com/')) {
                  return NavigationDecision.prevent;
                }
                return NavigationDecision.navigate;
              },
            ),
          )
          ..loadRequest(Uri.parse(widget.htmlUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: WebViewWidget(controller: controller),
    );
  }
}
