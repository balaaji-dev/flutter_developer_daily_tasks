void main(){
  List<String> names = ["Rahul", "Priya","Amit", "Sneha", "Kiran", "Anjali", "Rohit","Pooja","Arjun","Divya"];
  print("===== Gym Member List =====");


  for(int i = 0 ;i< names.length;i++){

    print("${i + 1} " " ${names[i]}");
  }

  print("===== Members Without Numbering =====");
  for(int i = 0 ;i< names.length;i++){

    print(" ${names[i]}");
  }

}
