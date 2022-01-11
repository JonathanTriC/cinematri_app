import 'package:bloc/bloc.dart';
import 'package:cinematri_app/models/user_model.dart';
import 'package:cinematri_app/services/auth_service.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void signUp({
    required String email,
    required String password,
    required String name,
    String city = '',
  }) async {
    try {
      emit(AuthLoading());
      UserModel user = await AuthService().signUp(
        email: email,
        password: password,
        name: name,
        city: city,
      );
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void signOut() async {
    try {
      emit(AuthLoading());
      await AuthService().signOut();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }
}
