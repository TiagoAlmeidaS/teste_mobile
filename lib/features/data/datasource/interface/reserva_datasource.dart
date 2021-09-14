
import 'package:teste_mobile/features/data/models/reserva_model.dart';

abstract class IReservaDatasource {
  Future<ReservaModel> createReserva(String viagemId, ReservaModel reserva);
  Future<ReservaModel> getReservaDaViagem(String viagemId);
  Future<String> deleteReserva(String viagemId, String id);
}