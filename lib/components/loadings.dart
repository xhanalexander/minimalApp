import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Loadings extends StatelessWidget {
  const Loadings({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: MediaQuery.of(context).size.height / 12,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              blurRadius: 5.0,
              spreadRadius: 1.0,
              offset: Offset(1.0, 1.0),
            )
          ],
        ),
      ),
    );
  }
}
