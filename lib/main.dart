import 'package:flutter/material.dart';
import 'package:quick_share_demo/profile_screen.dart';
import 'package:quick_share_demo/quick_action_handler.dart';

import 'home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final QuickActionsHandler _qaHandler = QuickActionsHandler();
  final GlobalKey<NavigatorState> _navKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    _qaHandler.setup(_handleShortcut);
  }

  void _handleShortcut(String type) {
    switch (type) {
      case 'home':
        _navKey.currentState?.pushNamedAndRemoveUntil('/', (_) => false);
        break;
      case 'profile':
        _navKey.currentState?.pushNamed('/profile');
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navKey,
      initialRoute: '/',
      routes: {'/': (_) => HomeScreen(), '/profile': (_) => ProfileScreen()},
    );
  }
}
