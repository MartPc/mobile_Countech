import 'package:countech_app/presentation/views/employee_view.dart';
import 'package:countech_app/presentation/views/sale_view.dart';
import 'package:countech_app/presentation/views/production_view.dart';
import 'package:countech_app/presentation/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {


  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    final screens = [const EmployeeView(), const ProductionView(), const SaleView()];

    return Scaffold(
      appBar: const AppMenuBar(),
      body: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),

        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          onTap: (value){
            setState(() {
              selectedIndex = value;
            });
          },
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.people_alt_outlined),
              activeIcon: Icon( Icons.people_alt),
              label: 'Empleados',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.fact_check_outlined),
              activeIcon: Icon( Icons.fact_check_rounded),
              label: 'Producción',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              activeIcon: Icon( Icons.account_circle_rounded),
              label: 'Ventas', 
            ),
          ],
        ),
    );
  }
}