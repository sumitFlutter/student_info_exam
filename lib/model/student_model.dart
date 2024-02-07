class Student{
  String? name,grId,image,std;
  Student({required this.name, required this.grId,required this.image,required this.std});
  factory Student.setData(Map m1)
  {
    return Student(name: m1["name"], grId: m1["GR Id"], image: m1["image"],std: m1["standard"]);
  }
}