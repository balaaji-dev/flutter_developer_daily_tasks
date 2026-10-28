
class Member {
  int id;
  String name;
  String phone;

  Member(this.id, this.name, this.phone);



  // void displayDetails() {
  //   print('Member ID: $id');
  //   print('Name: $name');
  //   print('Phone: $phone\n');
  // }

List<String> displayDetails() =>  ["Heelo", "hi", "qwee"];
}


class Qwerty{

  String cult() => "qwerty";

}

class studenName {
  //Member member = Member(1, "balaji", "123");

  Qwerty two = Qwerty();

}


// List<Member> getMembers() {
//   return [
//     Member(101, 'Rahul', '9876543210'),
//     Member(102, 'Priya', '9876543211'),
//     Member(103, 'Amit', '9876543212'),
//   ];
// }
List<Member> members = [
  Member(101, 'Rahul', '9876543210'),
  Member(102, 'Priya', '9876543211'),
  Member(103, 'Amit', '9876543212')
];

void main() {
  print('===== Gym Member Details =====\n');
  // List<Member> members = getMembers();


  for(int i = 0; i < members.length;i++){
    members[i].displayDetails();
  }

  // for (var member in members) {
  //   member.displayDetails();
  // }

}
