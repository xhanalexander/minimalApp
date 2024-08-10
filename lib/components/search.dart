import 'package:flutter/material.dart';

class CustomSearchBars extends StatelessWidget {
  final String? hintText;
  final IconData? iconData;
  final VoidCallback? onSearch;
  final ValueChanged<String>? onChanges;
  final TextEditingController controller;
  final EdgeInsetsGeometry? marginSize;

  const CustomSearchBars({
    super.key,
    this.hintText,
    this.iconData,
    this.onSearch,
    this.onChanges,
    required this.controller,
    this.marginSize,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: marginSize ?? const EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: onSearch,
            icon: const Icon(Icons.search_rounded, color: Colors.white),
          ),
          Expanded(
            child: TextFormField(
              controller: controller,
              onChanged: onChanges,
              textInputAction: TextInputAction.search,
              onFieldSubmitted: (value) => onSearch!(),
              decoration: const InputDecoration(
                hintText: "Search Movies...",
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
                border: InputBorder.none,
              ),
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchBarButton extends StatelessWidget {
  final VoidCallback? onClicked;
  
  const SearchBarButton({
    super.key,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(0),
        backgroundColor: Colors.grey[700],
        elevation: 0,
      ),
      onPressed: onClicked,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_rounded, color: Colors.white),
          ),
          const Expanded(
            child: Text(
              "Search ID's...",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}