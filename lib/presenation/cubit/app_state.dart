
abstract class AppState {}

class AppInitial extends AppState {}
class GetCurrentWeatherLoading extends AppState {}
class GetCurrentWeatherSuccess extends AppState {}


class GetOtherWeatherLoading extends AppState {}
class GetOtherWeatherSuccess extends AppState {}


class GetPermissionLoading extends AppState {}
class GetPermissionSuccess extends AppState {}
class GetPermissionError extends AppState {}

class GetLocationLoading extends AppState {}
class GetLocationSuccess extends AppState {}
class GetLocationError extends AppState {}


class SearchLoading extends AppState {}
class SearchSuccess extends AppState {}
class SearchError extends AppState {}