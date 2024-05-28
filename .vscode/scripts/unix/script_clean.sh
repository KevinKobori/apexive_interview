# CORE
cd core
flutter clean
flutter pub get
dart run build_runner build --delete-conflicting-outputs
cd ..
# DESIGN SYSTEM
cd design_system
flutter clean
flutter pub get
cd ..
# STORYBOOK
# cd storybook
# flutter clean
# flutter pub get
# cd ..
# TEST_UTILS
# cd test_utils
# flutter clean
# flutter pub get
# cd ..
# APP
cd app
flutter clean
# cd ios
# pod deintegrate
# rm Podfile.lock
# rm -rf Pods
# pod install
# pod repo update
# cd ..
flutter pub get
dart run build_runner build --delete-conflicting-outputs
cd ..