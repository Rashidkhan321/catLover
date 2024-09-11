

import 'package:flutter/material.dart';

import '../Api_Base/catApiData.dart';
import 'Home_Screen.dart';
import 'ImageDetail.dart';

class breadscreen extends StatefulWidget {
  final query;
  final name;
  const breadscreen({Key? key, required this.query, required this.name}) : super(key: key);

  @override
  State<breadscreen> createState() => _breadscreenState();
}

class _breadscreenState extends State<breadscreen> {
  @override
  final obj = CatApiData();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:

      AppBar(
        automaticallyImplyLeading: false,
        title: Center(child:
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20, // Adjust the radius as needed
            backgroundImage: AssetImage('images/logo.jpg'),
          ),
          SizedBox(width: 50,),
          Text(widget.name.toString())
        ],
      ) ),
      ),

      body:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

     SizedBox(height: 30,),

            Expanded(
              child: FutureBuilder(future: obj.getbread(widget.query), builder: (context, snasphot){

                if(!snasphot.hasData){
                  return Center(child: CircularProgressIndicator());

                }
                else if(snasphot.hasError){

                  return Center(child: Text('error'));
                }
                else{

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7.0,vertical: 2),
                    child: ListView.builder(

                        itemCount:  obj.list.length,
                        itemBuilder: (context, index){


                          return Column(
                            children: [
                              SizedBox(height: 10,),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder:
                                        (context)=>ImageDetail(imageurl: snasphot.data![index].url.toString())));
                                  },
                                  child: Container(

                                    child: imagepick(imageurl: snasphot.data![index].url.toString(), imagpet: BoxFit.cover),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                  );
                }
              }),
            )
          ],
        ),

    );
  }
}