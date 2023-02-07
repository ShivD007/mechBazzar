import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PaginationWidget extends StatefulWidget {
  final Widget paginatedWidget;
  final Function onDataFect;
  final Function? onRefresh;
  final int lastItemLength;
  final int pageLimit;

  const PaginationWidget(
      {Key? key,
      required this.onDataFect,
      required this.paginatedWidget,
      required this.pageLimit,
      required this.lastItemLength,
      this.onRefresh})
      : super(key: key);

  @override
  _PaginationWidgetState createState() => _PaginationWidgetState();
}

class _PaginationWidgetState extends State<PaginationWidget> {
  int scrollProgress = 0;

  @override
  Widget build(BuildContext context) =>
      NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          AxisDirection direction = notification.metrics.axisDirection;
          if (direction == AxisDirection.left ||
              direction == AxisDirection.right) {
            return true;
          }
          int progress = 0;
          if (notification.metrics.pixels != 0 &&
              notification.metrics.maxScrollExtent != 0) {
            progress = ((notification.metrics.pixels /
                        notification.metrics.maxScrollExtent) *
                    100)
                .toInt();
          }
          
          if (progress != scrollProgress) {
            scrollProgress = progress;
            if (scrollProgress == 100 &&
                widget.lastItemLength == widget.pageLimit) {
              widget.onDataFect();
            }
          }
          return true;
        },
        child: RefreshIndicator(
            onRefresh: () async {
              if (widget.onRefresh != null) {
                widget.onRefresh!();
              }
            },
            child: widget.paginatedWidget),
      );
}
