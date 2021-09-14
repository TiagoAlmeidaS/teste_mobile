import 'package:expandable_bottom_bar/expandable_bottom_bar.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_mobile/features/data/datasource/reserva_datasource_implementation.dart';
import 'package:teste_mobile/features/data/datasource/viagem_datasource_implementation.dart';
import 'package:teste_mobile/features/presenter/home/controller/home_store.dart';
import 'package:teste_mobile/features/presenter/home/home_page.dart';
import 'package:http/http.dart' as http;
import 'package:teste_mobile/features/presenter/reserva/controller/reserva_store.dart';
import 'package:teste_mobile/features/presenter/reserva/reserva_page.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => HomeStore(i())),
    Bind((i) => ReservaStore(i())),
    Bind((i) => ViagemDatasourceImplementation(i())),
    Bind((i) => ReservaDatasourceImplementation(i())),
    Bind((i) => http.Client()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/',
        child: (_, __) => DefaultBottomBarController(child: HomePage())),
    ChildRoute('/reserva',
        child: (_, args) => ReservaPage(viagemModel: args.data))
  ];
}
