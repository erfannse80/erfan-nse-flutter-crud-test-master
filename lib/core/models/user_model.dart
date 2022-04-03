
const String tableUser = 'Users';

class UserFields {
   static final List <String> value =[
      id,
      firstname,
      lastname,
      dateOfBirth,
      phoneNumber,
      email,
      bankAccountNumber,
   ];
  static final String id = '_id';
  static const String firstname = 'firstname';
  static const String lastname = 'lastname';
  static const String dateOfBirth = 'dateOfBirth';
  static const String phoneNumber = 'phoneNumber';
  static const String email = 'email';
  static const String bankAccountNumber = 'bankAccountNumber';
}

class UserModel {
  int? id;
  String? firstname;
  String? lastname;
  String? dateOfBirth;
  String? phoneNumber;
  String? email;
  String? bankAccountNumber;

  UserModel(
      { this.id,
      required this.firstname,
      required this.lastname,
      required this.phoneNumber,
      required this.dateOfBirth,
      required this.email,
      required this.bankAccountNumber});

  UserModel copy(
          {int? id,
          String? firstname,
          String? lastname,
          String? dateOfBirth,
          String? phoneNumber,
          String? email,
          String? bankAccountNumber}) =>
      UserModel(
        id: id ?? this.id,
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        bankAccountNumber: bankAccountNumber ?? this.bankAccountNumber,
      );
  static UserModel fromJson(Map<String,Object?> json)=> UserModel(
      id: json['UserFields.id'] as int?,
      firstname: json[UserFields.firstname] as String,
      lastname:json[UserFields.lastname] as String,
      phoneNumber: json[UserFields.phoneNumber] as String,
      dateOfBirth: json[UserFields.dateOfBirth] as String,
      email: json[UserFields.email] as String,
      bankAccountNumber: json[UserFields.bankAccountNumber] as String);

  Map<String, Object?> toJson() => {
        UserFields.id: id,
        UserFields.firstname: firstname,
        UserFields.lastname: lastname,
        UserFields.dateOfBirth: dateOfBirth,
        UserFields.phoneNumber: phoneNumber,
        UserFields.email: email,
        UserFields.bankAccountNumber: bankAccountNumber,
      };
}
