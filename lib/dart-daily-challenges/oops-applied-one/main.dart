class Employee{
  int id;
  String name;
  double _salary;

  Employee(this.id,this.name,this._salary);

  double get salary => this._salary;

  set salary(double salary) => this._salary = salary;

  double calculateSalary() => salary;

  void displayDetails(){
    print("Employee ID: $id");
    print("Employee Name: $name");
    print("Total salary: ${calculateSalary()}\n");
  }

}
class FullTimeEmployee extends Employee{
  double bonus;
  FullTimeEmployee(int id,String name, double salary, this.bonus) : super(id, name, salary);

  @override
  double calculateSalary() => salary + bonus;
}
class PartTimeEmployee extends Employee{
  int hoursWorked;
  PartTimeEmployee(int id,String name, double salary,this.hoursWorked) : super(id, name, salary);

  @override
  double calculateSalary() => salary * hoursWorked;

}

class MultiEmployee extends Employee{
  double extraHours;
  MultiEmployee(int id,String name, double salary,this.extraHours) : super(id, name, salary);

  @override
  double calculateSalary() => salary * extraHours;
}



void main(){
  FullTimeEmployee employeefull = FullTimeEmployee(1,"darshan",54000,400);
  PartTimeEmployee employeepart = PartTimeEmployee(2,"keval",8000,35);
  MultiEmployee employeemulti = MultiEmployee(3,"harsh", 5600, 4);
  // print("===Employee Management System===\n");
  // employeefull.displayDetails();
  // employeepart.displayDetails();
  List<Employee> employee = [employeefull, employeepart,employeemulti];
  print("===Employee Management System===\n");
  for(int i=0; i<employee.length; i++ ){
      employee[i].displayDetails();

  }

}
