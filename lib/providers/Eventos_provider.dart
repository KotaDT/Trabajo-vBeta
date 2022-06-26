import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart' as http;

class EventosProvider {
  final String apiURL = 'http://10.0.2.2:8000/api';
  

  Future<List<dynamic>>getEventos() async{
    var uri = Uri.parse('$apiURL/eventos');
    var respuesta = await http.get(uri);
    if (respuesta.statusCode==200){
      return json.decode(respuesta.body);
    }else{
      return [];
    }
  }




  Future<LinkedHashMap<String, dynamic>>getEvento(int codEvento)async{
    var uri = Uri.parse('$apiURL/eventos/$codEvento');
    var respuesta = await http.get(uri);
    
    if(respuesta.statusCode==200){
      return json.decode(respuesta.body);
    }else{
      return new LinkedHashMap();
    }
  }

  Future<LinkedHashMap<String, dynamic>> eventoEditar(
      String nom_alumno, String asunto, String descripcion) async {
    var uri = Uri.parse('$apiURL/evento/$nom_alumno');
    var respuesta = await http.put(uri,
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8', 'Accept': 'application/json'},
        body: jsonEncode(<String, dynamic>{
          'nom_niño': nom_alumno,
          'asunto': asunto,
          'descripcion':descripcion
        }));

    return json.decode(respuesta.body);
  }

  
  
  Future<LinkedHashMap<String, dynamic>>eventoAgregar(String nom_alumno, String asunto, String descripcion)async{
    var uri = Uri.parse('$apiURL/eventos');
    var respuesta = await http.post(uri, headers: <String, String>{'Content-Type':'application/json; charset=UTF-8','Accept':'application/json'},
    body: jsonEncode(<String, dynamic>{'nom_alumno':nom_alumno,'asunto':asunto,'descripcion':descripcion}));
    return json.decode(respuesta.body);
  }



  Future<bool> eventoBorrar(int cod_evento)async{
    var uri = Uri.parse('$apiURL/eventos/$cod_evento');
    var respuesta = await http.delete(uri);

    return respuesta.statusCode == 200;
  }

  Future<List<dynamic>> getEventoscmb() async {
    var url = Uri.parse('$apiURL/eventos');
    var respuesta = await http.get(url);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }
}