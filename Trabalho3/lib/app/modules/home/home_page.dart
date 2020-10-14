import 'package:Trabalho3/app/modules/core/carona_model.dart';
import 'package:Trabalho3/app/modules/utils/message.dart';
import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'home_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  final ScrollController _scrollController = ScrollController();
  ReactionDisposer disposer;
  @override
  void initState() {
    super.initState();
    autorun((_) async {
      await controller.loginController.signIn();
    });

    disposer = reaction((_) => controller.store.currentCarona, (msg) async {
      await Future.delayed(Duration(milliseconds: 100));
      Message.aceitarSolicitacao();
    });
  }

  @override
  void dispose() {
    super.dispose();
    disposer();
  }

  @override
  Widget build(BuildContext context) {
    var store = controller.store;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Scrollbar(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: 400,
              child: Column(
                children: <Widget>[
                  Divider(),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        store.user?.photoUrl ?? 'https://picsum.photos/200/300',
                        scale: 2.0),
                  ),
                  Text(
                    'Seja bem vindo ${store.user?.displayName}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Divider(),
                  Container(
                    width: 370,
                    child: RaisedButton(
                      child: Text('Criar Carona'),
                      onPressed: () {
                        Message.formCarona();
                      },
                    ),
                  ),
                  Divider(),
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('/caronas')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          height: 350,
                          child: Scrollbar(
                            controller: _scrollController,
                            isAlwaysShown: true,
                            child: ListView.builder(
                              controller: _scrollController,
                              itemCount: snapshot.data.docs.length,
                              itemBuilder: (_, index) {
                                CaronaModel carona = CaronaModel.fromJson(
                                    snapshot.data.docs[index].data());

                                if (store.user?.id == carona.donoId &&
                                    carona.caronaSolicitada == true) {
                                  store.setCarona(carona);
                                }
                                return Column(
                                  children: [
                                    ListTile(
                                      title: Text(
                                          'Carona de ${carona.donoDisplayName}'),
                                      leading: CircleAvatar(
                                        radius: 23,
                                        backgroundImage: NetworkImage(
                                            '${snapshot.data.docs[index].data()['donoPhoroUrl']}'),
                                      ),
                                      subtitle: Text(
                                          'De: ${carona.cidadeOrigem} para ${carona.cidadeDestino}'),
                                      trailing: Wrap(
                                        spacing: 12,
                                        children: [
                                          store.user?.id == carona.donoId
                                              ? RaisedButton(
                                                  child: Text('Deletar'),
                                                  onPressed: () => store.delete(
                                                      snapshot
                                                          .data.docs[index].id),
                                                )
                                              : carona.caronaSolicitada == false
                                                  ? RaisedButton(
                                                      child: Text('Solicitar'),
                                                      onPressed: () => store
                                                          .solicitar(snapshot
                                                              .data
                                                              .docs[index]))
                                                  : RaisedButton(
                                                      child: Text('Ocupado'),
                                                      onPressed: null),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        );
                      } else
                        return CircularProgressIndicator();
                    },
                  ),
                  Divider(),
                  Container(
                    width: 370,
                    child: RaisedButton(
                      child: Text('Sair'),
                      onPressed: () => controller.loginController.signOut(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
