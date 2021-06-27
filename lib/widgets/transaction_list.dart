import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deletTx;
  TransactionList(this.transaction, this.deletTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 540,
      width: 550,
      color: Colors.white,
      child: transaction.isEmpty
          ? Column(
              children: [
                Text(
                  "No Transaction Added Yet !!",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Quicksans',
                      fontSize: 25),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                    height: 200,
                    child: Image.asset(
                      'assets/waiting.png',
                      fit: BoxFit.cover,
                    ))
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.black,
                  margin: EdgeInsets.symmetric(horizontal: 7, vertical: 7),
                  elevation: 6,
                  child: ListTile(
                    leading: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: FittedBox(
                            child: Text(
                          "Rs. " + transaction[index].amount.toString(),
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Quicksans'),
                        )),
                      ),
                    ),
                    title: Text(
                      transaction[index].title,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Opensans'),
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transaction[index].date),
                      style: TextStyle(
                          color: Colors.white70,
                          fontFamily: 'Opensans',
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Theme.of(context).errorColor,
                      ),
                      onPressed: () {
                        deletTx(transaction[index].id);
                      },
                    ),
                  ),
                );
              },
              itemCount: transaction.length,
            ),
    );
  }
}
