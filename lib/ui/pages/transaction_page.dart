import 'package:cinematri_app/cubit/transaction_cubit.dart';
import 'package:cinematri_app/shared/theme.dart';
import 'package:cinematri_app/ui/widget/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void initState() {
    context.read<TransactionCubit>().fetchTransactions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        if (state is TransactionLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TransactionSuccess) {
          // ignore: prefer_is_empty
          if (state.transactions.length == 0) {
            return Container(
              margin: EdgeInsets.only(
                left: defaultMargin,
                right: defaultMargin,
                bottom: 30,
                top: 60,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Recents\nTransaction',
                    style: whiteTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(
                    height: 250,
                  ),
                  Center(
                    child: Text(
                      'You have no transaction yet..',
                      style: whiteTextStyle,
                    ),
                  )
                ],
              ),
            );
          } else {
            return ListView(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: defaultMargin,
                  ),
                  child: Text(
                    'Your Recents\nTransaction',
                    style: whiteTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                    ),
                  ),
                ),
                ListView.builder(
                    itemCount: state.transactions.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    padding: EdgeInsets.only(
                      left: defaultMargin,
                      right: defaultMargin,
                      bottom: 100,
                    ),
                    itemBuilder: (context, index) {
                      return TransactionCard(
                        state.transactions[index],
                      );
                    }),
              ],
            );
          }
        }

        return Center(
          child: Text(
            'Transaction Page',
            style: whiteTextStyle,
          ),
        );
      },
    );
  }
}
