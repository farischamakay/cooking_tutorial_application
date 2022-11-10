import 'package:dio/dio.dart';
import '../api/api_key.dart';
import '../screens/models/food_type.dart';
import 'recipe_data.dart';
import '../screens/models/failure.dart';

class GetHomeRecipes {
  var key = ApiKey.keys;

  final dio = Dio();

  Future<FoodTypeList> getRecipes(String type, int no) async {
    var RANDOM_RECIPE_PATH = '/random?number=$no&tags=$type';
    var url = '$BASE_URL$RANDOM_RECIPE_PATH&apiKey=$key';
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
