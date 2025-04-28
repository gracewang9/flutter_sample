import 'package:flutter/material.dart';
import 'package:flutter_sample/data/models/home_entity.dart';
import 'package:flutter_sample/page/home/home_controller.dart';
import 'package:flutter_sample/routes/app_routes.dart';
import 'package:get/get.dart';

import '../details/details_view.dart';

class HomeWidget extends GetView<HomeController> {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (data) => ListView.separated(
        itemBuilder: (context, index) {
          return _ListItemWidget(datas: data!.data!.datas![index]);
        },
        separatorBuilder: (context, index) {
          return Stack();
        },
        itemCount: data?.data!.datas?.length ?? 0,
      ),
      onError: (error) => Text('$error'),
      onEmpty: const Text('No data found'),
    );
  }
}

class _ListItemWidget extends StatelessWidget {
  const _ListItemWidget({required this.datas});

  final ArticleEntity datas;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 80.0,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        margin: EdgeInsets.all(5.0),
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.asset(
                    "images/androidIcon.png",
                    width: 40.0,
                    height: 40.0,
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 5.0)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      "${datas.author == "" ? datas.shareUser : datas.author}",
                      style: TextStyle(color: Colors.black, fontSize: 16.0),
                    ),
                    SizedBox(
                      width: 200.0,
                      child: Text(
                        "${datas.chapterName}",
                        style: TextStyle(color: Colors.grey, fontSize: 12.0),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Row(
            //   children: [
            //     SizedBox(
            //       width: 10.0,
            //       height: 10.0,
            //       child: Icon(Icons.share, color: Colors.grey),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
      onTap: () {
        // Get.to(DetailsPage(htmlUrl: '${datas.link}',title: '${datas.title}',));
        // Get.toNamed("${datas.link}");
        var map = <String, String>{
          'htmlUrl': '${datas.link}',
          'title': '${datas.title}',
        };

        Get.toNamed(AppRoutes.detail, arguments: map);
        // Get.snackbar("title", "message");
        // Get.defaultDialog(title: "Test",onConfirm: (){
        //   Get.back();
        // });
      }, // => ,
    );
  }
}
