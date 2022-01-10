import 'package:cinematri_app/shared/theme.dart';
import 'package:cinematri_app/ui/widget/custom_button.dart';
import 'package:cinematri_app/ui/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: const EdgeInsets.only(
          top: 30,
        ),
        child: Text(
          'Join us and get\nyour next journey',
          style: whiteTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget inputSection() {
      Widget nameInput() {
        return const CustomTextFormField(
          title: 'Full Name',
          hintText: 'Your full name',
        );
      }

      Widget emailInput() {
        return const CustomTextFormField(
          title: 'Email Address',
          hintText: 'Your email address',
        );
      }

      Widget passwordInput() {
        return const CustomTextFormField(
          title: 'Password',
          hintText: 'Your password',
          obsecureText: true,
        );
      }

      Widget cityInput() {
        return const CustomTextFormField(
          title: 'City',
          hintText: 'Your city',
        );
      }

      Widget submitButton() {
        return CustomButton(
          margin: const EdgeInsets.only(
            top: 30,
          ),
          title: 'Get Started',
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, '/main', (route) => false);
          },
        );
      }

      return Container(
        margin: const EdgeInsets.only(
          top: 30,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: kDarkBlueColor,
          borderRadius: BorderRadius.circular(
            defaultRadius,
          ),
        ),
        child: Column(
          children: [
            nameInput(),
            emailInput(),
            passwordInput(),
            cityInput(),
            submitButton(),
          ],
        ),
      );
    }

    Widget signInButton() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/sign-in');
        },
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(
            top: 50,
            bottom: 73,
          ),
          child: Text(
            'Have an account? Sign In',
            style: greyTextStyle.copyWith(
              fontSize: 16,
              fontWeight: light,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          children: [
            title(),
            inputSection(),
            signInButton(),
          ],
        ),
      ),
    );
  }
}
