import 'package:my_project/screen/home/model/home_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class fakestoreAPIHelper {
  Future<List<FakstoresModel>?> fakestoreAPI() async {
    String link = "https://fakestoreapi.com/products";
    var response =await http.get(Uri.parse(link));
    if(response.statusCode==200)
      {
        List json=jsonDecode(response.body);
        List<FakstoresModel> model=json.map((e) => FakstoresModel.MapToModel(e)).toList();
        return model;
      }
    return null;

  }
}
