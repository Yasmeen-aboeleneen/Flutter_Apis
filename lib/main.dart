import 'package:flutter/material.dart';
import 'package:flutter_api/Cubit/user_cubit.dart';
import 'package:flutter_api/Views/Auth/sign_up_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => UserCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Api',
      home: SignUpScreen(),
    );
  }
}
