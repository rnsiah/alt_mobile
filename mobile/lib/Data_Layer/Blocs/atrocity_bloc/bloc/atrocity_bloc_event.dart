part of 'atrocity_bloc_bloc.dart';

abstract class AtrocityBlocEvent extends Equatable {
  const AtrocityBlocEvent();

  @override
  List<Object> get props => [];
}

class AtrocityListFetched extends AtrocityBlocEvent {
 

  AtrocityListFetched();
  List<Object> get props => [];
}


