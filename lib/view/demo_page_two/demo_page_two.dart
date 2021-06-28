import 'package:blocapp/bloc/profile_bloc.dart';
import 'package:blocapp/route/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DemoTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle? fontStyles = Theme.of(context).textTheme.headline1;
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "DEMO TWO",
          style: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 35),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.accessibility_new),
                SizedBox(
                  width: 10,
                ),
                BlocBuilder<UpDateProfileBloc, Map<String, String>>(
                    buildWhen: (previous, current) {
                  if (previous["Name"] != current["Name"])
                    return true;
                  else
                    return false;
                }, builder: (context, event) {
                  return Text(
                    "${event["Name"]}",
                    style: Theme.of(context).textTheme.headline3,
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
                BlocBuilder<UpDateProfileBloc, Map<String, String>>(
                    buildWhen: (previous, current) {
                  if (previous["Email"] != current["Email"])
                    return true;
                  else
                    return false;
                }, builder: (context, event) {
                  return Text(
                    "${event["Email"]}",
                    style: Theme.of(context).textTheme.headline3,
                  );
                })
              ],
            ),
            SizedBox(
              height: 100,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(HomeRoute);
                  },
                  child: Text(
                    "Home",
                    style: fontStyles,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(ProfileRoute);
                  },
                  child: Text(
                    "Profile",
                    style: fontStyles,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(DemoPageOneRoute);
                  },
                  child: Text(
                    "Demo Page 1",
                    style: fontStyles,
                  ),
                ),
                SizedBox(
                  height: 30,
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
