import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
    
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 395,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/world.png'),
          
          fit: BoxFit.cover,
        )
      ),
      padding: const EdgeInsets.only(
        bottom: 7.5,
        top: 12,
        left: 16,
        right: 16,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: 
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Welcome',
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Text('Timea is a 3D animation studio with services that include post-production, visual effects, 3D modeling and animation.',
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Image.asset('assets/images/miles3.png',
                      scale: 8,
                                  ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 120,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Some of Our Best Works',
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 15
                    ),
                  ),
                  const Icon(Icons.arrow_downward_sharp),
                ],
              )
          ],
        ),
      );   
   }
}