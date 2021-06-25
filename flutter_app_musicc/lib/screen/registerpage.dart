import 'package:flutter/material.dart';
import 'package:flutter_app_musicc/interfaces/drawerpage.dart';
import 'package:flutter_app_musicc/utils/loginorregister.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                    onPressed: () => register(),
                    child: Text("Giriş Yap"),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueGrey),
                        padding: MaterialStateProperty.all(EdgeInsets.only(
                            top: 10, bottom: 10, left: 40, right: 40))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  register() async {
    if (emailcontrol.text == "") {
      emailerror = "E-mail boş olamaz";
      print(emailcontrol.text);
    } else if (passwordcontrol.text == "") {
      passworderror = "Şifre boş olamaz";
      print(passwordcontrol.text);
    } else {
      var returned = await LoginOrRegister()
          .register(emailcontrol.text, passwordcontrol.text);
      returned
          ? Get.off(() => DrawerPage())
          : Get.snackbar("HATA", "Bir şeyler yanlış gitti");
    }
  }
}
