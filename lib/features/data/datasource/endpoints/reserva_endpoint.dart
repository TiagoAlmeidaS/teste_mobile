class ReservaEndPoint {
  //ip e porta do servidor da API - 10.0.2.2
  static String HOST = "192.168.100.25:8080";
      // "localhost:8080";


  static Uri create(String viagemId) => Uri.http(HOST, "/api/viagem/$viagemId/reserva");
  static Uri delete(String viagemId, String id) => Uri.http(HOST, "/api/viagem/$viagemId/reserva/$id");
  static Uri getReserva(String viagemId) => Uri.http(HOST, "/api/viagem/$viagemId/reserva");

}