import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:my_first_flutter_application/repository/BeersRepository.dart';

class BeerBloc extends Bloc<BeerEvent, BeerState> {
  final BeerRepository beerRepository;

  BeerBloc({@required this.beerRepository})
      : assert(beerRepository != null),
        super(WeatherInitial());

  @override
  Stream<BeerState> mapEventToState(BeerEvent event) async* {}
}

abstract class BeerState extends Equatable {
  BeerState();

  @override
  List<Object> get props => [];
}

abstract class BeerEvent extends Equatable {
  BeerEvent();
}

class WeatherInitial extends BeerState {}
