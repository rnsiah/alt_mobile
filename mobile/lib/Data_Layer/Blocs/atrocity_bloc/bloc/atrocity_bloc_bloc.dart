import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile/Data_Layer/Models/atrocity_model.dart';

import 'package:mobile/Data_Layer/Repoositories/atrocity_repositories.dart';

part 'atrocity_bloc_event.dart';
part 'atrocity_bloc_state.dart';

class AtrocityBlocBloc extends Bloc<AtrocityBlocEvent, AtrocityBlocState> {
  AtrocityRepository atrocityRepository;
  AtrocityBlocBloc({required this.atrocityRepository})
      : super(AtrocityBlocState());

  @override
  Stream<AtrocityBlocState> mapEventToState(
    AtrocityBlocEvent event,
  ) async* {
    if (event is AtrocityListFetched) {
      List<Atrocity> atrocity = await atrocityRepository.getAtrocities();
      
      yield state.copyWith(
          atrocities: atrocity, status: AtrocityStatus.success);
    }
  }
}
