import 'dart:io';

double calculateRemainingBalance(double totalFee , double amountPaid){
  return totalFee - amountPaid;
}

bool isValidPayment(double totalFee, double amountPaid) {
  return totalFee >= 0 && amountPaid >= 0 && amountPaid <= totalFee;
}

void displayPaymentDetails(double totalFee, double amountPaid,double remainingBalance){

  print("===== Membership Payment Details =====");
  print("Total Fee: ₹$totalFee");
  print("Amount Paid: ₹$amountPaid");
  print("Remaining Balance: ₹$remainingBalance");
  print("=======================================");
}

void main() {
  print("Total Membership Fee: ");
  double totalFee = double.parse(stdin.readLineSync()!);
  print("Amount Paid: ");
  double amountPaid = double.parse(stdin.readLineSync()!);
  //calculateRemainingBalance(totalFee, amountPaid);

  if (!isValidPayment(totalFee, amountPaid)) {
    print("Error: Invalid fee or payment amount.");
    print("Payment must be between 0 and the total fee.");
    return;
  }
  double balance = calculateRemainingBalance(totalFee, amountPaid);
  displayPaymentDetails(totalFee, amountPaid, balance);
}