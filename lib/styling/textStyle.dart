import 'package:flutter/material.dart';

TextStyle textButton = const TextStyle(
  color: Colors.black,
);

TextStyle appTitle = const TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
);
TextStyle textName = const TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
);
TextStyle textOpenInfo = const TextStyle(
  fontSize: 11,
);
TextStyle textTimeforProcess = const TextStyle(
    fontWeight: FontWeight.bold, fontSize: 7, color: Colors.green);

TextStyle textTimeforWaiting = const TextStyle(
    fontWeight: FontWeight.bold, fontSize: 7, color: Colors.red);
TextStyle textTimeforProcessDialog = const TextStyle(
    fontWeight: FontWeight.bold, fontSize: 15, color: Colors.green);

TextStyle textTimeforWaitingDialog = const TextStyle(
    fontWeight: FontWeight.bold, fontSize: 15, color: Colors.red);

Text textCenter(String content, {TextStyle? style}) {
  return Text(
    content,
    textAlign: TextAlign.center,
    style: style ?? textButton,
  );
}
