import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/appbar/appbar_main.dart';
import '../../../../common/button/primary_button.dart';
import '../../../../common/field/password_field.dart';
import '../../../../common/field/textsin_field.dart';
import '../../../../common/widget/loading_fading.dart';
import '../../../../common/widget/message_toast.dart';
import '../../../../config/router/app_router.gr.dart';
import '../../../../config/theme/theme.dart';
import '../../../../utils/injection/injection.dart';
import '../cubit/registration_cubit.dart';

@RoutePage()
class RegistrationPage extends StatelessWidget {
  RegistrationPage({super.key});

  final _registrationCubit = getIt<RegistrationCubit>();

  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _registrationCubit,
      child: Scaffold(
        appBar: AppbarMain(title: "registration person".toUpperCase()),
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
                        onChanged: () => _registrationCubit.onChangeForm(
                          email: _emailCtrl.text,
                          password: _passwordCtrl.text,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: AppSize.s40),
                            TextSinField(
                              textController: _emailCtrl,
                              hintText: "Email",
                              keyboardType: TextInputType.emailAddress,
                            ),
                            const SizedBox(height: AppSize.s28),
                            PasswordField(
                              textController: _passwordCtrl,
                              hintText: "Password",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              BlocConsumer<RegistrationCubit, RegistrationState>(
                listener: (context, state) {
                  state.maybeWhen(
                    orElse: SizedBox.shrink,
                    loading: (isLoading) =>
                        LoadingFading.instance.show(context, isLoading),
                    error: (error) =>
                        MessageToast.instance.showError(context, error.message),
                    loaded: () => context.router.replaceAll([PersonRoute()]),
                  );
                },
                builder: (context, state) {
                  final isDisable =
                      state.whenOrNull(formValid: (isValid) => isValid) ??
                          false;

                  return PrimaryButton(
                    text: "Registration",
                    isDisable: !isDisable,
                    onTap: () {
                      _registrationCubit.onRegister(
                          email: _emailCtrl.text, password: _passwordCtrl.text);
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
