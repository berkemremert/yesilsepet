import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yesilsepet/Views/welcomePage/WelcomePage.dart';
import 'ViewModels/welcomePage/WelcomeViewModel.dart';
import 'Views/theme/appColors.dart';
import 'debug.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme(
          primary: AppColors.oliveGreen,
          primaryContainer: AppColors.limeGreen,
          secondary: AppColors.coralOrange,
          secondaryContainer: AppColors.coralOrangeDark,
          surface: AppColors.pureWhite,
          background: AppColors.offWhite,
          error: AppColors.scarletOrange,
          onPrimary: AppColors.pureWhite,
          onSecondary: AppColors.pureWhite,
          onSurface: AppColors.darkBlack,
          onBackground: AppColors.darkBlack,
          onError: AppColors.pureWhite,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: AppColors.offWhite,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.green,
          foregroundColor: AppColors.pureWhite,
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: AppColors.coralOrange,
          textTheme: ButtonTextTheme.primary,
        ),
        fontFamily: 'Nunito',
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontFamily: 'Nunito', fontWeight: FontWeight.bold),
          displayMedium: TextStyle(fontFamily: 'Nunito', fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontFamily: 'Nunito', fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontFamily: 'Nunito',fontWeight: FontWeight.bold),
        ),
        useMaterial3: true,
      ),
      home: DebugPage(),
    );
  }
}