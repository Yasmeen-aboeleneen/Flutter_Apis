import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api/Core/Api/dio_consumer.dart';
import 'package:flutter_api/Core/Cache/cache_helper.dart';
import 'package:flutter_api/Cubit/user_cubit.dart';
import 'package:flutter_api/Views/Auth/sign_in_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(
    BlocProvider(
      create: (context) => UserCubit(DioConsumer(dio: Dio())),
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
      home: SignInScreen(),
    );
  }
}
