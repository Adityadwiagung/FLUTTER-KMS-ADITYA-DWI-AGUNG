import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/openai_model.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.gptResponseData});

  final GptData gptResponseData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recommendations"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text('Recommendations'),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                gptResponseData.choices[0].text,
                textAlign: TextAlign.justify,
              ),
              )
        ],
      ),
    );
  }
}