import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class newTransaction extends StatefulWidget {
  final Function addtx;

  newTransaction(this.addtx);

  @override
  _newTransactionState createState() => _newTransactionState();
}

class _newTransactionState extends State<newTransaction> {
  final titlecontroller = TextEditingController();
  final amountcontroller = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    final enteredtitle = titlecontroller.text;
    final enteredamount = double.parse(amountcontroller.text);

    if (enteredtitle.isEmpty || enteredamount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addtx(enteredtitle, enteredamount, _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              //onChanged: (val) {
              //titleinput = val;
              //},
              controller: titlecontroller,
              keyboardType: TextInputType.name,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              decoration: InputDecoration(labelText: "Title"),
              onSubmitted: (value) => _submitData(),
            ),
            TextField(
                //onChanged: (val) {
                //amountinput = val;
                //},
                controller: amountcontroller,
                keyboardType: TextInputType.number,
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                decoration: InputDecoration(labelText: "Amount"),
                onSubmitted: (value) => _submitData()),
            Container(
              height: 70,
              child: Row(
                children: [
                  Text(
                    _selectedDate == null
                        ? "No Date Choosen"
                        : "Picked Date : ${DateFormat.yMMMd().format(_selectedDate)}",
                    style: TextStyle(fontFamily: 'Quicksans', fontSize: 16),
                  ),
                  // FlatButton(
                  //   onPressed: _presentDatePicker,
                  //   child: Text(
                  //     "Choose Date",
                  //     style:
                  //         TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  //   ),
                  //   textColor: Colors.blueAccent,
                  // )
                  SizedBox(
                    width: 20,
                  ),
                  IconButton(
                      onPressed: _presentDatePicker,
                      color: Colors.blueAccent,
                      icon: Icon(Icons.calendar_today)),
                ],
              ),
            ),
            RaisedButton(
              onPressed: _submitData,
              color: Colors.blueAccent,
              child: Text(
                "Add Transaction",
                style: TextStyle(
                    fontFamily: 'Quicksans',
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.white),
              ),
              textColor: Colors.purple,
              splashColor: Colors.pink,
            )
          ],
        ),
      ),
    );
  }
}
