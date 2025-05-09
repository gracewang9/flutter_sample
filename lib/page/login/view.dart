import 'package:flutter/material.dart';
import 'package:flutter_sample/core/network/interceptors/auth_service.dart';
import 'package:flutter_sample/routes/app_routes.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginLogic logic = Get.put(LoginLogic());
  final LoginState state = Get.find<LoginLogic>().state;
  final AuthService _auth = Get.find();

  void _handleLogin() {
    _auth.login();
    final fromRoute = Get.parameters['from'] ?? AppRoutes.home;
    Get.toNamed(fromRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(title: Text('login'.tr)),
      body: Container(
        child: Column(
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Image.asset(
                  'images/androidIcon.png',
                  width: 50.0,
                  height: 50.0,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            ElevatedButton(onPressed: _handleLogin, child: Text('login'.tr)),
          ],
        ),
      ),
    );
  }
}

// class _BottomAppBarDemoState extends State<BottomAppBarDemo> {
//   bool _showFab = true;
//   bool _showNotch = true;
//   FloatingActionButtonLocation _fabLocation = FloatingActionButtonLocation.endDocked;
//
//   void _onShowNotchChanged(bool value) {
//     setState(() {
//       _showNotch = value;
//     });
//   }
//
//   void _onShowFabChanged(bool value) {
//     setState(() {
//       _showFab = value;
//     });
//   }
//
//   void _onFabLocationChanged(FloatingActionButtonLocation? value) {
//     setState(() {
//       _fabLocation = value ?? FloatingActionButtonLocation.endDocked;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(automaticallyImplyLeading: false, title: const Text('Bottom App Bar Demo')),
//         body: ListView(
//           padding: const EdgeInsets.only(bottom: 88),
//           children: <Widget>[
//             SwitchListTile(
//               title: const Text('Floating Action Button'),
//               value: _showFab,
//               onChanged: _onShowFabChanged,
//             ),
//             SwitchListTile(
//               title: const Text('Notch'),
//               value: _showNotch,
//               onChanged: _onShowNotchChanged,
//             ),
//             const Padding(
//               padding: EdgeInsets.all(16),
//               child: Text('Floating action button position'),
//             ),
//             RadioListTile<FloatingActionButtonLocation>(
//               title: const Text('Docked - End'),
//               value: FloatingActionButtonLocation.endDocked,
//               groupValue: _fabLocation,
//               onChanged: _onFabLocationChanged,
//             ),
//             RadioListTile<FloatingActionButtonLocation>(
//               title: const Text('Docked - Center'),
//               value: FloatingActionButtonLocation.centerDocked,
//               groupValue: _fabLocation,
//               onChanged: _onFabLocationChanged,
//             ),
//             RadioListTile<FloatingActionButtonLocation>(
//               title: const Text('Floating - End'),
//               value: FloatingActionButtonLocation.endFloat,
//               groupValue: _fabLocation,
//               onChanged: _onFabLocationChanged,
//             ),
//             RadioListTile<FloatingActionButtonLocation>(
//               title: const Text('Floating - Center'),
//               value: FloatingActionButtonLocation.centerFloat,
//               groupValue: _fabLocation,
//               onChanged: _onFabLocationChanged,
//             ),
//           ],
//         ),
//         floatingActionButton:
//             _showFab
//                 ? FloatingActionButton(
//                   onPressed: () {},
//                   tooltip: 'Create',
//                   child: const Icon(Icons.add),
//                 )
//                 : null,
//         floatingActionButtonLocation: _fabLocation,
//         bottomNavigationBar: _DemoBottomAppBar(
//           fabLocation: _fabLocation,
//           shape: _showNotch ? const CircularNotchedRectangle() : null,
//         ),
//       ),
//     );
//   }
// }
//
// class _DemoBottomAppBar extends StatelessWidget {
//   const _DemoBottomAppBar({
//     this.fabLocation = FloatingActionButtonLocation.endDocked,
//     this.shape = const CircularNotchedRectangle(),
//   });
//
//   final FloatingActionButtonLocation fabLocation;
//   final NotchedShape? shape;
//
//   static final List<FloatingActionButtonLocation> centerLocations = <FloatingActionButtonLocation>[
//     FloatingActionButtonLocation.centerDocked,
//     FloatingActionButtonLocation.centerFloat,
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return BottomAppBar(
//       shape: shape,
//       color: Colors.blue,
//       child: IconTheme(
//         data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
//         child: Row(
//           children: <Widget>[
//             IconButton(
//               tooltip: 'Open navigation menu',
//               icon: const Icon(Icons.menu),
//               onPressed: () {},
//             ),
//             if (centerLocations.contains(fabLocation)) const Spacer(),
//             IconButton(tooltip: 'Search', icon: const Icon(Icons.search), onPressed: () {}),
//             IconButton(tooltip: 'Favorite', icon: const Icon(Icons.favorite), onPressed: () {}),
//           ],
//         ),
//       ),
//     );
//   }
// }
