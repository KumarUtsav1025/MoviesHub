
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/Screens/MovieDetail.dart';
import 'package:movies/Widgets.dart';
import 'package:movies/apicall.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

String value="Search";
YoutubePlayerController Control = YoutubePlayerController(
          initialVideoId: YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=L5iSp4VDaEY")!);

Widget MovieView(double Width, double Height, var ComplDat) {
  return Padding(
    padding: EdgeInsets.fromLTRB(Width*0.025, Height*0.185, Width*0.025, 0.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
                  height: Height*0.28,
                  foregroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: const [BoxShadow(
                      color: Color.fromARGB(255,0,0,0),
                      offset: Offset(
                        0.0,
                        0.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 4.0,
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ),
                  ],
                  image: DecorationImage(image: NetworkImage(ComplDat['poster'],), fit: BoxFit.cover,),
                ),
              ),
            ),
            const SizedBox(width: 4.0,),
            Expanded(
                flex: 7,
                child: DescripMov(Width,Height,ComplDat),
            ),
          ],
        ),
        Container(
          height: Height*0.534,
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0.0,10,0.0,5.0),
                child: Text("Description: ", style:GoogleFonts.raleway(textStyle: const TextStyle(fontSize: 26, color: Color.fromARGB(255,188, 111, 241),),),),
              ),
              Padding(padding: const EdgeInsets.fromLTRB(0.0, 0, 0.0, 15.0),
                child: AutoSizeText(ComplDat['description'],
                  maxLines: 6,
                  style: GoogleFonts.barlow(textStyle: const TextStyle(color: Color.fromARGB(255, 188, 111, 241,),fontSize: 16.0, fontWeight: FontWeight.normal)) ,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0,10,0.0,5.0),
                child: Text("Trailer: ", style:GoogleFonts.raleway(textStyle: const TextStyle(fontSize: 26, color: Color.fromARGB(255,188, 111, 241),),),),
              ),
              YoutubePlayerBuilder(player: YoutubePlayer(
                controller: Control,
                ),
                builder: (context,player)=>Center(
                child: player,
              ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0,10,0.0,8.0),
                child: Text("Similar Movies", style:GoogleFonts.raleway(textStyle: const TextStyle(fontSize: 26, color: Color.fromARGB(255,188, 111, 241),),),),
              ),
              //Similar Movies
              Container(
                height: Height*0.3,
                child:ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: SimData==null? 0 :SimData?.length,
                    itemBuilder: (context,index){
                      return Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          GestureDetector(
                              onTap: (){
                                isLoading=true;
                                var id = SimData![index]['id'];
                                const MovieCard().setter(id);
                                Navigator.push(context,
                                    MaterialPageRoute(builder :(context) =>  const MovieCard(),)
                                );
                              },
                              child: MovieTile('http://image.tmdb.org/t/p/w500/${SimData![index]['poster_path']}','${SimData![index]['title']}',Width,Height)),
                        ],
                      );
                    }
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
