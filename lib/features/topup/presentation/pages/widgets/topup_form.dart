import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topup_app/features/topup/domain/entities/card_details.dart';
import 'package:topup_app/features/topup/presentation/bloc/topup_bloc/topup_form_bloc.dart';
import 'package:topup_app/features/topup/presentation/bloc/topup_bloc/topup_form_event.dart';
import 'package:topup_app/features/topup/presentation/bloc/topup_bloc/topup_form_state.dart';
import 'package:topup_app/features/topup/presentation/pages/widgets/textfield_global.dart';

class TopupForm extends StatelessWidget {
  List<String> currency = ['USD', 'IDR'];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopupFormBloc, TopupFormState>(
      builder: (context, state) => Container(
    child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextfieldGlobal(
                  title: 'Amount to Top-up', 
                  inputType: TextInputType.number, 
                  placeholder: 'Input amount',
                  onChanged: (amount) {
                    context.read<TopupFormBloc>().add(AmountChanged(amount));
                  },
                ),
                const SizedBox(height: 16.0),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: DropdownButton<String>(
                    borderRadius: BorderRadius.circular(4.0),
                    hint: const Text('Select Currency'),
                    value: state.selectedCurrency,
                    isExpanded: true,
                    items: List.from(currency.map((c) => DropdownMenuItem(value: c, child: Text(c)))), 
                    onChanged: (value) => {
                    context.read<TopupFormBloc>().add(
                      SelectedCurrencyChanged(value!),
                    ),
                },
                    ),
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: TextfieldGlobal(
                        title: 'Card number',
                        inputType: TextInputType.text,
                        placeholder: 'input card number',
                        onChanged: (cardNumber) => {
                          context.read<TopupFormBloc>().add(
                            CardNumberChanged(cardNumber))
                        },
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextfieldGlobal(
                          title: 'CVV',
                          inputType: TextInputType.text,
                          placeholder: 'CVV',
                          onChanged: (cvv) => {
                          context.read<TopupFormBloc>().add(
                            CvvChanged(cvv),
                          ),
                        },
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextfieldGlobal(
                        title: 'Expiry Month',
                        inputType: TextInputType.text,
                        placeholder: 'Input expiry month',
                        onChanged: (expiryMonth) => {
                        context.read<TopupFormBloc>().add(
                          ExpiryMonthChanged(expiryMonth),
                        ),
                      },
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextfieldGlobal(
                          title: 'Expiry Year',
                          inputType: TextInputType.text,
                          placeholder: 'Input expiry year',
                          onChanged: (expiryYear) => {
                          context.read<TopupFormBloc>().add(
                            ExpiryYearChanged(expiryYear),
                          ),
                        },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ));
  }
}
