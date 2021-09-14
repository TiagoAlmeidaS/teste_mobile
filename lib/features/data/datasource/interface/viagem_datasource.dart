import 'package:teste_mobile/features/data/models/viagem_model.dart';

abstract class IViagemDatasource {
  Future<List<ViagemModel>> getAll();
  Future<ViagemModel> getById(String id);
  Future<ViagemModel> createViagem(ViagemModel viagemModel);
  Future<ViagemModel> updateViagem(ViagemModel viagemModel, String id);
  Future<String> deleteViagem(String id);
}