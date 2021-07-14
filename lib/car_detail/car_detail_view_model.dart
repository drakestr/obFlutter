import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ob_tj_day_one/core/models/async_state.dart';
import 'package:ob_tj_day_one/core/models/item_cars.dart';
import 'package:ob_tj_day_one/core/services/car_service.dart';

final carDetailProvider = StateNotifierProvider<CarDetailState, AsyncState<ItemCars>>(
    (ref) => CarDetailState(ref.read(carServiceProvider)));

class CarDetailState extends StateNotifier<AsyncState<ItemCars>> {
  final CarService _carService;
  CarDetailState(this._carService) : super(Initial<ItemCars>(ItemCars('', '', '', false, 1)));

  void getNewCarDetail(int index) async {
    state = Loading<ItemCars>(state.data);
    await Future.delayed(Duration(seconds: 2));
    state = Success<ItemCars>(_carService.getDetail(index));
  }

  void handleFavorite(int index) {
    _carService.setFavorite(index);
    state = Loading<ItemCars>(state.data);
    state = Success<ItemCars>(_carService.getDetail(index));
  }
}
