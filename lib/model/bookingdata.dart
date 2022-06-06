class BookingDataModel {
  late List<PassengerData> passengers;

  String? phone ;
  String? email;
  String? bookingId;



  BookingDataModel(this.bookingId , this.phone  , this.email , this.passengers);


  BookingDataModel.fromJson(Map<String, dynamic> json) {
    bookingId = json['booking_id'];
    phone = json['phone'];
    email = json['emai'];
    if (json['passenger_data'] != null) {
      passengers = <PassengerData>[];
      json['passenger_data'].forEach((v) {
        passengers.add(new PassengerData.fromJson(v));
      });
    }
  }
}

class PassengerData {
  String? fullName;
  String? age;
  String? gender;
  String? bookingId;



  PassengerData(this.fullName, this.age, this.gender, this.bookingId);

  PassengerData.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    age = json['age'];
    gender = json['gender'];
    bookingId= json['booking_id'];

  }
}