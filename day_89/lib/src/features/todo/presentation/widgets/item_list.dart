import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

import '../../data/models/item_model.dart';
import 'item_list_tile.dart';
import 'small_compose_icon.dart';

typedef _CardSelectedCallback = void Function(int?);

class ItemList extends StatelessWidget {
  final List<Item> items;
  final int? selected;
  final _CardSelectedCallback selectCard;
  const ItemList(
      {super.key,
      required this.items,
      this.selected,
      required this.selectCard});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 0, 0, 0),
      floatingActionButton: Breakpoints.mediumAndUp.isActive(context)
          ? null
          : const SmallComposeIcon(),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Icon(Icons.search),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: CircleAvatar(
                    radius: 18,
                    child: Image.asset(
                      'images/plum.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                contentPadding: const EdgeInsets.all(25),
                hintStyle:
                    const TextStyle(color: Color.fromARGB(255, 135, 129, 138)),
                hintText: 'Search replies',
                fillColor: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) => ItemListTile(
                item: items[index],
                email: items[index].emails![0],
                selectCard: selectCard,
                selected: selected,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
