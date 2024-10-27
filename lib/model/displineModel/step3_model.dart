import 'package:pedagogue/model/base_model.dart';

class Step3Model extends BaseModel{
 String? Performance;
  String? Deadline1;
  String? Training;
  String? Deadline2;
 
  

  Step3Model({
     this.Performance,
    this.Deadline1,
    this.Training,
    this.Deadline2,
   
    
  });

  factory Step3Model.fromJson(Map<String, dynamic> json) {
    return Step3Model(
      Performance: json['Performance'],
      Deadline1: json['Deadline1'],
      Training: json['Training'],
      Deadline2: json['Deadline2'],
     
      
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Performance': Performance,
      'Deadline1': Deadline1,
      'Training': Training,
      'Deadline2': Deadline2,
      
     
    };
  }


}