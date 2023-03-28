import 'package:flutter/material.dart';

class MyStepperPage extends StatefulWidget {
  const MyStepperPage({super.key});

  @override
  State<MyStepperPage> createState() => _MyStepperPageState();
}

class _MyStepperPageState extends State<MyStepperPage> {
  int stepIndex = 0;
  List<Step> getStep() => [
        Step(
            isActive: stepIndex >= 0,
            title: Text("data"),
            content: Container()),
        Step(
            isActive: stepIndex >= 1,
            title: Text("dat1"),
            content: Container()),
        Step(
            isActive: stepIndex == 2,
            title: Text("dat2"),
            content: Container()),
      ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stepper(
            type: StepperType.horizontal,
            currentStep: stepIndex,
            onStepCancel: () {
              if (stepIndex <= 1) {
                setState(() {
                  stepIndex--;
                });
              }
            },
            onStepContinue: () {
              if (stepIndex <= 0) {
                setState(() {
                  stepIndex++;
                });
              }
            },
            steps: getStep()),
      ),
    );
  }
}
