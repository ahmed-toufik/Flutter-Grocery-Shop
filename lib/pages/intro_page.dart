import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //logo
          Padding(
            padding: const EdgeInsets.only(
                left: 80, right: 160, bottom: 40, top: 160),
            child: Image.asset('images/avocado.png'),
          ),

          //we deliver groceries at your doorstep

          Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              "we deliver groceries at your doorstep",
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              )),
            ),
          ),

          const SizedBox(height: 30),

          //fresh items everyday

          Text(
            "Fresh items everyday",
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 18,
            ),
          ),

          const Spacer(),

          //get started button
          
          GestureDetector(
            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                return HomePage();
              },
            )),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(24),
              child: const Text(
                "Get Started",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),

          const Spacer(),
        ],
      ),
    );
  }
}
