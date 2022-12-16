import 'package:flutter/material.dart';

class ListCategoryWidget extends StatefulWidget {
  final String urlImageCategory;
  final String titleCategory;
  final bool isSelected;

  const ListCategoryWidget(
      {Key? key,
      required this.urlImageCategory,
      required this.titleCategory,
      required this.isSelected})
      : super(key: key);

  @override
  State<ListCategoryWidget> createState() => _ListCategoryWidgetState();
}

class _ListCategoryWidgetState extends State<ListCategoryWidget>
// with SingleTickerProviderStateMixin
{
  // late AnimationController controller;
  // late Animation<double> scaleAnimation;

  // @override
  // void initState() {
  //   super.initState();

  //   controller = AnimationController(
  //     value: widget.isSelected ? 1 : 0,
  //     duration: kThemeChangeDuration,
  //     vsync: this,
  //   );

  //   scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(CurvedAnimation(
  //     parent: controller,
  //     curve: Curves.ease,
  //   ));
  // }

  // @override
  // void didUpdateWidget(ListCategoryWidget oldWidget) {
  //   super.didUpdateWidget(oldWidget);

  //   if (oldWidget.isSelected != widget.isSelected) {
  //     if (widget.isSelected) {
  //       controller.forward();
  //     } else {
  //       controller.reverse();
  //     }
  //   }
  // }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.isSelected ? 60 : 30),
        // animation: scaleAnimation,
        // builder: (context, child) {
        //   return Transform.scale(
        //       scale: scaleAnimation.value,
        //       child: ClipRRect(
        //         borderRadius: BorderRadius.circular(widget.isSelected ? 80 : 20),
        //         child: child,
        //       ));
        // },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            // border: Border.all(
            //   width: 0.5,
            //   color: Colors.grey,
            // ),
            //borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          padding: const EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 300,
                  width: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.urlImageCategory),
                          fit: BoxFit.cover)),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                widget.titleCategory,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
