import 'package:cubittest/cubit/Cubit.dart';
import 'package:cubittest/cubit/states/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class Counters extends StatelessWidget {
  const Counters({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context) => AppCubit(),
    child: BlocConsumer<AppCubit , AppStates>(builder: (BuildContext context ,state){
      AppCubit cubicParam = AppCubit.getCubic(context);
      return Scaffold(
          body:Center(child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  cubicParam.inc();
                },
                icon: const Padding(padding: EdgeInsets.fromLTRB(8, 0, 0, 0),child: Icon(
                  Icons.add,
                  size: 50,
                  color: Colors.white,
                ),),
                label: const Text(""),
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(), // Circular button shape
                    padding: const EdgeInsets.all(10),
                    backgroundColor: Colors.amber// Adjust padding to make the icon look centered
                ),
              ),
              const Spacer(),
              Text(cubicParam.num.toString() , style: const TextStyle(fontSize: 50),),
              const Spacer(),
              ElevatedButton.icon(
                onPressed: () {
                  cubicParam.dec();
                },
                icon: const Padding(padding: EdgeInsets.fromLTRB(8, 0, 0, 0),child: Icon(
                  Icons.remove,
                  size: 50,
                  color: Colors.white,
                ),),
                label: const Text(""),
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(), // Circular button shape
                    padding: const EdgeInsets.all(10),
                    backgroundColor: Colors.red// Adjust padding to make the icon look centered
                ),
              ),
            ],
          ),
          ));
    }, listener: (BuildContext context , state){

    }),
    );
  }
}
