import 'package:flutter/material.dart';

class WRememberMe extends StatelessWidget {
  const WRememberMe({
    Key? key,
    required this.isChecked,
    required this.text,
    required this.onChanged,
  }) : super(key: key);

  final bool isChecked;
  final String text;
  final void Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: isChecked,
          onChanged: onChanged,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              5.0,
            ),
          ),
          checkColor: Colors.white,
          activeColor: Colors.red,
          side: const BorderSide(
            color: Colors.red,
            width: 2.5,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.4,
          child: Text(text,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.white),
              textAlign: TextAlign.center),
        )
      ],
    );
  }
}
