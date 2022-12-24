import 'package:flutter/material.dart';

class CustomRoundedOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;

  const CustomRoundedOutlinedButton({Key? key, required this.text,required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
        side: MaterialStateProperty.all(
          BorderSide(
              color: Theme.of(context).primaryColor,
              width: 1.0,
              style: BorderStyle.solid),
        ),
      ),
      onPressed: () {
        onPress.call();
      },
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .button!
            .copyWith(color: Theme.of(context).primaryColor),
      ),
    );
  }
}
