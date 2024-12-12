import 'package:flutter/material.dart';
import 'package:rock_paper_scissors_game/pages/choice_screen.dart';

import '../utils/colors.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Future<void> _showMyAlert(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Center(
                child: Text(
              'Rules',
            )),
            content: const SingleChildScrollView(
              child: ListBody(
                children: [
                  Center(
                    child: Text('PAPER WINS ROCK'),
                  ),
                  Center(
                    child: Text('ROCK WINS SCISSORS'),
                  ),
                  Center(
                    child: Text('SCISSORS WINS PAPER'),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Close',
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          );
        });
  }

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
              margin: const EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width,
              height: 80,
              child: TextButton(
                style: TextButton.styleFrom(
                    side: BorderSide(color: AppColors.btnColor, width: 2)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GameScreen(),
                    ),
                  );
                },
                child: Text(
                  'PLAY WITH COMPUTER',
                  style: TextStyle(color: AppColors.bgColor, fontSize: 20.0),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                _showMyAlert(context);
              },
              child: Text(
                'See the instructions?',
                style: TextStyle(color: AppColors.bgColor, fontSize: 20.0),
              ),
            ),
            const SizedBox(
              height: 40.0,
            )
          ],
        ),
      ),
    );
  }
}
