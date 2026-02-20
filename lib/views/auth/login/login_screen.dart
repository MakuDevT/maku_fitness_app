import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maku_fitness_app/widgets/auth/login/apple_button.dart';
import 'package:maku_fitness_app/widgets/auth/login/google_button.dart';
import 'package:maku_fitness_app/widgets/basic_layout.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BasicLayout(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "MAKU FITNESS",
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Train with the physique behind the program",
              style: GoogleFonts.roboto(
                color: const Color.fromRGBO(155, 155, 155, 1),
                fontSize: 14,
              ),
            ),
            SizedBox(height: 30),
            Image.asset(
              "lib/assets/icons/app_icon.png",
              height: 230,
              width: 375,
            ),
            SizedBox(height: 100),
            AppleButton(onPressed: () {}),
            SizedBox(height: 20),
            GoogleButton(onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
