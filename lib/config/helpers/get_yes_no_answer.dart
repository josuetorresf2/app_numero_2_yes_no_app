import 'package:app_de_mensaje_joshue/domain/entities/message.dart';
import 'package:app_de_mensaje_joshue/infrastructure/models/yes_no_model.dart';
import 'package:dio/dio.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');

    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    //the .data are the information we get from the api json
    //Mappers
    return Message(
        text: yesNoModel.answer,
        fromWho: FromWho.thems,
        imageUrl: yesNoModel.image);
  }
}
