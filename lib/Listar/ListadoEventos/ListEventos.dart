import 'package:flutter/material.dart';
import 'package:trabajo/Gestion/Eventos/Eventos_agregar_page.dart';
import 'package:trabajo/Listar/ListadoEventos/infoEvento.dart';
//import 'package:trabajo/Listar/ListadoEventos/infoEvento.dart';
import 'package:trabajo/providers/Eventos_provider.dart';

class EventosPage extends StatefulWidget {
  EventosPage({Key? key}) : super(key: key);

  @override
  State<EventosPage> createState() => _EventosPageState();
}

class _EventosPageState extends State<EventosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listado de eventos'),
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: EventosProvider().getEventos(),
                builder: (context, AsyncSnapshot snap){
                  if(!snap.hasData){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.separated(
                    separatorBuilder: (_,__) => Divider(),
                    itemCount: snap.data.length,
                    itemBuilder: (context, index){
                      var eve = snap.data[index];
                        return ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('[${eve['cod_evento']}] ${eve['nom_alumno']}')
                            ],
                          ),
                          subtitle:Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Divider(),
                                Container(
                                  child:Text('Asunto: ' '${eve['asunto']}',style: TextStyle(fontSize: 18, color: Colors.indigo),) ,
                                ),
                                Divider(
                                ),
                                Container(
                                  child:Text('Descripción:',style: TextStyle(fontSize: 20),),
                                ),
                                SizedBox(
                                  height: 100,
                                  width: double.infinity,
                                  child: Container(
                                    color: Colors.cyan,
                                    child:Column(
                                      children: [

                                        Text('${eve['descripcion']}',style: TextStyle(fontSize: 18, color: Colors.white),)
                                      ],
                                    ) ,
                                  ),
                                )
                                
                              ],
                            )) ,
                        );
                    },
                  );
                },
              ),
          ),
        ],
      ),
      
    );
  }
}