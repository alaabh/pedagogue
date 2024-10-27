class ImcChild {
  final dynamic imc;
  final dynamic stringResult;


  ImcChild({
     this.imc,
     this.stringResult,
    
  });

  factory ImcChild.fromJson(Map<dynamic, dynamic> json) {
    return ImcChild(
      imc: json['imc'],
      stringResult: json['stringResult'],
     
     
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {
      'imc': imc,
      'stringResult': stringResult,
     
    };
  }
}