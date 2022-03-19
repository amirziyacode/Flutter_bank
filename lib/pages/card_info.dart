import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class Items extends StatefulWidget {
  const Items({Key? key}) : super(key: key);

  @override
  _ItemsState createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  @override
  Widget build(BuildContext context) {
    
    return FadeIn(
      duration: const Duration(seconds: 1),
      child: Row(
        children: [
          const Text(
            "Expences",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
          ),
          const Icon(
            Icons.more_horiz_outlined,
            color: Colors.white,
            size: 25,
          )
        ],
      ),
    );
  }
}
