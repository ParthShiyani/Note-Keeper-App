import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Duration duration = const Duration(seconds: 3);
    Timer(duration, () {
      Navigator.of(context).pushReplacementNamed('/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Icon(
              Icons.sticky_note_2_outlined,
              color: Colors.amber,
              size: 100,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Keep Notes with ",
                  style: GoogleFonts.poppins(
                    fontSize: 25,
                    color: Colors.amber,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const FlutterLogo(
                  style: FlutterLogoStyle.stacked,
                  size: 30,
                ),
              ],
            ),
            const Spacer(),
            const LinearProgressIndicator(
              minHeight: 10,
            ),
          ],
        ),
      ),
    );
  }
}
