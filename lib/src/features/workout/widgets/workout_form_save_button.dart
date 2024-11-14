import 'package:ez_fit_app/src/features/_core/loading/loading_controller.codegen.dart';
import 'package:ez_fit_app/src/features/workout/controller/workout_save_controller.codegen.dart';
import 'package:ez_fit_app/src/features/workout/model/workout_model.codegen.dart';
import 'package:ez_fit_app/src/shared/ez_button/ez_button.dart';
import 'package:ez_fit_app/src/utils/extension/widget_ref_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WorkoutFormSaveButton extends ConsumerWidget {
  const WorkoutFormSaveButton(
      this.workout, {
        super.key,
        required this.isDisabled,
        required this.formKey,
      });

  final WorkoutModel Function() workout;
  final bool isDisabled;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watching the loading state of the WorkoutFormSaveController
    final saveState = ref.watch(workoutSaveControllerProvider);
    final isGeneralLoading = ref.watch(loadingControllerProvider);
    final isLoading = saveState.isLoading;

    return EzButton(
      text: ref.loc.save,
      isLoading: isLoading,
      onPressed: isLoading || isGeneralLoading || isDisabled
          ? null
          : () async {
        if (formKey.currentState?.validate() != true) return;
        final controller = ref.read(
          workoutSaveControllerProvider.notifier,
        );
        await controller.saveWorkout(workout());
      },
    );
  }
}