import 'package:f_practice_api_bloc/cubit/cubit/users_cubit.dart';
import 'package:f_practice_api_bloc/data/widgets/snackbar.dart';
import 'package:f_practice_api_bloc/models/random_user_model.dart';
import 'package:f_practice_api_bloc/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
