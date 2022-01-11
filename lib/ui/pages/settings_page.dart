import 'package:cinematri_app/cubit/auth_cubit.dart';
import 'package:cinematri_app/shared/theme.dart';
import 'package:cinematri_app/ui/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: const EdgeInsets.only(
          top: 50,
        ),
        child: Text(
          'Your Profile',
          style: whiteTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget profileDetail() {
      return Center(
        child: Container(
          margin: const EdgeInsets.only(
            top: 50,
          ),
          child: Column(
            children: [
              Container(
                width: 150,
                height: 150,
                margin: const EdgeInsets.only(
                  bottom: 30,
                ),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/image_profile.png',
                    ),
                  ),
                ),
              ),
              Text(
                'Jonathan Tri',
                style: whiteTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: semiBold,
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget signOutButton() {
      return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: kDarkBlueColor,
                content: Text(state.error),
              ),
            );
          } else if (state is AuthInitial) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/sign-up', (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container(
            margin: const EdgeInsets.only(
              top: 50,
            ),
            child: Center(
              child: CustomButton(
                title: 'Sign Out',
                onPressed: () {
                  context.read<AuthCubit>().signOut();
                },
                width: 220,
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title(),
            profileDetail(),
            signOutButton(),
          ],
        ),
      ),
    );
  }
}
