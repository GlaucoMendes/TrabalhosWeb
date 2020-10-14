import 'package:Trabalho3/app/modules/core/global_store.dart';
import 'package:Trabalho3/app/modules/login/login_controller.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final GlobalStore store;
  final LoginController loginController;
  _HomeControllerBase(this.store, this.loginController);
}
