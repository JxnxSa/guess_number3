import 'package:flutter/material.dart';
import 'package:guess_number3/game.dart';

class GamePage extends StatefulWidget {
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final _controller = TextEditingController();
  final _game = Game();

  // state variable
  var _feedbackText = '';
  var _showTestButton = false;
  // override
  void handleClickGuess() {
    setState(() {
      _showTestButton = !_showTestButton;
    });

    print('Button clicked!');
    print(_controller.text);
    var guess = int.tryParse(_controller.text);
    if (guess == null) {
      // แจ้ง error
      print('Input Error!!');
      setState(() {
        _feedbackText = 'Input error , Please try again';
      });
    } else {
      var result = _game.doGuess(guess);
      if (result == Result.tooHigh) {
        print('Too High');
        setState(() {
          _feedbackText = 'Too High , Please try again';
        });
      } else if (result == Result.tooLow) {
        print('Too Low');
        setState(() {
          _feedbackText = 'Too Low , Please try again';
        });
      } else {
        print('Correct');
        setState(() {
          _feedbackText = 'Good Job!!';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guess the Number'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Please enter number between 1 and 100'),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a number',
              ),
            ),
            // Callback function
            ElevatedButton(
              onPressed: handleClickGuess,
              child: const Text('GUESS'),
            ),
            Text(_feedbackText),

            /*conditional operator, ternary
            xxx?yyy:zzz*/
            ElevatedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: _showTestButton ? Colors.green : Colors.red
              ),
              onPressed: () {},
              child: const Text('Test'),
            ),
            Icon(_showTestButton ? Icons.print : Icons.access_alarm_rounded),
          ],
        ),
      ),
    );
  }
}
