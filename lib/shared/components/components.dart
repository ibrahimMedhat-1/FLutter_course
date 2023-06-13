import 'package:flutter/material.dart';

Widget defaultButton({
  required Function() onPressed,
  required String text,
}) {
  return //login button
      Container(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
    ),
    width: double.infinity,
    child: MaterialButton(
      color: Colors.blue,
      height: 50,
      onPressed: () {
        onPressed();
      },
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    ),
  );
}

Widget defaultTextField({
  required TextEditingController controller,
  required TextInputType textInputType,
  IconData? prefixIcon,
  IconData? suffixIcon,
  required String text,
  bool obscureText = false,
  Function()? onPressed,
  Function()? onTap,
  required Function(String) validate,
}) {
  return TextFormField(
    onTap: onTap,
    validator: (string) {
      return validate(string!);
    },
    controller: controller,
    keyboardType: textInputType,
    obscureText: obscureText,
    decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon),
        suffixIcon: IconButton(
            icon: Icon(suffixIcon),
            onPressed: () {
              onPressed!();
            }),
        labelText: text,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        )),
  );
}

Widget taskItem({
  required String time,
  required String title,
  required String date,
}) =>
    Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 45,
            child: Text(
              time,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 25,
                ),
              ),
              Text(
                date,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
