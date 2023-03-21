part of 'users_cubit.dart';

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

class ErrorState extends UsersBlocState {
  final ErrorsEnum error;

  ErrorState(this.error);
}
