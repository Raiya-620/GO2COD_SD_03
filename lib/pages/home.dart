import 'package:flutter/material.dart';

import '../utils/colors.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor2,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Image.asset('asset/background.png'),
            ),
            Container(
              margin: EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width,
              height: 80,
              child: TextButton(
                style: TextButton.styleFrom(
                    side: BorderSide(color: AppColors.btnColor, width: 2)),
                onPressed: () {},
                child: Text(
                  'PLAY WITH COMPUTER',
                  style: TextStyle(color: AppColors.bgColor, fontSize: 20.0),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                AlertDialog(
                  title: Text('Rules'),
                  content: Column(
                    children: [
                      Text('Rock wins scissors'),
                      Text('Rock wins scissors'),
                      Text('Rock wins scissors')
                    ],
                  ),
                );
              },
              child: Text(
                'See the instructions?',
                style: TextStyle(color: AppColors.bgColor, fontSize: 20.0),
              ),
            ),
            SizedBox(
              height: 40.0,
            )
          ],
        ),
      ),
    );
  }
}
