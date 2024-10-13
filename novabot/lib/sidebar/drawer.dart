import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novabot/Screen/homepage.dart';
import 'package:novabot/Screen/Onboarding.dart';
import 'package:novabot/Screen/login.dart';
import 'package:novabot/Services/authentication.dart';
import 'package:novabot/Themes/themeNotifier.dart';
import 'package:novabot/sidebar/aboutus.dart';
import 'package:novabot/sidebar/help&support.dart';
import 'package:novabot/sidebar/license.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Sidebar extends ConsumerWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.read(themeProvider.notifier);
    final themeMode = ref.watch(themeProvider);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF11455B),
            ),
            child: Text(
              'Hey Buddy',
              style: TextStyle(
                color: Color.fromARGB(255, 252, 249, 249),
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Onboarding()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.search),
            title: const Text('Search'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
          ),
          ListTile(
            leading: Icon(themeMode == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode),
            title: const Text('Theme'),
            trailing: IconButton(
              icon: themeMode == ThemeMode.dark
                  ? Icon(Icons.light_mode, color: Theme.of(context).colorScheme.secondary)
                  : Icon(Icons.dark_mode, color: Theme.of(context).colorScheme.primary),
              onPressed: () {
                themeNotifier.toggleTheme();
              },
            ),
          ),
          ListTile(
            leading: const Icon(Icons.verified),
            title: const Text('License'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const LicensePageCustom()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About Us'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutUsPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Help & Support'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Helpandsupport()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () async {
              await signout(context);
            },
          ),
        ],
      ),
    );
  }

  signout(BuildContext context) async {
    await _authService.logout();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (Route<dynamic> route) => false,
    );
  }
}
