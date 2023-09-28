import 'package:flutter/material.dart';


class CommonTextFormField extends StatelessWidget {
  const CommonTextFormField({
    required this.description,
    required this.controller,
    required this.hintText,
    required this.maxWidth,
    this.isKeyboardText,
  });
  final String description;
  final TextEditingController controller;
  final String hintText;
  final double maxWidth;
  final bool? isKeyboardText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(description),
          Container(
            margin: const EdgeInsets.only(left: 15, right: 15),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxWidth),
              child: TextFormField(
                controller: controller,
                onChanged: (value) {
                  value = controller.text;
                },
                keyboardType: isKeyboardText == true ? TextInputType.text : TextInputType.number ,
                textInputAction: TextInputAction.next,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1.0,
                    ),
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1.0,
                    ),
                  ),
                  hintText: hintText,
                  hintStyle: const TextStyle(fontSize: 12),
                  hintTextDirection: TextDirection.ltr,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}