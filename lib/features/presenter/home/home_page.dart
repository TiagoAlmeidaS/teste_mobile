import 'package:expandable_bottom_bar/expandable_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_mobile/core/app_colors.dart';
import 'package:teste_mobile/core/app_gradients.dart';
import 'package:teste_mobile/core/app_text_styles.dart';
import 'package:teste_mobile/features/data/models/viagem_model.dart';
import 'package:teste_mobile/features/presenter/home/controller/home_store.dart';
import 'package:teste_mobile/features/presenter/home/widget/card_viagem_widget.dart';
import 'package:teste_mobile/features/presenter/widgets/text_form_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  late ViagemModel viagemModel;
  List<String> dropDownOptions = ['Editar', 'Remover'];
  TextEditingController origemController = TextEditingController();
  TextEditingController destinoController = TextEditingController();
  TextEditingController nomeMotoristaController = TextEditingController();
  TextEditingController assentosController = TextEditingController();
  TextEditingController dataController = TextEditingController();
  late List<ViagemModel> listaDeViagens;
  late GlobalKey<FormState> _formKeys;

  Future<List<ViagemModel>> fetchListItems() async {
    return listaDeViagens = await store.getAll();
  }

  bool validator() {
    if (_formKeys.currentState != null && _formKeys.currentState!.validate()) {
      print("Validated");
      return true;
    } else {
      print("Is not Validated");
      return false;
    }
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
        backgroundColor: AppColors.background,
        body: Container(
            child: FutureBuilder(
                future: fetchListItems(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<ViagemModel>> snapshot) {
                  if (snapshot.data != null) {
                    return Container(
                      child: ListView.builder(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, index) {
                            return snapshot.data!
                                .map((ViagemModel viagemModel) {
                                  return Container(
                                      margin: EdgeInsets.symmetric(vertical: 4),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.15,
                                      child: CardViagemWidget(
                                          labelOrigem: viagemModel.origem,
                                          labelDestino: viagemModel.destino,
                                          labelNomeMotorista:
                                              viagemModel.nomeMotorista,
                                          labelAssentos:
                                              (viagemModel.assentos.length)
                                                  .toString(),
                                          labelData: viagemModel.dataViagem,
                                          onPressed: () {
                                            print(viagemModel.id);
                                            Modular.to.pushNamed('/reserva',
                                                arguments: viagemModel);
                                          },
                                          onTap: () async {
                                            await store
                                                .deleteViagem(viagemModel.id);
                                            setState(() {
                                              fetchListItems();
                                            });
                                          }));
                                })
                                .toList()
                                .elementAt(index);
                          }),
                    );
                  } else if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return Center(child: Text('Something went wrong :('));
                  }
                })),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: GestureDetector(
          onVerticalDragUpdate: DefaultBottomBarController.of(context).onDrag,
          onVerticalDragEnd: DefaultBottomBarController.of(context).onDragEnd,
          child: FloatingActionButton(
            elevation: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 3),
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, gradient: AppGradients.linear),
              child: AnimatedBuilder(
                animation: DefaultBottomBarController.of(context).state,
                builder: (context, child) => Center(
                  child: Icon(Icons.add,
                      size: MediaQuery.of(context).size.height * 0.04),
                ),
              ),
            ),
            onPressed: () => DefaultBottomBarController.of(context).swap(),
          ),
        ),
        bottomSheet: Container(
          padding: EdgeInsets.only(top: 10),
          child: BottomExpandableAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.7,
            horizontalMargin: 10,
            shape: AutomaticNotchedShape(
                RoundedRectangleBorder(), StadiumBorder(side: BorderSide())),
            expandedBackColor: AppColors.background,
            expandedBody: Container(
              height: double.infinity,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKeys,
                  child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.only(top: 10),
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Text("Cadastro Viagens",
                              style: AppTextStyles.heading)),
                      TextFormFieldWidget(
                          origemController,
                          TextInputType.text,
                          "Origem: ",
                          "Rua: Pinto coelho",
                          (val) => val == "" ? "Não pode ser vazio" : null),
                      TextFormFieldWidget(
                          destinoController,
                          TextInputType.text,
                          "Destino: ",
                          "Rua: Centro",
                          (val) => val == "" ? "Não pode ser vazio" : null),
                      TextFormFieldWidget(
                          nomeMotoristaController,
                          TextInputType.text,
                          "Nome do motorista: ",
                          "ex: Tiago",
                          (val) => val == "" ? "Não pode ser vazio" : null),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFormFieldWidget(
                                assentosController,
                                TextInputType.number,
                                "Número de assentos: ",
                                "ex: 12",
                                (val) =>
                                    val == "" ? "Não pode ser vazio" : null),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFormField(
                              controller: dataController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16)),
                                labelText: "Data da Viagem",
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              onTap: () {
                                showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime(2022))
                                    .then((value) {
                                  setState(() {
                                    dataController.text =
                                        value.toString().split(' ').first;
                                  });
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      Container(height: 10),
                      ElevatedButton(
                          onPressed: () async {
                            List<int> assentosList = [];

                            if (validator()) {
                              for (var i = 1;
                                  i <= int.parse(assentosController.text);
                                  i++) {
                                assentosList.add(i);
                              }

                              Map<String, dynamic> assentosMap = {
                                for (var item in assentosList)
                                  "$item": 'assento$item'
                              };

                              var newViagemModel = ViagemModel('',
                                  nomeMotorista: nomeMotoristaController.text,
                                  origem: origemController.text,
                                  destino: destinoController.text,
                                  dataViagem: dataController.text,
                                  assentos: assentosMap);

                              await store.createViagem(newViagemModel);
                              setState(() {
                                fetchListItems();
                              });
                            }
                          },
                          child: Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: MediaQuery.of(context).size.height * 0.05,
                              alignment: Alignment.center,
                              child: Text("Cadastrar Viagem")))
                    ],
                  ),
                ),
              ),
            ),
            bottomAppBarBody: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "Algo",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  Expanded(
                    child: Text(
                      "Talvez",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
