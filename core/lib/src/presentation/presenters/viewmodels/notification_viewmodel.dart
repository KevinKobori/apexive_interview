import 'package:equatable/equatable.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationViewModel extends Equatable {
  final String title;
  final String description;
  final PictureProvider icon;

  const NotificationViewModel({
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  List<Object?> get props => [
        title,
        description,
        icon,
      ];
}
