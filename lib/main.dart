import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localization.dart';

import 'support/style/application_themes.dart';
import 'support/utils/mobile_router.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: MobileRouter.routes,
      theme: ApplicationThemes.theme,
      initialRoute: MobileRouter.initialRoute,
      supportedLocales: Localization.supportedLocales,
      localizationsDelegates: Localization.localizationsDelegates,
      onGenerateTitle: (BuildContext context) => Localization.of(context)!.appTitle,
    );
  }
}
