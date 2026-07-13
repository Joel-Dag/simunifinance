import 'package:flutter/material.dart';
import '../../dashboard_screen.dart';
import '../analytics/presentation/analytics_screen.dart';
import '../budgeting/presentation/budget_screen.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold({super.key});

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  int _currentIndex = 0;
  
  final List<Widget> _screens = [
    const DashboardScreen(),
    const AnalyticsScreen(),
    const BudgetScreen(),
    const Center(child: Text('Analytics', style: TextStyle(color: Colors.white))),
    const Center(child: Text('Budgeting', style: TextStyle(color: Colors.white))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xFF00E676),
          unselectedItemColor: Colors.white30,
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.insights_rounded), label: 'Analytics'),
            BottomNavigationBarItem(icon: Icon(Icons.pie_chart_rounded), label: 'Budget'),
          ],
        ),
      ),
    );
  }
}