import 'dart:convert';
import 'dart:io';

import 'package:teste_mobile/core/usecases/errors/decode_error.dart';
import 'package:teste_mobile/core/usecases/errors/exceptions.dart';
import 'package:teste_mobile/features/data/datasource/endpoints/reserva_endpoint.dart';
import 'package:teste_mobile/features/data/datasource/interface/reserva_datasource.dart';
import 'package:teste_mobile/features/data/models/reserva_model.dart';
import 'package:http/http.dart' as http;

class ReservaDatasourceImplementation implements IReservaDatasource {
  final http.Client client;

  ReservaDatasourceImplementation(this.client);

  @override
  Future<ReservaModel> createReserva(
      String viagemId, ReservaModel reservaModel) async {
    var response = await client.post(ReservaEndPoint.create(viagemId),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
        body: json.encode(reservaModel.toJson()));
    if (response.statusCode == 200) {
      return ReservaModel.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 400) {
      String message = DecodeError.error(response.body);
      throw Exception(message);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ReservaModel> getReservaDaViagem(String viagemId) async {
    var response =
        await client.get(ReservaEndPoint.getReserva(viagemId), headers: {
      HttpHeaders.contentTypeHeader: "application/json",
    });
    if (response.statusCode == 200) {
      return ReservaModel.fromJson(jsonDecode(response.body));
    } else {
      return ReservaModel(id: '', nome: '', numero: '', assento: null);
    }
  }

  @override
  Future<String> deleteReserva(String viagemId, String id) async {
    var response =
        await client.delete(ReservaEndPoint.delete(viagemId, id), headers: {
      HttpHeaders.contentTypeHeader: "application/json",
    });
    if (response.statusCode == 204) {
      return "Excluído com sucesso";
    } else if (response.statusCode == 400) {
      String message = DecodeError.error(response.body);
      throw Exception(message);
    } else {
      throw ServerException();
    }
  }
}
