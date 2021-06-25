import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_musicc/interfaces/drawerpage.dart';
import 'package:flutter_app_musicc/screen/loginpage.dart';
import 'package:flutter_app_musicc/utils/getState.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Color(0xff84a9ac),
        brightness: Brightness.dark,
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: Color(0xff84a9ac)),
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  GetState getFavorite = Get.put(GetState());
  double opacityLevel = 1;
  @override
  void initState() {
    super.initState();
    if(auth.currentUser != null){
      Future.delayed(Duration(seconds: 5),(){
        Get.off(() => DrawerPage());
      });
    }else{
      Future.delayed(Duration(seconds: 5),(){
        Get.off(() => LoginPage());
      });
    }
    getFavorite.getfavs();

    Timer(Duration(milliseconds: 500), () {
      setState(() {
        opacityLevel = opacityLevel == 0 ? 1.0 : 0.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff20232d),
              Color(0xff03081e),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: AnimatedOpacity(
          duration: Duration(seconds: 3),
          opacity: opacityLevel == 0 ? 1.0 : 0.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: 200,
                  height: 200,
                  child: CircleAvatar(radius: 25,backgroundImage: AssetImage("images/logo.png")),
                ),
              ),
              SizedBox(height: 30,),
              Text("Lyrics App",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.blueGrey,
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
