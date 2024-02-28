import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../constants/colors.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Slidable(
            startActionPane: ActionPane(
              motion: const StretchMotion(),
              children: [
                SlidableAction(
                  onPressed: ((context) {}),
                  backgroundColor: Colors.green,
                  icon: Icons.phone,
                ),
                SlidableAction(
                  flex: 2,
                  onPressed: ((context) {}),
                  backgroundColor: kBlueColor,
                  icon: Icons.chat,
                ),
              ],
            ),
            endActionPane: ActionPane(
              motion: const StretchMotion(),
              children: [
                SlidableAction(
                  onPressed: ((context) {}),
                  backgroundColor: Colors.red,
                  icon: Icons.delete,
                ),
              ],
            ),
            child: Container(
              color: kGrey300Color,
              child: const ListTile(
                title: Text('Trishia Buenne'),
                subtitle: Text('09123456789'),
                leading: Icon(
                  Icons.person,
                  size: 40,
                ),
              ),
            ),
          ),
          Slidable(
            startActionPane: ActionPane(
              motion: const StretchMotion(),
              children: [
                SlidableAction(
                  onPressed: ((context) {}),
                  backgroundColor: Colors.green,
                  icon: Icons.phone,
                ),
                SlidableAction(
                  flex: 2,
                  onPressed: ((context) {}),
                  backgroundColor: kBlueColor,
                  icon: Icons.chat,
                ),
              ],
            ),
            endActionPane: ActionPane(
              motion: const StretchMotion(),
              children: [
                SlidableAction(
                  onPressed: ((context) {}),
                  backgroundColor: Colors.red,
                  icon: Icons.delete,
                ),
              ],
            ),
            child: Container(
              color: kGrey300Color,
              child: const ListTile(
                title: Text('Al-Fasheer'),
                subtitle: Text('09987654321'),
                leading: Icon(
                  Icons.person,
                  size: 40,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
