import 'package:flutter/material.dart';
import 'package:rock_paper_scissors_game/pages/result_screen.dart';
import 'dart:math';
import '../utils/colors.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int userScore = 0;
  int computerScore = 0;

  String getComputerChoice() {
    final choices = ['rock', 'paper', 'scissors'];
    final randomIndex = Random().nextInt(choices.length);
    return choices[randomIndex];
  }

  void updateScores(String userChoice, String computerChoice) {
    if (userChoice == computerChoice) {
    } else if ((userChoice == 'rock' && computerChoice == 'scissors') ||
        (userChoice == 'scissors' && computerChoice == 'paper') ||
        (userChoice == 'paper' && computerChoice == 'rock')) {
      setState(() {
        userScore++;
      });
    } else {
      setState(() {
        computerScore++;
      });
    }
  }

  void handleChoice(String userChoice) {
    String computerChoice = getComputerChoice();
    updateScores(userChoice, computerChoice);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          userChoice: userChoice,
          computerChoice: computerChoice,
          userScore: userScore,
          computerScore: computerScore,
          resetScores: () {
            setState(() {
              userScore = 0;
              computerScore = 0;
            });
          },
        ),
      ),
    );
  }

  void showFinalScores(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Final Scores'),
        content: Text('You: $userScore\nComputer: $computerScore'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();

              setState(() {
                userScore = 0;
                computerScore = 0;
              });
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor2,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor2,
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            'YOUR CHOICE',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Column(
        children: [
          const Spacer(),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    child: Image.asset('asset/rock.png'),
                    onTap: () {
                      handleChoice('rock');

                      print('Rock has been tapped');
                    },
                  ),
                ),
                Expanded(
                    child: GestureDetector(
                  child: Image.asset('asset/paper.png'),
                  onTap: () {
                    handleChoice('paper');

                    print('paper has been tapped');
                  },
                )),
                Expanded(
                    child: GestureDetector(
                  child: Image.asset('asset/scissors.png'),
                  onTap: () {
                    handleChoice('scissors');

                    print('scissors has been tapped');
                  },
                ))
              ],
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
                'HOME',
                style: TextStyle(color: AppColors.bgColor, fontSize: 20.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
