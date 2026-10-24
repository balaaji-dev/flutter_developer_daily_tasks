List<Map<String, dynamic>> members = [
{ 'id': 1, 'name': 'Rahul', 'age': 24, 'monthlyFee': 1000.0,
},

{ 'id': 2, 'name': 'Bharath', 'age': 22, 'monthlyFee': 2000.0,
},

{'id': 3, 'name': 'Keval', 'age': 28, 'monthlyFee': 1000.0,
},

{'id': 4, 'name': 'Darshan', 'age': 20, 'monthlyFee': 2000.0,
},

{'id': 5, 'name': 'Harsh', 'age': 25, 'monthlyFee': 1000.0,
},
];
void main(){
  String searchName = "harsh";
  matchMember(searchName);
}
void matchMember(String searchName) {
  bool found = false;
  for (int i = 0; i < members.length; i++) {
    if (members[i]['name'].toLowerCase() == searchName.toLowerCase()) {
      found = true;
      print("===== Gym Member Details =====");
      print("ID: ${members[i]['id']}");
      print("Name: ${members[i]['name']}");
      print("Age: ${members[i]['age']}");
      print("Monthly Fee: ${members[i]['monthlyFee']}");
      print("==============================");
    }
  }
  if(!found){
    print("Member not found");
  }
}
