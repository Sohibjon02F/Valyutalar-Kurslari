import 'package:dio/dio.dart';
import 'package:gt/Model/valyuta_model.dart';

class ValyutaService {
  Future getValyuta() async {
    try {
      Response response =
                await Dio().get( "https://cbu.uz/uz/arkhiv-kursov-valyut/json/",options: Options(headers: {'Content-Type': 'application/json','Authorizaton':'Baerer xnbczxhjkj673' }));

          //await Dio().get("https://cbu.uz/uz/arkhiv-kursov-valyut/json/");

      if (response.statusCode == 200) {
        // return [(UserModel.fromJson(response.data))];
        return (response.data as List).map((e) => ValyutaModel.fromJson(e)).toList();
      } else {
        return response.statusMessage.toString();
      }
    } on DioError catch (e) {
      return e.message.toString();
    }
  }
}
