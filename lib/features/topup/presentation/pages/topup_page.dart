import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topup_app/dependency_injection.dart';
import 'package:topup_app/features/topup/domain/entities/card_details.dart';
import 'package:topup_app/features/topup/presentation/bloc/topup_bloc.dart';
import 'package:topup_app/features/topup/presentation/bloc/topup_bloc/topup_form_bloc.dart';
import 'package:topup_app/features/topup/presentation/bloc/topup_event.dart';
import 'package:topup_app/features/topup/presentation/bloc/topup_state.dart';
import 'package:topup_app/features/topup/presentation/pages/widgets/topup_form.dart';
import 'package:topup_app/packages/constants/color_values.dart';
import 'package:url_launcher/url_launcher.dart';

class TopupPage extends StatefulWidget {
  const TopupPage({super.key});

  @override
  State<TopupPage> createState() => _TopupPageState();
}

class _TopupPageState extends State<TopupPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TopupBloc(serviceLocator()),
      child: Scaffold(
        body: BlocListener<TopupBloc, TopupState>(
          listener: (context, state) async {
            if (state is TopupSuccess) {
              final uri = Uri.parse(state.invoiceUrl);
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri, mode: LaunchMode.externalApplication);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Could not open invoice URL')),
                );
              }
            }

            if (state is TopupError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
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
          child: Text(
            'Topup Your Account',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          padding: const EdgeInsets.all(16.0),
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
                    child: Text(
                      '\$1,250.00',
                      style: Theme.of(context).textTheme.headlineLarge
                          ?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        TopupForm(
          
        ),

        SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
              backgroundColor: AppColors.primary50,
            ),
            onPressed: () {
              print('Top Up Now pressed');
              final formState = context.read<TopupFormBloc>().state;
              
              if (formState.selectedCurrency == null || 
              formState.amount.isEmpty ||
              formState.cardNumber.isEmpty ||
              formState.cvv.isEmpty || 
              formState.expiryMonth.isEmpty ||
              formState.expiryYear.isEmpty) {
                formState.isFormValid == false;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Please fill in all required fields')),
                );
              }

              context.read<TopupBloc>().add(
                SubmitTopup(
                  amount: int.parse(formState.amount),
                  currency: formState.selectedCurrency!,
                  cardDetails: CardDetails(
                    cardNumber: formState.cardNumber,
                    cvv: formState.cvv,
                    expiryMonth: formState.expiryMonth,
                    expiryYear: formState.expiryYear,
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
