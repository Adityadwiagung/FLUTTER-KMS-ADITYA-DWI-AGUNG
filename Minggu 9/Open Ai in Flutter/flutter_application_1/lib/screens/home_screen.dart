import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/result_screen.dart';
import 'package:flutter_application_1/services/recommendation.dart';

const List <String> internalStorage = <String>[
  '64 GB',
  '128 GB',
  '256 GB',
  '512 GB',
  '1 TB'
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _cameraController = TextEditingController();
  final TextEditingController _budgetController = TextEditingController();
  String storageValue = internalStorage.first;
  bool isLoading = false;

  void _getRecommendation() async {
    setState(() {
      isLoading = true;
    });

    try {
      final result = await RecommendationSercive.getRecommendation(
        cameraRes: _cameraController.text, 
        internalStorage: storageValue, 
        budget: _budgetController.text
      );

      if (mounted) {
        setState(() {
          isLoading = false;
        });
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return ResultScreen(gptResponseData: result);
        }
      ));
      }

    } catch (e) {
      const snackBar = SnackBar(
        content: Text('Gagal mengirim request, Coba lagi :)')
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Smartphone Recommendation AI"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body:  SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Masukkan Spesifikasi Smarthphone impianmu"),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: _budgetController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Budget',
                          hintText: 'Masukkan Budget dalam Rupiah',
                          filled: true
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: _cameraController,
                        decoration: const InputDecoration(
                          labelText: 'Camera (MP)',
                          hintText: 'Masukkan Resolusi Kamera',
                          filled: true
                        ),
                      ),
                      const SizedBox(height: 20),
                      DropdownButton<String>(
                        value: storageValue, 
                        icon: const Icon(Icons.arrow_drop_down),
                        elevation: 16,
                        underline: Container(
                          height: 2,
                          color: Colors.red,
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            storageValue = value!;
                          });
                        },
                        items: 
                          internalStorage.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value)
                              );
                          }).toList()
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: ElevatedButton(
                          onPressed: _getRecommendation, 
                          child: const Text("GET RECOMMENDATIONS"),
                          ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}