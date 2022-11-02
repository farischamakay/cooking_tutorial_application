import 'package:dio/dio.dart';
import '../api/api_key.dart';
import '../screens/models/food_type.dart';
import 'recipe_info.dart';
import '../screens/models/failure.dart';

class GetHomeRecipes {
  var key = ApiKey.keys;
  // ignore: non_constant_identifier_names

  final dio = Dio();

  Future<FoodTypeList> getRecipes(String type, int no) async {
    var url = BASE_URL + "/random?number=$no&tags=$type" + '&apiKey=' + key;
    final response = await dio.get(url);

    if (response.statusCode == 200) {
      return FoodTypeList.fromJson(response.data['recipes']);
    } else if (response.statusCode == 401) {
      throw Failure(code: 401, message: response.data['message']);
    } else {
      print(response.statusCode);
      throw Failure(
          code: response.statusCode!, message: response.statusMessage!);
    }
  }
}
