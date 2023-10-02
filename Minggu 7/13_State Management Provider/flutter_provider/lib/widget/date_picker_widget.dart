import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/date_picker_change_notifier.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DatePickerWidget extends StatelessWidget {

   const DatePickerWidget(BuildContext context, {super.key});

  @override
  Widget build(BuildContext context) {
    final datePickerProvider = Provider.of<DatePickerChangeNotifier>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Date'),
            TextButton(
            onPressed:() async{
              final selectDate = await showDatePicker(
              context: context, 
              initialDate: datePickerProvider.currentDate, 
              firstDate: DateTime(1990), 
              lastDate: DateTime(datePickerProvider.currentDate.year + 5)
              );
              if (selectDate != null) {
                  datePickerProvider.dueDate = selectDate;
                }
            },
            child: const Text('Select'),
            )
          ],
          ),
        Text(
          DateFormat('dd-MM-yyyy').format(datePickerProvider.dueDate),
        ),
      ],
    );
  }
}