import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile/Data_Layer/Models/shirt_model.dart';
import 'package:mobile/Data_Layer/Repoositories/shirt_repository.dart';

part 'shirt_event.dart';
part 'shirt_state.dart';

class ShirtBloc extends Bloc<ShirtEvent, ShirtState> {
  final ShirtRepository shirtRepository;
  ShirtBloc({required this.shirtRepository}) : super(ShirtState());

  @override
  Stream<ShirtState> mapEventToState(
    ShirtEvent event,
  ) async* {
    if (event is FetchShirts) {
      List<Shirt> shirtlist = await shirtRepository.fetchShirtList();
      yield state.copyWith(shirtlist: shirtlist);
    }
  }
}
