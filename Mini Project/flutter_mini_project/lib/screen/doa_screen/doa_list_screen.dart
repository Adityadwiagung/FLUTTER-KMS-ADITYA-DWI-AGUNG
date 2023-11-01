import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mini_project/bloc/doa_bloc/doa_list_bloc.dart';
import 'package:flutter_mini_project/screen/doa_screen/doa_detail_screen.dart';
import 'package:flutter_mini_project/theme/theme_color.dart';
import 'package:flutter_mini_project/theme/theme_text.dart';
import 'package:flutter_mini_project/widget/container_widget.dart';

class DoaScreenList extends StatefulWidget {
  const DoaScreenList({super.key});

  @override
  State<DoaScreenList> createState() => _DoaScreenListState();
}

class _DoaScreenListState extends State<DoaScreenList> {

    @override
  void initState() {
    BlocProvider.of<DoaListBloc>(context).add(GetDoaListEvent());
    super.initState();
  }

  
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
      body: BlocBuilder<DoaListBloc, DoaListState>(builder: (context, state) {
            if (state is DoaListLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is DoaListLoaded) {
                return ListView.builder(
                  itemCount: state.doaModel.data.length,
                  itemBuilder: (context, int index) {
                    var doaData = state.doaModel.data[index];
                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context, MaterialPageRoute(
                          builder: (_) => DoaDetailInitState(
                            idDoa: doaData.id.toString(),
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
                              title: doaData.id.toString()),
                            title: Text(doaData.doa),
                          ),
                        ),
                      );
                    },
                    
              );
            } else if (state is DoaListEmpty) {
              return const Center(
                child: Text('Data Doa Kosong'),
              );
            } else if (state is DoaListError) {
                return Center(
                child: Text(state.messageError),
              );
            } else {
              return const SizedBox();
            }
          }),
      );
  }
}