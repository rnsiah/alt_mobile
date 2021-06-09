import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile/Data_Layer/Models/non_profit_model.dart';
import 'package:mobile/Data_Layer/Repoositories/nonProfit_repository.dart';

part 'nonprofit_event.dart';
part 'nonprofit_state.dart';

class NonprofitBloc extends Bloc<NonprofitEvent, NonprofitState> {
  final NonProfitRespository nonProfitRespository;
  NonprofitBloc({required this.nonProfitRespository})
      : super(NonprofitInitial());

  @override
  Stream<NonprofitState> mapEventToState(
    NonprofitEvent event,
  ) async* {
    if (event is FetchNonProfitList) {
      List<NonProfit> nonprofitList =
          await nonProfitRespository.fetchNonProfits();
      yield state.copyWith(nonprofitList: nonprofitList);
    }
  }
}
