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
  var result = members.where((member) => member['name'].toLowerCase() == searchName.toLowerCase());

     if(result.isEmpty){
       print("Member not found");
     }else{
       for(var member in result){
         print("MemberName ${member['name']}");
         print("MonthlyFee ${member['monthlyFee']}");
       }
     }
    }

