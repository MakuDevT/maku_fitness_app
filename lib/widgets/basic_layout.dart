import 'package:flutter/material.dart';

class BasicLayout extends StatelessWidget {
  const BasicLayout({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color.fromRGBO(24, 24, 24, 1),
        child: SafeArea(child: child),
      ),
    );
  }
}
