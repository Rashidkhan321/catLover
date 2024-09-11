import 'package:cat_lovers/Api_Base/catApiData.dart';
import 'package:cat_lovers/Ui/ImageDetail.dart';
import 'package:cat_lovers/Ui/breadScreen.dart';
import 'package:flutter/material.dart';

import '../Api_Base/catbreaddata.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
final obj = CatApiData();

  final obj2 = recipApiData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:

      AppBar(title: Center(child:
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20, // Adjust the radius as needed
            backgroundImage: AssetImage('images/logo.jpg'),
          ),
          SizedBox(width: 50,),
          Text('Home Screen')
        ],
      ) ),
      ),

      body: RefreshIndicator(

        onRefresh: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home_Screen())),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            breaddata(),

            
            Expanded(
              child: FutureBuilder(future: obj.getdata(), builder: (context, snasphot){

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
      ),
    );
  }
}















class imagepick extends StatelessWidget {

  final imageurl;
  final imagpet;
  double   height;
  double width;


  imagepick({Key? key,
    required this.imageurl,
    required this.imagpet,
    this.height = 400,
    this.width=900

  }) : super(key: key,

  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Image(
        fit: imagpet,
        image: NetworkImage(imageurl),
        loadingBuilder: ( BuildContext context, Widget child, ImageChunkEvent? loading ){

          if(loading==null)
            return child;
          return Container(
            height: height,
            width: width,
            // MediaQuery.of(context).size.height *
            //    0.4,
            // width: MediaQuery.of(context).size.width *
            //   0.9,
            decoration: BoxDecoration(
                color: Colors.green.shade200
            ),
            child: Center(


            ),
          );
        },
        errorBuilder: (contex, exception, stack){
          return Container(
            decoration: BoxDecoration(
                color: Colors.green.shade200
            ),

            height:
            MediaQuery.of(context).size.height *
                0.3,
            width: MediaQuery.of(context).size.width *
                0.9,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [

                  Icon(Icons.wifi_off, color: Colors.black,
                    size: 30,),
                  Container(
                      margin: EdgeInsets.only(bottom: 13),
                      child: Text('check internet connection!'))
                ],
              ),
            ),
          );
        },

      ),
    );
  }
}

class breaddata extends StatefulWidget {
  const breaddata({Key? key}) : super(key: key);

  @override
  State<breaddata> createState() => _breaddataState();
}

class _breaddataState extends State<breaddata> {
  final catbrea =BreadApiData();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child:   FutureBuilder(future: catbrea.getdata(), builder: (context, snasphot){

        if(!snasphot.hasData){
          return Center(child: Container());

        }
        else if(snasphot.hasError){

          return Center(child: Text('error'));
        }
        else{

          return
             ListView.builder(
                scrollDirection: Axis.horizontal,

                itemCount:  catbrea.list.length,
                itemBuilder: (context, index){
                  final query = snasphot.data![index].id.toString();


                  return Row(
                    children: [

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder:
                                  (context)=>breadscreen(query: query, name: snasphot.data![index].name.toString(),)
                                  ));
                            },
                            child: Container(
                              height: 40,
                        color: Colors.black,
                              child: Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: Text(snasphot.data![index].name.toString(),style: TextStyle(color: Colors.white,
                                fontSize: 18),),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }

          );
        }
      }),
    );
  }
}
