import 'package:blocapp/business_logic/cubit/profile_cubit.dart';
import 'package:blocapp/route/route_name.dart';
import 'package:blocapp/widget/elevation_custom_button.dart';
import 'package:blocapp/widget/name_email_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DemoOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle? fontStyles = Theme.of(context).textTheme.headline1;
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "DEMO ONE",
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
            NameAndEmailWidget(),
            SizedBox(
              height: 100,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomButton(
                  title: 'Clean',
                  onTap: () {
                    context.read<ProfileCubit>().onClean();
                  },
                ),
                SizedBox(
                  height: 50,
                ),
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
                    Navigator.of(context).pushNamed(DemoPageTwoRoute);
                  },
                  child: Text(
                    "Demo Page 2",
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
