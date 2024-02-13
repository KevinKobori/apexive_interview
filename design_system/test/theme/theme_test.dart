import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';
import 'package:nasa_apod_design_system/src/theme/data/form_factor.dart';
import 'package:test_utils/test_utils.dart';

import 'library/library.dart';

void main() {
  _renderLibrary(
    ApodAppFormFactor.medium,
  );
  _renderLibrary(
    ApodAppFormFactor.medium,
  );
  _renderLibrary(
    ApodAppFormFactor.medium,
  );
  _renderLibrary(
    ApodAppFormFactor.small,
  );
  _renderLibrary(
    ApodAppFormFactor.small,
  );
}

void _renderLibrary(ApodAppFormFactor formFactor) async {
  testWidgets('${formFactor.name} theme rendering', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await loadTestFonts();

    final key = UniqueKey();

    tester.binding.window.physicalSizeTestValue =
        Size(ApodAppThemeColorMode.values.length * 700.0, 1500);
    tester.binding.window.devicePixelRatioTestValue = 1.0;

    await tester.pumpWidget(
      Row(
        key: key,
        textDirection: TextDirection.ltr,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ...ApodAppThemeColorMode.values.map(
            (colorMode) => Expanded(
              child: ApodThemeLibrary(
                colorMode: colorMode,
                formFactor: formFactor,
              ),
            ),
          )
        ],
      ),
    );

    await expectLater(
      find.byKey(key),
      matchesGoldenFile('renders/${formFactor.name}.png'),
    );
  });
}
