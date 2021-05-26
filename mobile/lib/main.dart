import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/Data_Layer/Blocs/session_cubit.dart';

import 'package:mobile/Presentation/Router/signup_process_navigator.dart';

import 'Data_Layer/Repoositories/user_repository.dart';



class SimpleBlocDelegate extends BlocObserver {
  @override
  // ignore: override_on_non_overriding_member
  void onNewEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
  }
}

void main() {
  SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RepositoryProvider(create: (context)=> UserRepository(),
      child: BlocProvider(create: (context) => SessionBLoc(userRepository: context.read<UserRepository>(),),
      child: AppNavigator(),
      ),
      ),
    );
  }
}
