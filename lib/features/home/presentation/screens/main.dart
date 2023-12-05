import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manasa_admin_panel/features/home/presentation/viewmodel/HomeNavigationViewModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  final homeViewModel = Get.put(HomeNavigationViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Row(
        children: [
          NavigationRailTheme(
            data: NavigationRailThemeData(
              backgroundColor: Colors.blueGrey.shade50,
              selectedIconTheme:
                  IconThemeData(color: Colors.deepPurple.shade700),
              selectedLabelTextStyle:
                  TextStyle(color: Colors.deepPurple.shade700),
              unselectedIconTheme:
                  IconThemeData(color: Colors.blueGrey.shade600),
              unselectedLabelTextStyle:
                  TextStyle(color: Colors.blueGrey.shade600),
            ),
            child: Obx(
              () => NavigationRail(
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(Icons.favorite_border),
                    selectedIcon: Icon(Icons.favorite),
                    label: Text('First'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.bookmark_border),
                    selectedIcon: Icon(Icons.book),
                    label: Text('Second'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.star_border),
                    selectedIcon: Icon(Icons.star),
                    label: Text('Third'),
                  ),
                ],
                selectedIndex: homeViewModel.selectedIndex,
                onDestinationSelected: (int index) {
                  homeViewModel.onDestinationSelected(index);
                },
                labelType: NavigationRailLabelType.all,
              ),
            ),
          ),
          const VerticalDivider(thickness: 1, width: 1),
          // This is the main content.
          Expanded(
            child: Center(
              child: Obx(
                  () => Text('selectedIndex: ${homeViewModel.selectedIndex}')),
            ),
          )
        ],
      ),
    );
  }
}
