import 'package:get/get.dart';

class HomeNavigationViewModel extends GetxController {
  final _selectedIndex = 0.obs;

  int get selectedIndex => _selectedIndex.value;

  void onDestinationSelected(int index) {
    _selectedIndex.value = index;
  }
}
