import 'package:flutter/material.dart';

class SignUpDetailsStepper extends StatefulWidget {
  const SignUpDetailsStepper({super.key});

  @override
  State<SignUpDetailsStepper> createState() => _SignUpDetailsStepperState();
}

class _SignUpDetailsStepperState extends State<SignUpDetailsStepper> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Stepper(
        elevation: 0,
        currentStep: currentStep,
        type: StepperType.horizontal,
        steps: [
          Step(
            title: Text('관심지역'),
            content: Container(),
          ),
          Step(
            title: Text('경력&포지션'),
            content: Container(),
          ),
          Step(
            title: Text('성향선택(1/4)'),
            content: Container(),
          ),
        ],
      ),
    );
  }
}
