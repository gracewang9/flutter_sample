import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/home_entity.dart';
import '../../routes/app_routes.dart';
import 'logic.dart';
import 'state.dart';


@immutable
class HomeTabBarWidget extends StatelessWidget {
  HomeTabBarWidget({super.key});

  final HomeState state = HomeState();
  final List<Widget> children = <Widget>[
    _HomeWidget(),
    Container(
      alignment: Alignment.center,
      child: Text("历史", textScaler: TextScaler.linear(5)),
    ),
    Container(
      alignment: Alignment.center,
      child: Text("图片", textScaler: TextScaler.linear(5)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: state.tabs.length,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0.0,
          bottom: TabBar(
            dividerHeight: 0.0,
            tabs: state.tabs.map((value) => Tab(text: value,height: 20)).toList(),
          ),
        ),
        body: TabBarView(children: children),
      ),
    );
  }
}


@immutable
class _HomeWidget extends GetView<HomeLogic> {
  const _HomeWidget();

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
          ],
        ),
      ),
      onTap: () {
        var map = <String, String>{
          'htmlUrl': '${datas.link}',
          'title': '${datas.title}',
        };
        Get.toNamed(AppRoutes.detail, arguments: map);
      }, // => ,
    );
  }
}
