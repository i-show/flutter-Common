import 'package:flutter/material.dart';



extension WidgetExt<T> on Widget {
  Padding intoPadding({
    Key key,
    EdgeInsetsGeometry padding,
  }) {
    return Padding(
      key: key,
      padding: padding,
      child: this,
    );
  }

  Center intoCenter({
    Key key,
    double widthFactor,
    double heightFactor,
  }) {
    return Center(
      key: key,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      child: this,
    );
  }

  Container intoContainer({
    Key key,
    AlignmentGeometry alignment,
    EdgeInsetsGeometry padding,
    Color color,
    Decoration decoration,
    Decoration foregroundDecoration,
    double width,
    double height,
    BoxConstraints constraints,
    EdgeInsetsGeometry margin,
    Matrix4 transform,
  }) {
    return Container(
      key: key,
      alignment: alignment,
      padding: padding,
      color: color,
      decoration: decoration,
      foregroundDecoration: foregroundDecoration,
      width: width,
      height: height,
      constraints: constraints,
      margin: margin,
      transform: transform,
      child: this,
    );
  }
}
