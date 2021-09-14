import 'dart:convert';

class DecodeError {
  static error(body){
    Map<String, dynamic> json = jsonDecode(body);
    List<dynamic> errors = json["errors"];
    Map<String, dynamic> errors0 = errors[0];
    var defaultMessage = errors0["defaultMessage"];
    return defaultMessage;
  }
}