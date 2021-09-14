import 'package:teste_mobile/features/domain/entities/reserva_entity.dart';

class ReservaModel extends ReservaEntity {
  ReservaModel(
      {required String id,
      required String nome,
      required String numero,
      required int? assento})
      : super(id, nome, numero, assento);

  factory ReservaModel.fromJson(Map<String, dynamic> json) => ReservaModel(
      id: json['id'],
      nome: json['nome'],
      numero: json['numero'],
      assento: json['assento']);

  Map<String, dynamic> toJson() =>
      {"id": id, "nome": nome, "numero": numero, "assento": assento};
}
