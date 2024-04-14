import 'package:flutter/material.dart';
import 'package:partyguam/app/theme/colors.dart';

class SignUpDetailsStepper extends StatefulWidget {
  const SignUpDetailsStepper({super.key});

  @override
  State<SignUpDetailsStepper> createState() => _SignUpDetailsStepperState();
}

class _SignUpDetailsStepperState extends State<SignUpDetailsStepper> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    List<Step> getSteps = [
      Step(
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 0,
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
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 1,
        title: const Text(
          '경력&포지션',
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        content: Container(),
      ),
      Step(
        state: currentStep > 2 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 2,
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
      child: Container(
        height: 200,
        child: Stepper(
          elevation: 0,
          connectorThickness: 2.0,
          // controlsBuilder: (BuildContext context, ControlsDetails details) {
          //   return Container();
          // },
          currentStep: currentStep,
          onStepContinue: () {
            final isLastStep = currentStep == getSteps.length - 1;
            setState(
              () {
                if (isLastStep) {
                  /// 데이터 전송
                  print('completed');
                } else {
                  currentStep += 1;
                }
              },
            );
          },
          onStepCancel: () {
            currentStep == 0
                ? null
                : setState(
                    () {
                      currentStep -= 1;
                    },
                  );
          },
          type: StepperType.horizontal,
          steps: getSteps,
        ),
      ),
    );
  }
}
