import 'package:cubittest/cubit/states/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class AppCubit extends Cubit <AppStates>
{
  AppCubit() : super(InitAppStates());
  static AppCubit getCubic (BuildContext context){
    return BlocProvider.of(context);
  }

  int num = 0;
  void inc () => {num ++ , emit(Increment())};
  void dec () => {num -- , emit(Decrement())};
}