import 'package:equatable/equatable.dart';

class ViagemEntity extends Equatable {
  final String id;
  final String nomeMotorista;
  final String origem;
  final String destino;
  final String dataViagem;
  final Map<String, dynamic> assentos;

  ViagemEntity(this.id, this.nomeMotorista, this.origem, this.destino,
      this.dataViagem, this.assentos);

  @override
  List<Object?> get props => [
    id,
    nomeMotorista,
    origem,
    destino,
    dataViagem,
    assentos
  ];
}
