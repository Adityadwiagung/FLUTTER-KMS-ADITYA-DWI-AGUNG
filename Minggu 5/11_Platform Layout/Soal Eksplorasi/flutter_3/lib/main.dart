import 'package:flutter/material.dart';


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
  List<String> items = [
    "Learn Flutter",
    "Learn ReactJS",
    "Learn VueJS",
    "Learn Tailwind CSS",
    "Learn UI/UX",
    "Learn Figma",
    "Learn Digital Marketing",
     ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF6200EE),
        title: const Text("My Flutter App"),
        centerTitle: true,
        actions:  [
          IconButton(onPressed: () {
          }, 
          icon: const Icon(Icons.search),
          )
        ],
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
            child: Text(items[index],
            style:
            const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            ),
          );
        },
        separatorBuilder: (context, int index) => const Divider(),
        itemCount: items.length,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF6200EE),
        selectedItemColor: Colors.white,
        unselectedItemColor: Color.fromARGB(255, 165, 165, 165),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorites",
            ),
           BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.info_rounded),
            label: "Information",
            ),
        ]
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){

          },
          backgroundColor: const Color(0xFF03DAC5),
          foregroundColor: Colors.black,
          child: const Icon(Icons.add),
          ),
    );
  }
}
