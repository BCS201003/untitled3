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
    // Fetch the screen dimensions using MediaQuery
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
          // Container for the main content, with dynamic height based on the screen size
          Container(
            height: screenHeight * 0.7, // Set height relative to screen height (70%)
            padding: EdgeInsets.all(screenWidth * 0.02), // Padding relative to screen width
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight * 0.02), // Spacing relative to screen height

                  // Billing Address
                  const BillingAddressContainer(),
                  SizedBox(height: screenHeight * 0.02), // Spacing between sections

                  // Payment Method
                  const PaymentMethodContainer(),
                  SizedBox(height: screenHeight * 0.02), // Spacing between sections

                  // Order Review
                  const OrderReviewContainer(),
                  SizedBox(height: screenHeight * 0.02), // Spacing between sections

                  // Billing Summary
                  const BillingSummaryContainer(),
                  SizedBox(height: screenHeight * 0.01), // Small spacing before PayWidget
                ],
              ),
            ),
          ),

          // Container for the PayWidget, with dynamic padding
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05, // Padding relative to screen width
            ),
            child: const PayWidget(),
          ),
        ],
      ),
    );
  }
}
