import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal:24 ,vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Work Space',style: TextStyle(fontWeight: FontWeight.bold),),
              Text('Best platform for creating to-do list',
                style: TextStyle(fontWeight: FontWeight.w600,color: Colors.grey[600]),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings,color: Colors.grey[600]),
          )
        ],
      ),
    );
  }
}
