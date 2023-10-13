import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderPage extends StatelessWidget {
  const HeaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Color(0xff21345b),
                Color.fromARGB(255, 12, 19, 32),
              ],
            ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 100,
          left: 50,
          right: 50,
          bottom: 20,
        ),
        child: Column(
          children: [
             Row(
           
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Image.asset('assets/images/logo.png',
                 width: 50,
                 height: 50,
                 ),
                Text(
                  'TIMEA ANIMA',
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white

                  ),
                   
           ),
              ],
            ),
          const SizedBox(height: 16),
          Text(
            "Make Your 3D Models Come True",
            style: GoogleFonts.dancingScript(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
             
           ),
            const SizedBox(height: 16)
    ,          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Divider(
                color: Colors.white,
              ),
            )
         ]
       ),
      ),
    );
  }
}