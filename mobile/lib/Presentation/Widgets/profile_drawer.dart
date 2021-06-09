import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/Data_Layer/Blocs/profile_bloc/bloc/profile_bloc.dart';
import 'package:mobile/Data_Layer/Models/user_model.dart';

class ProfileDrawer extends StatelessWidget {
  final Profile profile;
  const ProfileDrawer({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: <Widget>[
      DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.black12,
        ),
        child: BlocProvider<ProfileBloc>(
          create: (context) => context.read<ProfileBloc>(),
          child: Column(
            children: [
              CircleAvatar(
                radius: 45.0,
                backgroundImage: null,
              ),
              Column(
                children: [
                  Text(profile.username),
                  Text("username"),
                ],
              )
            ],
          ),
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
              onTap: () => Navigator.of(context).pushNamed('/supporters'),
              leading: Icon(Icons.people, color: Colors.amber),
              title: Text(
                'My Supporters',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ))),
      Card(child:
          BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
        if (state is ProfileLoaded){
          return ListTile(
              leading: Icon(Icons.camera, color: Colors.black),
              title: Text(
                'My Altrue Code',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              onTap: () {
                context
                    .read<ProfileBloc>()
                    .add(LoadQR(profile: state.profile!));
                Navigator.of(context)
                    .pushNamed('/myQrCode', arguments: state.profile);
              });

        } 
          return Card(
              child: ListTile(
            leading: Icon(Icons.camera, color: Colors.black),
            title: Text(
              'My Altrue Code',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            onTap: () => {},
          ));
        }
      )),
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

Widget profileDrawer() {
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
