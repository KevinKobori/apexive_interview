import 'package:mix/mix.dart';

class CustomButtonType extends Variant {
  const CustomButtonType._(super.name);

  static const primary = CustomButtonType._('custom.button.primary');
  static const destructive = CustomButtonType._('custom.button.desctructive');
  static const link = CustomButtonType._('custom.button.link');
}

class CustomButtonSize extends Variant {
  const CustomButtonSize._(super.name);

  static const medium = CustomButtonSize._('custom.button.medium');
  static const large = CustomButtonSize._('custom.button.large');
}
