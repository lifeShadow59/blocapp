import 'package:blocapp/route/route_name.dart';
import 'package:blocapp/widget/name_email_widget.dart';
import 'package:flutter/material.dart';

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
            NameAndEmailWidget(),
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
