import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maku_fitness_app/widgets/basic_layout.dart';
import 'package:maku_fitness_app/widgets/common/ripple_effect.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _bounceAnimation;

  bool showRipple = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 950),
    );

    _bounceAnimation = Tween<double>(
      begin: -100,
      end: 0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.addListener(() {
      if (_bounceAnimation.value >= -10) {
        if (!showRipple) {
          setState(() => showRipple = true);
        }
      } else {
        if (showRipple) {
          setState(() => showRipple = false);
        }
      }
    });

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BasicLayout(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: _bounceAnimation,
            builder: (context, child) {
              return SizedBox(
                height: 330,
                width: 375,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    if (showRipple)
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: const Center(child: RippleEffect()),
                      ),
                    Transform.translate(
                      offset: Offset(0, _bounceAnimation.value),
                      child: Image.asset(
                        "lib/assets/icons/app_icon.png",
                        height: 230,
                        width: 375,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          const SizedBox(height: 30),

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
        ],
      ),
    );
  }
}
