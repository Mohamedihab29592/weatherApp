import 'package:flutter/material.dart';

import '../../../../resources/app_strings.dart';
import '../../../../resources/values_manger.dart';

class DateTimeNowText extends StatelessWidget {
  const DateTimeNowText({
    Key? key,
    required this.isCollapsed,
  }) : super(key: key);

  final bool isCollapsed;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${AppStrings.dayNow}, ${AppStrings.hourNow}',
      style: !isCollapsed
          ? Theme.of(context).textTheme.titleSmall?.copyWith()
          : Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(fontSize: AppSize.s12 * AppSize.s1_2),
    );
  }
}
