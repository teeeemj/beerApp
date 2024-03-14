import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(Brightness.light));

  void setThemeBrightness() {
    emit(ThemeState(state.brightness == Brightness.light
        ? Brightness.dark
        : Brightness.light));
  }
}
