import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final heroTag;
  final Wpoknom;
  final Wpoktipe;
  final Wpoknum;
  final Wpokimg;
  final Wpokpes;
  final Wpokalt;


  const DetailsScreen({super.key,this.heroTag, this.Wpoknom, this.Wpoktipe , this.Wpoknum , this.Wpokimg , this.Wpokpes , this.Wpokalt});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  
  @override
  Widget build(BuildContext context) {
    
  var height=MediaQuery.of(context).size.height;
  var width=MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: 
      widget.Wpoktipe=="Grass" ? Colors.greenAccent
        : widget.Wpoktipe=="Fire" ?const Color.fromARGB(255, 255, 0, 0)
        : widget.Wpoktipe=="Water" ?const Color.fromARGB(255, 68, 224, 255)
        : widget.Wpoktipe=="Bug" ?const Color.fromARGB(255, 104, 248, 78)
        : widget.Wpoktipe=="Poison" ?Colors.purpleAccent
        : widget.Wpoktipe=="Electric" ? const Color.fromARGB(236, 240, 248, 22)
        : widget.Wpoktipe=="Ground" ?Colors.brown
        : widget.Wpoktipe=="Fighting" ?Colors.orange
        : widget.Wpoktipe=="Psychic" ?Colors.pinkAccent
        : widget.Wpoktipe=="Dragon" ?Colors.blueGrey
        : widget.Wpoktipe=="Rock" ?Colors.grey
        : widget.Wpoktipe=="Ice" ?Colors.lightBlue
        : Colors.black,
      body: Stack(
        alignment: Alignment.center ,
        children: [
          _ArrowBack(),
          _NamePok(),
          _Tipepok(),
          _PokeballBack(),
          

          Positioned(
            bottom: 0,
            child: Container(
              width: width,
              height: height*0.6,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                  )
                ),
                child: Padding(padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,

                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Container(
                              width: width*0.3,
                              child: Text(
                                "Altura:",
                                style:TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                widget.Wpokalt.toString(),
                                style:TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                       Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Container(
                              width: width*0.3,
                              child: Text(
                                "Peso:",
                                style:TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                widget.Wpokpes.toString(),
                                style:TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
           Positioned(
                  top: (height*0.2),
                  left: (width/2)-100,
                  child: Hero(
                  tag: widget.heroTag,
                  child: CachedNetworkImage(
                  imageUrl: widget.Wpokimg.toString(),
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              )
            )
          ],
        )
    );
  }

  Widget _ArrowBack(){
    return Positioned(
      top: 50,
      left: 5,
      child: IconButton(
        icon: Icon(
          Icons.arrow_back, //esta madre la puedo cambiar por una de ios
          size: 35,
          color: Colors.white,
          ), 
        onPressed: (){
          Navigator.pop(context);
        },
        )
      );
  }
  
  Widget _NamePok(){
    return Positioned(
      top: 100,
      left: 20,
      right: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.Wpoknom.toString(),
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text("#"+widget.Wpoknum.toString(),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          
        ],
      ),
    );
  }

  Widget _Tipepok(){
    return Positioned(
      top: 150,
      left: 25,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0), 
          child: Text(
            widget.Wpoktipe.toString(),
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            )
          ),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
        )
      ),
    );
  }

  Widget _PokeballBack(){
    var height=MediaQuery.of(context).size.height;
    return Positioned(
      top: height*0.18,
      right: -30,
      child: Image.asset(
        'images/pokeball.png',
        height: 200,
        fit: BoxFit.fitHeight,
      ),
    );
  }

//   Widget _ImgPok(heroTag){
//     var height=MediaQuery.of(context).size.height;
//     var width=MediaQuery.of(context).size.width;
//     return Positioned(
      
//       top: (height*0.2),
//       left: (width/2)-100,
//       child: Hero(
//         tag: width.heroTag,
//         child: CachedNetworkImage(
//           imageUrl: 'http://www.serebii.net/pokemongo/pokemon/004.png',
//           height: 200,
//           width: 200,
//           fit: BoxFit.cover,
//         ),
//       )
//     );
//   }
}