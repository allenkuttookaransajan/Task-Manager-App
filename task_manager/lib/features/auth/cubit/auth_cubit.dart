import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/core/services/sp_services.dart';
import 'package:task_manager/features/auth/repository/auth_local_repository.dart';
import 'package:task_manager/features/auth/repository/auth_remote_repository.dart';
import 'package:task_manager/models/user_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthIntial());
  final authRemoteRepository = AuthRemoteRepository();
  final authLocalRepository = AuthLocalRepository();
  final spService = SpService();

  void getUserData() async {
    try {
      emit(AuthLoading());
      final userModel = await authRemoteRepository.getUserData();
      if (userModel != null) {
        await authLocalRepository.insertUser(userModel);
        emit(AuthLoggedIn(userModel));
      } else {
        emit(AuthIntial());
      }
    } catch (e) {
      print(e);
      emit(AuthIntial());
    }
  }

  void signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      emit(AuthLoading());
      await authRemoteRepository.signUp(
        name: name,
        email: email,
        password: password,
      );
      emit(AuthSignup());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  void login({
    required String email,
    required String password,
  }) async {
    try {
      emit(AuthLoading());
      final userModel = await authRemoteRepository.login(
        email: email,
        password: password,
      );

      if (userModel.token.isNotEmpty) {
        await spService.setToken(userModel.token);
      }

      await authLocalRepository.insertUser(userModel);

      emit(AuthLoggedIn(userModel));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
