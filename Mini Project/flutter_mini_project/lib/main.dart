import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mini_project/bloc/doa_bloc/doa_list_bloc.dart';
import 'package:flutter_mini_project/bloc/hadist_bloc/hadist%20list/hadist_list_bloc.dart';
import 'package:flutter_mini_project/bloc/hadist_bloc/hadist%20range/hadist_range_bloc.dart';
import 'package:flutter_mini_project/bloc/quran_bloc/quran%20detal/quran_detail_bloc.dart';
import 'package:flutter_mini_project/bloc/quran_bloc/quran%20list/quran_list_bloc.dart';
import 'package:flutter_mini_project/screen/home_screen/home_screen.dart';
import 'package:flutter_mini_project/theme/theme_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => QuranListBloc()),
      BlocProvider(create: (context) => QuranDetailBloc()),
      BlocProvider(create: (context) => HadistListBloc()),
      BlocProvider(create: (context) => HadistRangeBloc()),
      BlocProvider(create: (context) => DoaListBloc()),
    ], child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: ThemeColor().cream),
        useMaterial3: true,
      ),
      home: const HomeScreen()
    )
    );
  }
}

