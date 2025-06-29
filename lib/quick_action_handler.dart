import 'package:quick_actions/quick_actions.dart';

typedef ShortcutCallback = void Function(String type);

class QuickActionsHandler {
  final QuickActions _qa = const QuickActions();

  void setup(ShortcutCallback onShortcut) {
    _qa.initialize(onShortcut);
    _qa.setShortcutItems([
      ShortcutItem(type: 'home', localizedTitle: 'Home', icon: 'home'),
      ShortcutItem(type: 'profile', localizedTitle: 'Profile', icon: 'profile'),
    ]);
  }
}
