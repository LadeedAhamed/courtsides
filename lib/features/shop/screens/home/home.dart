import 'package:courtsides/common/widgets/appbar/appbar.dart';
import 'package:courtsides/common/widgets/products_cart/cart_menu_icon.dart';
import 'package:courtsides/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:courtsides/features/shop/screens/home/widgets/primary_header_container.dart';
import 'package:courtsides/utils/constants/colors.dart';
import 'package:courtsides/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
                child: Column(
              children: [THomeAppBar()],
            ))
          ],
        ),
      ),
    );
  }
}
