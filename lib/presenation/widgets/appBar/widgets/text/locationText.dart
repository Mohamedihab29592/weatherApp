import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../cubit/app_cubit.dart';
import '../../../../resources/app_colors.dart';
import '../../../../resources/values_manger.dart';

class LocationText extends StatefulWidget {
  final bool isCollapsed;

  const LocationText({Key? key, required this.isCollapsed}) : super(key: key);

  @override
  State<LocationText> createState() => _LocationTextState();
}

class _LocationTextState extends State<LocationText> {
  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);

    return  Row(
      children:   [
        Text(
          '${cubit.currentWeatherModel!.locationModel!.name}',
          style: !widget.isCollapsed
              ? const TextStyle(color: AppColors.white)
              : Theme.of(context).textTheme.titleMedium,
        ),
         Icon(
          Icons.location_on,
          color: !widget.isCollapsed ? AppColors.white : Theme.of(context).iconTheme.color,
          size: !widget.isCollapsed ? null : AppSize.s18,
        )
      ],
    );
  }
}
