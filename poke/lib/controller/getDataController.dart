import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:poke/models/getDataModel.dart';
class GetDataController extends GetxController{
  var isLoading = false.obs;
  var getDataModel = GetDataModel(results:[]).obs;
  
  getDataFromApi() async{
    isLoading.value=true;
    try{
      var response = await Dio().get('http://192.168.1.31:90/ApiRestpokemon/controller/pokemon.php?op=listar');
      final datax=json.decode(response.data);
      getDataModel.value = GetDataModel.fromJson(datax);
      isLoading.value=false;
    }
    catch(e){
      print(e);
    }
    // finally{
    //   isLoading.value=false;
    // }
  }
}