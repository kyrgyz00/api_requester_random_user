part of 'users_bloc_cubit.dart';

@immutable
abstract class UsersBlocState {}

class UsersBlocInitial extends UsersBlocState {}

class LoadingState extends UsersBlocState {
  LoadingState();
}

class UsersFetchedState extends UsersBlocState {
  final RandomUserModel user;

  UsersFetchedState(this.user);
}

class CatchErrorstate extends UsersBlocState {
  final String error;

  CatchErrorstate(this.error);
}
