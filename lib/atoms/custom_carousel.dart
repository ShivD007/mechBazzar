import 'dart:async';
import 'dart:math';
import 'package:admin_jandhara/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomCarousel extends StatefulWidget {
  final List<Widget> widgetList; //only this field is mandatory
  final Duration? duration;
  final Curve? curve;
  final Axis? scrollDirection;
  final bool? showBottomIndicator;
  final bool? autoPlay;
  final int? autoPlayTime;
  final double? disabledIndicatorRadius;
  final double? enabledIndicatorRadius;
  final Color? indicatorColor;
  final Color? disabledIndicatorColor;
  final int? maxIndicator;
  final double? spacebetweenIndicators;
  final double? pageViewFraction;
  final double? spaceBeforeIndicator;
  final double? height;

  const CustomCarousel(
      {Key? key,
      required this.widgetList,
      this.duration,
      this.autoPlay = false,
      this.autoPlayTime = 10,
      required this.height,
      this.curve,
      this.showBottomIndicator = true,
      this.scrollDirection = Axis.horizontal,
      this.disabledIndicatorRadius,
      this.enabledIndicatorRadius,
      this.indicatorColor = AppColors.COLOR_GREEN,
      this.disabledIndicatorColor = AppColors.COLOR_GREY_400,
      this.maxIndicator = 7,
      this.spacebetweenIndicators,
      this.pageViewFraction = 1.0,
      this.spaceBeforeIndicator})
      : super(key: key);

  @override
  State<CustomCarousel> createState() => _CarouselState();
}

class _CarouselState extends State<CustomCarousel> {
  late PageController _pageController;

  ValueNotifier<int> currentIndex = ValueNotifier(0);

  Timer? _timer;
  // this stream is to cancel future once another future get initiated in reinitiateTimer function
  StreamSubscription<void>? dataSub;

  @override
  void initState() {
    _pageController = PageController(
        initialPage: 0, viewportFraction: widget.pageViewFraction!);
    if (widget.autoPlay!) {
      _periodicTimer();
    }
    super.initState();
  }

  void _periodicTimer() {
    _timer = Timer.periodic(Duration(seconds: widget.autoPlayTime!), (timer) {
      final int _remainder =
          currentIndex.value + 1 % (widget.widgetList.length);

      _pageController.animateToPage(
          //_remainder == widget.widgetList.length - 1 ? 0 : _remainder + 1,
          _remainder % widget.widgetList.length,
          duration: widget.duration ?? const Duration(milliseconds: 300),
          curve: widget.curve ?? Curves.linear);
    });
  }

  void clearTimer() {
    if (_timer != null) {
      _timer?.cancel();
      _timer = null;
    }
  }

  Future<void> _reinitiateTimer() async {
    clearTimer();
    dataSub?.cancel();
    dataSub = Future.delayed(Duration(seconds: widget.autoPlayTime!))
        .asStream()
        .listen((data) {
      _timer = Timer.periodic(Duration(seconds: widget.autoPlayTime!), (timer) {
        final int _remainder =
            currentIndex.value + 1 % (widget.widgetList.length);

        _pageController.animateToPage(_remainder % widget.widgetList.length,
            duration: widget.duration ?? const Duration(milliseconds: 300),
            curve: widget.curve ?? Curves.linear);
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    dataSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      // mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: widget.height,
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll) {
              overscroll.disallowGlow();
              return false;
            },
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.widgetList.length,
              controller: _pageController,
              onPageChanged: (int currentPage) {
                currentIndex.value = currentPage;
              },
              itemBuilder: (context, index) {
                return Listener(
                    onPointerDown: (details) =>
                        widget.autoPlay! ? _reinitiateTimer() : () {},
                    child: widget.widgetList[index]);
              },
            ),
          ),
        ),
        if (widget.showBottomIndicator!) ...[
          SizedBox(
            height: widget.spaceBeforeIndicator ?? 10.0,
          ),
          SizedBox(
            height: widget.enabledIndicatorRadius != null &&
                    widget.disabledIndicatorRadius != null
                ? max(widget.enabledIndicatorRadius!,
                    widget.disabledIndicatorRadius!)
                : 11,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: min(widget.maxIndicator!, widget.widgetList.length),
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ValueListenableBuilder(
                    valueListenable: currentIndex,
                    builder: (BuildContext context, int currentIndex, _) {
                      bool _isSelected = index == currentIndex ||
                          widget.widgetList.length > widget.maxIndicator! &&
                              currentIndex >= widget.maxIndicator! - 1 &&
                              index >= widget.maxIndicator! - 1;
                      return Container(
                        height: _isSelected
                            ? widget.enabledIndicatorRadius ?? 11
                            : widget.disabledIndicatorRadius ?? 10,
                        width: _isSelected
                            ? widget.enabledIndicatorRadius ?? 11
                            : widget.disabledIndicatorRadius ?? 10,
                        decoration: BoxDecoration(
                            color: _isSelected
                                ? widget.indicatorColor
                                : widget.disabledIndicatorColor,
                            shape: BoxShape.circle),
                      );
                    });
              },
              separatorBuilder: (BuildContext context, int index) => SizedBox(
                width: widget.spacebetweenIndicators ?? 4,
              ),
            ),
          )
        ]
      ],
    );
  }
}
