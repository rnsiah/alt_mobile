part of 'shirt_bloc.dart';

enum ShirtStatus { initial, successful, failure }

class ShirtState extends Equatable {
  final List<Shirt> shirtlist;
  final ShirtStatus status;

  const ShirtState(
      {this.shirtlist = const <Shirt>[], this.status = ShirtStatus.initial});

  ShirtState copyWith({
    List<Shirt>? shirtlist,
    ShirtStatus? status,
  }) {
    return ShirtState(
        shirtlist: shirtlist ?? this.shirtlist, status: status ?? this.status);
  }

  @override
  List<Object> get props => [shirtlist, status];
}
