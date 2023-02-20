import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RentTab extends ConsumerStatefulWidget {
  const RentTab({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RentTabState();
}

class _RentTabState extends ConsumerState<RentTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: const Center(
        child: Text('RentTab'),
      ),
    );
  }
}
