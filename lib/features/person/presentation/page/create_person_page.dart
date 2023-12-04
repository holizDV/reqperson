import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/appbar/appbar_main.dart';
import '../../../../common/button/primary_button.dart';
import '../../../../common/field/textsin_field.dart';
import '../../../../common/widget/loading_fading.dart';
import '../../../../common/widget/message_toast.dart';
import '../../../../common/widget/success_dialog.dart';
import '../../../../config/theme/theme.dart';
import '../../../../utils/injection/injection.dart';
import '../cubit/person_cubit.dart';

@RoutePage()
class CreatePersonPage extends StatelessWidget {
  CreatePersonPage({super.key});

  final _personCubit = getIt<PersonCubit>();

  final _nameCtrl = TextEditingController();
  final _jobCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _personCubit,
      child: Scaffold(
        appBar: AppbarMain(title: "create person".toUpperCase()),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSize.s24,
                        vertical: AppSize.s16,
                      ),
                      child: Form(
                        onChanged: () => _personCubit.onChangeForm(
                          name: _nameCtrl.text,
                          job: _jobCtrl.text,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: AppSize.s40),
                            TextSinField(
                              textController: _nameCtrl,
                              hintText: "Name",
                            ),
                            const SizedBox(height: AppSize.s28),
                            TextSinField(
                              textController: _jobCtrl,
                              hintText: "Job",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              BlocConsumer<PersonCubit, PersonState>(
                listener: (context, state) {
                  state.maybeWhen(
                    orElse: SizedBox.shrink,
                    loading: (isLoading) =>
                        LoadingFading.instance.show(context, isLoading),
                    error: (error) =>
                        MessageToast.instance.showError(context, error.message),
                    loaded: () {
                      SuccessDialog.instance.show(context);
                    },
                  );
                },
                builder: (context, state) {
                  final isDisable =
                      state.whenOrNull(formValid: (isValid) => isValid) ??
                          false;

                  return PrimaryButton(
                    text: "Create",
                    isDisable: !isDisable,
                    onTap: () {
                      _personCubit.onCreate(
                          name: _nameCtrl.text, job: _jobCtrl.text);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
