import 'package:courtsides/common/widgets/appbar/appbar.dart';
import 'package:courtsides/features/shop/screens/cart/widgets/cart_item.dart';
import 'package:courtsides/features/shop/screens/checkout/checkout.dart';
import 'package:courtsides/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
          title: Text(
            'Cart',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          showBackArrow: true),
      body: const Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace), child: TCartItems()),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(const CheckoutScreen()),
            child: const Text('Checkout \$200.0')),
      ),
    );
  }
}
