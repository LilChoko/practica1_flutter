import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final conUser = TextEditingController();
  final conPwd = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    TextFormField txtUser = TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: conUser,
      decoration: const InputDecoration(prefixIcon: Icon(Icons.person)),
    );

    final txtPwd = TextFormField(
      keyboardType: TextInputType.text,
      obscureText: true,
      controller: conPwd,
      decoration: const InputDecoration(prefixIcon: Icon(Icons.password)),
    );

    final ctnCredentials = Positioned(
      bottom: 180,
      child: Container(
        width: MediaQuery.of(context).size.width * .9,
        //margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 199, 157, 141),
            borderRadius: BorderRadius.circular(20)),
        child: ListView(
          shrinkWrap: true,
          children: [txtUser, txtPwd],
        ),
      ),
    );

    final btnLogin = Positioned(
        width: MediaQuery.of(context).size.width * .9,
        bottom: 100,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 199, 157, 141)),
          onPressed: () {
            isLoading = true;
            setState(() {});
            Future.delayed(const Duration(milliseconds: 4000)).then((value) => {
                  isLoading = false,
                  setState(() {}),
                  Navigator.pushNamed(context, "/home")
                });
          },
          child: const Text('Validar Usuario'),
        ));

    final gifLoading = Positioned(
        top: 200,
        child: Image.asset(
          'assets/relojarena.gif',
          height: 150,
        ));

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('assets/vultures.jpg'))),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 275,
              child: Image.asset(
                'assets/v1.png',
                width: 300,
              ),
            ),
            ctnCredentials,
            btnLogin,
            isLoading ? gifLoading : Container() //uso operandos ternarios
          ],
        ),
      ),
    );
  }
}


/*
Elementos a trabajar en las App
GridView.builder
Col
Row
ListView.builder
Stack
*/

/*
ImageProvider
Existen 2 tipos
NetworkImage
AssetImage

Image.Network
Image.file
Image.asset
*/