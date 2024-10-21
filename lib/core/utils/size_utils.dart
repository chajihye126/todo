import 'package:flutter/cupertino.dart';

double ssW(BuildContext context) => MediaQuery.sizeOf(context).width;
double ssH(BuildContext context) => MediaQuery.sizeOf(context).height;

extension IntSizedBox on int? {
  int validate({int value = 0}) {
    return this ?? value;
  }

  Widget get sbH => SizedBox(height: this?.toDouble());
  Widget get sbW => SizedBox(width: this?.toDouble());
}