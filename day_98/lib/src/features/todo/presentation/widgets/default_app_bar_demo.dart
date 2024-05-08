import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../data/models/choice_value_model.dart';
import '../../data/models/sample_badge_model.dart';
import 'chip_item.dart';
import 'choose_tab_item.dart';
import 'colors_item.dart';
import 'data.dart';
import 'gradient_item.dart';
import 'heading.dart';
import 'radio_item.dart';

class DefaultAppBarDemo extends StatefulWidget {
  const DefaultAppBarDemo({super.key});

  @override
  State createState() {
    return _State();
  }
}

class _State extends State<DefaultAppBarDemo>
    with SingleTickerProviderStateMixin {
  static const kStyles = [
    ChoiceValue<TabStyle>(
      title: 'TabStyle.react',
      label: 'Appbar use react style',
      value: TabStyle.react,
    ),
    ChoiceValue<TabStyle>(
      title: 'TabStyle.reactCircle',
      label: 'Appbar use reactCircle style',
      value: TabStyle.reactCircle,
    ),
    ChoiceValue<TabStyle>(
      title: kIsWeb
          ? 'TabStyle.flip (Flutter Web is not supported)'
          : 'TabStyle.flip',
      label: 'Appbar use flip style',
      value: TabStyle.flip,
    ),
    ChoiceValue<TabStyle>(
      title: 'TabStyle.textIn',
      label: 'Appbar use textIn style',
      value: TabStyle.textIn,
    ),
    ChoiceValue<TabStyle>(
      title: 'TabStyle.titled',
      label: 'Appbar use titled style',
      value: TabStyle.titled,
    ),
    ChoiceValue<TabStyle>(
      title: 'TabStyle.fixed',
      label: 'Appbar use fixed style',
      value: TabStyle.fixed,
    ),
    ChoiceValue<TabStyle>(
      title: 'TabStyle.fixedCircle',
      label: 'Appbar use fixedCircle style',
      value: TabStyle.fixedCircle,
    ),
  ];

  static final kTabTypes = [
    ChoiceValue<List<TabItem>>(
      title: 'Icon Tab',
      label: 'Appbar use icon with Tab',
      value: Data.items(image: false),
    ),
    ChoiceValue<List<TabItem>>(
      title: 'Image Tab',
      label: 'Appbar use image with Tab',
      value: Data.items(image: true),
    ),
  ];
  var _tabItems = kTabTypes.first;

  ChoiceValue<TabStyle> _style = kStyles.first;
  ChoiceValue<Curve> _curve = Data.curves.first;
  Color _barColor = Data.namedColors.first.color;
  Color _shadowColor = Data.namedColors.first.color;
  Gradient? _gradient = Data.gradients.first;
  SampleBadge? _badge;
  TabController? _tabController;
  TextDirection _textDirection = TextDirection.ltr;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabItems.value.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var options = <Widget>[
      const Heading(text: 'Appbar Color'),
      ColorsItem(
        colors: Data.namedColors,
        selectedColor: _barColor,
        onChanged: _onBarColorChanged,
      ),
      const Heading(text: 'Shadow Color'),
      ColorsItem(
        colors: Data.namedShadowColors,
        selectedColor: _shadowColor,
        onChanged: _onShadowColorChanged,
      ),
      const Heading(text: 'Background Gradient'),
      GradientItem(
        colors: Data.gradients,
        selectedColor: _gradient,
        onChanged: _onGradientChanged,
      ),
      const Heading(text: 'Badge Chip'),
      ChipItem(
        chips: Data.badges,
        selectedChip: _badge,
        onChanged: _onBadgeChanged,
      ),
      const Heading(text: 'Tab Type'),
      ChooseTabItem(
        tabTypes: kTabTypes,
        selectedType: _tabItems,
        onChanged: _onTabItemTypeChanged,
      ),
      const Heading(text: 'Tab Style'),
    ];
    options.addAll(
      kStyles.map(
        (s) => RadioItem<TabStyle>(
          value: s,
          groupValue: _style,
          onChanged:
              s.value == TabStyle.flip && kIsWeb ? _onNothing : _onStyleChanged,
        ),
      ),
    );
    if (_style.value != TabStyle.fixed &&
        _style.value != TabStyle.fixedCircle) {
      options.add(
        const Heading(text: 'Animation Curve'),
      );
      options.addAll(
        Data.curves.map(
          (c) => RadioItem<Curve>(
            value: c,
            groupValue: _curve,
            onChanged: _onCurveChanged,
          ),
        ),
      );
    }

    return Directionality(
      textDirection: _textDirection,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ConvexAppBar'),
          backgroundColor: _barColor,
          actions: <Widget>[
            IconButton(
              icon: Icon(_textDirection == TextDirection.rtl
                  ? Icons.format_textdirection_r_to_l
                  : Icons.format_textdirection_l_to_r),
              color: Colors.white,
              tooltip: _textDirection == TextDirection.rtl
                  ? "Change to LTR"
                  : "Change to RTL",
              onPressed: () {
                setState(() {
                  _textDirection = _textDirection == TextDirection.ltr
                      ? TextDirection.rtl
                      : TextDirection.ltr;
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.style),
              color: Colors.white,
              tooltip: "Custom style example",
              onPressed: () => Navigator.of(context).pushNamed('/custom'),
            ),
            IconButton(
              icon: const Icon(Icons.radio_button_checked),
              color: Colors.white,
              tooltip: "convex button example",
              onPressed: () => Navigator.of(context).pushNamed('/fab'),
            ),
            IconButton(
              icon: const Icon(Icons.looks_two),
              color: Colors.white,
              tooltip: "change tab by controller",
              onPressed: () {
                _tabController?.animateTo(2);
              },
            )
          ],
        ),
        body: TabBarView(
            controller: _tabController,
            children: _tabItems.value
                .map((i) => i.title == 'Home' || i.title == 'Happy'
                    ? ListView(children: options)
                    : Center(
                        child: Text(
                        '${i.title} World',
                        style: const TextStyle(fontSize: 30),
                      )))
                .toList(growable: false)),
        bottomNavigationBar: _badge == null
            ? ConvexAppBar(
                items: _tabItems.value,
                style: _style.value,
                curve: _curve.value,
                shadowColor: _shadowColor,
                backgroundColor: _barColor,
                gradient: _gradient,
                controller: _tabController,
                onTap: (int i) => debugPrint('select index=$i'),
              )
            : ConvexAppBar.badge(
                {
                  3: _badge!.text,
                  4: Icons.assistant_photo,
                  2: Colors.redAccent
                },
                badgePadding: _badge!.padding,
                badgeColor: _badge!.badgeColor,
                badgeBorderRadius: _badge!.borderRadius,
                badgeMargin: const EdgeInsets.only(bottom: 20, left: 30),
                items: _tabItems.value,
                style: _style.value,
                curve: _curve.value,
                shadowColor: _shadowColor,
                backgroundColor: _barColor,
                gradient: _gradient,
                controller: _tabController,
                onTap: (int i) => debugPrint('select index=$i'),
              ),
      ),
    );
  }

  void _onTabItemTypeChanged(ChoiceValue<List<TabItem>>? value) {
    if (value == null) {
      return;
    }
    setState(() {
      _tabItems = value;
    });
  }

  void _onNothing(ChoiceValue<TabStyle>? value) {}

  void _onStyleChanged(ChoiceValue<TabStyle>? value) {
    if (value == null) {
      return;
    }
    setState(() {
      _style = value;
    });
  }

  void _onCurveChanged(ChoiceValue<Curve>? value) {
    if (value == null) {
      return;
    }
    setState(() {
      _curve = value;
    });
  }

  void _onBarColorChanged(Color value) {
    setState(() {
      _barColor = value;
    });
  }

  void _onShadowColorChanged(Color value) {
    setState(() {
      _shadowColor = value;
    });
  }

  void _onGradientChanged(Gradient? value) {
    setState(() {
      _gradient = value;
    });
  }

  void _onBadgeChanged(SampleBadge? value) {
    setState(() {
      _badge = value;
    });
  }
}
