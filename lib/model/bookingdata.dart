class BookingDataModel {
  late List<PassengerData> passengers;
  late List<BookingData> booking;

  BookingDataModel(this.booking , this.passengers);

  BookingDataModel.fromJson(Map<String, dynamic> json) {
    if (json['booking_data'] != null) {
      booking = <BookingData>[];
      json['booking_data'].forEach((v) {
        booking.add(new BookingData.fromJson(v));
      });
    }
    if (json['passenger_data'] != null) {
      passengers = <PassengerData>[];
      json['passenger_data'].forEach((v) {
        passengers.add(new PassengerData.fromJson(v));
      });
    }


  }
}

class PassengerData {
  late String fullName;
  late String age;
  late String gender;
  late String bookingId;
   late String index ;


  PassengerData(this.fullName, this.age, this.gender, this.bookingId , this.index);

  PassengerData.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    age = json['age'];
    gender = json['gender'];
    bookingId= json['booking_id'];
    index =  json['pass_num'];
  }
}
class BookingData {
  late String phone;
  late String email;
  late String bookingId;
  late String date;
  late String flight_date;
  BookingData(this.bookingId, this.phone, this.email ,this.date);

  BookingData.fromJson(Map<String, dynamic> json) {
    bookingId = json['booking_id'];
    phone = json['phone'];
    email = json['email'];
    date = json['booking_date'] as String;
    flight_date = json['flight_date'] as String;
  }
}