import 'package:Trabalho3/app/modules/core/global_store.dart';
import 'package:Trabalho3/app/modules/utils/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:google_sign_in/google_sign_in.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  GoogleSignIn _googleSignIn = GoogleSignIn();
  final GlobalStore store;

  _LoginControllerBase(this.store);
  Future<GoogleSignInAccount> signIn() async {
    GoogleSignInAccount user;
    if (_googleSignIn.currentUser == null) {
      try {
        user = await _googleSignIn.signInSilently();

        if (user == null) user = await _googleSignIn.signIn();
        if (user != null) {
          store.user = user;

          Modular.to
              .pushNamedAndRemoveUntil('/home', ModalRoute.withName('/login'));
        }
      } catch (error) {
        Message.show('Error', 'Autenticação não efetuada.');
      }
    }
    return user;
  }

  void signOut() {
    _googleSignIn.signOut();
    Modular.to.pushReplacementNamed('/login');
  }
}
