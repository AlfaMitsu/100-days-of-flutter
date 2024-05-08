import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../views/color_item_view.dart';

class CustomAppBarDemo extends StatefulWidget {
  const CustomAppBarDemo({super.key});

  @override
  State createState() {
    return _State();
  }
}

class _State extends State<CustomAppBarDemo>
    with SingleTickerProviderStateMixin {
  List<TabItem> items = <TabItem>[
    const TabItem(icon: Icons.home, title: 'Home'),
    const TabItem(icon: Icons.map, title: 'Discovery'),
    const TabItem(icon: Icons.plus_one, title: 'Add'),
  ];

  static const paletteColors = [
    Color(0xFFf44336),
    Color(0xFFE91E63),
    Color(0xFF9C27B0),
    Color(0xFF673AB7),
    Color(0xFF3F51B5),
    Color(0xFF2196F3),
    Color(0xFF00BCD4),
    Color(0xFF009688),
    Color(0xFF4CAF50),
    Color(0xFF8BC34A),
    Color(0xFFCDDC39),
    Color(0xFFFFEB3B),
    Color(0xFFFFC107),
    Color(0xFFFF9800),
    Color(0xFFFF5722),
    Color(0xFF795548),
    Color(0xFF9E9E9E),
    Color(0xFF607D8B),
  ];
  Color _tabBackgroundColor = paletteColors[5];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: items.length,
        child: Scaffold(
          appBar: AppBar(title: const Text('Custom ConvexAppBar')),
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: items
                .map((i) => i.title == 'Discovery'
                    ? paletteBody()
                    : Center(
                        child: Text(
                        '<\t\t${i.title}\t\t>',
                        style: const TextStyle(fontSize: 30),
                      )))
                .toList(growable: false),
          ),
          bottomNavigationBar: StyleProvider(
            style: Style(),
            child: ConvexAppBar(
              disableDefaultTabController: true,
              initialActiveIndex: 0,
              height: 50,
              top: -30,
              curveSize: 100,
              style: TabStyle.fixedCircle,
              items: [
                const TabItem(title: '2019', icon: Icons.link),
                TabItem(
                    icon: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFFF5722),
                  ),
                  child: const Icon(Icons.add, color: Colors.white, size: 40),
                )),
                const TabItem(title: "2020", icon: Icons.work),
              ],
              backgroundColor: _tabBackgroundColor,
              cornerRadius: 25,
              onTabNotify: (i) {
                var intercept = i == 1;
                if (intercept) {
                  Navigator.pushNamed(context, '/fab');
                }
                return !intercept;
              },
              onTap: (i) => debugPrint('click $i'),
            ),
          ),
        ));
  }

  Widget builder() {
    return ConvexAppBar.builder(
      itemBuilder: _CustomBuilder(items, _tabBackgroundColor),
      count: items.length,
      backgroundColor: _tabBackgroundColor,
    );
  }

  Container tabContent(TabItem data, Color color) {
    return Container(
        height: 50,
        padding: const EdgeInsets.only(bottom: 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(data.icon, color: color),
            Text(data.title != null ? data.title! : "",
                style: TextStyle(color: color))
          ],
        ));
  }

  GridView paletteBody() {
    return GridView.count(
      crossAxisCount: 5,
      childAspectRatio: 1,
      mainAxisSpacing: 1,
      crossAxisSpacing: 1,
      children: paletteColors
          .map((c) => GestureDetector(
                child: ColorItemView(color: c),
                onTap: () => _onColorChanged(c),
              ))
          .toList(),
    );
  }

  void _onColorChanged(Color color) {
    setState(() {
      _tabBackgroundColor = color;
    });
  }
}

class _CustomBuilder extends DelegateBuilder {
  final List<TabItem> items;
  final Color _tabBackgroundColor;

  _CustomBuilder(this.items, this._tabBackgroundColor);

  @override
  Widget build(BuildContext context, int index, bool active) {
    var navigationItem = items[index];
    var color = active ? Colors.white : Colors.white60;

    if (index == items.length ~/ 2) {
      return Container(
        width: 60,
        height: 60,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        child: Icon(
          Icons.add,
          size: 40,
          color: _tabBackgroundColor,
        ),
      );
    }
    var icon = active
        ? navigationItem.activeIcon ?? navigationItem.icon
        : navigationItem.icon;
    var title = navigationItem.title ?? "";
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.only(bottom: 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Icon(icon, color: color),
          Text(title, style: TextStyle(color: color))
        ],
      ),
    );
  }

  @override
  bool fixed() {
    return true;
  }
}

class Style extends StyleHook {
  @override
  double get activeIconSize => 40;

  @override
  double get activeIconMargin => 10;

  @override
  double get iconSize => 20;

  @override
  TextStyle textStyle(Color color, String? fontFamily) {
    return TextStyle(fontSize: 20, color: color, fontFamily: fontFamily);
  }
}
