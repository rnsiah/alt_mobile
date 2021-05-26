


import 'package:flutter/material.dart';

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
