import 'package:flutter/material.dart';

import '../components/PaymentSuccess.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  String? selectedCard;
  final List<String> existingCards = [
    '**** **** **** 1934',
    '**** **** **** 5678'
  ];

  void _showDeliveryOptions() async {
    final selectedOption = await showModalBottomSheet<String>(
      context: context,
      builder: (context) => PaymentSuccess(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Payment method',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select existing card',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            DropdownButton<String>(
              hint: const Text('Select a card'),
              value: selectedCard,
              isExpanded: true,
              items: existingCards.map((String card) {
                return DropdownMenuItem<String>(
                  value: card,
                  child: Text(card),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedCard = newValue;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Or input new card',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Card number',
                border: OutlineInputBorder(),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/logo/visa.png', // Visa logo asset
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 8),
                    Image.asset(
                      'assets/images/logo/mastercard.png', // MasterCard logo asset
                      width: 24,
                      height: 24,
                    ),
                  ],
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Exp date',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Security code',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Card holder',
                border: OutlineInputBorder(),
              ),
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Order Summary',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\$2499.97',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 280,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle payment method selection here
                      _showDeliveryOptions();
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: const Color(0xFF67C4A7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8.0), // Đặt độ cong của góc thành 8.0
                      ),
                    ),
                    child: const Text(
                      'Select payment method',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
