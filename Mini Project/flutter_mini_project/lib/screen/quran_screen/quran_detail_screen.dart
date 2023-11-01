import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mini_project/bloc/quran_bloc/quran%20detal/quran_detail_bloc.dart';
import 'package:flutter_mini_project/model/quran_model/quran_lokal_model.dart';
import 'package:flutter_mini_project/service/remote_service/db_helper.dart';
import 'package:flutter_mini_project/theme/theme_color.dart';
import 'package:flutter_mini_project/theme/theme_text.dart';
import 'package:flutter_mini_project/widget/container_widget.dart';

class DetailQuranInitState extends StatelessWidget {
  final String idQuran;
  final QuranLokalModel quranLokalModel;
  const DetailQuranInitState({super.key, required this.idQuran, required this.quranLokalModel});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<QuranDetailBloc>(
      create: (context) => QuranDetailBloc()
        ..add(
          GetQuranDetailEvent(idQuran: idQuran)
          ),
        child: QuranDetailScreen(
          idQuran: idQuran,
          quranLokalModel: quranLokalModel,
        ),
      );
  }
}

class QuranDetailScreen extends StatefulWidget {
  final String idQuran;
  final QuranLokalModel quranLokalModel;
  const QuranDetailScreen({super.key, required this.idQuran, required this.quranLokalModel});

  @override
  State<QuranDetailScreen> createState() => _QuranDetailScreenState();
}

class _QuranDetailScreenState extends State<QuranDetailScreen> {

  DatabaseHelper dbHelper = DatabaseHelper();

  QuranLokalModel? _quranLokalModel;


  void getQuranById(int nomor) async {
  _quranLokalModel = await dbHelper.getQuranById(nomor);
    setState(() {});
  }

  @override
  void initState() {
    getQuranById(int.parse(widget.idQuran));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Al-Qur'an",
            style: ThemeTextStyle().textSmall3,
          ),
          backgroundColor: ThemeColor().brown,
      ),
      body: BlocBuilder<QuranDetailBloc, QuranDetailState>(
        builder: (context, state) {
          if (state is QuranDetailLoading) {
            return const Center(
                child: CircularProgressIndicator(),
              );
          } else if (state is QuranDetailLoaded) {
            final ayatList = state.dataDetailModel.ayat;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ContainerWidget2(
                  title: "${state.dataDetailModel.namaLatin}   |   ${state.dataDetailModel.nama}   |   ${state.dataDetailModel.jumlahAyat} ",
                  ),
                Expanded(
                  child: ListView.builder(
                    itemCount: ayatList.length,
                    itemBuilder: (context, index) {
                      final ayat = ayatList[index];
                      return GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return SizedBox(
                                height: 60,
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: const Icon(Icons.add_box),
                                      title: const Text("Bookmark"),
                                      onTap: () async {
                                        if (_quranLokalModel?.nomor == widget.quranLokalModel.nomor){
                                          await dbHelper.updateQuran(widget.quranLokalModel);
                                          Navigator.pop(context);
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(
                                              content: Text("Berhasil Update Data"),
                                            ),
                                          );
                                        } else {
                                          await dbHelper.insertQuran(widget.quranLokalModel);
                                          getQuranById(int.parse(widget.idQuran));
                                          Navigator.pop(context);
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(
                                              content: Text("Berhasil Menambahkan Data"),
                                            ),
                                          );
                                        }
                                      },
                                    )
                                  ],
                                ),
                              );
                            }
                          );
                        },
                        child: Column(
                        children: [
                          ListTile(
                            leading: ContainerWidget(
                              title: ayat.nomor.toString()),
                            title: Text(
                              ayat.ar,
                              textAlign: TextAlign.end,
                              style: ThemeTextStyle().textSmall4
                            ),
                            subtitle: Text(
                              ayat.idn,
                              textAlign: TextAlign.justify,
                              style: ThemeTextStyle().textSmall2
                            ),
                          ),
                          const Divider(
                            color: Colors.grey,
                            indent: 20,
                            endIndent: 20,
                          ),
                        ],
                      )
                      );
                      
                    },
                  ),
                ),
              ],
            );
          } else if (state is QuranDetailEmpty) {
            return const Center(
                child: Text('Data Al-Quran Kosong'),
              );
          } else if (state is QuranDetailError) {
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