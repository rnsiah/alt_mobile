import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/Data_Layer/Blocs/atrocity_bloc/bloc/atrocity_bloc_bloc.dart';
import 'package:mobile/Data_Layer/Blocs/session_cubit.dart';
import 'package:mobile/Data_Layer/Models/atrocity_model.dart';
import 'package:mobile/Data_Layer/Models/user_model.dart';

class HomePage extends StatelessWidget {
  final User user;
  PageController _pageController = PageController();
  static List<Atrocity> featuredAtrocity = [];

  HomePage({Key? key, required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => context.read<SessionBLoc>(),
      child: Scaffold(
        drawer: _profileDrawer(),
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
                  child: Text(
                    'Shirt Screen',
                    style: TextStyle(fontSize: 24),
                  ),
                  onPressed: () {
                    context.read<AtrocityBlocBloc>().add(AtrocityListFetched());
                    Navigator.of(context).pushNamed('/atrocities');
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget _profileDrawer() {
    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: <Widget>[
      DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.black12,
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: 45.0,
              backgroundImage: null,
            ),
            Text('{Name}'),
            Text('@Username')
          ],
        ),
      ),
      Card(
        child: ListTile(
          leading: Icon(Icons.person, color: Colors.black),
          title: Text(
            'My Profile',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          onTap: () => print('Taking You to my profile page'),
        ),
      ),
      Card(
        child: ListTile(
          leading: Icon(Icons.favorite, color: Colors.black),
          title: Text(
            'My Causes',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          onTap: () => print('Taking You to my causes page'),
        ),
      ),
      Card(
        child: ListTile(
            leading: Icon(Icons.camera, color: Colors.black),
            title: Text(
              'My Altrue Code',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            onTap: () {}),
      ),
      Card(
        color: Colors.white,
        child: ListTile(
          leading: Icon(Icons.close, color: Colors.amber),
          title: Text(
            'Sign Out Now',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          onTap: () {},
        ),
      )
    ]));
  }
}
