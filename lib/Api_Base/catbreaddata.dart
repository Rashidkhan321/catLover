import 'dart:convert';

import 'package:http/http.dart' as http;

import 'modals/catbreadmodal.dart';
import 'modals/catdatamodal.dart';
import 'modals/example/recipe.dart';
class BreadApiData{

  List<catbread> list=[];

  Future<List<catbread>> getdata()async{

    final response =
    await http.get(Uri.parse('https://api.thecatapi.com/v1/breeds'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode==200){

      for(Map i in data){
        list.add(catbread.fromJson(i as dynamic));

      }

      return list;

    }
    else{
      return list;
    }

  }


}