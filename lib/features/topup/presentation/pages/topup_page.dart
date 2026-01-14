import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topup_app/dependency_injection.dart';
import 'package:topup_app/features/topup/domain/entities/card_details.dart';
import 'package:topup_app/features/topup/presentation/bloc/account/account_bloc.dart';
import 'package:topup_app/features/topup/presentation/bloc/account/account_event.dart';
import 'package:topup_app/features/topup/presentation/bloc/account/account_state.dart';
import 'package:topup_app/features/topup/presentation/bloc/topup_bloc.dart';
import 'package:topup_app/features/topup/presentation/bloc/topup_event.dart';
import 'package:topup_app/features/topup/presentation/bloc/topup_form/topup_form_bloc.dart';
import 'package:topup_app/features/topup/presentation/bloc/topup_state.dart';
import 'package:topup_app/features/topup/presentation/pages/widgets/topup_form.dart';
import 'package:topup_app/packages/constants/color_values.dart';
import 'package:url_launcher/url_launcher.dart';

class TopupPage extends StatelessWidget {
  const TopupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => serviceLocator<TopupFormBloc>(),
      child: Scaffold(
        body: BlocListener<TopupBloc, TopupState>(
          listener: (context, state) async {
            if (state is TopupSuccess) {
              context.read<AccountBloc>().add(RefreshBalance(state.amount));

              final uri = Uri.parse(state.invoiceUrl);
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri, mode: LaunchMode.externalApplication);
              } else {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Could not open invoice URL')),
                  );
                }
              }
            }

            if (state is TopupError) {
              if (context.mounted) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              }
            }
          },
          child: BlocBuilder<TopupBloc, TopupState>(
            builder: (context, state) {
              if (state is TopupLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              return _buildContent(context);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Topup Your Account',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 160,
          padding: EdgeInsets.all(16.0),
          child: Card(
            color: AppColors.primary50,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Balance:',
                    style: Theme.of(
                      context,
                    ).textTheme.titleLarge?.copyWith(color: Colors.white),
                  ),
                  SizedBox(height: 8.0),
                  Center(
                    child: BlocSelector<AccountBloc, AccountState, String>(
                      selector: (state) => state is AccountLoaded
                          ? '${state.currency} ${state.balance}'
                          : 'Loading...',
                      builder: (context, amount) {
                        return Text(
                          amount,
                          style: Theme.of(context).textTheme.headlineLarge
                              ?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        TopupForm(),
        SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50), // Make button full width
              backgroundColor: AppColors.primary50,
            ),
            onPressed: () {
              final formState = context.read<TopupFormBloc>().state;

              context.read<TopupBloc>().add(
                SubmitTopup(
                  amount: int.parse(formState.amount),
                  currency: formState.currency!,
                  cardDetails: CardDetails(
                    cardNumber: formState.cardNumber,
                    expiryMonth: formState.expiryMonth,
                    expiryYear: formState.expiryYear,
                    cvv: formState.cvv,
                  ),
                ),
              );
            },
            child: Text(
              'Top Up Now',
              style: TextStyle(fontSize: 18, color: AppColors.white),
            ),
          ),
        ),
      ],
    );
  }
}
