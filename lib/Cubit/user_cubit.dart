import 'package:flutter/material.dart';
import 'package:flutter_api/Core/Api/end_points.dart';
import 'package:flutter_api/Core/Cache/cache_helper.dart';
import 'package:flutter_api/Core/Errors/exceptions.dart';
import 'package:flutter_api/Core/Models/sign_in_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter_api/Core/Api/api_consumer.dart';
import 'package:flutter_api/Cubit/user_state.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(
    this.api,
  ) : super(UserInitial());
  final ApiConsumer api;
  //Sign in Form key
  GlobalKey<FormState> signInFormKey = GlobalKey();
  //Sign in email
  TextEditingController signInEmail = TextEditingController();
  //Sign in password
  TextEditingController signInPassword = TextEditingController();
  //Sign Up Form key
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  //Profile Pic
  XFile? profilePic;
  //Sign up name
  TextEditingController signUpName = TextEditingController();
  //Sign up phone number
  TextEditingController signUpPhoneNumber = TextEditingController();
  //Sign up email
  TextEditingController signUpEmail = TextEditingController();
  //Sign up password
  TextEditingController signUpPassword = TextEditingController();
  //Sign up confirm password
  TextEditingController confirmPassword = TextEditingController();
  SignInModel? user;
  signIn() async {
    try {
      emit(SignInLoading());
      final response = await api.post(EndPoints.signIn, data: {
        ApiKeys.email: signInEmail.text,
        ApiKeys.password: signInPassword.text
      });
      user = SignInModel.fromJson(response);
      final decodedToken = JwtDecoder.decode(user!.token);
      CacheHelper().saveData(key: ApiKeys.token, value: user!.token);
      CacheHelper().saveData(key: ApiKeys.id, value: decodedToken[ApiKeys.id]);
      emit(SignInSuccess());
    } on ServerException catch (e) {
      emit(SignInFailure(errorMessage: e.errorModel.errorMessage));
    }
  }
}
