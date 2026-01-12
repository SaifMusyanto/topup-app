import 'package:flutter/material.dart';
import 'package:topup_app/features/topup/domain/entities/card_details.dart';
import 'package:topup_app/features/topup/presentation/pages/widgets/textfield_global.dart';

class TopupForm extends StatefulWidget {
  const TopupForm({super.key});

  @override
  State<TopupForm> createState() => TopupFormState();
}

class TopupFormState extends State<TopupForm> {
  final amountController = TextEditingController();
  final cardNumberController = TextEditingController();
  final cvvController = TextEditingController();
  final expiryMonthController = TextEditingController();
  final expiryYearController = TextEditingController();

  List<String> currency = ['USD', 'IDR'];
  String? selectedCurrency;

  CardDetails buildCardDetails() {
    return CardDetails(
      cardNumber: cardNumberController.text,
      cvv: cvvController.text,
      expiryMonth: expiryMonthController.text,
      expiryYear: expiryYearController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextfieldGlobal(
                  title: 'Amount to Top-up', 
                  inputType: TextInputType.number, 
                  placeholder: 'Input amount',
                  controller: amountController,
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
                    value: selectedCurrency,
                    isExpanded: true,
                    items: List.from(currency.map((c) => DropdownMenuItem(value: c, child: Text(c)))), 
                    onChanged: (String? value) { 
                      setState(() {
                        selectedCurrency = value;
                      });
                    },),
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
                        controller: cardNumberController,
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
                          controller: cvvController,
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
                        controller: expiryMonthController,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextfieldGlobal(
                          title: 'Expiry Year',
                          inputType: TextInputType.text,
                          placeholder: 'Input expiry year',
                          controller: expiryYearController,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
