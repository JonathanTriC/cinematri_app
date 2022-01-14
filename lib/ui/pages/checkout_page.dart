import 'package:cinematri_app/cubit/auth_cubit.dart';
import 'package:cinematri_app/cubit/transaction_cubit.dart';
import 'package:cinematri_app/models/transaction_model.dart';
import 'package:cinematri_app/shared/theme.dart';
import 'package:cinematri_app/ui/widget/booking_details_item.dart';
import 'package:cinematri_app/ui/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CheckoutPage extends StatelessWidget {
  final TransactionModel transaction;
  const CheckoutPage(this.transaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: const EdgeInsets.only(
          top: 50,
        ),
        child: Text(
          'Continue Your\nCheckout',
          style: whiteTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget bookingDetails() {
      return Column(
        children: [
          Container(
            width: double.infinity,
            height: 50,
            margin: const EdgeInsets.only(
              top: 30,
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/image_ticket_top.png',
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 30,
            ),
            decoration: BoxDecoration(
              color: kGoldColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // NOTE: Destination Tile
                Row(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      margin: const EdgeInsets.only(
                        right: 16,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            transaction.movie.imageUrl,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transaction.movie.name,
                            style: blackTextStyle.copyWith(
                              fontSize: 18,
                              fontWeight: medium,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            transaction.movie.genre,
                            style: blackTextStyle.copyWith(
                              fontWeight: light,
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          margin: const EdgeInsets.only(right: 2),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/icon_star.png',
                              ),
                            ),
                          ),
                        ),
                        Text(
                          transaction.movie.rating.toString(),
                          style: blackTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                        )
                      ],
                    ),
                  ],
                ),

                // NOTE: Booking Details Text
                Container(
                  margin: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: Text(
                    'Booking Details',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                ),

                // NOTE: Booking Details Item
                BookingDetailsItem(
                  title: 'Ticket',
                  valueText: '${transaction.amountOfPerson} Person',
                  valueColor: kBlackColor,
                ),
                BookingDetailsItem(
                  title: 'Seat',
                  valueText: transaction.selectedSeat,
                  valueColor: kBlackColor,
                ),
                BookingDetailsItem(
                  title: 'Tax',
                  valueText: '${(transaction.tax * 100).toStringAsFixed(0)}%',
                  valueColor: kBlackColor,
                ),
                BookingDetailsItem(
                  title: 'Price',
                  valueText: NumberFormat.currency(
                    locale: 'id',
                    symbol: 'IDR ',
                    decimalDigits: 0,
                  ).format(transaction.price),
                  valueColor: kBlackColor,
                ),
                BookingDetailsItem(
                  title: 'Grand Total',
                  valueText: NumberFormat.currency(
                    locale: 'id',
                    symbol: 'IDR ',
                    decimalDigits: 0,
                  ).format(transaction.grandTotal),
                  valueColor: kPurpleColor,
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/image_ticket_bottom.png',
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget paymentDetails() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: const EdgeInsets.only(
                top: 30,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: kDarkBlueColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payments Details',
                    style: whiteTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 16,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          height: 70,
                          margin: const EdgeInsets.only(
                            right: 16,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/image_card.png',
                              ),
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  margin: const EdgeInsets.only(
                                    right: 6,
                                  ),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/icon_logo.png',
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  'Pay',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: medium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                NumberFormat.currency(
                                  locale: 'id',
                                  symbol: 'IDR ',
                                  decimalDigits: 0,
                                ).format(state.user.balance),
                                style: whiteTextStyle.copyWith(
                                  fontSize: 18,
                                  fontWeight: medium,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Current Balance',
                                style: greyTextStyle.copyWith(
                                  fontWeight: light,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }

          return const SizedBox();
        },
      );
    }

    Widget payNowButton() {
      return BlocConsumer<TransactionCubit, TransactionState>(
        listener: (context, state) {
          if (state is TransactionSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/success', (route) => false);
          } else if (state is TransactionFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: kDarkBlueColor,
                content: Text(state.error),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is TransactionLoading) {
            return Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(
                top: 30,
              ),
              child: const CircularProgressIndicator(),
            );
          }
          return CustomButton(
            title: 'Pay Now',
            onPressed: () {
              context.read<TransactionCubit>().createTransaction(transaction);
            },
            margin: const EdgeInsets.only(
              top: 30,
            ),
          );
        },
      );
    }

    Widget tacButton() {
      return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(
          vertical: 30,
        ),
        child: Text(
          'Terms and Conditions',
          style: greyTextStyle.copyWith(
            fontSize: 16,
            fontWeight: light,
            decoration: TextDecoration.underline,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          title(),
          bookingDetails(),
          paymentDetails(),
          payNowButton(),
          tacButton(),
        ],
      ),
    );
  }
}
