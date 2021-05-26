import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/Data_Layer/Blocs/session_cubit.dart';
import 'package:mobile/Data_Layer/Blocs/session_state.dart';
import 'package:mobile/Data_Layer/Blocs/validationCubit.dart';
import 'package:mobile/Presentation/Router/app_router.dart';
import 'package:mobile/Presentation/Screens/home_screen.dart';

import 'package:mobile/Presentation/Screens/userProfile_fillScreen.dart';
import 'package:mobile/Presentation/Widgets/loading_indicator.dart';


class AppNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionBLoc, SessionState>(
      builder: (context, state) {
        return Navigator(
          pages: [
            if (state is  UnknownSessionState)
            MaterialPage(child: LoadingIndicator()),

            if (state is Unauthenticated )
            MaterialPage(child: BlocProvider(
              create: (context) => ValidationCubit(sessionBloc: context.read<SessionBLoc>()),
              child: AuthNavigator(),
            ),
            ),
            if(state is AuthenticatedWithoutProfile)
            MaterialPage(child: UserProfileComplete(user: state.user,)
            ),
            if(state is Authenticated)
            MaterialPage(child: HomePage(user: state.user)),

            
            
            
    

          ],
          onPopPage: (route, result)=> route.didPop(result),
        );
      },
    );
  }
}