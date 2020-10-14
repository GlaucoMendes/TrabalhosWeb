// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_store.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $GlobalStore = BindInject(
  (i) => GlobalStore(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GlobalStore on _GlobalStoreBase, Store {
  final _$currentCaronaAtom = Atom(name: '_GlobalStoreBase.currentCarona');

  @override
  CaronaModel get currentCarona {
    _$currentCaronaAtom.reportRead();
    return super.currentCarona;
  }

  @override
  set currentCarona(CaronaModel value) {
    _$currentCaronaAtom.reportWrite(value, super.currentCarona, () {
      super.currentCarona = value;
    });
  }

  final _$_GlobalStoreBaseActionController =
      ActionController(name: '_GlobalStoreBase');

  @override
  dynamic setCarona(CaronaModel value) {
    final _$actionInfo = _$_GlobalStoreBaseActionController.startAction(
        name: '_GlobalStoreBase.setCarona');
    try {
      return super.setCarona(value);
    } finally {
      _$_GlobalStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentCarona: ${currentCarona}
    ''';
  }
}
