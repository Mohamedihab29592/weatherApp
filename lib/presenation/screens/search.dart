import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/network/endpoints.dart';
import 'package:weather_app/presenation/cubit/app_cubit.dart';
import 'package:weather_app/presenation/cubit/app_state.dart';
import 'package:weather_app/presenation/resources/app_colors.dart';
import 'package:weather_app/presenation/resources/app_strings.dart';

import '../../app/routes/app_routes.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppStrings.enterData;
                    } else {
                      return null;
                    }
                  },
                  onChanged: (String text) {
                    cubit.searchData(text);
                  },
                  keyboardType: TextInputType.text,
                  controller: cubit.searchController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.darkGrey)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.blue)),
                    hintText: AppStrings.search,
                    suffixIcon: IconButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            cubit.searchData(cubit.searchController.text);
                            cubit.searchData(cubit.searchController.text);
                          }
                        },
                        icon: const Icon(Icons.search)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                if (state is SearchLoading)
                  const LinearProgressIndicator(),
                const SizedBox(height: 200,),
                if(cubit.searchItems.isEmpty)
                  const Text(AppStrings.enterValidData,style: TextStyle(color: Colors.grey),)
                else
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) =>
                        _buildSearchItem(cubit.searchItems, index, cubit),
                    itemCount: cubit.searchItems.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchItem(model, int index, AppCubit cubit) {
    return Center(
      child: Column(
        children: [
          TextButton(
              onPressed: () {
                cubit.getOtherWeather();
                Navigator.pushNamed(context, Routes.initialRoute);
              },
              child: Text(model[index]['name'])),
        ],
      ),
    );
  }
}
