import 'package:flutter/material.dart';

class CustomCards extends StatelessWidget {
  final String titleTextName;
  final VoidCallback onTaps;
  final EdgeInsetsGeometry margins;
  final double? heights;
  final CrossAxisAlignment crossAxisAlignment;

  const CustomCards({
    super.key,
    required this.titleTextName,
    required this.onTaps,
    this.margins = const EdgeInsets.symmetric(horizontal: 10),
    this.heights,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    final double defaultHeight = MediaQuery.of(context).size.height / 12;
    return Container(
      margin: margins,
      height: heights ?? defaultHeight,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5.0,
            spreadRadius: 1.0,
            offset: Offset(1.0, 1.0),
          )
        ],
      ),
      child: InkWell(
        onTap: onTaps,
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(left: 10),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            crossAxisAlignment: crossAxisAlignment,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.28,
                child: Text(
                  titleTextName,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
