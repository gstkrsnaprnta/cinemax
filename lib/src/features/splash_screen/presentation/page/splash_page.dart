import 'package:cinemax/src/commons/widgets/base_page.widget.dart';
import 'package:cinemax/src/core/const/const.dart';
import 'package:cinemax/src/features/main/home/presentation/page/home_page.dart';
import 'package:cinemax/src/features/main/root/presentation/page/root.page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = '/splash';

  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RootPage()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BasePageWidget(
      child: Scaffold(
        body: Center(
          child: Image.asset(
            Asset.logoCinemax,
            height: 200,
          ),
        ),
      ),
    );
  }
}
