import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business/cubits/notification_cubit/notifications_cubit.dart';
import '../../business/cubits/notification_cubit/notifications_state.dart';
import '../../data/models/notifications_model.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotificationsCubit, NotificationsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final cubit = NotificationsCubit.get(context);
        return cubit.model != null
            ? ListView.separated(
          physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => buildNotificationsItem(
                    notificationsItem: cubit.model!.data!.data![index]),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 8,
                    ),
                itemCount: cubit.model!.data!.data!.length)
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }

  Widget buildNotificationsItem(
          {required NotificationsItem notificationsItem}) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          height: 90,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.orange.shade50,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(notificationsItem.title!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontFamily: 'Jannah',
                      fontSize: 20,
                    )),
                Text(notificationsItem.message!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                      fontFamily: 'Jannah',
                      fontSize: 16,
                    )),
              ]),
        ),
      );
}
