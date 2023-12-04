import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/widget/loading_screen_dialog.dart';
import '../../../../common/widget/message_toast.dart';
import '../../../../config/router/app_router.gr.dart';
import '../../../../config/theme/theme.dart';
import '../../../../utils/injection/injection.dart';
import '../cubit/fetch_person_cubit.dart';
import '../widget/person_card.dart';

@RoutePage()
class PersonPage extends StatelessWidget {
  PersonPage({super.key});

  final _fetchPersonCubit = getIt<FetchPersonCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _fetchPersonCubit..fetchPerson(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton.small(
          onPressed: () => context.router.push(CreatePersonRoute()),
          backgroundColor: AppColor.brandBlue,
          child: const Icon(Icons.add),
        ),
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: AppSize.s24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
                child: Text(
                  "List Person",
                  style: Typograph.text16Medium,
                ),
              ),
              const SizedBox(height: AppSize.s20),
              BlocBuilder<FetchPersonCubit, FetchPersonState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: SizedBox.shrink,
                    loading: () => const Expanded(child: LoadingScreenDialog()),
                    error: (error) =>
                        MessageToast.instance.showError(context, error.message),
                    loaded: (users) {
                      final itemCount = users.length;

                      return Expanded(
                        child: RefreshIndicator(
                          onRefresh: _fetchPersonCubit.onRefresh,
                          color: AppColor.backgroundCard,
                          child: ListView.separated(
                            itemCount: itemCount,
                            separatorBuilder: (_, __) =>
                                const SizedBox(height: AppSize.s16),
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSize.s16),
                            itemBuilder: (context, index) {
                              final data = users[index];

                              return PersonCard(
                                email: data.email ?? "-",
                                fullName: "${data.firstName} ${data.lastName}",
                                onTap: () {},
                              );
                            },
                          ),
                        ),
                      );
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
