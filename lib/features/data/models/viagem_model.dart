import 'package:teste_mobile/features/domain/entities/viagem_entity.dart';

class ViagemModel extends ViagemEntity {
  ViagemModel(String? id, {
    required String nomeMotorista,
    required String origem,
    required String destino,
    required String dataViagem,
    required Map<String, dynamic> assentos})
      : super(id!, nomeMotorista, origem, destino, dataViagem, assentos);

  factory ViagemModel.fromJson(Map<String, dynamic> json) =>
      ViagemModel(
          json['id'],
          nomeMotorista: json['nomeMotorista'],
          origem: json['origem'],
          destino: json['destino'],
          dataViagem: json['dataViagem'],
          assentos: json['assentos']);

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'nomeMotorista': nomeMotorista,
        'origem': origem,
        'destino': destino,
        'dataViagem': dataViagem,
        'assentos': assentos
      };
}
