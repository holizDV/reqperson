import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/button/primary_button.dart';
import '../../../../common/field/password_field.dart';
import '../../../../common/field/textsin_field.dart';
import '../../../../common/widget/loading_fading.dart';
import '../../../../common/widget/message_toast.dart';
import '../../../../config/router/app_router.gr.dart';
import '../../../../config/theme/theme.dart';
import '../../../../utils/injection/injection.dart';
import '../cubit/login_cubit.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _loginCubit = getIt<LoginCubit>();

  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _loginCubit,
      child: Scaffold(
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
                        onChanged: () => _loginCubit.onChangeForm(
                          email: _emailCtrl.text,
                          password: _passwordCtrl.text,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "welcome person".toUpperCase(),
                              style: Typograph.titleH3,
                            ),
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
                            const SizedBox(height: 52),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don`t have account ? ",
                                  style: Typograph.text12Regular,
                                ),
                                InkWell(
                                  onTap: () =>
                                      context.router.push(RegistrationRoute()),
                                  child: Text(
                                    "Create Account",
                                    style: Typograph.text12Regular.copyWith(
                                      color: AppColor.statusWarning,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              BlocConsumer<LoginCubit, LoginState>(
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
                    text: "Login",
                    isDisable: !isDisable,
                    onTap: () {
                      _loginCubit.onLogin(
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
