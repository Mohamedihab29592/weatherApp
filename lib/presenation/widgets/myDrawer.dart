import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/presenation/cubit/app_cubit.dart';
import 'package:weather_app/presenation/resources/app_colors.dart';
import 'package:weather_app/presenation/resources/app_strings.dart';
import 'package:weather_app/presenation/resources/values_manger.dart';

import '../../app/routes/app_routes.dart';
import '../resources/assets_manager.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return Column(
      children: [
        const SizedBox(
          height: AppSize.s40,
        ),
        Expanded(
          child: Drawer(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(AppPadding.p20),
                  bottomRight: Radius.circular(AppPadding.p20)),
            ),
            backgroundColor:  AppColors.backGroundDrawer,
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.settings,
                            color: AppColors.white,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: AppSize.s20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width:  AppSize.s20,
                      ),
                      const Text(AppStrings.favLocations,
                          style: TextStyle(color: AppColors.white,fontSize: AppSize.s15)),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.report_gmailerrorred_outlined,
                            color: AppColors.white,
                          ))
                    ],
                  ),
                  Padding(
                    padding:
                         const EdgeInsets.only(left: AppPadding.p25, top: AppPadding.p20, bottom: AppPadding.p20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: AppColors.white,
                          size: AppSize.s12,
                        ),
                        const SizedBox(
                          width: AppSize.s4,
                        ),
                        TextButton(
                            onPressed: () {
                              cubit.getCurrentWeather();
                            },
                            child: Text(
                              "${cubit.favWeatherModel!.locationModel!.name}",
                              style: const TextStyle(
                                  color: AppColors.white,
                                  fontSize: AppSize.s14,
                                  fontWeight: FontWeight.bold),
                            )),
                        const Spacer(),
                        Lottie.asset(JsonAssets.sunLJson, height: AppSize.s20),
                        Text(
                          "${cubit.favWeatherModel!.currentWeather!.tempC}${AppStrings.symbolDegree}",
                          style: const TextStyle(
                              fontSize: AppSize.s12, color: AppColors.white),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    height: AppSize.s4,
                    color: AppColors.white,
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.location_on_outlined,
                        color: AppColors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.all(AppPadding.p20),
                        child: Text(
                          AppStrings.otherLocations,
                          style: TextStyle(
                              color:AppColors.white,
                              fontSize: AppSize.s15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  if (cubit.otherItems.isEmpty)
                    Container()
                  else
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) => Row(
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(left: AppSize.s40),
                                child: TextButton(
                                  onPressed: () {
                                    cubit.getWeather(
                                        "${cubit.otherItems[index].locationModel!.name}"
                                    );
                                  },
                                  child: Text(
                                    "${cubit.otherItems[index].locationModel!.name}",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: AppSize.s15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                            const Spacer(),
                            Lottie.asset(JsonAssets.sunLJson, height: AppSize.s20),
                            Text(
                              "${cubit.otherItems[index].currentWeather!.tempC}${AppStrings.symbolDegree}",
                              style: const TextStyle(
                                  fontSize: AppSize.s14, color: AppColors.white),
                            ),
                          ],
                        ),
                        itemCount: cubit.otherItems.length,
                      ),
                    ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(AppSize.s10),
                      child: Column(
                        children: [
                          Container(
                            height: AppSize.s45,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AppSize.s40),
                              color:  AppColors.groundDrawer,
                            ),
                            child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, Routes.searchRoute);
                                  cubit.searchItems = [];
                                  cubit.searchController.clear();
                                },
                                child: const Text(
                                  AppStrings.manageLocation,
                                  style: TextStyle(color: AppColors.white),
                                )),
                          ),
                          const SizedBox(
                            height: AppSize.s10,
                          ),

                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Divider(
                          height: AppSize.s4,
                          color: AppColors.white,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.report_gmailerrorred_outlined,
                              color: AppColors.white,
                            ),
                            const SizedBox(
                              width: AppSize.s30,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                AppStrings.reportLocation,
                                style: TextStyle(color: AppColors.white),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: AppSize.s20,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.headset_mic_rounded,
                              color: AppColors.white,
                            ),
                            const SizedBox(
                              width: AppSize.s30,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                AppStrings.contactUs,
                                style: TextStyle(color: AppColors.white),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
