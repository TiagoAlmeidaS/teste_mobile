import 'package:flutter_triple/flutter_triple.dart';
import 'package:http/http.dart' as http;
import 'package:teste_mobile/core/usecases/errors/failures.dart';
import 'package:teste_mobile/features/data/datasource/viagem_datasource_implementation.dart';
import 'package:teste_mobile/features/data/models/viagem_model.dart';
import 'package:teste_mobile/features/domain/entities/viagem_entity.dart';

class HomeStore extends NotifierStore<Failure, ViagemEntity> {
  ViagemDatasourceImplementation datasource = ViagemDatasourceImplementation(http.Client());


  HomeStore(this.datasource) : super(ViagemEntity('', '', '', '', '', <String, dynamic> {}));

  Future<ViagemModel> createViagem(ViagemModel viagemModel) async {
    return await datasource.createViagem(viagemModel);
  }

  Future<List<ViagemModel>> getAll() async {
    return await datasource.getAll();
  }

  Future<String> deleteViagem(String id) async {
    return await datasource.deleteViagem(id);
  }

  Future<ViagemModel> updateViagem(ViagemModel viagemModel) async {
    return await datasource.updateViagem(viagemModel, viagemModel.id);
  }
}
