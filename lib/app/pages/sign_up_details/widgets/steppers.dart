import 'package:flutter/material.dart';

import '../../../theme/colors.dart';

class SignUpDetailsStepper extends StatefulWidget {
  const SignUpDetailsStepper({super.key, required this.currentStep});

  final int currentStep;

  @override
  State<SignUpDetailsStepper> createState() => _SignUpDetailsStepperState();
}

class _SignUpDetailsStepperState extends State<SignUpDetailsStepper> {
  @override
  Widget build(BuildContext context) {
    List<Step> stepList = [
      Step(
        state: widget.currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: widget.currentStep >= 0,
        title: const Text(
          '관심지역',
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        content: Container(),
      ),
      Step(
        state: widget.currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: widget.currentStep >= 1,
        title: const Text(
          '경력/포지션',
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        content: Container(),
      ),
      Step(
        state: widget.currentStep > 2 ? StepState.complete : StepState.indexed,
        isActive: widget.currentStep >= 2,
        title: const Text(
          '성향선택(1/4)',
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        content: Container(),
      ),
    ];

    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: AppColors.greyColors.shade50,
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: AppColors.primaryLightColors,
            ),
      ),
      child: SizedBox(
        height: 80,
        child: Stepper(
          elevation: 0,
          connectorThickness: 2.0,
          currentStep: widget.currentStep,
          type: StepperType.horizontal,
          steps: stepList,

          /// TODO: 디자인 변경 가능
          // stepIconBuilder: (int stepIndex, StepState stepState) {
          //   if (stepState == StepState.complete) {
          //     return const Icon(Icons.check, size: 20.0);
          //   }
          // },
        ),
      ),
    );
  }
}
