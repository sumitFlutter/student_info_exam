import '../model/student_model.dart';

List <Map> studentInfo=[];
List<Student> studentModel=[
];
void use()
{
  studentModel=studentInfo.map((e) => Student.setData(e)).toList();
}