import 'package:blocapp/business_logic/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NameAndEmailWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.accessibility_new),
            SizedBox(
              width: 10,
            ),
            BlocBuilder<ProfileCubit, ProfileState>(
                buildWhen: (previous, current) {
              if (previous.userName != current.userName)
                return true;
              else
                return false;
            }, builder: (context, event) {
              return Flexible(
                child: Text(
                  "${event.userName}",
                  style: Theme.of(context).textTheme.headline3,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              );
            })
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.email_outlined),
            SizedBox(
              width: 10,
            ),
            BlocBuilder<ProfileCubit, ProfileState>(
                buildWhen: (previous, current) {
              if (previous.userEmailId != current.userEmailId)
                return true;
              else
                return false;
            }, builder: (context, event) {
              return Flexible(
                child: Text(
                  "${event.userEmailId}",
                  style: Theme.of(context).textTheme.headline3,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              );
            })
          ],
        ),
      ],
    );
  }
}
