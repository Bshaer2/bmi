import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result(
      {super.key,
      required this.isMale,
      required this.age,
      required this.result});

  final bool isMale;
  final int age;
  final double result;

  String get resultPhrase {
    String resultText = '';
    if (result >= 30) {
      resultText = 'Obese';
    } else if (result < 30 && result >= 25) {
      resultText = 'Overweight';
    } else if (result <= 24.9 && result >= 18.5) {
      resultText = 'Normal';
    } else {
      resultText = 'Underweight';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget> [
              Text('Gender: ${isMale ? 'Male' : 'Female'}',
                  style: Theme.of(context).textTheme.headlineLarge),
              Text('Result: ${result.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.headlineLarge),
              Text('Healthiness: $resultPhrase',
                  style: Theme.of(context).textTheme.headlineLarge, textAlign: TextAlign.center,),
              Text('Age: $age',
                  style: Theme.of(context).textTheme.headlineLarge,),
            ],
          ),
        ),
      ),
    );
  }
}
