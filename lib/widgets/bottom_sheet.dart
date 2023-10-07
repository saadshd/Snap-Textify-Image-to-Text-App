import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snap_textify/model/theme_model.dart';
import 'package:snap_textify/utils/routes/routes_name.dart';
import 'package:snap_textify/view_model/theme_view_model.dart';

void showCustomBottomSheet(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text('Dark Mode'),
            leading: const Icon(Icons.dark_mode),
            trailing: Consumer<ThemeViewModel>(
              builder: (context, themeViewModel, child) {
                final isDarkMode = themeViewModel.themeData == ThemeModel().darkTheme;
                return Switch(
                  value: isDarkMode,
                  onChanged: (value) {
                    themeViewModel.toggleTheme();
                    final newIsDarkMode = themeViewModel.themeData == ThemeModel().darkTheme;
                    if (isDarkMode != newIsDarkMode) {
                      themeViewModel.setSwitchState(newIsDarkMode);
                    }
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
          ListTile(
            title: const Text('Help Center'),
            leading: const Icon(Icons.help),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, RoutesName.help);
            },
          ),
          ListTile(
            title: const Text('Privacy Policy'),
            leading: const Icon(Icons.lock),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, RoutesName.privacy);
            },
          ),
          ListTile(
            title: const Text('About'),
            leading: const Icon(Icons.info),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, RoutesName.about);
            },
          ),
        ],
      );
    },
  );
}
