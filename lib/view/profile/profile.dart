import 'package:blocapp/business_logic/cubit/profile_cubit.dart';
import 'package:blocapp/route/route_name.dart';
import 'package:blocapp/widget/elevation_custom_button.dart';
import 'package:blocapp/widget/name_email_widget.dart';
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle? fontStyles = Theme.of(context).textTheme.headline1;
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
                NameAndEmailWidget(),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      title: 'Clean',
                      onTap: () {
                        context.read<ProfileCubit>().onClean();
                      },
                    ),
                    CustomButton(
                      title: 'Update Profile',
                      onTap: () {
                        context.read<ProfileCubit>().onSave(
                            _nameController.text, _emailController.text);
                      },
                    )
                  ],
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
