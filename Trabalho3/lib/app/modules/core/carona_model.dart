class CaronaModel {
  String donoId;
  String donoPhoroUrl;
  String donoDisplayName;
  String donoEmail;
  String donoTelefone;
  String cidadeOrigem;
  String cidadeDestino;
  String passageiroId;
  String passageiroPhoroUrl;
  String passageiroDisplayName;
  String passageiroEmail;
  String docRef;
  bool caronaSolicitada;

  CaronaModel(
      {this.donoId,
      this.donoPhoroUrl,
      this.donoDisplayName,
      this.donoEmail,
      this.donoTelefone,
      this.cidadeOrigem,
      this.cidadeDestino,
      this.passageiroId,
      this.passageiroPhoroUrl,
      this.passageiroDisplayName,
      this.passageiroEmail,
      this.caronaSolicitada,
      this.docRef});

  CaronaModel.fromJson(Map<String, dynamic> json) {
    donoId = json['donoId'];
    donoPhoroUrl = json['donoPhoroUrl'];
    donoDisplayName = json['donoDisplayName'];
    donoEmail = json['donoEmail'];
    donoTelefone = json['donoTelefone'];
    cidadeOrigem = json['cidade_origem'];
    cidadeDestino = json['cidade_destino'];
    passageiroId = json['passageiroId'];
    passageiroPhoroUrl = json['passageiroPhoroUrl'];
    passageiroDisplayName = json['passageiroDisplayName'];
    passageiroEmail = json['passageiroEmail'];
    caronaSolicitada = json['caronaSolicitada'];
    docRef = json['docRef'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['donoId'] = this.donoId;
    data['donoPhoroUrl'] = this.donoPhoroUrl;
    data['donoDisplayName'] = this.donoDisplayName;
    data['donoEmail'] = this.donoEmail;
    data['donoTelefone'] = this.donoTelefone;
    data['cidade_origem'] = this.cidadeOrigem;
    data['cidade_destino'] = this.cidadeDestino;
    data['passageiroId'] = this.passageiroId;
    data['passageiroPhoroUrl'] = this.passageiroPhoroUrl;
    data['passageiroDisplayName'] = this.passageiroDisplayName;
    data['passageiroEmail'] = this.passageiroEmail;
    data['caronaSolicitada'] = this.caronaSolicitada;
    data['docRef'] = this.docRef;
    return data;
  }
}
