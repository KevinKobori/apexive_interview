import 'package:equatable/equatable.dart';

class NotificationViewModel extends Equatable {
  final String title;
  final String description;
  final String icon;

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
