
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/Screens/MoviePage.dart';
import 'package:movies/Widgets.dart';
import 'package:movies/apicall.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
int arg =0;
bool isLoading=true;

class MovieCard extends StatefulWidget {
  void setter(int x){
    arg=x;
  }
  const MovieCard({Key? key}) : super(key: key);

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {

  var ComplDat = new Map();

  // ignore: non_constant_identifier_names
  Future<String> FetchData() async{
   var Dat = await MovDetail(arg);
   print("fuck ");
   print(Dat);
       setState(() {
      ComplDat=Dat;
      isLoading = false;
      var UrL = ComplDat['trailer'];
      Control = YoutubePlayerController(
        flags: const YoutubePlayerFlags(autoPlay: false),
          initialVideoId: YoutubePlayer.convertUrlToId(UrL).toString());
    });
   print(ComplDat);
   return'success';

}

  @override
  void initState() {
    super.initState();
    FetchData();
    
  }

  @override
  void deactivate(){
    Control.pause();

    super.deactivate();
  }

  @override
  void dispose() {
    Control.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context,) {

    double Width = MediaQuery.of(context).size.width;
    double Height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,

      body:isLoading ? const Center(
        child: CircularProgressIndicator(),)
          :Stack(
        alignment: AlignmentDirectional.bottomStart,
          children:[
            //Backround Image
            Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    foregroundDecoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            ComplDat['poster']),
                        fit: BoxFit.cover
                      ),
                    ),
                  ),
                ),
                Expanded(flex:5, child: Container(color: Colors.black,))
              ],
            ),
            //Front view
            Container(
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
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50),) ,
              ),
            ),
            //ImageWithDetails
            Align(
              alignment: AlignmentDirectional.topStart,
                child: MovieView(Width, Height,ComplDat)),
            //SearchBar
            Align(
              alignment: AlignmentDirectional.topCenter,
              child: CustomBar(Height, Width),
            ),
            //Playbutton
          ],
      ),
    );
  }
}
