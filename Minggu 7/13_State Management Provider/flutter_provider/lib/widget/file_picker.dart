import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/file_picker_change_notifier.dart';
import 'package:provider/provider.dart';

class FilePickerWidget extends StatelessWidget {
  const FilePickerWidget(BuildContext context, {super.key});

  @override
  Widget build(BuildContext context) {
    final filePickerProvider = Provider.of<FilePickerChangeNotifier>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Pick File'),
        const SizedBox(height: 10,),
        Center(
          child: ElevatedButton(
            onPressed: ()  {
              filePickerProvider.pickFile();
            }, 
            child: 
            const Text('Pick File'),
            ),
        ),
        const SizedBox(height: 10,),
        Center(child: Text(filePickerProvider.result?.files.first.name ?? '-')),
      ],
    );
  }
}