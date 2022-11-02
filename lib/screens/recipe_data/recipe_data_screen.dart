import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './bloc/recipe_data_bloc.dart';
import '../recipe_random/widgets/recipe_success_widget.dart';

class RecipeInfo extends StatefulWidget {
  final String id;
  const RecipeInfo({Key? key, required this.id}) : super(key: key);

  @override
  State<RecipeInfo> createState() => _RecipeInfoState();
}

class _RecipeInfoState extends State<RecipeInfo> {
  late final RecipeDataBloc bloc;
  @override
  void initState() {
    bloc = BlocProvider.of<RecipeDataBloc>(context);
    bloc.add(LoadRecipeInfo(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<RecipeDataBloc, RecipeDataState>(
          builder: (context, state) {
            if (state is RecipeDataLoadState) {
              return const Center(child: LoadingWidget());
            } else if (state is RecipeDataSuccesState) {
              return RacipeInfoWidget(
                equipment: state.equipment,
                info: state.recipe,
                similarlist: state.similar,
              );
            } else if (state is RecipeDataErrorState) {
              return Center(
                child: Container(
                  child: Text("Error"),
                ),
              );
            } else {
              return Center(
                child: Container(
                  child: Text("Noting happingng"),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 30,
      height: 30,
      child: CircularProgressIndicator(
        color: Colors.redAccent,
        strokeWidth: 1.5,
        backgroundColor: Colors.grey,
      ),
    );
  }
}
