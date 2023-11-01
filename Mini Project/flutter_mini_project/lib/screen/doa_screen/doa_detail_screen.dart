import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mini_project/bloc/doa_bloc/doa_list_bloc.dart';
import 'package:flutter_mini_project/theme/theme_color.dart';
import 'package:flutter_mini_project/theme/theme_text.dart';
import 'package:flutter_mini_project/widget/container_widget.dart';

class DoaDetailInitState extends StatelessWidget {
  final String idDoa;
  const DoaDetailInitState({super.key, required this.idDoa});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DoaListBloc>(
      create: (context) => DoaListBloc()
        ..add(
          GetDoaDetailEvent(idDoa: idDoa)
          ),
        child: const DoaDetailScreen(),
      );
  }
}

class DoaDetailScreen extends StatelessWidget {
  const DoaDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Do'a Sehari hari",
          style: ThemeTextStyle().textSmall3,
        ),
        backgroundColor: ThemeColor().brown,
      ),
      body: BlocBuilder<DoaListBloc, DoaListState>(
        builder: (context, state) {
          if (state is DoaDetailLoading) {
            return const Center(
                child: CircularProgressIndicator(),
              );
          } else if (state is DoaDetailLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ContainerWidget2(
                  title: state.doaModel.data[0].doa,
                  ),
                  Container(
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
                      title: Text(
                        state.doaModel.data[0].ayat,
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          fontSize: 25
                        ),
                      ),
                      subtitle: Column(
                        children: [
                          const SizedBox(height: 10,),
                          Text(
                            state.doaModel.data[0].latin,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontSize: 15
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Text(
                            state.doaModel.data[0].artinya,
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                              fontSize: 15
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ]
            );
          } else if (state is DoaDetailEmpty) {
            return const Center(
                child: Text('Data Doa Kosong'),
              );
          } else if (state is DoaDetailError) {
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