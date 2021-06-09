import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/Data_Layer/Blocs/profile_bloc/bloc/profile_bloc.dart';
import 'package:mobile/Data_Layer/Models/user_model.dart';

class MyQrScreen extends StatelessWidget {
  const MyQrScreen({Key? key, required this.profile}) : super(key: key);

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor:Colors.black,
        title:  Image(
            image: AssetImage('images/Altrue Logo White.png'),
          ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(50),
          child: BlocProvider(
            create: (context) => context.read<ProfileBloc>(),
            child: BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                if (state is ProfileLoaded)
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Image(
                        image: NetworkImage(state.profile!.qrCode),
                      ),
                      SizedBox(height: 43),
                      Text(
                        'Scan' +
                            state.profile!.username +
                            's profile to donate to support their favorite causes',
                        style: TextStyle(fontSize: 22, color: Colors.amber),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  );
                else {
                  return Column(
                    children: [Text('You need to create a QR Code For Your Profile')],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
