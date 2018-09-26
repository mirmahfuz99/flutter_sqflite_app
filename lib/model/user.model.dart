
class UserModel {
  bool status;
  int statusCode;
  String message;
//  String data;
  Map<String, dynamic> data;

  UserModel(
      {
        this.status,
        this.statusCode,
        this.message,
        this.data
      });

  factory UserModel.fromJson(Map<String, dynamic> parsedJson){
    print('parseJSON');
//    print(parsedJson);
    UserModel model = UserModel(
        status: parsedJson['status'],
        statusCode : parsedJson['statusCode'],
        message : parsedJson['message'],
        data :  parsedJson['data']
    );
    print(model);
    return model;
  }

}