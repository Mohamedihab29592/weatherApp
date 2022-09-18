import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:weather_app/app/services/functions.dart';

import '../../data/network/dio.dart';
import '../../data/network/endpoints.dart';

import '../../domain/weather_model.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of<AppCubit>(context);

  CurrentWeatherModel? currentWeatherModel;
  CurrentWeatherModel? favWeatherModel;
  CurrentWeatherModel? otherWeatherModel;
  List<CurrentWeatherModel> otherItems = [];

  List<dynamic> searchItems = [];

  String? lat, long;
  String? _currentPosition;

  TextEditingController searchController = TextEditingController();

  Future<void> getCurrentPosition() async {
    emit(GetLocationLoading());
    var location = Location();

    if (!await location.serviceEnabled()) {
      if (!await location.requestService()) {
        return;
      }
    }
    var permission = await location.hasPermission();
    if (permission == PermissionStatus.denied) {
      permission = await location.requestPermission();
      if (permission != PermissionStatus.granted) {
        return;
      }
    }
    var loc = await location.getLocation();
    lat = toFixed2DecimalPlaces(loc.latitude!);
    long = toFixed2DecimalPlaces(loc.longitude!);
    _currentPosition = ('$lat,$long');
    emit(GetLocationSuccess());
  }

  void getCurrentWeather() async {
    emit(GetCurrentWeatherLoading());
    await getCurrentPosition();
    await DioHelper.getData(url: forecast, query: {
      'key': apiKey,
      'q': _currentPosition ?? "cairo",
      'days': '7',
      'aqi': 'no',
    }).then((value) {
      currentWeatherModel = CurrentWeatherModel.fromJson(value.data);
      favWeatherModel = CurrentWeatherModel.fromJson(value.data);
      emit(GetCurrentWeatherSuccess());
    }).catchError((error) {
      emit(GetLocationError());

      debugPrint(error.toString());
    });
  }

  void getOtherWeather() async {
    emit(GetOtherWeatherLoading());
    await DioHelper.getData(url: forecast, query: {
      'key': apiKey,
      'q': searchController.text,
      'days': '7',
      'aqi': 'no',
    }).then((value) {
      currentWeatherModel = CurrentWeatherModel.fromJson(value.data);
      otherItems.add(CurrentWeatherModel.fromJson(value.data));
      emit(GetOtherWeatherSuccess());
    }).catchError((error) {
      emit(GetLocationError());

      debugPrint(error.toString());
    });
  }
  void getWeather(String text) async {
    emit(GetOtherWeatherLoading());
    await DioHelper.getData(url: forecast, query: {
      'key': apiKey,
      'q': text,
      'days': '7',
      'aqi': 'no',
    }).then((value) {
      currentWeatherModel = CurrentWeatherModel.fromJson(value.data);
      emit(GetOtherWeatherSuccess());
    }).catchError((error) {
      emit(GetLocationError());

      debugPrint(error.toString());
    });
  }

  void searchData(String cityName) async {
    emit(SearchLoading());
    await DioHelper.postData(url: search, query: {
      'key': apiKey,
      'q': cityName,
    }).then((value) {
      searchItems = value.data;
      emit(SearchSuccess());
      emit(GetCurrentWeatherSuccess());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(SearchError());
      emit(GetCurrentWeatherSuccess());
    });
  }
}
