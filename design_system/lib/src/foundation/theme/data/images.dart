import 'package:equatable/equatable.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class ApodImagesData extends Equatable {
  final String appLogo;
  final String appWormLogo;
  final String darkAppLogo;
  final String darkAppWormLogo;

  const ApodImagesData()
      : appLogo = 'assets/images/nasa_logo.svg',
        appWormLogo = 'assets/images/nasa_worm_logo.svg',
        darkAppLogo = 'assets/images/nasa_logo.svg',
        darkAppWormLogo = 'assets/images/nasa_worm_logo.svg';

  @override
  List<Object?> get props => [
        appLogo.named('appLogo'),
        appWormLogo.named('appWormLogo'),
        darkAppLogo.named('darkAppLogo'),
        darkAppWormLogo.named('darkAppWormLogo'),
      ];
}

// class ApodImagesData extends Equatable {
//   final String appLogo;
//   final String appWormLogo;

//   const ApodImagesData({
//     required this.appLogo,
//     required this.appWormLogo,
//   });

//   @override
//   List<Object?> get props => [
//         appLogo.named('appLogo'),
//         appWormLogo.named('appWormLogo'),
//       ];
// }
