import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mini_project/bloc/hadist_bloc/hadist%20range/hadist_range_bloc.dart';
import 'package:flutter_mini_project/theme/theme_color.dart';
import 'package:flutter_mini_project/theme/theme_text.dart';
import 'package:flutter_mini_project/widget/container_widget.dart';

class HadistDetailScreen extends StatefulWidget {
  final String person;
  const HadistDetailScreen({super.key, required this.person});

  @override
  State<HadistDetailScreen> createState() => _HadistDetailScreenState();
}

class _HadistDetailScreenState extends State<HadistDetailScreen> {
  
  @override
  void initState() {
    _hadistRangeBloc = BlocProvider.of<HadistRangeBloc>(context);
    _hadistRangeBloc.add(GetHaditsRangeEvent(firstRange: firstRange ?? 1, lastRange: lastRange?? 30, person: widget.person));
    super.initState();
  }

   HadistRangeBloc _hadistRangeBloc = HadistRangeBloc();
  final TextEditingController _firstRangeController = TextEditingController();
  final TextEditingController _lastRangeController = TextEditingController();


  int? firstRange;
  int? lastRange;

  
  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 350,
          padding: const EdgeInsets.only(left: 16, right: 16, top: 70, bottom: 30),
          child: Column(
            children: [
              const Text("Maximal Hadist : 300"),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                        margin: const EdgeInsets.only(
                          left: 70,
                          right: 30,
                        ),
                      child: TextField(
                        controller: _firstRangeController,
                        decoration: const InputDecoration(
                          labelText: 'Start Range',
                          ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                  const Text("-",
                  style: TextStyle(
                    fontSize: 20
                  ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                        margin: const EdgeInsets.only(
                          left: 30,
                          right: 70,
                        ),
                      child: TextField(
                        controller: _lastRangeController,
                        decoration: const InputDecoration(labelText: 'End Range',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: _firstRangeController.text.isNotEmpty && _lastRangeController.text.isNotEmpty && (int.parse(_lastRangeController.text) - int.parse(_firstRangeController.text) <= 299)
                ?
                () {
                  firstRange = int.parse(_firstRangeController.text);
                  lastRange = int.parse(_lastRangeController.text);
                  _hadistRangeBloc.add(GetHaditsRangeEvent(firstRange: firstRange?? 0, lastRange: lastRange?? 0, person: widget.person),);
                  Navigator.of(context).pop();
                  _firstRangeController.clear();
                  _lastRangeController.clear();
                } : null,
                child: const Text('Submit'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hadist',
          style: ThemeTextStyle().textSmall3,
        ),
        backgroundColor: ThemeColor().brown,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list,
            color: Colors.white,
            ),
            onPressed: _showFilterBottomSheet,
          ),
        ],
      ),
      body: BlocBuilder<HadistRangeBloc, HadistRangeState>(
        builder: (context, state) {
          if (state is HadistRangeLoading) {
            return const Center(
                child: CircularProgressIndicator(),
              );
          } else if (state is HadistRangeLoaded) {
            return Column(
              children: [
                ContainerWidget2(
                  title: "${state.hadistRangeModel.data.name}    |    ${state.hadistRangeModel.data.available}"),
                Expanded(
                  child: ListView.separated(
                    itemCount: state.hadistRangeModel.data.hadiths.length,
                    itemBuilder: (context, index) {
                      final hadith = state.hadistRangeModel.data.hadiths[index];
                      return Container(
                        padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 247, 225),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(2, 5),
                          ),
                        ],
                          ),
                        child: ListTile(
                          leading: ContainerWidget(
                            title: hadith.number.toString()),
                          title: Text(hadith.arab,
                          style: ThemeTextStyle().textSmall4,
                          textAlign: TextAlign.end,
                          ),
                          subtitle: Text(hadith.id,
                          style: ThemeTextStyle().textSmall2,
                          textAlign: TextAlign.justify,
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(
                        indent: 20,
                        endIndent: 20,
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (state is HadistRangeEmpty) {
            return const Center(
                child: Text('Data Hadist Kosong'),
              );
          } else if (state is HadistRangeError) {
            return Center(
                child: Text(state.messageError),
              );
          } else {
            return const SizedBox();
          }
        },
      )
    );
  }
}