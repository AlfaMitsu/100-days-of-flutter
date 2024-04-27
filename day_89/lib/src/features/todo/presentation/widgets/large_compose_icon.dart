import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

class LargeComposeIcon extends StatelessWidget {
  const LargeComposeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 5, 0, 12),
      child: Column(children: <Widget>[
        Container(
          padding: const EdgeInsets.fromLTRB(6, 0, 0, 0),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'REPLY',
                style: TextStyle(color: Colors.deepPurple, fontSize: 15),
              ),
              Icon(Icons.menu_open, size: 22)
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 225, 231),
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            boxShadow: Breakpoints.mediumAndUp.isActive(context)
                ? null
                : <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0, 2),
                    ),
                  ],
          ),
          width: 200,
          height: 50,
          child: const Padding(
            padding: EdgeInsets.fromLTRB(16.0, 0, 0, 0),
            child: Row(
              children: <Widget>[
                Icon(Icons.edit_outlined),
                SizedBox(width: 20),
                Center(child: Text('Compose')),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
