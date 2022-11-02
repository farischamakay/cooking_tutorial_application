part of 'recipe_data_bloc.dart';

@immutable
abstract class RecipeDataEvent {}

class LoadRecipeInfo extends RecipeDataEvent {
  final String id;

  LoadRecipeInfo(this.id);
}
