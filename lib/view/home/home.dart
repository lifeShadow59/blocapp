import 'package:blocapp/business_logic/cubit/darktheme_cubit.dart';
import 'package:blocapp/route/route_name.dart';
import 'package:blocapp/widget/name_email_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle? fontStyles = Theme.of(context).textTheme.headline1;
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Home",
          style: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 35),
        ),
        elevation: 0,
        
        actions: [

          BlocBuilder<DarkThemeCubit, DarkThemeState>(
            buildWhen: (previous, current) {
              if (previous.darkTheme != current.darkTheme)
                return true;
              else
                return false;
            },
            builder: (context, state) {
              return CupertinoSwitch(
                value: state.darkTheme,
                onChanged: (value) {
                  context.read<DarkThemeCubit>().changeTheme(value);
                },
              );
            },
          ),
        ],
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
