import 'package:cinemax/injection_container.dart';
import 'package:cinemax/src/config/theme/colors.theme.dart';
import 'package:cinemax/src/features/main/root/presentation/page/root.page.dart';
import 'package:cinemax/src/features/splash_screen/presentation/page/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        iconButtonTheme: IconButtonThemeData(
            style: ButtonStyle(
                iconColor: WidgetStatePropertyAll(
          Colors.white,
        ))),
        scaffoldBackgroundColor: AppColors.dark,
      ),
      home: SplashPage(),
    );
  }
}
