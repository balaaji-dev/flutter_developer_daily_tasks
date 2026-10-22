import 'dart:io';

double remaining(double totalFee , double amountPaid){
  return totalFee - amountPaid;
}


void main(){

  print("Enter the Total Fee: ");
  double totalFee = double.parse(stdin.readLineSync()!);

  print("Enter the Amount Paid: ");
  double amountPaid = double.parse(stdin.readLineSync()!);

  print("Total Fee: ₹$totalFee");
  print("Amount Paid: ₹$amountPaid");
  print("Remaining Balance: ₹${remaining(totalFee , amountPaid)}");

  if(amountPaid == totalFee){
    print("Payment Status: Payment Completed");
  }
  else if(amountPaid > 0 && amountPaid < totalFee){
    print("Payment Status: Partially Paid");
  }
  else if(amountPaid > totalFee || amountPaid < 0){
    print("Payment Status: Invalid Payment Amount");
  }
  else if(amountPaid == 0){
      print("Payment Status: Payment Pending");
    }

}
