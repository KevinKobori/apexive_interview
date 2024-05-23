import 'package:mix/mix.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class CustomButtonStyle {
  final CustomButtonType type;
  final CustomButtonSize size;

  CustomButtonStyle(this.type, this.size);

  Style container() => Style(
        borderRadius(8),
        CustomButtonSize.medium(
          padding.horizontal(16),
          padding.vertical(8),
        ),
        CustomButtonSize.large(
          padding.horizontal(24),
          padding.vertical(16),
        ),
        CustomButtonType.primary(
          backgroundColor.green(),
        ),
        CustomButtonType.primary(
          backgroundColor.pink(),
        ),
        CustomButtonType.destructive(
          backgroundColor.redAccent(),
        ),
        CustomButtonType.link(
          backgroundColor.transparent(),
        ),
      ).applyVariants([type, size]);

  Style label() => Style(
        text.style.color.white(),
        text.style.bold(),
        CustomButtonSize.medium(
          text.style.fontSize(14),
        ),
        CustomButtonSize.large(
          text.style.fontSize(18),
        ),
        CustomButtonType.primary(
          text.style.color.white(),
        ),
        CustomButtonType.destructive(
          text.style.color.white(),
        ),
        CustomButtonType.link(
          text.style.color.black(),
          text.style.decoration.underline(),
        ),
      ).applyVariants([type, size]);
}
