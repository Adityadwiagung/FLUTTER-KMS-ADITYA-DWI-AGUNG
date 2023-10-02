import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_provider/provider/color_picker_change_notifier.dart';
import 'package:provider/provider.dart';

class ColorPickerWidget extends StatelessWidget {
  const ColorPickerWidget(BuildContext context, {super.key});

  @override
  Widget build(BuildContext context) {
    final colorPickerProvider = Provider.of<ColorPickerChangeNotifier>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Color'),
        const SizedBox(height: 10,),
        Container(
          height: 100, 
          width: double.infinity,
          
          decoration: BoxDecoration(
            color: colorPickerProvider.currentColor,
            borderRadius: BorderRadius.circular(20)
          ),
          ),
          const SizedBox(height: 10,),
          Center(
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context, 
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Pick Your Color'),
                      content: SingleChildScrollView(
                        child: ColorPicker(
                          pickerColor: colorPickerProvider.currentColor,
                          onColorChanged: (color) {
                            colorPickerProvider.currentColor = color;
                        },
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          }, 
                          child: const Text('Save')
                          )
                      ],
                    );
                  },
                );
              }, 
              child: const Text(
                'Pick Color',
              ),
              ),
          ),
      ],
    );
  }
}