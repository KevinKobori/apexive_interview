import 'package:flutter/widgets.dart';
import 'package:nasa_apod_design_system/src/theme/theme.dart';
import 'package:nasa_apod_design_system/src/widgets/buttons/action_button.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return AppActionButton(
      icon: theme.icons.characters.arrowBack,
      onTap: onTap ?? () => Navigator.pop(context),
    );
  }
}
