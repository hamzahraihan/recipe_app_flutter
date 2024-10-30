import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app_flutter/src/screens/main_screen.dart';

import 'sample_feature/sample_item_details_view.dart';
import 'sample_feature/sample_item_list_view.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The ListenableBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
          // background.
          restorationScopeId: 'app',

          // Provide the generated AppLocalizations to the MaterialApp. This
          // allows descendant Widgets to display the correct translations
          // depending on the user's locale.
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
          ],

          // Use AppLocalizations to configure the correct application title
          // depending on the user's locale.
          //
          // The appTitle is defined in .arb files found in the localization
          // directory.
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,

          // Define a light and dark color theme. Then, read the user's
          // preferred ThemeMode (light, dark, or system default) from the
          // SettingsController to display the correct theme.
          theme: ThemeData(
              textTheme: GoogleFonts.montserratTextTheme(),
              colorScheme: ColorScheme(
                brightness: Brightness.light,
                primary: const Color(0xFF313131),
                onPrimary: Colors.white,
                secondary: const Color(0xff03dac6),
                onSecondary: Colors.black,
                error: const Color(0xffb00020),
                secondaryContainer: Color.fromARGB(255, 192, 207, 188),
                primaryContainer: Color.fromARGB(255, 175, 190, 173),
                onError: Colors.white,
                surface: Colors.white,
                onSurface: const Color(0xFF313131),
              )),
          darkTheme: ThemeData.dark().copyWith(
              textTheme:
                  GoogleFonts.montserratTextTheme(Typography.whiteMountainView),
              colorScheme: ColorScheme(
                  brightness: Brightness.dark,
                  primary: Color(0xFFFFB0D0),
                  onPrimary: Color(0xFF5C113B),
                  primaryContainer: Color(0xFF141615),
                  secondaryContainer: Color(0xFF1E201F),
                  onPrimaryContainer: Color(0xFFFFD8E6),
                  secondary: Color(0xFFE1BDCA),
                  onSecondary: Color.fromARGB(255, 7, 15, 10),
                  error: Color.fromARGB(255, 223, 28, 102),
                  onError: Color.fromARGB(255, 223, 28, 102),
                  surface: Color(0xFF412A33),
                  onSurface: Color.fromARGB(255, 253, 253, 253))),
          themeMode: settingsController.themeMode,

          // Define a function to handle named routes in order to support
          // Flutter web url navigation and deep linking.
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case SettingsView.routeName:
                    return SettingsView(controller: settingsController);
                  case SampleItemDetailsView.routeName:
                    return const SampleItemDetailsView();
                  case SampleItemListView.routeName:
                  default:
                    return MainScreen(controller: settingsController);
                }
              },
            );
          },
        );
      },
    );
  }
}
