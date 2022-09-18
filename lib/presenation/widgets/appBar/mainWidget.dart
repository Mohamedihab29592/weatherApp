import 'package:flutter/cupertino.dart';

import '../../resources/values_manger.dart';
import 'widgets/bodyWidget.dart';
import 'widgets/currentTemperatureWidget.dart';
import 'widgets/text/locationText.dart';

class MainWidget extends StatefulWidget {
  final bool isLight;
  final bool isCollapsed;
  const MainWidget({Key? key, required this.isLight, required this. isCollapsed}) : super(key: key);

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.isCollapsed ? const Spacer(flex: AppPadding.p2) :  const Spacer(flex:AppPadding.p7),
        CurrentTemperatureWidget(isLight: widget.isLight, isCollapsed: widget.isCollapsed,),
        widget.isCollapsed ? Container() : LocationText(isCollapsed: widget.isCollapsed),
        widget.isCollapsed ? Container() : const Spacer(flex:  AppPadding.p2),
        widget.isCollapsed ? Container() : BodyWidget(isCollapsed: widget.isCollapsed),
        widget.isCollapsed ? const Spacer() : const Spacer(flex:  AppPadding.p3),

      ],
    ));
  }
}
