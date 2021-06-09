part of 'nonprofit_bloc.dart';

enum NonProfitStatus { initial, success, failure }

 class NonprofitState extends Equatable {
  final List<NonProfit> nonprofitList;
  final NonProfitStatus status;

  NonprofitState(
      {this.nonprofitList = const <NonProfit>[],
      this.status = NonProfitStatus.initial});

  NonprofitState copyWith({
    final List<NonProfit>? nonprofitList,
    final NonProfitStatus? status,
  }) {
    return NonprofitState(
        nonprofitList: nonprofitList ?? this.nonprofitList,
        status: status ?? this.status);
  }

  @override
  List<Object> get props => [];
}

class NonprofitInitial extends NonprofitState {}
