
class UserModel {
  bool status;
  int statusCode;
  String message;
  Data data;

  UserModel(
      {
        this.status,
        this.statusCode,
        this.message,
        this.data
      });

  factory UserModel.fromJson(Map<String, dynamic> parsedJson){
    return UserModel(
        status: parsedJson['status'],
        statusCode : parsedJson['statusCode'],
        message : parsedJson ['message'],
        data :  Data.fromJson(parsedJson ['data'])
    );
  }

}
class Data{
  String access_token;

  Data({
    this.access_token
  });

  factory Data.fromJson(Map<String, String> json){
    return Data(
        access_token: json['access_token']
    );
  }
}
