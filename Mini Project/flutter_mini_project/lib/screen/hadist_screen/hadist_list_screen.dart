import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mini_project/bloc/hadist_bloc/hadist list/hadist_list_bloc.dart';
import 'package:flutter_mini_project/screen/hadist_screen/hadist_detail_screen.dart';
import 'package:flutter_mini_project/theme/theme_color.dart';
import 'package:flutter_mini_project/theme/theme_text.dart';
import 'package:flutter_mini_project/widget/container_widget.dart';

class HadistListScreen extends StatefulWidget {
  const HadistListScreen({super.key});

  @override
  State<HadistListScreen> createState() => _HadistListScreenState();
}

class _HadistListScreenState extends State<HadistListScreen> {
@override
  void initState() {
    BlocProvider.of<HadistListBloc>(context).add(GetHadistEvent());
    super.initState();
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
      ),

      body: BlocBuilder<HadistListBloc, HadistListState>(
        builder: (context, state) {
          if (state is HadistListLoading) {
            return const Center(
                child: CircularProgressIndicator(),
              );
          } else if (state is HadistListLoaded) {
            return ListView.builder(
                  itemCount: state.hadist.data.length,
                  itemBuilder: (context, int index) {
                    var hadistData = state.hadist.data[index];
                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context, MaterialPageRoute(
                          builder: (_) => HadistDetailScreen(
                            person: hadistData.id,
                            )
                          )
                        ),
                        child: Container(
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
                              title: (index + 1).toString()),
                            title: Text(hadistData.name,
                            style: ThemeTextStyle().textSmall,
                            ),
                            subtitle: Text(hadistData.id,
                            style: ThemeTextStyle().textSmall2,
                            ),
                            trailing: Text(
                              hadistData.available.toString(),
                              style: ThemeTextStyle().textSmall,
                            ),
                          ),
                        ),
                    );
                  },
              );
          } else if (state is HadistListEmpty) {
            return const Center(
                child: Text('Data Hadist Kosong'),
              );
          } else if (state is HadistListError) {
            return Center(
                child: Text(state.messageError),
              );
          } else {return const SizedBox();}
        }
        ),
    );
  }
}