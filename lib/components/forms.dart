import 'package:flutter/material.dart';
import 'package:minimalapp/components/form_validations.dart';

class CustomForms extends StatelessWidget {
  final String hintTextName;
  final TextEditingController controllerNames;
  final void Function(String)? onChanged;
  final BorderRadius borderRads;

  const CustomForms({
    super.key, 
    required this.hintTextName, 
    required this.controllerNames,
    this.borderRads = const BorderRadius.all(Radius.circular(10)),
    this.onChanged  
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controllerNames,
      validator: (value) => FormValidator.validateForms(contents: value),
      keyboardType: TextInputType.text,
      onChanged: onChanged,
      decoration: InputDecoration(
        // prefixIcon: const Icon(Icons.account_circle, color: Colors.grey),
        hintText: hintTextName,
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: borderRads,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRads,
          // borderSide: const BorderSide(color: Colors.purpleAccent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRads,
          borderSide: const BorderSide(
            // color: Colors.purpleAccent,
            width: 2,
          ),
        ),
      ),
    );
  }
}

class CustomTextAreaForms extends StatelessWidget {
  final String hintTextName;
  final TextEditingController controllerNames;
  final void Function(String)? onChanged;
  final BorderRadius borderRads;

  const CustomTextAreaForms({
    super.key, 
    required this.hintTextName, 
    required this.controllerNames,
    this.borderRads = const BorderRadius.all(Radius.circular(10)),
    this.onChanged  
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controllerNames,
      validator: (value) => FormValidator.validateForms(contents: value),
      keyboardType: TextInputType.multiline,
      expands: true,
      maxLines: null,
      onChanged: onChanged,
      decoration: InputDecoration(
        // prefixIcon: const Icon(Icons.account_circle, color: Colors.grey),
        hintText: hintTextName,
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: borderRads,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRads,
          // borderSide: const BorderSide(color: Colors.purpleAccent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRads,
          borderSide: const BorderSide(
            // color: Colors.purpleAccent,
            width: 2,
          ),
        ),
      ),
    );
  }
}

class LabelsForms extends StatelessWidget {
  final String labelName;

  const LabelsForms({
    super.key,
    required this.labelName,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      labelName,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}