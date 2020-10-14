import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Carona Web Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 350,
          child: Column(
            children: <Widget>[
              Divider(),
              Text(
                'Equipe',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                            'https://lh3.googleusercontent.com/a-/AOh14Gi18g_IPLqbaiuSDki-LXiv-ImyCxevPg4Mfhn4TZc=s96-c'),
                      ),
                      Text(
                        'Glauco Mendes',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Text('398042')
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                            'https://lh3.googleusercontent.com/a-/AOh14GibA7ANGaOJs0KPTN3KnYvz359RnyC4fYAhhTCUow4=s96-c'),
                      ),
                      Text(
                        'Leonardo Paiva',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Text('385401')
                    ],
                  ),
                ],
              ),
              Divider(),
              Divider(),
              Divider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  RaisedButton(
                      child: Text("Entrar com Google"),
                      onPressed: () => controller.signIn()),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
