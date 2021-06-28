import 'package:blocapp/bloc/profile_bloc.dart';
import 'package:blocapp/route/route_name.dart';
import 'package:blocapp/widget/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _nameFocusNode = FocusNode();
  String get name => _nameController.text;
  String get email => _emailController.text;

  final UpDateProfileBloc _upDateProfileBloc = UpDateProfileBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();

    _emailFocusNode.dispose();
    _nameFocusNode.dispose();
    _upDateProfileBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle? fontStyles = Theme.of(context).textTheme.headline1;
    final _UserData = BlocProvider.of<UpDateProfileBloc>(context);
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text("PROFILE",
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(fontSize: 35)),
            elevation: 0,
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
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
                  height: 40,
                ),
                TextFormField(
                  controller: _nameController,
                  focusNode: _nameFocusNode,
                  enabled: true,
                  decoration: InputDecoration(hintText: 'Name'),
                ),
                SizedBox(
                  height: 36,
                ),
                TextFormField(
                  controller: _emailController,
                  focusNode: _emailFocusNode,
                  enabled: true,
                  decoration: InputDecoration(hintText: 'Email'),
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(SecondaryGrayColor),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(12.5)),
                    elevation: MaterialStateProperty.all<double>(10),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    )),
                  ),
                  onPressed: () {
                    // _upDateProfileBloc.add(
                    //   UpdateProfileEvent.update,
                    // );
                    _UserData.add(UpdateProfileEvent.update);
                  },
                  child: Text("Update Profile",
                      style: TextStyle(color: PrimaryBlueColor)),
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
                ),
              ],
            ),
          )),
    );
  }
}
