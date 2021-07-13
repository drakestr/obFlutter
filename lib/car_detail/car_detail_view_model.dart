import 'package:flutter_riverpod/flutter_riverpod.dart';

final carDetailProvider = StateNotifierProvider<CarDetailState, CarDetail>((ref) => CarDetailState());

class CarDetail {
  String name;
  String price;
  String asset;
  bool favorited;
  int color;

  CarDetail(this.name, this.price, this.asset, this.favorited, this.color);
}

class CarDetailState extends StateNotifier<CarDetail>{
  CarDetailState() : super(CarDetail('', '', '', false, 1));

  void getNewCarDetail(e) {
    state = CarDetail(e.name, e.price, e.asset, e.favorited, e.color);
  }

  void handleFavorite() {
    if (state.favorited) {
      state = CarDetail(state.name, state.price, state.asset, false, state.color);
    } else {
      state = CarDetail(state.name, state.price, state.asset, true, state.color);
    }
  }


}