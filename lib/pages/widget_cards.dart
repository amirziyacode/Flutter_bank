import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Widget_Card extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String price;
  final String time;

  
  const Widget_Card(
      {Key? key,
      required this.icon,
      required this.title,
      required this.description,
      required this.price,
      required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
      var we = MediaQuery.of(context).size.width;
      
    return Padding(
    padding: const EdgeInsets.only(left: 10.0, right: 8.0),
    child: Row(
      children: [
        Container(
          margin: const EdgeInsets.all(5),
          alignment: Alignment.center,
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Colors.grey.withOpacity(0.2)),
          child: FaIcon(icon, color: Colors.white),
        ),
        SizedBox(
          width: we * 0.03,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.white),
            ),
            Text(description,
                style: TextStyle(color: Colors.white.withOpacity(0.5)))
          ],
        ),
        SizedBox(
          width: we * 0.2,
        ),
        Column(
          children: [
            Text(
              price,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Text(time, style: TextStyle(color: Colors.white.withOpacity(0.5)))
          ],
        )
      ],
    ),
  );
  }
}
