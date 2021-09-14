import 'package:flutter_triple/flutter_triple.dart';
import 'package:teste_mobile/core/usecases/errors/failures.dart';
import 'package:teste_mobile/features/data/datasource/reserva_datasource_implementation.dart';
import 'package:http/http.dart' as http;
import 'package:teste_mobile/features/data/datasource/viagem_datasource_implementation.dart';
import 'package:teste_mobile/features/data/models/reserva_model.dart';
import 'package:teste_mobile/features/data/models/viagem_model.dart';
import 'package:teste_mobile/features/domain/entities/reserva_entity.dart';

class ReservaStore extends NotifierStore<Failure, ReservaEntity> {
  ReservaDatasourceImplementation datasource =
      ReservaDatasourceImplementation(http.Client());

  ReservaStore(this.datasource) : super(ReservaEntity('', '', '', 0));

  Future<ReservaModel> getReservaDaViagem(String viagemId) async {
    return await datasource.getReservaDaViagem(viagemId);
  }

  Future<ReservaModel> createReserva(
      String viagemId, ReservaModel reservaModel) async {
    return await datasource.createReserva(viagemId, reservaModel);
  }

  Future<String> deleteReserva(String viagemId, String id) async {
    return await datasource.deleteReserva(viagemId, id);
  }
}
