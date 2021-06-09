import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/Data_Layer/Blocs/shirt_bloc/bloc/shirt_bloc.dart';
import 'package:mobile/Data_Layer/Models/shirt_model.dart';
import 'package:mobile/Data_Layer/Repoositories/shirt_repository.dart';

class ShirtList extends StatelessWidget {
  final ShirtRepository shirtRepository = ShirtRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
              color: Colors.black,
            ),
            title: Text(
              'Altrue Tees',
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
                color: Colors.black,
              ),
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {},
                color: Colors.black,
              ),
            ]),
        body: RepositoryProvider(
          create: (_) => context.read<ShirtRepository>(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  'Global Causes',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              BlocProvider(
                create: (_) => context.read<ShirtBloc>(),
                child: BlocBuilder<ShirtBloc, ShirtState>(
                  builder: (context, state) {
                    
                    return Expanded(
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2),
                          child: GridView.builder(
                              itemCount: state.shirtlist.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisSpacing: 27,
                                      mainAxisSpacing: 18,
                                      childAspectRatio: .75,
                                      crossAxisCount: 2),
                              itemBuilder: (context, index) => GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                          '/ShirtDetail',
                                          arguments: state.shirtlist[index]);
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          child: Image.network(
                                            state.shirtlist[index].shirtImage,
                                            scale: .7,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 2),
                                          child: Text(
                                            state.shirtlist[index].name,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Text(
                                          state.shirtlist[index].price
                                              .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ))),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}

class ShirtGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => context.read<ShirtRepository>(),
      child: BlocProvider(
        create: (context) => context.read<ShirtBloc>(),
        child: BlocBuilder<ShirtBloc, ShirtState>(
          builder: (context, state) {
            return Expanded(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 27,
                            mainAxisSpacing: 18,
                            childAspectRatio: .75,
                            crossAxisCount: 2),
                        itemBuilder: (context, index) => ShirtCard(
                            shirt: state.shirtlist[index],
                            press: () => Navigator.of(context).pushNamed(
                                '/shirtView',
                                arguments: state.shirtlist[index])))));
          },
        ),
      ),
    );
  }
}

class ShirtCard extends StatelessWidget {
  final Shirt shirt;
  final Function press;

  ShirtCard({required this.shirt, required this.press});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.network(
              shirt.shirtImage,
              scale: .7,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Text(
              shirt.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            shirt.price.toString(),
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
