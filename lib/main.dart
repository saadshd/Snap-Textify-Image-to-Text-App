import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snap_textify/utils/routes/routes.dart';
import 'package:snap_textify/utils/routes/routes_name.dart';
import 'package:snap_textify/view_model/text_view_model.dart';
import 'package:snap_textify/view_model/theme_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TextViewModel()),
        ChangeNotifierProvider(create: (context) => ThemeViewModel()),
      ],
      child: Consumer<ThemeViewModel>(
        builder: (context, themeViewModel, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeViewModel.themeData,
            initialRoute: RoutesName.splash,
            onGenerateRoute: (settings) => Routes.generateRoute(context, settings),
          );
        },
      ),
    );
  }
}
