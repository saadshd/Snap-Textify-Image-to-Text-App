
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snap_textify/utils/routes/routes_name.dart';
import 'package:snap_textify/view/about_screen.dart';
import 'package:snap_textify/view/help_screen.dart';
import 'package:snap_textify/view/home_screen.dart';
import 'package:snap_textify/view/privacy_policy_screen.dart';
import 'package:snap_textify/view/splash_screen.dart';
import 'package:snap_textify/view/text_screen.dart';
import 'package:snap_textify/view_model/text_view_model.dart';

class Routes{

  static Route<dynamic> generateRoute(BuildContext context, RouteSettings settings){
    final textViewModel = Provider.of<TextViewModel>(context, listen: false);

    switch(settings.name){
      case RoutesName.splash:
        return MaterialPageRoute(builder: (BuildContext context) => const SplashScreen());
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => const HomeScreen());
      case RoutesName.text:
        return MaterialPageRoute(builder: (BuildContext context) => TextScreen(scannedText: textViewModel.scannedText,));
      case RoutesName.help:
        return MaterialPageRoute(builder: (BuildContext context) => const HelpScreen());
      case RoutesName.privacy:
        return MaterialPageRoute(builder: (BuildContext context) => const PrivacyPolicyScreen());
      case RoutesName.about:
        return MaterialPageRoute(builder: (BuildContext context) => const AboutScreen());
        default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(
              child: Text('No Route Defined'),
            ),
          );
        });
    }
  }
}