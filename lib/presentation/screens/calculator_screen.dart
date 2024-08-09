import 'package:flutter/material.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF16171C),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 30, right: 8, left: 8),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
