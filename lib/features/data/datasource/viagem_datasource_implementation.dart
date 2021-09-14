import 'dart:convert';
import 'dart:core';
import 'dart:io';

import 'package:teste_mobile/core/usecases/errors/decode_error.dart';
import 'package:teste_mobile/core/usecases/errors/exceptions.dart';
import 'package:teste_mobile/features/data/datasource/endpoints/viagem_endpoint.dart';
import 'package:teste_mobile/features/data/datasource/interface/viagem_datasource.dart';
import 'package:teste_mobile/features/data/models/viagem_model.dart';
import 'package:http/http.dart' as http;


class ViagemDatasourceImplementation implements IViagemDatasource {
  final http.Client client;

  ViagemDatasourceImplementation(this.client);


  @override
  Future<ViagemModel> createViagem(ViagemModel viagemModel) async {
    var response = await client.post(ViagemEndPoint.create(),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
        body: json.encode(viagemModel.toJson()));
    if(response.statusCode == 200){
      return ViagemModel.fromJson(jsonDecode(response.body));
    } else if(response.statusCode == 400){
      String message = DecodeError.error(response.body);
      throw Exception(message);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<String> deleteViagem(String id) async {
    var response = await client.delete(ViagemEndPoint.getById(id),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        });
    if(response.statusCode == 204){
      return "Excluído com sucesso";
    } else if(response.statusCode == 400){
      String message = DecodeError.error(response.body);
      throw Exception(message);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ViagemModel>> getAll() async {
    var response = await client.get(ViagemEndPoint.getAll(),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        });
    if(response.statusCode == 200){
      List<ViagemModel> viagens = [];
      jsonDecode(response.body).forEach((x) => viagens.add(ViagemModel.fromJson(x)));
      print("------------------------------------------------------------------------------");
      print(viagens);
      return viagens;
    } else if(response.statusCode == 400){
      String message = DecodeError.error(response.body);
      throw Exception(message);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ViagemModel> getById(String id) async {
    var response = await client.get(ViagemEndPoint.getById(id),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        });
    if(response.statusCode == 200){
      return ViagemModel.fromJson(jsonDecode(response.body));
    } else if(response.statusCode == 400){
      String message = DecodeError.error(response.body);
      throw Exception(message);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ViagemModel> updateViagem(ViagemModel viagemModel, String id) async {
    var response = await client.put(ViagemEndPoint.getById(id),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
    body: json.encode(viagemModel.toJson()));
    if(response.statusCode == 200){
      return ViagemModel.fromJson(jsonDecode(response.body));
    } else if(response.statusCode == 400){
      String message = DecodeError.error(response.body);
      throw Exception(message);
    } else {
      throw ServerException();
    }
  }

}