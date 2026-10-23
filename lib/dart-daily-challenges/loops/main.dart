
void main() {
  List<String> names = [
    "Rahul", "Priya", "Amit", "Sneha", "Kiran",
    "Anjali", "Rohit", "Pooja", "Arjun", "Divya"
  ];

  NumberedMembers(names);
  MembersWithoutNumbering(names);
}

void NumberedMembers(List<String> names) {
  print("===== Gym Member List =====\n");

  for (int i = 0; i < names.length; i++) {
    print("${i + 1}. ${names[i]}");
  }
}

void MembersWithoutNumbering(List<String> names) {
  print("===== Members Without Numbering =====\n");

  for (int i = 0; i < names.length; i++) {
    print(names[i]);
  }
}
