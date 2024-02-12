import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';
import '../base/widget.dart';

void main() {
  testAppWidgets(
    'action_button',
    {
      'inactive': Builder(
        builder: (context) {
          final theme = AppTheme.of(context);
          return AppActionButtonLayout.inactive(
            icon: theme.icons.characters.arrowBack,
          );
        },
      ),
      'hovered': Builder(
        builder: (context) {
          final theme = AppTheme.of(context);
          return AppActionButtonLayout.hovered(
            icon: theme.icons.characters.arrowBack,
          );
        },
      ),
      'pressed': Builder(
        builder: (context) {
          final theme = AppTheme.of(context);
          return AppActionButtonLayout.pressed(
            icon: theme.icons.characters.arrowBack,
          );
        },
      ),
    },
  );
}
