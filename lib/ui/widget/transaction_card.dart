import 'package:cinematri_app/models/transaction_model.dart';
import 'package:cinematri_app/shared/theme.dart';
import 'package:cinematri_app/ui/widget/booking_details_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionCard(this.transaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
