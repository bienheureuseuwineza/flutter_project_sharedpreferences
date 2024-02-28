import 'package:flutter/material.dart';
import 'home_page.dart';
import 'calculator_page.dart';
import 'about_page.dart';
import 'common_widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final isDarkMode = prefs.getBool('isDarkMode') ?? false;
  runApp(MyApp(isDarkMode: isDarkMode));
}

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode;
  ThemeProvider(this._isDarkMode);

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool('isDarkMode', _isDarkMode);
    });
  }
}

class MyApp extends StatelessWidget {
  final bool isDarkMode;

  MyApp({required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(isDarkMode),
      child: Consumer<ThemeProvider>(
        builder: (context, provider, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: provider.isDarkMode ? ThemeData.dark() : ThemeData.light(),
            initialRoute: '/',
            routes: {
              '/': (context) => HomePage(),
              '/calculator': (context) => CalculatorPage(),
              '/about': (context) => AboutPage(),
            },
          );
        },
      ),
    );
  }
}
