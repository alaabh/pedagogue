import 'package:flutter/material.dart';

class Utilities {
  static bool _isKeyboardShowing() {
    return WidgetsBinding.instance.window.viewInsets.bottom > 0;
  }

  static closeKeyboard(BuildContext context) {
    if (_isKeyboardShowing()) {
      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) currentFocus.unfocus();
    }
  }
}
