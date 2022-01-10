import 'package:cinematri_app/shared/theme.dart';
import 'package:cinematri_app/ui/widget/custom_button.dart';
import 'package:flutter/material.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/image_get_started.png',
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Watch and Get Fun',
                  style: whiteTextStyle.copyWith(
                    fontSize: 32,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Boost your mood and make a good\nday by watching our greatest movie',
                  style: whiteTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: light,
                  ),
                  textAlign: TextAlign.center,
                ),
                CustomButton(
                  margin: const EdgeInsets.only(
                    top: 50,
                    bottom: 80,
                  ),
                  title: 'Get Started',
                  width: 220,
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/sign-up',
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
