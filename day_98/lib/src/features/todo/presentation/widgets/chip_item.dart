import 'package:flutter/material.dart';

import '../../data/models/sample_badge_model.dart';

class ChipItem extends StatelessWidget {
  const ChipItem({
    super.key,
    required this.chips,
    this.selectedChip,
    required this.onChanged,
  });

  final List<SampleBadge?> chips;
  final SampleBadge? selectedChip;
  final ValueChanged<SampleBadge?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: chips.map<Widget>((SampleBadge? chip) {
        return GestureDetector(
          onTap: () => onChanged(chip),
          child: Container(
            height: 40,
            width: 80,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(
                  color: chip == selectedChip
                      ? Colors.black
                      : const Color(0xFFD5D7DA),
                  width: 2),
            ),
            child: chip == null
                ? const Center(child: Text('clear'))
                : Center(
                    child: Material(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(chip.borderRadius ?? 20),
                      ),
                      type: MaterialType.card,
                      color: chip.badgeColor ?? Colors.redAccent,
                      child: Padding(
                        padding: chip.padding ??
                            const EdgeInsets.only(left: 4, right: 4),
                        child: Text(
                          chip.text,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
          ),
        );
      }).toList(),
    );
  }
}
