import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:f_practice_api_bloc/helpers/api_requester.dart';
import 'package:f_practice_api_bloc/helpers/error_helper.dart';
import 'package:f_practice_api_bloc/models/random_user_model.dart';
import 'package:meta/meta.dart';

part 'users_bloc_state.dart';

class UsersBlocCubit extends Cubit<UsersBlocState> {
  UsersBlocCubit() : super(UsersBlocInitial());
  APIRequester apiRequester = APIRequester();
  Future<void> getUsers() async {
    late RandomUserModel user;

    emit(LoadingState());

    try {
      var response = await apiRequester.toGet("/api");
      // log(response.data["results"][0].toString());

      user = RandomUserModel.fromJson(response.data["results"][0]);

      emit(UsersFetchedState(user));
    } catch (error) {
      log(error.toString());
      
      // emit(CatchErrorstate(""));
    }
  }
}
