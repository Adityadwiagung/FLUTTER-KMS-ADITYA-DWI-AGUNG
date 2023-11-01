import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mini_project/bloc/quran_bloc/quran%20list/quran_list_bloc.dart';
import 'package:flutter_mini_project/model/quran_model/quran_lokal_model.dart';
import 'package:flutter_mini_project/screen/quran_screen/quran_bookmark_screen.dart';
import 'package:flutter_mini_project/screen/quran_screen/quran_detail_screen.dart';
import 'package:flutter_mini_project/theme/theme_color.dart';
import 'package:flutter_mini_project/theme/theme_text.dart';
import 'package:flutter_mini_project/widget/container_widget.dart';

class QuranListScreen extends StatefulWidget {
  const QuranListScreen({super.key});

  @override
  State<QuranListScreen> createState() => _QuranListScreenState();
}

class _QuranListScreenState extends State<QuranListScreen> {
  final audioPlayer = AudioPlayer();
  List<bool> _audioPlayList = [];
  Duration _currentPosition = Duration.zero;
  Duration _currentDuration = Duration.zero;

  @override
  void initState() {
    BlocProvider.of<QuranListBloc>(context).add(GetQuranEvent());

      audioPlayer.onDurationChanged.listen((newDuration) {
        setState(() {
          _currentDuration = newDuration;
        });
      });

            audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        _currentPosition = newPosition;
      });
    });
    super.initState();
  }

    String formatTime(int seconds) {
    return '${(Duration(seconds: seconds))}'.split('.')[0].padLeft(8, '0');
    
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Al-Quran',
            style: ThemeTextStyle().textSmall3,
          ),
          backgroundColor: ThemeColor().brown,
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text(
                  'Surah',
                  style: ThemeTextStyle().textSmall3,
                ),
              ),
              Tab(
                child: Text(
                  'Bookmark',
                  style: ThemeTextStyle().textSmall3,
                ),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            BlocBuilder<QuranListBloc, QuranListState>(builder: (context, state) {
              if (state is QuranListLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is QuranListLoaded) {
                if (_audioPlayList.isEmpty) {
                  _audioPlayList = List.filled(state.quran.results.length, false);
                }
                return ListView.builder(
                  itemCount: state.quran.results.length,
                  itemBuilder: (context, int index) {
                    var quranData = state.quran.results[index];
                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailQuranInitState(
                            idQuran: quranData.nomor.toString(),
                            quranLokalModel: QuranLokalModel(
                              nomor: quranData.nomor,
                              namaLatin: quranData.namaLatin,
                            ),
                          ),
                        ),
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
                            title:  quranData.nomor.toString(),),
                          title: Text(quranData.namaLatin,
                          style: ThemeTextStyle().textSmall,
                          ),
                          subtitle: Text('${quranData.arti} | ${quranData.jumlahAyat}',
                          style: ThemeTextStyle().textSmall2,
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "${quranData.nama}  |",
                                style: ThemeTextStyle().textSmalll,
                              ),
                              IconButton(
                                onPressed: () async {
                                  if (_audioPlayList[index]) {
                                    audioPlayer.pause();
                                    _audioPlayList[index] = false;
                                  } else {
                                    audioPlayer.play(
                                      UrlSource(quranData.audio)
                                    );
                                    _audioPlayList[index] = true;
                                  }
                                  setState(() {});
                                  showBottomSheet(
                                    context: context, 
                                    builder: (BuildContext context) {
                                      return SizedBox(
                                        height: 170 ,
                                        child: StatefulBuilder(
                                          builder: 
                                          (BuildContext context, StateSetter mystate) {
                                          return Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                IconButton(
                                                  onPressed: () {
                                                    if (_audioPlayList[index]) {
                                                      audioPlayer.pause();
                                                      _audioPlayList[index] = false;
                                                    } else {
                                                      audioPlayer.play(
                                                        UrlSource(quranData.audio)
                                                      );
                                                      _audioPlayList[index] = true;
                                                    }
                                                    mystate(() {});
                                                    setState(() {});
                                                  },
                                                  icon: Icon(_audioPlayList[index] ? Icons.pause : Icons.play_arrow)
                                                ),
                                                IconButton(
                                                  onPressed: () {
                                                    audioPlayer.stop();
                                                    _audioPlayList[index] = false;
                                                    mystate(() {});
                                                  },
                                                  icon: const Icon(Icons.stop_sharp)
                                                ),
                                              ],
                                            ),
                                          Slider(
                                              min: 0,
                                              max: _currentDuration.inSeconds.toDouble(),
                                              value: _currentPosition.inSeconds.toDouble(),
                                              onChanged: (value) {
                                                final position = Duration(seconds: value.toInt());
                                                audioPlayer.seek(position);
                                                mystate(() {});
                                              },
                                            ),
                                            Container(
                                              padding: const EdgeInsets.all(20),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(formatTime(_currentPosition.inSeconds)),
                                                  Text(formatTime((_currentDuration - _currentPosition).inSeconds)),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                        }
                                        ),
                                      );
                                      
                                    },
                                  );
                                  setState(() {});
                                },
                                icon: Icon(_audioPlayList[index] ? Icons.pause : Icons.play_arrow),
                              )
                            ],
                          ),
                        ),
                      )
                      );
                    },
                  );
                } else if (state is QuranListEmpty) {
                  return const Center(
                    child: Text('Data Al-Quran Kosong'),
                  );
                } else if (state is QuranListError) {
                  return Center(
                    child: Text(state.messageError),
                  );
                } else {
                  return const SizedBox();
                }
              }),
            const QuranBookmarkScreen(),
          ]),
        ),
      );
    }
  }
