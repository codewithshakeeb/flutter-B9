import 'dart:io';
class Expense {
  String name;
  double amount;
  Expense(this.name, this.amount);
}

List<Expense> myExpenses = [];
void main() {
  print("M.Shakeeb Expense Tracker App");
  bool runapp = true;

  while (runapp) {
    print('Enter what you want to do');
    print('1. Add Expense');
    print('2. View List');
    print('3. Delete');
    print('4. Total');
    print('5. Exit');
    String? input = stdin.readLineSync();
    if (input == '1') {
      addinlist();
    } else if (input == '2') {
      viewlist();
    } else if (input == '3') {
      deletelist();
    } else if (input == '4') {
      totalinlist();
    } else if (input == '5') {
      print("Allah Hafiz");
      runapp = false;
    } else {
      print('Enter valid number');
    }
    ;
  }
}
void addinlist() {
  stdout.write('Enter your Expense: ');
  String? name = stdin.readLineSync();

  stdout.write('Enter your Amount: ');
  String? amount = stdin.readLineSync();

  if (name != null && amount != null && name.isNotEmpty && amount.isNotEmpty) {
    double? price = double.tryParse(amount);

    if (price != null) {
      myExpenses.add(Expense(name, price));
      print('Added: $name (Rs. $price)');
    } else {
      print('Enter amount in numbers (e.g. 100).');
    }
  } else {
    print("Don't leave fields empty");
  }
}

void viewlist() {
  if (myExpenses.isEmpty) {
    print('List is empty');
  } else {
    for (int i = 0; i < myExpenses.length; i++) {
      print('${i + 1}. ${myExpenses[i].name}  =  Rs. ${myExpenses[i].amount}');
    }
  }
}
void deletelist() {
  viewlist();
  stdout.write('Enter number to delete');
  String? val = stdin.readLineSync();
  int? index = int.tryParse(val ?? '');
  if (index != null && index > 0 && index <= myExpenses.length) {
    var deletedItem = myExpenses.removeAt(index - 1);
    print('Deleted: ${deletedItem.name}');
  } else {
    print('Enter valid number');
  }
}
void totalinlist() {
  double total = 0;
  for (var item in myExpenses) {
    total += item.amount;
  }
  print('Total: Rs. $total');
}