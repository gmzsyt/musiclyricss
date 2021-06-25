import 'package:flutter/material.dart';
import 'package:flutter_app_musicc/interfaces/drawerpage.dart';
import 'package:flutter_app_musicc/screen/registerpage.dart';
import 'package:flutter_app_musicc/utils/loginorregister.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailcontrol = TextEditingController();
  var passwordcontrol = TextEditingController();
  String? emailerror;
  String? passworderror;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 200, left: 20, right: 20),
            child: Column(
              children: [
                TextField(
                  controller: emailcontrol,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "E-mail",
                    errorText: emailerror,
                    prefixIcon: Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: passwordcontrol,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password",
                    errorText: passworderror,
                    prefixIcon: Icon(Icons.vpn_key),
                  ),
                  obscureText: true,
                ),
                Padding(
                  padding: EdgeInsets.all(30),
                  child: ElevatedButton(
                    onPressed: () => login(),
                    child: Text("Giriş Yap"),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueGrey),
                        padding: MaterialStateProperty.all(EdgeInsets.only(
                            top: 10, bottom: 10, left: 40, right: 40))),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Henüz bir hesabınız yok mu ? "),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage()));
                        },
                        child: Text("Kayıt ol"))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  login() async {
    if (emailcontrol.text == "") {
      emailerror = "E-mail boş olamaz";
      print(emailcontrol.text);
    } else if (passwordcontrol.text == "") {
      passworderror = "Şifre boş olamaz";
      print(passwordcontrol.text);
    } else {
      var returned = await LoginOrRegister()
          .login(emailcontrol.text, passwordcontrol.text);
      returned
          ? Get.off(() => DrawerPage())
          : Get.snackbar("HATA", "Bir şeyler yanlış gitti!",
              backgroundColor: Colors.red);
    }
  }
}
