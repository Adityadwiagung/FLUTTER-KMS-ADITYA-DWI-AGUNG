import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eksplorasi_1/bloc/galery_bloc/bloc/galery_bloc.dart';

class GaleryScreen extends StatefulWidget {
  const GaleryScreen({super.key});

  @override
  State<GaleryScreen> createState() => _GaleryScreenState();
}

class _GaleryScreenState extends State<GaleryScreen> {


  @override
  void initState() {
    super.initState();
    BlocProvider.of<GaleryBloc>(context).add(LoadImages()); 

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 174, 175, 160),
        title: const Text('Galery'),
        centerTitle: true,
      ),

      body: BlocBuilder<GaleryBloc, GaleryState>(
        builder: (context, state) {
          if (state is GaleryLoaded) {
            final images = state.images;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: const Color(0xFFEDDCC0),
                      builder: (context) {
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            ClipOval(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 50, right: 50, top: 10),
                                child: Image.asset(images[index]),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text(
                                        'Tekan Ya untuk Melihat Lihat Gambar',
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Image.asset(images[index])
                                        ],
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            Navigator.pushNamed(
                                              context,
                                              '/detail',
                                              arguments:
                                                  Image.asset(images[index]),
                                            );
                                          },
                                          child: const Text('Ya'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Tidak'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: const Text("Lihat Gambar"),
                            )
                          ],
                        );
                      },
                    );
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Image.asset(
                      images[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              itemCount: images.length,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        
      ),
    );
    
  }
}