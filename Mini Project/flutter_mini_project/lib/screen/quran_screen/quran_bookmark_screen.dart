import 'package:flutter/material.dart';
import 'package:flutter_mini_project/model/quran_model/quran_lokal_model.dart';
import 'package:flutter_mini_project/screen/quran_screen/quran_detail_screen.dart';
import 'package:flutter_mini_project/service/remote_service/db_helper.dart';
import 'package:flutter_mini_project/theme/theme_text.dart';
import 'package:flutter_mini_project/widget/container_widget.dart';

class QuranBookmarkScreen extends StatefulWidget {
  final QuranLokalModel? quranModel;
  const QuranBookmarkScreen({super.key, this.quranModel});

  @override
  State<QuranBookmarkScreen> createState() => _QuranBookmarkScreenState();
}

class _QuranBookmarkScreenState extends State<QuranBookmarkScreen> {
  List<QuranLokalModel> _quranLokalModel = [];
  // QuranLokalModel _ayatList = QuranLokalModel();
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  QuranLokalModel? quranLokalModel;

  bool _isLoading = true;

  void getQuranLokal() async {
    if(mounted) {
      _quranLokalModel = await _databaseHelper.getListQuranLocal();
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    getQuranLokal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : _quranLokalModel.isEmpty
              ? const Center(
                  child: Text("Belum ada data"),
                )
              : ListView.builder(
                  itemCount: _quranLokalModel.length,
                  itemBuilder: (context, index) {
                    var quranData = _quranLokalModel[index];
                    return GestureDetector(
                      onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => DetailQuranInitState(
                        idQuran: quranData.nomor.toString(),
                        quranLokalModel: QuranLokalModel(
                          nomor: quranData.nomor,
                          namaLatin: quranData.namaLatin,
                        ),
                      ))).then((value) => getQuranLokal()),
                      child: Column(
                        children: [
                          ListTile(
                            leading: ContainerWidget(
                              title: (index + 1).toString()),
                            title: Text("${quranData.namaLatin}",
                            style: ThemeTextStyle().textSmall
                            ),
                            subtitle: Text("Surah ke ${quranData.nomor.toString()}",
                            style: ThemeTextStyle().textSmall2
                            ),
                            trailing: IconButton(
                              onPressed: () async {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("Apakah anda yakin?",
                                      style: ThemeTextStyle().textSmall,
                                      ),
                                      content: Text("Yakin ingin menghapus data?",
                                      style: ThemeTextStyle().textSmall2
                                      ),
                                      actions: [
                                        TextButton(onPressed: () async {
                                          await _databaseHelper
                                          .deleteQuran(quranData.nomor?.toInt() ?? 0);
                                          quranLokalModel = null;
                                          setState(() {});
                                          ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                            content: Text("Data berhasil dihapus"),
                                          ),
                                        );
                                        Navigator.pop(context);
                                        }, child: const Text('Ya')),
                                        TextButton(onPressed: () {
                                          Navigator.pop(context);
                                        }, child: const Text('Tidak')),
                                      ],
                                    );
                                  }
                                );
                              },
                              icon: const Icon(Icons.delete)),
                          )
                        ],
                      ),
                    );
                  },
                ),
        );
    }
}
