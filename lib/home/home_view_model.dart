import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeScreenProvider = StateNotifierProvider<HomeScreenViewModel, bool>(
    (ref) => HomeScreenViewModel());

class HomeScreenViewModel extends StateNotifier<bool> {
  HomeScreenViewModel() : super(false);

  void handleSwitch() {
    if (state) {
      state = false;
    } else {
      state = true;
    }
  }
}
