// ignore_for_file: library_private_types_in_public_api

import 'package:firebase_attempt/database/firebase_functions.dart';
import 'package:flutter/material.dart';

class MembershipUpgradePage extends StatefulWidget {
  const MembershipUpgradePage({Key? key}) : super(key: key);

  @override
  _MembershipUpgradePageState createState() => _MembershipUpgradePageState();
}

class _MembershipUpgradePageState extends State<MembershipUpgradePage> {
  String _selectedMembership = '';
  bool _showDoneButton = false;
  final FirebaseFunctions firebaseFunctions = FirebaseFunctions();

  void showUpdatedMembershipDialog(String result) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(result),
          );
        });
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upgrade Membership'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Choose your membership plan:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildMembershipCard(
              title: 'Basic',
              price: '£2.99/month',
              description: 'Access to basic features',
              isSelected: _selectedMembership == 'Basic',
              onTap: () {
                setState(() {
                  _selectedMembership = 'Basic';
                  _showDoneButton = true;
                });
              },
            ),
            const SizedBox(height: 16),
            _buildMembershipCard(
              title: 'Middle Tier',
              price: '£9.99/month',
              description: 'Access to some more features',
              isSelected: _selectedMembership == 'Middle Tier',
              onTap: () {
                setState(() {
                  _selectedMembership = 'Middle Tier';
                  _showDoneButton = true;
                });
              },
            ),
            const SizedBox(height: 16),
            _buildMembershipCard(
              title: 'Premium',
              price: '£14.99/month',
              description: 'Access to premium features',
              isSelected: _selectedMembership == 'Premium',
              onTap: () {
                setState(() {
                  _selectedMembership = 'Premium';
                  _showDoneButton = true;
                });
              },
            ),
            const SizedBox(height: 50),
            if (_showDoneButton)
              ElevatedButton(
                onPressed: () async {
                  final result = await firebaseFunctions
                      .updateMembershipType(_selectedMembership);
                  showUpdatedMembershipDialog(result);
                },
                child: const Text('Done'),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildMembershipCard({
    required String title,
    required String price,
    required String description,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: isSelected ? Colors.blue.withOpacity(0.25) : null,
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey,
            width: isSelected ? 2.0 : 1.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              Text(
                price,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentIcon({
    required IconData icon,
    required String paymentMethod,
    required Color backgroundColor,
  }) {
    return FractionallySizedBox(
      widthFactor: 1.1,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.grey, width: 1.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Icon(icon, size: 40, color: Colors.white),
              const SizedBox(height: 8),
              Text(
                paymentMethod,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
