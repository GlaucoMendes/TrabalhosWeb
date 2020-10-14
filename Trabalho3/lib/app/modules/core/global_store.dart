import 'package:Trabalho3/app/modules/core/carona_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'global_store.g.dart';

@Injectable()
class GlobalStore = _GlobalStoreBase with _$GlobalStore;

abstract class _GlobalStoreBase with Store {
  GoogleSignInAccount user;
  @observable
  CaronaModel currentCarona;
  @action
  setCarona(CaronaModel value) => currentCarona = value;
  void criarCarona({String origem, String destino, String telefone}) async {
    DocumentReference docRef =
        await FirebaseFirestore.instance.collection('caronas').add(
      {
        "donoId": user.id,
        "donoPhoroUrl": user.photoUrl,
        "donoDisplayName": user.displayName,
        "donoEmail": user.email,
        "cidade_origem": origem,
        "cidade_destino": destino,
        "donoTelefone": telefone,
        "passageiroId": "",
        "passageiroPhoroUrl": "",
        "passageiroDisplayName": "",
        "passageiroEmail": "",
        "caronaSolicitada": false
      },
    );
    await FirebaseFirestore.instance
        .collection('caronas')
        .doc(docRef.id)
        .update({"docRef": docRef.id});
  }

  void delete(String docId) {
    FirebaseFirestore.instance.collection('caronas').doc(docId).delete();
  }

  void solicitar(QueryDocumentSnapshot snapshot) {
    FirebaseFirestore.instance.collection('caronas').doc(snapshot.id).update({
      'caronaSolicitada': true,
      'passageiroId': user.id,
      'passageiroPhoroUrl': user.photoUrl,
      'passageiroDisplayName': user.displayName,
      'passageiroEmail': user.email
    });
  }

  void negar() {
    FirebaseFirestore.instance
        .collection('caronas')
        .doc(currentCarona.docRef)
        .update({'caronaSolicitada': false});
  }

  void aceitar() {
    print(currentCarona.docRef);
    delete(currentCarona.docRef);
  }
}
