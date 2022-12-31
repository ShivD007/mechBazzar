import 'package:admin_jandhara/core/custom_spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliverHorizontalList extends StatelessWidget {
  const SliverHorizontalList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      sliver: SliverToBoxAdapter(
        child: SizedBox(
          height: 250.h,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return SizedBox(
                  height: 250.h,
                  width: 400.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Image.network(
                            "https://cdn.pixabay.com/photo/2016/11/19/09/44/antique-1838324__340.jpg",
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      Text("data")
                    ],
                  ));
            },
            itemCount: 5,
            separatorBuilder: (BuildContext context, int index) => CustomSpacers.width10,
          ),
        ),
      ),
    );
  }
}
