import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_mobile/core/app_images.dart';
import 'package:teste_mobile/features/data/models/reserva_model.dart';
import 'package:teste_mobile/features/data/models/viagem_model.dart';
import 'package:teste_mobile/features/presenter/reserva/controller/reserva_store.dart';
import 'package:teste_mobile/features/presenter/widgets/text_form_field.dart';

class ReservaPage extends StatefulWidget {
  final ViagemModel viagemModel;

  ReservaPage({required this.viagemModel});

  @override
  _ReservaPageState createState() => _ReservaPageState();
}

class _ReservaPageState extends ModularState<ReservaPage, ReservaStore> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController numeroController = TextEditingController();
  TextEditingController assentoController = TextEditingController();
  ReservaModel reservaModel =
      ReservaModel(id: '', nome: '', numero: '', assento: 0);
  late GlobalKey<FormState> _formKeys;

  bool validator() {
    if (_formKeys.currentState != null && _formKeys.currentState!.validate()) {
      print("Validated");
      return true;
    } else {
      print("Is not Validated");
      return false;
    }
  }

  Future<ReservaModel> fetchListItems() async {
    reservaModel = await store.getReservaDaViagem(widget.viagemModel.id);
    nomeController.text = reservaModel.nome;
    numeroController.text = reservaModel.numero;
    assentoController.text =
        reservaModel.assento == null ? "" : reservaModel.assento.toString();
    return reservaModel;
  }

  @override
  void initState() {
    _formKeys = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
            future: fetchListItems(),
            builder: (context, index) {
              return SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: _formKeys,
                    child: Column(
                      children: [
                        Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                                "Cadastre aqui sua reserva\n ou cancele",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16))),
                        TextFormFieldWidget(
                            nomeController,
                            TextInputType.text,
                            "Nome: ",
                            "ex: Tiago",
                            (val) =>
                                val == "" ? "Nome não pode ser vazio" : null),
                        TextFormFieldWidget(
                            numeroController,
                            TextInputType.number,
                            "Telefone: ",
                            "ex: (95) 981233741)",
                            (val) => val == ""
                                ? "Telefone não pode ser vazio"
                                : null),
                        TextFormFieldWidget(
                            assentoController,
                            TextInputType.number,
                            "Assento: ",
                            "ex: 11",
                            (val) => (val == "" && val != null)
                                ? "Assento não pode ser vazio"
                                : null),
                        Container(child: Image.asset(AppImages.assentos)),
                      ],
                    ),
                  ),
                ),
              );
            }),
        bottomSheet: FutureBuilder(
            future: fetchListItems(),
            builder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed: reservaModel.id.isEmpty
                            ? () async {
                                reservaModel = ReservaModel(
                                    id: '',
                                    nome: nomeController.text,
                                    numero: numeroController.text,
                                    assento: int.parse(assentoController.text));
                                if (validator()) {
                                  await store.createReserva(
                                      widget.viagemModel.id, reservaModel);
                                  Modular.to.pop();
                                }
                              }
                            : () {},
                        style: ElevatedButton.styleFrom(
                            onPrimary: reservaModel.id.isNotEmpty
                                ? Colors.black
                                : Colors.white,
                            primary: reservaModel.id.isNotEmpty
                                ? Colors.grey
                                : Colors.green),
                        child: Text("Cadastre a reserva")),
                    ElevatedButton(
                        onPressed: reservaModel.id.isNotEmpty
                            ? () async {
                                await store.deleteReserva(
                                    widget.viagemModel.id, reservaModel.id);
                                Modular.to.pop();
                              }
                            : () {},
                        style: ElevatedButton.styleFrom(
                            onPrimary: Colors.white, primary: Colors.red),
                        child: Text("Cancelar reserva"))
                  ],
                ),
              );
            }),
      ),
    );
  }
}
