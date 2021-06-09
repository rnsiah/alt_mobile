import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/Data_Layer/Blocs/atrocity_bloc/bloc/atrocity_bloc_bloc.dart';
import 'package:mobile/Data_Layer/Blocs/category_bloc/bloc/category_bloc.dart';
import 'package:mobile/Data_Layer/Blocs/nonprofit_bloc/bloc/nonprofit_bloc.dart';
import 'package:mobile/Data_Layer/Blocs/profile_bloc/bloc/profile_bloc.dart';
import 'package:mobile/Data_Layer/Blocs/session_cubit.dart';
import 'package:mobile/Data_Layer/Blocs/session_event_bloc.dart';
import 'package:mobile/Data_Layer/Blocs/session_state.dart';
import 'package:mobile/Data_Layer/Blocs/shirt_bloc/bloc/shirt_bloc.dart';
import 'package:mobile/Data_Layer/Blocs/user_profile_edit_bloc.dart/user_profile_edit_bloc.dart';
import 'package:mobile/Data_Layer/Blocs/validationCubit.dart';
import 'package:mobile/Data_Layer/Repoositories/atrocity_repositories.dart';
import 'package:mobile/Data_Layer/Repoositories/category_repository.dart';
import 'package:mobile/Data_Layer/Repoositories/nonProfit_repository.dart';
import 'package:mobile/Data_Layer/Repoositories/shirt_repository.dart';
import 'package:mobile/Presentation/Router/app_router.dart';
import 'package:mobile/Presentation/Router/functionality_router.dart';

import 'package:mobile/Presentation/Screens/home_screen.dart';

import 'Data_Layer/Repoositories/user_repository.dart';
import 'Presentation/Screens/userProfile_fillScreen.dart';

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
  final ShirtRepository shirt = ShirtRepository();
  final NonProfitRespository nonprofit = NonProfitRespository();
  final CategoryRepository categoryRepository = CategoryRepository();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AtrocityBlocBloc>(
          create: (context) => AtrocityBlocBloc(atrocityRepository: atrocity),
        ),
        BlocProvider(
          create: (context) => ShirtBloc(shirtRepository: shirt),
        ),
        BlocProvider<NonprofitBloc>(
          create: (context) => NonprofitBloc(nonProfitRespository: nonprofit),
        ),
        BlocProvider<CategoryBloc>(
          create: (context) =>
              CategoryBloc(categoryRepository: categoryRepository),
        ),
        BlocProvider<UserProfileEditBloc>(
          create: (context) => UserProfileEditBloc(
              userRepository: context.read<UserRepository>(),
              sessionBLoc: context.read<SessionBLoc>()),
        ),
        BlocProvider<ProfileBloc>(
            create: (context) => ProfileBloc(
                userRepository: context.read<UserRepository>(),
                sessionBLoc: context.read<SessionBLoc>())),
      ],
      child: MaterialApp(
          home: BlocConsumer<SessionBLoc, SessionState>(
            listenWhen: (previous, current) {
              if (previous == current) {}
              return true;
            },
            listener: (context, state) {
              if (state is Authenticated) {
                print(state.user.email +
                    state.user.altid.toString() +
                    state.user.hasProfile.toString());
              }
            },
            buildWhen: (previous, current) {
              if (previous == current) {
                print('The state was $previous and now the state is $current');
                return false;
              }
              print('the state was $previous and now the state is $current');
              return true;
            },
            builder: (context, state) {
              if (state is AuthenticatedWithProfile &&
                  state.user.hasProfile ==1) {
                return HomePage(user: state.user, profile: state.profile);
              } else if (state is Authenticated) {
                return UserProfileComplete(
                  user: state.user,
                );
              } 
              return BlocProvider(
                create: (context) => ValidationCubit(
                    userProfileEditBloc: context.read<UserProfileEditBloc>(),
                    userRepository: context.read<UserRepository>(),
                    sessionBloc: context.read<SessionBLoc>()),
                child: AuthNavigator(),
              );
            },
          ),
          onGenerateRoute: (RouteSettings settings) {
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
