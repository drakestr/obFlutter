import 'package:flutter_riverpod/flutter_riverpod.dart';

final carlistProvider = StateNotifierProvider((ref) => CarListState());

class ItemCars {
  String name;
  String price;
  String asset;
  bool favorited;
  int color;

  ItemCars(this.name, this.price, this.asset, this.favorited, this.color);

  @override
  String toString() {
    return '{ name: ${this.name}, price: ${this.price}, asset: ${this.asset}, favorited: ${this.favorited}, color: ${this.color} }';
  }
}

List carsState = [];

class CarListState extends StateNotifier<List>{
  CarListState() : super(carsState);

  void loadData() {
    if (carsState.length == 0) {
      carsState.add(ItemCars('Classic Car', '\$34/day', 'assets/image/car_classic.png', false, 0xFFB67853));
      carsState.add(ItemCars('Sport Car', '\$55/day', 'assets/image/car_sport.png', false, 0xFF60B5F4));
      carsState.add(ItemCars('Flying Car', '\$500/day', 'assets/image/car_flying.png', false, 0xFF8382C2));
      carsState.add(ItemCars('Electric Car', '\$45/day', 'assets/image/car_electric.png', false, 0xFF2A3640));
    }
  }

  void favorited(index) {
    print(index);
    if (carsState[index].favorited) {
      carsState[index].favorited = false;
      state = carsState;
    } else {
      carsState[index].favorited = true;
      state = carsState;
    }
    print(carsState[index]);
  }

  void getDataFromDetail(params) {
    print(params.name);
    int index = carsState.indexWhere((el) => el.name == params.name);
    print(index);
    carsState[index].favorited = params.favorited;
    state = carsState;
  }

}