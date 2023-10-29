class User{
  String name, email, phone, Add;
  User(this.name,this.email,this.phone,this.Add);
  User.fromJson(Map<String,dynamic> json): name= json['name'],email=json['email']
  ,phone=json['phone'],Add= json['Add'];

  Map<String,dynamic> toJson()=>{
    'name':name,
    'email':email,
    'phone': phone,
    'Add':Add
  };

}