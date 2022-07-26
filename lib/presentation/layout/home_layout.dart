import 'package:carty_e_coomerce_app/business/cubits/home_cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business/cubits/home_cubit/home_cubit.dart';
import '../themes/icon_broken.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final cubit = HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            title: Text(
              cubit.widgetsName[cubit.currentIndex],
              style: const TextStyle(
                color: Colors.deepOrange,
                fontFamily: 'Jannah',
                fontWeight: FontWeight.bold
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    IconBroken.Bag_2,
                    color: Colors.deepOrange,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    IconBroken.Search,
                    color: Colors.deepOrange,
                  )),
            ],
          ),
          body: cubit.widgets[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(IconBroken.Home, color: Colors.deepOrange),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(IconBroken.Heart, color: Colors.deepOrange),
                    label: 'Favorite'),
                BottomNavigationBarItem(
                    icon:
                        Icon(IconBroken.Notification, color: Colors.deepOrange),
                    label: 'Notifications'),
                BottomNavigationBarItem(
                    icon: Icon(IconBroken.User, color: Colors.deepOrange),
                    label: 'Profile'),
              ]),
        );
      },
    );
  }
}
