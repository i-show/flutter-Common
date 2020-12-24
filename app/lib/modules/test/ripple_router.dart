import 'dart:math';

import 'package:flutter/material.dart';

class RouteConfig {
  Offset offset;
  double circleRadius;
  double width;
  double height;

  RouteConfig.fromContext(BuildContext context) {
    final RenderBox renderBox = context.findRenderObject();
    offset = renderBox.localToGlobal(renderBox.size.center(Offset.zero));
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    if (offset.dx > width / 2) {
      if (offset.dy > height / 2) {
        circleRadius = _calcRadius(offset.dx, offset.dy);
      } else {
        circleRadius = _calcRadius(offset.dx, height - offset.dy);
      }
    } else {
      if (offset.dy > height / 2) {
        circleRadius = _calcRadius(width - offset.dx, offset.dy);
      } else {
        circleRadius = _calcRadius(width - offset.dx, height - offset.dy);
      }
    }
  }

  /// 计算展示圆形的半径
  /// 根据勾股定理 z = √(x² + y²）
  double _calcRadius(double x, double y) {
    return sqrt(pow(x, 2) + pow(y, 2));
  }
}

// double circleRadius
class RippleRoute extends PageRouteBuilder {
  final Widget widget;
  final RouteConfig config;

  RippleRoute(this.widget, this.config)
      : super(
            opaque: false,
            // 设置过度时间
            transitionDuration: Duration(milliseconds: 300),
            // 构造器
            pageBuilder: (_, __, ___) => widget,
            transitionsBuilder: (_, animation, __, child) =>
                RippleContainer(child, config, animation.value));
}

class RippleContainer extends StatelessWidget {
  final Widget child;
  final RouteConfig config;

  /// 动画完成了多少
  final double aniValue;

  RippleContainer(this.child, this.config, this.aniValue);

  @override
  Widget build(BuildContext context) {
    var currentRadius = config.circleRadius * aniValue;
    var boxSize = config.circleRadius * 2 * aniValue;
    return _buildContainer(currentRadius, boxSize);
  }

  Widget _buildContainer(double currentRadius, double boxSize) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Positioned(
          top: config.offset.dy - currentRadius,
          left: config.offset.dx - currentRadius,
          child: SizedBox(
            height: boxSize,
            width: boxSize,
            child: ClipOval(
              child:  _resetBoxChildPosition(currentRadius)
            ),
          ),
        ),
      ],
    );
  }

  /// 重新设置剪切圆形后面的界面
  Widget _resetBoxChildPosition(double currentRadius) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: currentRadius - config.offset.dy,
          left: currentRadius - config.offset.dx,
          child: Container(
            width: config.width,
            height: config.height,
            child: child,
          ),
        )
      ],
    );
  }

  Widget ok(double currentRadius) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Positioned(
          top: config.offset.dy - currentRadius,
          left: config.offset.dx - currentRadius,
          child: SizedBox(
            height: config.circleRadius * 2 * aniValue,
            width: config.circleRadius * 2 * aniValue,
            child: ClipOval(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: currentRadius - config.offset.dy,
                    left: currentRadius - config.offset.dx,
                    child: Container(
                      width: config.width,
                      height: config.height,
                      child: child,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
