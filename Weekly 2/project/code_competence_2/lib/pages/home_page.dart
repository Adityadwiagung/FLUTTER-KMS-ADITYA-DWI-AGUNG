import 'package:code_competence_2/constant/assets.dart';
import 'package:code_competence_2/pages/contact_page.dart';
import 'package:code_competence_2/pages/header_page.dart';
import 'package:code_competence_2/pages/welcome_page.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> images = [
    Assets.assetsImages1,
    Assets.assetsImages2,
    Assets.assetsImages3,
    Assets.assetsImages4,
    Assets.assetsImages5,
    Assets.assetsImages6,
    Assets.assetsImages7,
  ];

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 12, 19, 32),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.mail),
              title: const Text('Contact Us'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.login),
              title: const Text('Login'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children:  [
          const HeaderPage(),
          const WelcomePage(),
          SizedBox(
            height: 190,
            child: GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context, 
                      builder: (context) {
                        return AlertDialog(
                          content: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(images[index],
                            fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }
                    );
                  },
                    child: Padding(
                    padding: const EdgeInsets.only(left: 2, right: 2, top: 8),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        ),
                      child: Image.asset(
                        images[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
                
              },
              itemCount: 5,
            ),
          ),
           const ContactPage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Contact Us',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: 'Login',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 0, 86, 156),
        onTap: _onItemTapped,
      ),
    );
  }
}
       