import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:poke/controller/getDataController.dart';
import 'package:poke/pages/DetailsScreen.dart';
class HomeScreen extends StatefulWidget{
  const HomeScreen ({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  final getDataController=Get.put(GetDataController());
  
  @override
  void initState(){
    getDataController.getDataFromApi();
    super.initState();
    
  }

  @override
  Widget build(BuildContext context){
    var size=MediaQuery.of(context).size.width;

    return Obx(()=>
      Scaffold(
        backgroundColor: Colors.white,
          body: !getDataController.isLoading.value ? Stack(
            children: [
              _ImagenFondo(),
              _TxtTitulo(),
              Positioned(
                top: 150,
                bottom: 0,
                width: size,
                child: Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1.5),
                      itemCount: 151,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context,index){
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 5,
                          ),
                          child: InkWell(
                            child: SafeArea(
                              child: Container(
                                  decoration: BoxDecoration(
                                  color:
                                  getDataController.getDataModel.value.results[index].pokTipo=="Grass" ? Colors.greenAccent
                                          : getDataController.getDataModel.value.results[index].pokTipo=="Fire" ?const Color.fromARGB(255, 255, 0, 0)
                                          : getDataController.getDataModel.value.results[index].pokTipo=="Water" ?const Color.fromARGB(255, 68, 224, 255)
                                          : getDataController.getDataModel.value.results[index].pokTipo=="Bug" ?const Color.fromARGB(255, 104, 248, 78)
                                          : getDataController.getDataModel.value.results[index].pokTipo=="Poison" ?Colors.purpleAccent
                                          : getDataController.getDataModel.value.results[index].pokTipo=="Electric" ? const Color.fromARGB(236, 240, 248, 22)
                                          : getDataController.getDataModel.value.results[index].pokTipo=="Ground" ?Colors.brown
                                          : getDataController.getDataModel.value.results[index].pokTipo=="Fighting" ?Colors.orange
                                          : getDataController.getDataModel.value.results[index].pokTipo=="Psychic" ?Colors.pinkAccent
                                          : getDataController.getDataModel.value.results[index].pokTipo=="Dragon" ?Colors.blueGrey
                                          : getDataController.getDataModel.value.results[index].pokTipo=="Rock" ?Colors.grey
                                          : getDataController.getDataModel.value.results[index].pokTipo=="Ice" ?Colors.lightBlue
                                          : Colors.black,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Stack(
                                  children: [
                                      _PokeballInter(),
                                      _Imgpokeball(index),
                                      _Namepokemon(index),
                                      _Typepokemon(index),
                                  ],
                                ),
                              )
                            ),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(
                                builder: (_)=>DetailsScreen(
                                  heroTag: index,
                                  Wpoknom: getDataController.getDataModel.value.results[index].pokNom,
                                  Wpoktipe: getDataController.getDataModel.value.results[index].pokTipo,
                                  Wpoknum: getDataController.getDataModel.value.results[index].pokNum,
                                  Wpokimg: getDataController.getDataModel.value.results[index].pokImg,
                                  Wpokpes: getDataController.getDataModel.value.results[index].pokPeso,
                                  Wpokalt: getDataController.getDataModel.value.results[index].pokAltura,
                                  )
                                )
                              );
                            },
                          ),
                        );
                      }
                    )
                  )
              ],)
              )
            ],
          ):Center(child: CircularProgressIndicator()
        ),
      ),
    );
  }

  Widget _ImagenFondo(){
    return Positioned(
      top: -50,
      right: -50,
      child: Image.asset('images/pokeball.png',
      fit: BoxFit.fitWidth,
      width: 200,
      ),
    );
  }
  
  Widget _TxtTitulo(){
    return Positioned(
      top: 100,
      left: 20,
      child: Text("Pokedex",
      style: TextStyle(
        color: Colors.black.withOpacity(0.7),
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
      ),
    );
  }

  Widget _PokeballInter(){
  return Positioned(
    bottom: -10,
    right: -10, 
    child: Image.asset('images/pokeball.png',
    width: 100,
    fit: BoxFit.fitHeight,)
    );
}

  Widget _Imgpokeball(index){
  return Positioned(
      bottom: 5,
      right: 5,
        child: Hero(
            tag: index,
            child: CachedNetworkImage(
            imageUrl: getDataController.getDataModel.value.results[index].pokImg,
            height: 80,
            fit: BoxFit.fitHeight,
            placeholder: (context,url)=>Center(
            child: CircularProgressIndicator(),
          )
        ),
      )
  );
}

  Widget _Namepokemon(index){
    return Positioned(
      top: 20,
      left: 15,
      child:Text(
        getDataController.getDataModel.value.results[index].pokNom, 
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.white.withOpacity(0.7),
          ) ,
        ),
    );
  }

  Widget _Typepokemon(index){
    return Positioned(
      top: 50,
      left: 15,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 5,
            bottom: 5,
          ), 
          child: Text(
              getDataController.getDataModel.value.results[index].pokTipo,
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                
              ),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.redAccent.withOpacity(0.7),
          
        ),
      )
    );
  }
}

