
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'modals/catdatamodal.dart';
import 'modals/example/recipe.dart';
 class CatApiData{

   List<catmodal> list=[];

   Future<List<catmodal>> getdata()async{

     final response =
     await http.get(Uri.parse('https://api.thecatapi.com/v1/images/search?limit=100&RAND='
         'random&api_key=live_Clu0vCd6dKxnvw7Y1iwwxaPHXB8awBZ0jfWheTC6OXIAoAHd3ep9tbiFTVv8t6hq'));
     var data = jsonDecode(response.body.toString());
     if(response.statusCode==200){

       for(Map i in data){
         list.add(catmodal.fromJson(i as dynamic));

       }

       return list;

     }
     else{
       return list;
     }

   }
   Future<List<catmodal>> getbread( String query)async{

     final response =
     await http.get(Uri.parse('https://api.thecatapi.com/v1/images/search?limit=100&breed_ids=$query&RAND='
         'random&api_key=live_Clu0vCd6dKxnvw7Y1iwwxaPHXB8awBZ0jfWheTC6OXIAoAHd3ep9tbiFTVv8t6hq'));
     var data = jsonDecode(response.body.toString());
     if(response.statusCode==200){

       for(Map i in data){
         list.add(catmodal.fromJson(i as dynamic));

       }

       return list;

     }
     else{
       return list;
     }

   }


 }

class recipApiData{

  List<recipemodal> list=[];


  Future<recipemodal> getdata()async{

    final response = await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?f=b'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode==200){



      return recipemodal.fromJson(data);

    }
    else{
      return recipemodal.fromJson(data);
    }

  }


}