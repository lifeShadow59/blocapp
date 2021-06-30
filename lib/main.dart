import 'package:blocapp/business_logic/cubit/profile_cubit.dart';
import 'package:blocapp/route/route.dart';
import 'package:blocapp/route/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'business_logic/cubit/darktheme_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProfileCubit>(
          create: (_) => ProfileCubit(),
        ),
        BlocProvider<DarkThemeCubit>(
          create: (_) => DarkThemeCubit(),
        )
      ],
      child: BlocBuilder<DarkThemeCubit, DarkThemeState>(
        buildWhen: (previous, current) {
          if (previous.darkTheme != current.darkTheme)
            return true;
          else
            return false;
        },
        builder: (context, state) {
          WidgetsFlutterBinding.ensureInitialized();
          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
            systemNavigationBarColor: state.darkTheme
                ? Colors.black
                : Colors.white, // navigation bar color
            statusBarColor: state.darkTheme
                ? Colors.black
                : Colors.white, // status bar color
            statusBarBrightness: state.darkTheme
                ? Brightness.light
                : Brightness.dark, //status bar brigtness
            statusBarIconBrightness: state.darkTheme
                ? Brightness.light
                : Brightness.dark, //status barIcon Brightness
            systemNavigationBarDividerColor: state.darkTheme
                ? Colors.black
                : Colors.white, //Navigation bar divider color
            systemNavigationBarIconBrightness: state.darkTheme
                ? Brightness.light
                : Brightness.dark, //navigation bar icon
          ));
          return MaterialApp(
            title: 'AirPhotos',
            debugShowCheckedModeBanner: false,
            onGenerateRoute: Routes.onGenerateRoute,
            theme: ThemeData(
              brightness: state.darkTheme ? Brightness.dark : Brightness.light,
              primarySwatch: Colors.blueGrey,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              primaryColor: state.darkTheme ? Colors.black : Colors.white,
              primaryColorBrightness:
                  state.darkTheme ? Brightness.dark : Brightness.light,
              scaffoldBackgroundColor:
                  state.darkTheme ? Colors.black : Colors.white,
              accentColor: Color(0xff36608F),
              accentColorBrightness:
                  state.darkTheme ? Brightness.dark : Brightness.light,
              bottomAppBarColor: Colors.white,
              buttonColor: Color(0xffE3E1E2),
              errorColor: Colors.red,
              buttonTheme: ButtonThemeData(
                height: 50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                buttonColor: Color(0xffE3E1E2),
                textTheme: ButtonTextTheme.primary,
              ),
              shadowColor: state.darkTheme ? Colors.blueGrey : Colors.black,
              inputDecorationTheme: InputDecorationTheme(
                focusColor: Color(0xff36608F),
                disabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xff36608F),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xff36608F),
                  ),
                ),
                errorStyle: TextStyle(color: Colors.red),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffD4D4D4),
                  ),
                ),
                hintStyle: TextStyle(
                  fontSize: 14, // 35
                  fontFamily: 'PoppinsRegular',
                  color: Colors.grey,
                ),
              ),
              appBarTheme: AppBarTheme(
                brightness: Brightness.light,
                elevation: 10,
                actionsIconTheme: IconThemeData(
                  color: Color(0xff36608F),
                ),
              ),
              iconTheme: IconThemeData(
                color: Color(0xff36608F),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                elevation: 10,
                backgroundColor: state.darkTheme ? Colors.black : Colors.white,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                selectedItemColor: Color(0xff36608F),
                unselectedItemColor: Colors.grey,
              ),
              tabBarTheme: TabBarTheme(
                labelColor: Color(0xff36608F),
                unselectedLabelColor: Color(0xff818181),
                labelStyle: TextStyle(
                  fontSize: 22,
                  fontFamily: 'PoppinsBold',
                ),
                unselectedLabelStyle: TextStyle(
                  fontSize: 22,
                  fontFamily: 'PoppinsBold',
                ),
              ),
              textTheme: TextTheme(
                headline1: TextStyle(
                  fontSize: 30, // 75
                  fontFamily: 'PoppinsSemibold',
                  color: state.darkTheme ? Colors.white : Colors.black,
                ),
                headline2: TextStyle(
                  fontSize: 22, // 50
                  color: Color(0xff36608F),
                  fontFamily: 'PoppinsSemibold',
                ),
                headline3: TextStyle(
                  fontSize: 22, // 50
                  color: Color(0xff36608F),
                  fontFamily: 'PoppinsBold',
                ),
                headline4: TextStyle(
                  fontSize: 22, // 50
                  fontFamily: 'PoppinsMedium',
                ),
                headline5: TextStyle(
                  fontSize: 20, // 45
                  fontFamily: 'PoppinsMedium',
                ),
                headline6: TextStyle(
                    fontSize: 18, // 40
                    fontFamily: 'PoppinsMedium',
                    color: state.darkTheme ? Colors.white : Colors.black),
                bodyText1: TextStyle(
                  fontSize: 14, // 35
                  fontFamily: 'PoppinsRegular',
                  color: Colors.grey,
                ),
                bodyText2: TextStyle(
                  fontSize: 14, // 35
                  fontFamily: 'PoppinsMedium',
                  color: Colors.grey,
                ),
                subtitle1: TextStyle(
                  fontSize: 16,
                  fontFamily: 'PoppinsRegular',
                  letterSpacing: 0.15,
                ),
                subtitle2: TextStyle(
                  fontSize: 14,
                  fontFamily: 'PoppinsMedium',
                  letterSpacing: 0.1,
                ),
                overline: TextStyle(
                    fontSize: 13,
                    fontFamily: 'PoppinsMedium',
                    letterSpacing: 0.1,
                    color: Colors.grey),
                button: TextStyle(
                  fontSize: 22, // 50
                  fontFamily: 'PoppinsSemibold',
                  color: state.darkTheme ? Colors.black : Colors.white,
                ),
              ),
            ),
            initialRoute: HomeRoute,
          );
        },
      ),
    );
  }
}
