import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste_mobile/core/app_colors.dart';

class CardViagemWidget extends StatelessWidget {
  String labelOrigem;
  String labelDestino;
  String labelNomeMotorista;
  String labelAssentos;
  String labelData;
  Function() onPressed;
  Function() onTap;

  CardViagemWidget(
      {required this.labelOrigem,
      required this.labelDestino,
      required this.labelNomeMotorista,
      required this.labelAssentos,
      required this.labelData,
      required this.onPressed,
      required this.onTap})
      : super();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: AppColors.white,
          onPrimary: AppColors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20)),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Origem: ",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppColors.purple)),
                  Text(labelOrigem, style: TextStyle(fontSize: 15)),
                  Text("Destino: ",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppColors.purple)),
                  Text(labelDestino, style: TextStyle(fontSize: 15)),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Motorista: ",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppColors.purple)),
                  Text(labelNomeMotorista, style: TextStyle(fontSize: 15)),
                  Text("Assentos: ",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppColors.purple)),
                  Text(labelAssentos, style: TextStyle(fontSize: 15)),
                ],
              ),
            ),
            Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                      onTap: onTap,
                      child: Container(
                          child: Icon(Icons.delete_forever,
                              color: AppColors.purple))),
                ),
                Container(height: 5),
                Container(
                  child: Text("Data: ",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppColors.purple)),
                ),
                Text(labelData, style: TextStyle(fontSize: 15)),
              ],
            ))
          ],
        ),
      ),
      onPressed: onPressed,
    );
  }
}
