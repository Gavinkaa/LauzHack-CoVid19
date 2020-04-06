import 'package:app/AfterLogin/Article.dart';

class Contact {
  int _pcode;
  String _city, _street, _aptFloor;
  String _firstName, _lastName;
  String _phone;
  String _email;

  Contact(int pcode, String city, String street, String aptFloor,
      String firstName, String lastName, String phone, String email) {
    this._pcode = pcode;
    this._city = city;
    this._street = street;
    this._aptFloor = aptFloor;
    this._firstName = firstName[0].toUpperCase() + firstName.substring(1);
    this._lastName = lastName[0].toUpperCase() + lastName.substring(1);
    this._phone = phone;
    this._email = email;
  }

  Contact.from(Contact contact) {
    this._pcode = contact._pcode;
    this._city = contact._city;
    this._street = contact._street;
    this._aptFloor = contact._aptFloor;
    this._firstName = contact._firstName;
    this._lastName = contact._lastName;
    this._phone = contact._phone;
    this._email = contact._email;
  }

  Contact.fromJSON(Map<String, String> contact) {
    String pcode = contact["pcode"];
    this._pcode = int.parse(pcode);
    this._city = contact["city"];
    this._street = contact["street"];
    this._aptFloor = contact["aptFloor"];
    this._firstName = contact["firstName"];
    this._lastName = contact["lastName"];
    this._phone = contact["phone"];
    this._email = contact["email"];
  }

  int getPCode() {
    return _pcode;
  }

  String getCity() {
    return _city;
  }

  String getStreet() {
    return _street;
  }

  String getAptFloor() {
    return _aptFloor;
  }

  String getFirstName() {
    return _firstName;
  }

  String getLastname() {
    return _lastName;
  }

  String getPhone() {
    return _phone;
  }

  String getEmail() {
    return _email;
  }

  void setPCode(int pcode) {
    _pcode = pcode;
  }

  void setCity(String city) {
    _city = city;
  }

  void setStreet(String street) {
    _street = street;
  }

  void setAptFloor(String aptFloor) {
    _aptFloor = aptFloor;
  }

  void setFirstName(String firstName) {
    _firstName = firstName;
  }

  void setLastname(String lastName) {
    _lastName = lastName;
  }

  void setPhone(String phone) {
    _phone = phone;
  }

  void setEmail(String email) {
    _email = email;
  }
}
