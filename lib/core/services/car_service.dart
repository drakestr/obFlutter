import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ob_tj_day_one/core/models/item_cars.dart';

final carServiceProvider = Provider((ref) => CarService());

class CarService {
  List<ItemCars> carsState = [
    ItemCars('Classic Car', '\$34/day', 'assets/image/car_classic.png', false,
        0xFFB67853),
    ItemCars('Sport Car', '\$55/day', 'assets/image/car_sport.png', false,
        0xFF60B5F4),
    ItemCars('Flying Car', '\$500/day', 'assets/image/car_flying.png', false,
        0xFF8382C2),
    ItemCars('Electric Car', '\$45/day', 'assets/image/car_electric.png', false,
        0xFF2A3640)
  ];

  List<ItemCars> fetchCar() {
    return carsState;
  }

  setFavorite(int index) {
    var newCar = ItemCars(
        carsState[index].name,
        carsState[index].price,
        carsState[index].asset,
        !carsState[index].favorited,
        carsState[index].color);
    carsState[index] = newCar;
  }

  ItemCars getDetail(int index){
    return carsState[index];
  }
}
