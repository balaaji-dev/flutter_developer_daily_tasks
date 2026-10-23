
void main() {
  List<String> names = [
    "Rahul", "Priya", "Amit", "Sneha", "Kiran",
    "Anjali", "Rohit", "Pooja", "Arjun", "Divya"
  ];

  printNumberedMembers(names);
  printMembersWithoutNumbering(names);
}

void printNumberedMembers(List<String> names) {
  print("===== Gym Member List =====\n");

  for (int i = 0; i < names.length; i++) {
    print("${i + 1}. ${names[i]}");
  }
}

void printMembersWithoutNumbering(List<String> names) {
  print("===== Members Without Numbering =====\n");

  for (int i = 0; i < names.length; i++) {
    print(names[i]);
  }
}
