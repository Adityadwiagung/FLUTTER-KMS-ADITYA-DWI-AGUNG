import 'package:flutter/material.dart';
import 'package:flutter_application_diceb/model/dice_bear_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ImageGenScreen extends StatelessWidget {
  const ImageGenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avatar Generator'),
        backgroundColor: Colors.red,
      ),

      body: Consumer<DiceBearModel>(builder: (context, diceBearProvider, child) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              diceBearProvider.isLoading 
              ? CircularProgressIndicator()
              : diceBearProvider.imageData.isEmpty
                ? Icon(
                    Icons.image,
                    size: 68,
                  ) : SvgPicture.string(diceBearProvider.imageData,
                    height: 150,
                    width: 150,
                  ),
              Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  controller: diceBearProvider.diceBearController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Masukkan Namamu'
                  ),
                ),
                ),
                ElevatedButton(
                  onPressed: () {
                    diceBearProvider.getDiceBear();
                  }, 
                  child: const Text('Generate Image'),
                  )
                ],
              ),
            );
          },
      )
    );
  }
}