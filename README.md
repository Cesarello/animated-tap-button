<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

# AnimatedTapButton

A Flutter package that provides an animated button widget which can toggle between two icons with a smooth animation and customizable haptic feedback on tap.

<img width="100%" src="https://i.imgur.com/zN9uQ0w.gif">


## Features

- Smooth animation between two icon states.
- Haptic feedback for better user experience.
- Customizable icon size, color, and type for both selected and unselected states.
- Fully controllable with external state management via `onValueChanged`.

## Getting started

Import the package into your Dart file:
``` sh
import 'package:animated_tap_button/animated_tap_button.dart';
```

Use the AnimatedTapButton widget in your widget tree:
``` sh
AnimatedTapButton(
  iconSize: 40.0, // optional
  initialValue: false, // default state (true/false)
  onValueChanged: (bool newValue) {
    // handle the state change here
    print('Button state: $newValue');
  },
  selectedIcon: Icons.favorite, // optional, default is Icons.favorite
  unselectedIcon: Icons.favorite_border, // optional, default is Icons.favorite_border
  iconColor: Colors.red, // optional, sets the icon color
),
```
## Parameters

iconSize: The size of the icon. Defaults to 30.0. Range between 20.0 and 100.0.
initialValue: Boolean indicating the initial state (selected/unselected).
onValueChanged: Callback function triggered when the button's value changes.
selectedIcon: The icon to display when the button is in the selected state. Defaults to Icons.favorite.
unselectedIcon: The icon to display when the button is in the unselected state. Defaults to Icons.favorite_border.
iconColor: Color of the icon.

| Parameter | Description | Default |Required |
| ------ | ------ | ------  | ------ |
| initialValue |  Boolean indicating the initial state (selected/unselected). | | ✅ |
| onValueChanged | Callback function triggered when the button's value changes. | |✅ |
| iconSize | The size of the icon. Defaults to 30.0. Range between 20.0 and 100.0.| 30.0
| selectedIcon |  The icon to display when the button is in the selected state.  |Icons.favorite
| unselectedIcon | The icon to display when the button is in the unselected state. |Icons.favorite_border
| iconColor | Color of the icon. | Default icon color
