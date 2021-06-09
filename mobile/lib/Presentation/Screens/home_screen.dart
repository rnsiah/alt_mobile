import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/Data_Layer/Blocs/atrocity_bloc/bloc/atrocity_bloc_bloc.dart';
import 'package:mobile/Data_Layer/Blocs/category_bloc/bloc/category_bloc.dart';
import 'package:mobile/Data_Layer/Blocs/nonprofit_bloc/bloc/nonprofit_bloc.dart';
import 'package:mobile/Data_Layer/Blocs/profile_bloc/bloc/profile_bloc.dart';
import 'package:mobile/Data_Layer/Blocs/session_cubit.dart';
import 'package:mobile/Data_Layer/Blocs/shirt_bloc/bloc/shirt_bloc.dart';
import 'package:mobile/Data_Layer/Models/atrocity_model.dart';
import 'package:mobile/Data_Layer/Models/user_model.dart';
import 'package:mobile/Presentation/Widgets/profile_drawer.dart';

class HomePage extends StatelessWidget {
  final User user;
  final Profile profile;

  HomePage({Key? key, required this.user, required this.profile}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => context.read<SessionBLoc>(),
        ),
        BlocProvider(create: (context) => context.read<ProfileBloc>()),
      ],
      child: Scaffold(
        drawer:  ProfileDrawer(profile: profile),
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          title: Image(
            image: AssetImage('images/Altrue Logo White.png'),
          ),
          actions: <Widget>[
            IconButton(
              padding: EdgeInsets.only(right: 7),
              onPressed: () => print('Search'),
              icon: Icon(Icons.search),
              iconSize: 30,
              color: Colors.black,
            ),
          ],
        ),
        body: Column(
          children: [
            Text('${user.altid}'),
            MaterialButton(
              onPressed: () => BlocProvider.of<SessionBLoc>(context).signOut(),
            ),
            BlocProvider(
              create: (context) => context.read<AtrocityBlocBloc>(),
              child: MaterialButton(
                  color: Colors.black,
                  child: Text(
                    'Atrocities',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  onPressed: () {
                    context.read<AtrocityBlocBloc>().add(AtrocityListFetched());
                    Navigator.of(context).pushNamed('/atrocities');
                  }),
            ),
            BlocProvider(
              create: (context) => context.read<ShirtBloc>(),
              child: MaterialButton(
                color: Colors.black,
                child: Text(
                  'Shirts',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                onPressed: () {
                  context.read<ShirtBloc>().add(FetchShirts());
                  Navigator.of(context).pushNamed('/shirts');
                },
              ),
            ),
            MultiBlocProvider(
                providers: [
                  BlocProvider<NonprofitBloc>(
                    create: (context) => context.read<NonprofitBloc>(),
                  ),
                  BlocProvider<CategoryBloc>(
                      create: (context) => context.read<CategoryBloc>()),
                ],
                child: Column(children: [
                  MaterialButton(
                    color: Colors.black,
                    child: Text(
                      'Non Profits',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    onPressed: () {
                      context.read<CategoryBloc>().add(FetchCategory());
                      context.read<NonprofitBloc>().add(FetchNonProfitList());
                      Navigator.of(context).pushNamed('/nonprofits');
                    },
                  ),
                  MaterialButton(
                    child: Text(
                      'Causes',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    color: Colors.black,
                    onPressed: () {
                      context.read<CategoryBloc>().add(FetchCategory());
                      Navigator.of(context).pushNamed('/causes');
                    },
                  )
                ]))
          ],
        ),
      ),
    );
  }
}
