import 'package:chat_app/domain/entities/message.dart';
import 'package:chat_app/models/yes_no_models.dart';
import 'package:dio/dio.dart';

class GetApiAnswe{
  final _dio =Dio();
  
  Future <Message> getAnswer() async {

    final response = await _dio.get("https://yesno.wtf/api");

    final  yesNoModel = YesNoModel.fromJsonMap(response.data);
    return yesNoModel.toMessageEntity();
  }
}