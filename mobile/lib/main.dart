import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/Data_Layer/Blocs/atrocity_bloc/bloc/atrocity_bloc_bloc.dart';
import 'package:mobile/Data_Layer/Blocs/session_cubit.dart';
import 'package:mobile/Data_Layer/Blocs/session_event_bloc.dart';
import 'package:mobile/Data_Layer/Blocs/session_state.dart';
import 'package:mobile/Data_Layer/Blocs/validationCubit.dart';
import 'package:mobile/Data_Layer/Repoositories/atrocity_repositories.dart';
import 'package:mobile/Data_Layer/Repoositories/category_repository.dart';
import 'package:mobile/Data_Layer/Repoositories/nonProfit_repository.dart';
import 'package:mobile/Data_Layer/Repoositories/shirt_repository.dart';
import 'package:mobile/Presentation/Router/app_router.dart';
import 'package:mobile/Presentation/Router/functionality_router.dart';

import 'package:mobile/Presentation/Screens/home_screen.dart';

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
  runApp(RepositoryProvider(
      create: (context) => UserRepository(),
      child: BlocProvider<SessionBLoc>(
        create: (context) {
          final userRepository = context.read<UserRepository>();
          return SessionBLoc(userRepository: userRepository)..add(Apploaded());
        },
        child: MultiRepositoryProvider(providers: [
          RepositoryProvider(
            create: (context) => ShirtRepository(),
          ),
          RepositoryProvider(
            create: (context) => NonProfitRespository(),
          ),
          RepositoryProvider(
            create: (context) => AtrocityRepository(),
          ),
          RepositoryProvider(create: (context) => CategoryRepository()),
        ], child: MyApp()),
      )));
}

class MyApp extends StatelessWidget {
  final AtrocityRepository atrocity = AtrocityRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AtrocityBlocBloc(atrocityRepository: atrocity),
      child: MaterialApp(home: BlocBuilder<SessionBLoc, SessionState>(
          builder: (context, state) {
            if (state is Authenticated) {
              return HomePage(user: state.user);
            }
            return BlocProvider(
              create: (context) =>
                  ValidationCubit(sessionBloc: context.read<SessionBLoc>()),
              child: AuthNavigator(),
            );
          },
        ), onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            builder: (BuildContext context) => makeRoute(
                context: context,
                routeName: settings.name!,
                arguments: settings.arguments),
          );
        }),
    );
  }
}
