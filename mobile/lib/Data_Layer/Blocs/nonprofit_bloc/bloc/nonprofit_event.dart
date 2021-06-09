part of 'nonprofit_bloc.dart';

abstract class NonprofitEvent extends Equatable {
  const NonprofitEvent();
  


  @override
  List<Object> get props => [];
}

class FetchNonProfitList extends NonprofitEvent{}