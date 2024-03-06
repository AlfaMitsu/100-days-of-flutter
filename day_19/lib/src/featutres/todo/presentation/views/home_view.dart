import 'package:day_19/src/constants/colors.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _items = [];
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  void _addItem() {
    _items.insert(0, 'Item ${_items.length + 1}');
    _key.currentState!.insertItem(
      0,
      duration: const Duration(milliseconds: 500),
    );
  }

  void _removeItem(int index) {
    _key.currentState!.removeItem(
      index,
      (_, animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: const Card(
            margin: EdgeInsets.all(8),
            color: kTealColor,
            child: ListTile(
              title: Text(
                'Deleted',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        );
      },
      duration: const Duration(milliseconds: 500),
    );
    _items.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        IconButton(
          onPressed: _addItem,
          icon: const Icon(
            Icons.add,
            color: kWhiteColor,
          ),
        ),
        Expanded(
          child: AnimatedList(
            key: _key,
            initialItemCount: 0,
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index, animation) {
              return SizeTransition(
                key: UniqueKey(),
                sizeFactor: animation,
                child: Card(
                  margin: const EdgeInsets.all(10),
                  color: kLightGreenColor,
                  child: ListTile(
                    title: Text(
                      _items[index],
                      style: const TextStyle(fontSize: 24),
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: kWhiteColor,
                      ),
                      onPressed: () {
                        _removeItem(index);
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
