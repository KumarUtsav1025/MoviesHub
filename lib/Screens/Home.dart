import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/Screens/MovieDetail.dart';
import 'package:movies/Widgets.dart';
import 'package:movies/main.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var id;
  int pa=1;
  String surc='marvel';
  late String trend;
  var sciLink,topLink,triLink,horLink;
  List? data,data1,data2,data3,data4;


  @override
  void initState() {
    super.initState();
    trend="https://api.themoviedb.org/3/trending/movie/day?api_key=6c459b95cc2fb143cce9ca7d2097b416&page=$pa";
    topLink="https://api.themoviedb.org/3/movie/top_rated?api_key=6c459b95cc2fb143cce9ca7d2097b416&language=en-US&page=$pa";
    sciLink="https://api.themoviedb.org/3/discover/movie?api_key=6c459b95cc2fb143cce9ca7d2097b416&with_genres=28&page=$pa";
    triLink="https://api.themoviedb.org/3/discover/movie?api_key=6c459b95cc2fb143cce9ca7d2097b416&with_genres=53&page=$pa";
    horLink="https://api.themoviedb.org/3/discover/movie?api_key=6c459b95cc2fb143cce9ca7d2097b416&with_genres=27&page=$pa";

    getData(pa,trend);
  }



  Future<String> getData(int pa, String Link) async{
    var onlineData = await http.get(Uri.parse(Link));
    var onlineData1 = await http.get(Uri.parse(topLink));
    var onlineData2 = await http.get(Uri.parse(sciLink));
    var onlineData3 = await http.get(Uri.parse(triLink));
    var onlineData4 = await http.get(Uri.parse(horLink));

    var jdata = jsonDecode(onlineData.body);
    var jdata1 = jsonDecode(onlineData1.body);
    var jdata2 = jsonDecode(onlineData2.body);
    var jdata3 = jsonDecode(onlineData3.body);
    var jdata4 = jsonDecode(onlineData4.body);
    setState(() {
      data=jdata['results'];
      data1=jdata1['results'];
      data2=jdata2['results'];
      data3=jdata3['results'];
      data4=jdata4['results'];
      
    });
    return 'success';
  }

  @override
  Widget build(BuildContext context) {
    double Height=MediaQuery.of(context).size.height;
    double Width=MediaQuery.of(context).size.width;
    isLoading=true;


    // SizedBox(height: Height*0.02,),
    // Align(
    // alignment: Alignment.center,
    // child: CustomBar(Height, Width)),https://cdn.vox-cdn.com/thumbor/qAOExpJwBQrvWqssMEY2JlNFZN4=/0x0:3000x2000/1200x800/filters:focal(1021x1075:1501x1555)/cdn.vox-cdn.com/uploads/chorus_image/image/70310267/RoundUpArt_LEDESTREAM.0.jpg
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body:Stack(
        alignment: Alignment.topCenter,
        children: [
          Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  foregroundDecoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://cdn.vox-cdn.com/thumbor/qAOExpJwBQrvWqssMEY2JlNFZN4=/0x0:3000x2000/1200x800/filters:focal(1021x1075:1501x1555)/cdn.vox-cdn.com/uploads/chorus_image/image/70310267/RoundUpArt_LEDESTREAM.0.jpg'),
                        fit: BoxFit.cover
                    ),
                  ),
                ),
              ),
              Expanded(flex:5, child: Container(color: Colors.black,))
            ],
          ),
          //Front view
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              alignment: Alignment.bottomCenter,
              width: Width,
              height: Height*0.788,
              foregroundDecoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Color.fromARGB(170, 0, 0, 0),
                      Color.fromARGB(255, 0, 0, 0),
                      Color.fromARGB(255, 7, 7, 7),
                      Color.fromARGB(255, 12, 12, 12),
                      Color.fromARGB(255, 9, 9, 9),
                    ]
                ),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25),) ,
              ),
            ),
          ),
          ListView(
            children: [
              Container(
                width:Width ,
                height: Height*0.18,
                color: const Color.fromARGB(0, 0, 0, 0),
              ),
              //trending
              Padding(
                padding: EdgeInsets.fromLTRB(8.0,4.0,0.0,4.0),
                child: Text("Trending Movies", style:GoogleFonts.raleway(textStyle: const TextStyle(fontSize: 23, color: Color.fromARGB(255,188, 111, 241),),),),
              ),
              Container(
                height: Height*0.3,
                child:ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data==null? 0 :data?.length,
                    itemBuilder: (context,index){
                      return Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          GestureDetector(
                              onTap: (){
                                isLoading=true;
                                id = data![index]['id'];
                                const MovieCard().setter(id);
                                Navigator.push(context,
                                    MaterialPageRoute(builder :(context) =>  const MovieCard(),)
                                );
                              },
                              child: MovieTile('http://image.tmdb.org/t/p/w500/${data![index]['poster_path']}','${data![index]['title']}',Width,Height)),
                        ],
                      );
                    }
                ),
              ),

              //top rated
              Padding(
                padding: EdgeInsets.fromLTRB(0.8,13.0,0.0,4.0),
                child: Text("Top Rated Movies", style:GoogleFonts.raleway(textStyle: const TextStyle(fontSize: 23, color: Color.fromARGB(255,188, 111, 241),),),),
              ),
              Container(
                height: Height*0.3,
                child:ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data1==null? 0 :data1?.length,
                    itemBuilder: (context,index){
                      return Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          GestureDetector(
                              onTap: (){
                                isLoading=true;
                                id = data1![index]['id'];
                                const MovieCard().setter(id);
                                Navigator.push(context,
                                    MaterialPageRoute(builder :(context) =>  const MovieCard(),)
                                );
                              },
                              child: MovieTile('http://image.tmdb.org/t/p/w500/${data1![index]['poster_path']}','${data1![index]['title']}',Width,Height)),
                        ],
                      );
                    }
                ),
              ),


              //Scifi
              Padding(
                padding: EdgeInsets.fromLTRB(8.0,13.0,0.0,4.0),
                child: Text("Sci-Fi Movies", style:GoogleFonts.raleway(textStyle: const TextStyle(fontSize: 23, color: Color.fromARGB(255,188, 111, 241),),),),
              ),
              Container(
                height: Height*0.3,
                child:ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data2==null? 0 :data2?.length,
                    itemBuilder: (context,index){
                      return Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          GestureDetector(
                              onTap: (){
                                isLoading=true;
                                id = data2![index]['id'];
                                const MovieCard().setter(id);
                                Navigator.push(context,
                                    MaterialPageRoute(builder :(context) =>  const MovieCard(),)
                                );
                              },
                              child: MovieTile('http://image.tmdb.org/t/p/w500/${data2![index]['poster_path']}','${data2![index]['title']}',Width,Height)),
                        ],
                      );
                    }
                ),
              ),

              //thriller
              Padding(
                padding: EdgeInsets.fromLTRB(8.0,13.0,0.0,4.0),
                child: Text("Thriller Movies", style:GoogleFonts.raleway(textStyle: const TextStyle(fontSize: 23, color: Color.fromARGB(255,188, 111, 241),),),),
              ),
              Container(
                height: Height*0.3,
                child:ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data3==null? 0 :data3?.length,
                    itemBuilder: (context,index){
                      return Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          GestureDetector(
                              onTap: (){
                                isLoading=true;
                                id = data3![index]['id'];
                                const MovieCard().setter(id);
                                Navigator.push(context,
                                    MaterialPageRoute(builder :(context) =>  const MovieCard(),)
                                );
                              },
                              child: MovieTile('http://image.tmdb.org/t/p/w500/${data3![index]['poster_path']}','${data3![index]['title']}',Width,Height)),
                        ],
                      );
                    }
                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(8.0,13.0,0.0,4.0),
                child: Text("Horror Movies", style:GoogleFonts.raleway(textStyle: const TextStyle(fontSize: 23, color: Color.fromARGB(255,188, 111, 241),),),),
              ),
              Container(
                height: Height*0.3,
                child:ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data4==null? 0 :data4?.length,
                    itemBuilder: (context,index){
                      return Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          GestureDetector(
                              onTap: (){
                                isLoading=true;
                                id = data4![index]['id'];
                                const MovieCard().setter(id);
                                Navigator.push(context,
                                    MaterialPageRoute(builder :(context) =>  const MovieCard(),)
                                );
                              },
                              child: MovieTile('http://image.tmdb.org/t/p/w500/${data4![index]['poster_path']}','${data4![index]['title']}',Width,Height)),
                        ],
                      );
                    }
                ),
              ),

            ],
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0.0, 20, 0, 0),
                child: CustomBar(Height, Width))),
        ],
      )


    );
  }
}
