class ViagemEndPoint {
  //ip e porta do servidor da API - 10.0.2.2
  static String HOST = "192.168.100.25:8080";
      // "localhost:8080";


  static Uri create() => Uri.http(HOST, "/api/viagem");
  static Uri getById(String id) => Uri.http(HOST, "/api/viagem/$id");
  static Uri getAll() => Uri.http(HOST, "/api/viagem");

}