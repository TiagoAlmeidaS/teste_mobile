import 'package:equatable/equatable.dart';

class ReservaEntity extends Equatable {
  String id;
  String nome;
  String numero;
  int? assento;

  ReservaEntity(this.id, this.nome, this.numero, this.assento);

  @override
  List<Object?> get props => [id, nome, numero];
}
