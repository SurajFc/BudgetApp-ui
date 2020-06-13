import 'package:budgetApp/models/category_model.dart';
import 'package:budgetApp/models/expense_model.dart';
import 'package:budgetApp/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CategoryScreen extends StatefulWidget {
  final Category category;
  CategoryScreen({this.category});

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  _buildExpenses() {
    List<Widget> expenseList = [];
    widget.category.expenses.forEach((Expense expense) {
      expenseList.add(
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          height: 80.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 2),
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CustomTextStyle(
                  font: FontWeight.bold,
                  size: 20.0,
                  text: expense.name,
                ),
                CustomTextStyle(
                  text: '~\$${expense.cost.toStringAsFixed(2)}',
                  size: 20.0,
                  font: FontWeight.w600,
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ),
      );
    });
    return Column(
      children: expenseList,
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalAmountSpend = 0;
    widget.category.expenses.forEach((Expense expense) {
      totalAmountSpend += expense.cost;
    });
    final double amountLeft = widget.category.maxAmount - totalAmountSpend;
    final double percent = amountLeft / widget.category.maxAmount;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            iconSize: 30.0,
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(20.0),
              height: 250.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 2),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Center(
                child: CircularPercentIndicator(
                  radius: 200.0,
                  // startAngle: 0.0,
                  lineWidth: 10.0,
                  animation: true,
                  animationDuration: 1500,
                  percent: percent,
                  center: CustomTextStyle(
                    text:
                        '\$${amountLeft.toStringAsFixed(2)}/ \$${widget.category.maxAmount}',
                    size: 20.0,
                    font: FontWeight.w600,
                  ),
                  progressColor: Theme.of(context).primaryColor,
                ),
              ),
            ),
            _buildExpenses(),
          ],
        ),
      ),
    );
  }
}
