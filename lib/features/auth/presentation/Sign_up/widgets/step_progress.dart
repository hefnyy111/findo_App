// features/auth/presentation/Sign_up/widgets/step_progress.dart
import 'package:Ascend/shared/core/constants/constants.dart';
import 'package:flutter/material.dart';

class StepProgress extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const StepProgress({
    super.key,
    required this.currentStep,
    required this.totalSteps,
  });

  @override
  Widget build(BuildContext context) {
    double progress = currentStep / totalSteps;

    return Padding(
      padding: const EdgeInsets.symmetric( vertical: 12),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // ******************************* Container
                    Container(
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade800,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    // ******************************* FractionallySizedBox
                    FractionallySizedBox(
                      widthFactor: progress,
                      child: Container(
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.cyanAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    // ******************************* Positioned
                    Positioned(
                      right: 120,
                      bottom: -15,
                      child: Container(
                        height: 37,
                        width: 37,
                        decoration: BoxDecoration(
                          color: Colors.cyanAccent,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            '$currentStep',
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    
                  ],
                ),
              ),
            ],
          ),
          // ******************************* Sizebox
          const SizedBox(height: 10),
          // ******************************* Align
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Step $currentStep of $totalSteps',
              style: const TextStyle(color: AppColors.kGreyColor),
            ),
          ),
        ],
      ),
    );
  }
}
