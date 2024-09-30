import 'dart:math';

import 'package:bmiapp/result.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = true;
  double heightVal = 170;

  int weight = 55;
  int age = 33;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Body Mass Index'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //gender Expanded
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        genderExpanded(context, 'male'),
                        const SizedBox(
                          width: 15,
                        ),
                        genderExpanded(context, 'female'),
                      ],
                    ),
                  ),
                ),
                //height slider
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration:  BoxDecoration(
                        borderRadius:  BorderRadius.circular(10),
                        color: Colors.blueGrey,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Height',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            textBaseline: TextBaseline.alphabetic,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            children: [
                              Text(heightVal.toStringAsFixed(1),style: Theme.of(context).textTheme.headlineLarge),
                              Text('CM',style: Theme.of(context).textTheme.bodySmall),

                            ],

                          ),
                          Slider(
                            min: 50,
                            max:220,
                            value: heightVal,
                            onChanged: (newValue) => setState(() {
                              heightVal = newValue;
                            }),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),

                //age and weight Expanded
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        ageWeightExpanded(context, 'age'),
                        const SizedBox(
                          width: 10,
                        ),
                        ageWeightExpanded(context, 'weight'),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.teal,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 16,
                  child: TextButton(
                    onPressed: () {
                      var result = (weight / pow((heightVal / 100), 2));
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => Result(
                                isMale: isMale, age: age, result: result)),
                      );
                    },
                    child: Text(
                      'Calculate',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded genderExpanded(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isMale = type == 'male' ? true : false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
              color:
                  ((type == 'male' && isMale) || (!isMale && type == 'female'))
                      ? Colors.teal
                      : Colors.blueGrey,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(type == 'male' ? Icons.male : Icons.female),
              const SizedBox(
                height: 15,
              ),
              Text(
                type == 'male' ? 'Male' : 'Female',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded ageWeightExpanded(BuildContext context, String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blueGrey, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              type == 'age' ? 'Age' : 'Weight',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              type == 'age' ? '$age' : '$weight',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: type == 'age' ? 'age--' : 'weight--',
                  onPressed: () =>
                      setState(() => type == 'age' ? age-- : weight--),
                  shape: const CircleBorder(),
                  backgroundColor: Colors.teal,
                  mini: true,
                  child: const Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                FloatingActionButton(
                  heroTag: type == 'age' ? 'age++' : 'weight++',
                  onPressed: () =>
                      setState(() => type == 'age' ? age++ : weight++),
                  shape: const CircleBorder(),
                  backgroundColor: Colors.teal,
                  mini: true,
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
