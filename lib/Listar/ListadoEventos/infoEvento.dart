import 'package:flutter/material.dart';


class infevento extends StatefulWidget {
  infevento({Key? key}) : super(key: key);

  @override
  State<infevento> createState() => _infeventoState();
}

class _infeventoState extends State<infevento> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Evento'),
      ),
    );
  }
}