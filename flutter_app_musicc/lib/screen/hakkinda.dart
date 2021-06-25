import 'package:flutter/material.dart';
import 'package:flutter_app_musicc/interfaces/drawer.dart';

class Hakkinda extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0x0ff20232d),
        appBar: AppBar(
          title: new Text("Hakkında"),
          backgroundColor: Colors.black,
        ),
        drawer: DrawerPage(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Text(
              "Bu uygulama Dr. Öğretim Üyesi Ahmet Cevahir ÇINAR tarafından yürütülen 3301456 kodlu MOBİL PROGRAMLAMA dersi kapsamında 193301037 numaralı Öğrenci Gamzenur Seyit tarafından 25 Haziran 2021 günü teslim edilmek üzere  yapılmıştır.",
              textAlign: TextAlign.center,
            ),
          ),
        ));
  }
}
