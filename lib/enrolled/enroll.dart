import 'package:flutter/material.dart';
import 'package:untitled/Widgets/Appbar/custom_appbar.dart';
import 'package:untitled/enrolled/Widgets/billing_address_container.dart';
import 'package:untitled/enrolled/Widgets/billing_summary_container.dart';
import 'package:untitled/enrolled/Widgets/order_review_container.dart';
import 'package:untitled/enrolled/Widgets/payment_method_container.dart';
import 'package:untitled/enrolled/Widgets/pay_widget.dart';

class EnrollScreen extends StatelessWidget {
  const EnrollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Payment Method',
        onBackPressed: () {
          Navigator.of(context).pop();
        },
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: screenHeight * 0.6,
            padding: EdgeInsets.all(screenWidth * 0.02),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight * 0.02),
                  // Billing
                  const BillingAddressContainer(),
                  SizedBox(height: screenHeight * 0.02),
                  // payments
                  const PaymentMethodContainer(),
                  SizedBox(height: screenHeight * 0.02),

                  // Order Review
                  const OrderReviewContainer(),
                  SizedBox(height: screenHeight * 0.02),

                  // Billing Summary
                  const BillingSummaryContainer(),
                  SizedBox(height: screenHeight * 0.01),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
            ),
            child: const PayWidget(),
          ),
        ],
      ),
    );
  }
}