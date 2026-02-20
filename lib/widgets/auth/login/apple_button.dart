import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppleButton extends StatelessWidget {
  const AppleButton({super.key, required this.onPressed, this.enabled = true});
  final bool enabled;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => onPressed(),
        style: _getButtonStyle(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            children: [
              Image.asset(
                'lib/assets/icons/common/apple.png',
                height: 15,
                width: 15,
              ),
              Spacer(),
              Text(
                'Continue with Apple',
                textAlign: TextAlign.center,
                style: _getTextStyle(),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  ButtonStyle _getButtonStyle() {
    return ButtonStyle(
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          side: BorderSide(color: Color.fromRGBO(225, 6, 0, 1)),
          borderRadius: BorderRadiusGeometry.all(Radius.circular(15)),
        ),
      ),
      backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(0, 0, 0, 1)),
    );
  }

  TextStyle _getTextStyle() {
    return GoogleFonts.dmSans(
      color: Colors.white,
      fontWeight: FontWeight.w700,
      fontSize: 18,
      letterSpacing: -1.44,
    );
  }
}
