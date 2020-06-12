import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:follow_up_app/pages/add_calls_page.dart';
import 'package:follow_up_app/pages/add_customer_page.dart';
import 'package:follow_up_app/pages/customer_history_page.dart';
import 'package:follow_up_app/pages/dashboard_page.dart';
import 'package:follow_up_app/pages/main_page.dart';
import 'package:follow_up_app/pages/promotions_page.dart';
import 'package:follow_up_app/pages/reports_page.dart';
import 'package:follow_up_app/pages/settings_page.dart';
import 'package:follow_up_app/utils/colors.dart';
import './pages/login_page.dart';
import './pages/register_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//      systemNavigationBarColor: Colors.white,
//      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Market App',
      theme: ThemeData(
          primarySwatch: AppColors.mainColor,
          appBarTheme: AppBarTheme(brightness: Brightness.dark, iconTheme: IconThemeData(color: Colors.white), textTheme: TextTheme(title: TextStyle(color: Colors.white, fontSize: 20)))
      ),
      initialRoute: '/login',
      routes: {
        '/main': (context) => MainPage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/dashboard': (context) => DashboardPage(),
        '/addCalls': (context) => AddCallsPage(),
        '/addCustomer': (context) => AddCustomerPage(),
        '/reports': (context) => ReportsPage(),
        '/promotions': (context) => PromotionsPage(),
        '/settings': (context) => SettingsPage(),
        '/customerHistory': (context) => CustomerHistoryPage(),
      },
    );
  }
}
