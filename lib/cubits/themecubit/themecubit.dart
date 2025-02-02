import 'package:chatsapp/cubits/themecubit/themecubitstate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Themecubit extends Cubit<Themecubitstate> {
  Themecubit() : super(Themecubitstate.light);
  tochange() {
    emit(state == Themecubitstate.light
        ? Themecubitstate.dark
        : Themecubitstate.light);
  }
}
