// import 'package:flutter/material.dart';
// import 'package:mix/mix.dart';
// import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

// class CustomButton extends StatelessWidget {
//   final String title;
//   final void Function() onPress;
//   final CustomButtonType type;
//   final CustomButtonSize size;

//   const CustomButton({
//     required this.title,
//     required this.onPress,
//     super.key,
//     this.type = CustomButtonType.primary,
//     this.size = CustomButtonSize.large,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final style = CustomButtonStyle(type, size);

//     return PressableBox(
//       onPress: onPress,
//       style: style.container(),
//       child: StyledText(
//         title,
//         style: style.label(),
//       ),
//     );
//   }
// }
