import 'package:flutter/material.dart';
import 'package:rock_paper_scissors_game/pages/home.dart';
import 'package:rock_paper_scissors_game/utils/colors.dart';

class ResultScreen extends StatelessWidget {
  final String userChoice;
  final String computerChoice;
  final int userScore;
  final int computerScore;
  final VoidCallback resetScores;
  const ResultScreen({
    super.key,
    required this.userChoice,
    required this.computerChoice,
    required this.userScore,
    required this.computerScore,
    required this.resetScores,
  });

  String determineResult() {
    if (userChoice == computerChoice) {
      return "It's a Draw!";
    } else if ((userChoice == 'rock' && computerChoice == 'scissors') ||
        (userChoice == 'scissors' && computerChoice == 'paper') ||
        (userChoice == 'paper' && computerChoice == 'rock')) {
      return "You Win!";
    } else {
      return "You Lose!";
    }
  }

  void confirmQuit(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Quit Game'),
        content: const Text('Are you sure you want to quit the game?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              resetScores();
              Navigator.of(context).pop();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const Home()),
                (route) => false,
              );
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final result = determineResult();
    return Scaffold(
      backgroundColor: AppColors.bgColor2,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.bgColor2,
        title: Center(
          child: Text(
            'You: $userScore - Computer: $computerScore',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text(
                      'Computer',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    SizedBox(
                      height: 180.0,
                      width: 180.0,
                      child: Image.asset(
                        'asset/$computerChoice.png',
                        // color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      'You',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 180.0,
                      width: 180.0,
                      child: Image.asset(
                        'asset/$userChoice.png',
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ],
            ),
          ),
          Text(
            result,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: result == "You Win!"
                  ? Colors.green
                  : result == "You Lose!"
                      ? Colors.red
                      : Colors.orange,
            ),
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width,
            height: 80,
            child: TextButton(
              style: TextButton.styleFrom(
                  side: BorderSide(color: AppColors.btnColor, width: 2)),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'PLAY AGAIN',
                style: TextStyle(color: AppColors.bgColor, fontSize: 20.0),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width,
            height: 80,
            child: TextButton(
              style: TextButton.styleFrom(
                  side: BorderSide(color: AppColors.btnColor, width: 2)),
              onPressed: () {
                confirmQuit(context);
              },
              child: Text(
                'QUIT',
                style: TextStyle(color: AppColors.bgColor, fontSize: 20.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
