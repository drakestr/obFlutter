import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ob_tj_day_one/core/models/async_state.dart';
import 'package:ob_tj_day_one/core/models/item_cars.dart';
import 'package:ob_tj_day_one/core/services/car_service.dart';

final carlistProvider = StateNotifierProvider.autoDispose<CarListState, AsyncState<List<ItemCars>>>(
    (ref) => CarListState(ref.read(carServiceProvider)));

class CarListState extends StateNotifier<AsyncState<List<ItemCars>>> {
  final CarService _carService;
  CarListState(this._carService) : super(Initial<List<ItemCars>>([])){
    loadData();
  }

  void loadData() {
    state = Loading<List<ItemCars>>(state.data);
    state = Success<List<ItemCars>>(_carService.fetchCar());
  }

  void favorited(index) {
    _carService.setFavorite(index);
    state = Loading<List<ItemCars>>(state.data);
    state = Success<List<ItemCars>>(_carService.fetchCar());
  }
}
