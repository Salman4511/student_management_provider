import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_provider/provider/splash_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<SplashProvider>(context, listen: false).goToLogin(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child:CircularProgressIndicator(),
      ),
    );
  }
}
