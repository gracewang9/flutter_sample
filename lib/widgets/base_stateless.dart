import 'package:flutter/material.dart';

abstract class BaseStateless extends StatelessWidget {
  const BaseStateless({super.key, required this.title});

  final String title;

  // final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: body(context),
    );
  }

  @protected
  Widget body(BuildContext context);
}
