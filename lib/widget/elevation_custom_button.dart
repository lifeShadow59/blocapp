import 'package:blocapp/widget/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function() onTap;
  final String title;

  const CustomButton({Key? key, required this.onTap, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(SecondaryGrayColor),
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(12.5)),
        elevation: MaterialStateProperty.all<double>(10),
        shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        )),
      ),
      onPressed: onTap,
      child: Text(title, style: TextStyle(color: PrimaryBlueColor)),
    );
  }
}
