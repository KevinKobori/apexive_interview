import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';
import 'package:test_utils/test_utils.dart';

import 'library/library.dart';

void main() {
  _renderLibrary(
    XFormFactor.medium,
  );
  _renderLibrary(
    XFormFactor.medium,
  );
  _renderLibrary(
    XFormFactor.medium,
  );
  _renderLibrary(
    XFormFactor.small,
  );
  _renderLibrary(
    XFormFactor.small,
  );
}

void _renderLibrary(XFormFactor formFactor) async {
  testWidgets('${formFactor.name} theme rendering', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await loadTestFonts();

    final key = UniqueKey();

    tester.view.devicePixelRatio = 1.0;
    tester.view.physicalSize = Size(ThemeMode.values.length * 700.0, 1500);

    await tester.pumpWidget(
      Row(
        key: key,
        textDirection: TextDirection.ltr,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ...ThemeMode.values.map(
            (colorMode) => Expanded(
              child: ApodThemeLibrary(
                themeMode: colorMode,
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
