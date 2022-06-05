import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;
  const Header({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          const Expanded(child: Divider()),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headline2,
          ),
          const SizedBox(
            width: 10,
          ),
          const Expanded(child: Divider()),
        ],
      ),
    );
  }
}
