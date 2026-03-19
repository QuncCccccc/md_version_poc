library m3;

// Re-export standard material to prevent compilation errors and simulate
// a fully decoupled setup where common widgets exist directly in this repo.
export 'package:flutter/material.dart' hide TextButton, Switch, ButtonStyleButton, Scaffold;
export 'src/button_style_button.dart';
export 'src/scaffold.dart';
export 'src/m3/text_button.dart';
export 'src/m3/switch.dart';

