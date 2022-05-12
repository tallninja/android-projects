class ClassListN {
  String grade1;
  String grade2;
  String grade3;
  String grade4;
  String grade5;
  String grade6;
  String token;

  ClassListN({
    this.grade1,
    this.grade2,
    this.grade3,
    this.grade4,
    this.grade5,
    this.grade6,
    this.token,
  });
  factory ClassListN.fromJson(Map<String, dynamic> responseData) {
    return ClassListN(
      grade1: responseData['grade1'],
      grade2: responseData['grade2'],
      grade3: responseData['grade3'],
      grade4: responseData['grade4'],
      grade5: responseData['grade5'],
      grade6: responseData['grade6'],
      token: responseData['token'],
    );
  }
}
