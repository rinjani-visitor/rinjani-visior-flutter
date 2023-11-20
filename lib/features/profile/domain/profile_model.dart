class ProfileEntity {
  String name;
  String email;
  String phoneNumber;
  String birthDate;
  String? address;

  ProfileEntity(
      {required this.name,
      required this.email,
      required this.phoneNumber,
      required this.birthDate,
      this.address});
}
