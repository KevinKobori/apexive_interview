import 'package:nasa_apod_design_system/src/helpers/named.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';

class AppColorsData extends Equatable {
  const AppColorsData({
    required this.accent,
    required this.accentHighlight,
    required this.accentHighlight2,
    required this.foreground,
    required this.background,
    required this.actionBarBackground,
    required this.actionBarForeground,
    required this.accentOpposite,
  });

  factory AppColorsData.light() => const AppColorsData(
        accent: Color(0xFFD21F3C),
        accentOpposite: Color(0xFFFFFFFF),
        accentHighlight: Color(0xFFB71C37),
        accentHighlight2: Color(0xFF9C172E),
        foreground: Color(0xFF000000),
        background: Color(0xFFFFFFFF),
        // actionBarBackground: Color(0xFFD21F3C),
        actionBarBackground: Color(0xFF000000),
        actionBarForeground: Color(0xFFFFFFFF),
      );

  factory AppColorsData.dark() => const AppColorsData(
        accent: Color(0xFFD21F3C),
        accentOpposite: Color(0xFFFFFFFF),
        accentHighlight: Color(0xFFB71C37),
        accentHighlight2: Color(0xFF9C172E),
        foreground: Color(0xFFFFFFFF),
        // background: Color(0xFF000000),
        background: Color(0xFF111111),
        // actionBarBackground: Color(0xFFD21F3C),
        actionBarBackground: Color(0xFF000000),
        actionBarForeground: Color(0xFFFFFFFF),
      );

  factory AppColorsData.highContrast() => const AppColorsData(
        accent: Color(0xFFD21F3C),
        accentOpposite: Color(0xFFFFFFFF),
        accentHighlight: Color(0xFFD21F3C),
        accentHighlight2: Color(0xFFD21F3C),
        foreground: Color(0xFF000000),
        background: Color(0xFFFFFFFF),
        actionBarBackground: Color(0xFF000000),
        actionBarForeground: Color(0xFFFFFFFF),
      );

  // factory AppColorsData.light() => const AppColorsData(
  //       accent: Color(0xFF0B3D91), // Azul NASA
  //       accentOpposite: Color(0xFFFFFFFF), // Branco
  //       accentHighlight: Color(
  //           0xFF0B3D91), // Um tom de azul um pouco mais claro que o accent
  //       accentHighlight2:
  //           Color(0xFF0B3D91), // Um tom ainda mais claro que o accentHighlight
  //       foreground: Color(0xFF000000), // Preto
  //       background: Color(0xFFFFFFFF), // Branco
  //       actionBarBackground: Color(0xFF0B3D91), // Azul NASA
  //       actionBarForeground: Color(0xFFFFFFFF), // Branco
  //     );

  // factory AppColorsData.dark() => const AppColorsData(
  //       accent: Color(0xFF0B3D91), // Azul NASA
  //       accentOpposite: Color(0xFFFFFFFF), // Branco
  //       accentHighlight: Color(
  //           0xFF0B3D91), // Um tom de azul um pouco mais claro que o accent para o tema escuro
  //       accentHighlight2: Color(
  //           0xFF0B3D91), // Um tom ainda mais claro que o accentHighlight para o tema escuro
  //       foreground: Color(0xFFFFFFFF), // Branco
  //       background: Color(0xFF111111), // Muito escuro, quase preto
  //       actionBarBackground: Color(0xFF0B3D91), // Azul NASA
  //       actionBarForeground: Color(0xFFFFFFFF), // Branco
  //     );

  // factory AppColorsData.highContrast() => const AppColorsData(
  //       accent: Color(0xFF0B3D91), // Azul NASA para alta contraste
  //       accentOpposite: Color(0xFFFFFFFF), // Branco para garantir o contraste
  //       accentHighlight: Color(
  //           0xFFD21F3C), // Vermelho, cor secundária da NASA para destaques
  //       accentHighlight2: Color(
  //           0xFF0B3D91), // Azul um pouco mais claro para diferenciação sutil
  //       foreground:
  //           Color(0xFF000000), // Preto para máximo contraste em fundo claro
  //       background: Color(
  //           0xFFFFFFFF), // Branco, oferecendo alto contraste com o texto preto
  //       actionBarBackground:
  //           Color(0xFF000000), // Preto para contraste com ícones e texto branco
  //       actionBarForeground:
  //           Color(0xFFFFFFFF), // Branco para texto e ícones sobre fundo preto
  //     );

  // factory AppColorsData.light() => const AppColorsData(
  //       accent: Color(0xFF454CFF),
  //       accentOpposite: Color(0xFFFFFFFF),
  //       accentHighlight: Color(0xFF2D33B9),
  //       accentHighlight2: Color(0xFF272C9A),
  //       foreground: Color(0xFF000000),
  //       background: Color(0xFFFFFFFF),
  //       actionBarBackground: Color(0xFF000000),
  //       actionBarForeground: Color(0xFFFFFFFF),
  //     );

  // factory AppColorsData.dark() => const AppColorsData(
  //       accent: Color(0xFF454CFF),
  //       accentOpposite: Color(0xFFFFFFFF),
  //       accentHighlight: Color(0xFF2D33B9),
  //       accentHighlight2: Color(0xFF272C9A),
  //       foreground: Color(0xFFFFFFFF),
  //       background: Color(0xFF111111),
  //       actionBarBackground: Color(0xFF000000),
  //       actionBarForeground: Color(0xFFFFFFFF),
  //     );

  // factory AppColorsData.highContrast() => const AppColorsData(
  //       accent: Color(0xFF000000),
  //       accentOpposite: Color(0xFFFFFFFF),
  //       accentHighlight: Color(0xFF000000),
  //       accentHighlight2: Color(0xFF000000),
  //       foreground: Color(0xFF222222),
  //       background: Color(0xFFFFFFFF),
  //       actionBarBackground: Color(0xFFDDDDDD),
  //       actionBarForeground: Color(0xFF222222),
  //     );

  final Color accent;
  final Color accentHighlight;
  final Color accentHighlight2;
  final Color foreground;
  final Color accentOpposite;
  final Color background;
  final Color actionBarForeground;
  final Color actionBarBackground;

  @override
  List<Object?> get props => [
        accent.named('accent'),
        accentHighlight.named('accentHighlight'),
        accentHighlight2.named('accentHighlight2'),
        foreground.named('foreground'),
        accentOpposite.named('accentOpposite'),
        background.named('background'),
        actionBarForeground.named('actionBarForeground'),
        actionBarBackground.named('actionBarBackground'),
      ];
}
