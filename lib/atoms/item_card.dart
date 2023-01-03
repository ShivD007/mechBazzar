import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mechBazzar/core/custom_spacers.dart';
import 'package:mechBazzar/core/text_extension.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({Key? key, this.isHome = false}) : super(key: key);

  final bool isHome;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260.h,
      width: (MediaQuery.of(context).size.width - 32).w,
      child: Material(
        borderRadius: BorderRadius.circular(8),
        color: isHome ? null : Colors.transparent,
        child: Container(
          height: 260.h,
          width: (MediaQuery.of(context).size.width - 32).w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomSpacers.height8,
              Flexible(
                child: Material(
                  borderRadius: BorderRadius.circular(8),
                  elevation: 0,
                  child: Container(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Image.network(
                        "https://cdn.pixabay.com/photo/2016/11/19/09/44/antique-1838324__340.jpg",
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
              ),
              CustomSpacers.height8,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: "abc dallklkfadfa".body16(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("\$ 300 "),
              )
            ],
          ),
        ),
      ),
    );
  }
}
