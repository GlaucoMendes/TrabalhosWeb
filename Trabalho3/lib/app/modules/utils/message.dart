import 'package:Trabalho3/app/modules/core/global_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Message {
  static void show(String title, String message) {
    Modular.to.showDialog(
        barrierDismissible: false,
        builder: (_) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Modular.to.pop();
                  },
                  child: Text("OK"))
            ],
          );
        });
  }

  static void formCarona() {
    TextEditingController cidadeOrigemController = TextEditingController();
    TextEditingController cidadeDestinoController = TextEditingController();
    TextEditingController telefoneController = TextEditingController();
    GlobalStore store = Modular.get();
    Modular.to.showDialog(
        barrierDismissible: false,
        builder: (_) {
          return AlertDialog(
            title: Text('Criar Carona'),
            content: Container(
              height: 200,
              child: Column(
                children: [
                  TextField(
                    controller: cidadeOrigemController,
                    decoration: InputDecoration(labelText: 'Cidade de Origem:'),
                  ),
                  TextField(
                    controller: cidadeDestinoController,
                    decoration:
                        InputDecoration(labelText: 'Cidade de Destino:'),
                  ),
                  TextField(
                    controller: telefoneController,
                    decoration: InputDecoration(labelText: 'Telefone:'),
                    keyboardType: TextInputType.number,
                  )
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Modular.to.pop();
                },
                child: Text("Cancelar"),
              ),
              FlatButton(
                onPressed: () {
                  store.criarCarona(
                      origem: cidadeOrigemController.text,
                      destino: cidadeDestinoController.text,
                      telefone: telefoneController.text);

                  Modular.to.pop();
                  show('Suceso', 'Carona criada!');
                },
                child: Text("Criar"),
              )
            ],
          );
        });
  }

  static void aceitarSolicitacao() {
    GlobalStore store = Modular.get();
    Modular.to.showDialog(
        barrierDismissible: false,
        builder: (_) {
          return AlertDialog(
            title: Text('Pedido de Carona!'),
            content: Container(
              height: 145,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        NetworkImage(store.currentCarona.passageiroPhoroUrl),
                  ),
                  Text('${store.currentCarona.passageiroDisplayName}'),
                  Text('${store.currentCarona.passageiroEmail}')
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  store.aceitar();
                  Modular.to.pop();
                },
                child: Text("Aceitar"),
              ),
              FlatButton(
                onPressed: () {
                  store.negar();
                  Modular.to.pop();
                },
                child: Text("Negar"),
              ),
            ],
          );
        });
  }
}
