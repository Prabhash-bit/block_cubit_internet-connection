import 'package:bloc_cubit/bloc/bloc_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  String? title;
  HomePage({Key? key, this.title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DEMOOOON')),
      body: Center(
        child: BlocConsumer<InternetCubit, InternetState>(
          listener: (context, state) {
            if (state == InternetState.Gained) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Connected....'),
                backgroundColor: Colors.green,
              ));
            } else if (state == InternetState.Lost) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Disconnected...'),
                backgroundColor: Colors.red,
              ));
            }
          },
          builder: (context, state) {
            return Center(
              child: Text("Check the connection"),
            );

            // if (state == InternetState.Gained) {
            //   return Text("Connected");
            // } else {
            //   return Text('Disconnected');
            // }
          },
        ),
      ),
    );
  }
}
