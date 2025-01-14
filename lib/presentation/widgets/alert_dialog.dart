import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../index.dart';

Future<Widget?> showExitDialog(BuildContext context, String exitRoute) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Stack(
          children: [
            Container(
              height: 200.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: AppColors.greyColors.shade50,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0, bottom: 23.0),
                    child: Text(
                      '나가기',
                      style: TextStyle(
                        color: AppColors.greyColors.shade700,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Text(
                    '회원가입이 완료되지 않았습니다.\n나가시겠습니까?',
                    style: TextStyle(
                      color: AppColors.greyColors.shade700,
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            context.pop();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.primaryLightColors.shade400,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(16.0),
                              ),
                            ),
                            height: 48,
                            child: Text(
                              '취소',
                              style: TextStyle(
                                color: AppColors.greyColors.shade700,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            context
                                .read<AuthCubit>()
                                .resetAuthenticationStatus();
                            context.go(exitRoute);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(16.0),
                              ),
                              color: AppColors.primaryLightColors,
                            ),
                            height: 48.0,
                            child: Text(
                              '나가기',
                              style: TextStyle(
                                color: AppColors.greyColors.shade700,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
