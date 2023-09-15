import 'package:flutter/material.dart';

import 'contact_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 70, 70, 70),
        title: const Text("MaterialApp"),
      ),
      body: ListView(
        children: [
          Padding(
            padding:
             EdgeInsets.only(top: 20, left: 15),
             child: Text(
              "Contact List",
              style: 
              TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: contactList.length,
            itemBuilder: (context, index) {
              final contact = contactList[index];
              return Container(
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                ),
                width: double.infinity,
                child: ListTile(
                  leading: Container(
                    width: MediaQuery.of(context).size.width / 6,
                    height: MediaQuery.of(context).size.width / 6,
                    decoration:const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      contact.username[0],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  title: Text(
                    contact.username,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Text(
                    contact.phone,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: Wrap(
                    spacing: 15, // space between two icons
                    children: <Widget>[
                      Icon(Icons.edit), // icon-1
                      Icon(Icons.delete), // icon-2
                    ],
                  ), 
                ),
              );
            },
            )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            ),
           BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
            )
        ]
        ),
    );
  }
}
