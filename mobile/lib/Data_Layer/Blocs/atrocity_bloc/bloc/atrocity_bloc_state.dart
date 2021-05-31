part of 'atrocity_bloc_bloc.dart';

enum AtrocityStatus { initial, success, failure }

class AtrocityBlocState extends Equatable {
  final AtrocityStatus status;
  final List<Atrocity> atrocities;

  const AtrocityBlocState(
      {this.status = AtrocityStatus.initial,
      this.atrocities = const <Atrocity>[]});

  AtrocityBlocState copyWith({
    final AtrocityStatus? status,
    final List<Atrocity>? atrocities,
  }) {
    return AtrocityBlocState(
        status: status ?? this.status,
        atrocities: atrocities ?? this.atrocities);
  }

  @override
  List<Object> get props => [];
}
