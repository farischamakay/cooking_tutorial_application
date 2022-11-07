part of 'recipe_data_bloc.dart';

@immutable
abstract class RecipeDataState {}

class RecipeDataInitial extends RecipeDataState {}

class RecipeDataLoadState extends RecipeDataState {}

class RecipeDataSuccesState extends RecipeDataState {
  final Recipe recipe;
  final List<Similar> similar;
  final List<Equipment> equipment;
  // final Nutrient nutrient;

  RecipeDataSuccesState({
    required this.recipe,
    required this.similar,
    required this.equipment,
    // required this.nutrient,
  });
}

class RecipeDataErrorState extends RecipeDataState {}

class FailureState extends RecipeDataState {
  final Failure error;

  FailureState({required this.error});
}
