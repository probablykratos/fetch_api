import 'package:fetch_api/bloc/user_event.dart';
import 'package:fetch_api/bloc/user_state.dart';
import 'package:fetch_api/data/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent,UserState>{

  final UserRepository _userRepository;
  UserBloc(this._userRepository): super(InitialUserState()){

  on<LoadUserEvent>((event,emit)async{
    emit(UserLoadingState());
  try{
      final users= await  _userRepository.getUser();
      emit(UserSuccessState(users));
  }catch(e){
      emit(UserErrorState(e.toString()));
  }
  });}
}