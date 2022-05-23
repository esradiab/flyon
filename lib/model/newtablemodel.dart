class NewTableModel {

   late List<FlightsData> flightsdata = <FlightsData>[] ;


  NewTableModel(this.flightsdata);

  NewTableModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      print("its ok");
      flightsdata = <FlightsData>[];
      json['data'].forEach((v) {
        flightsdata.add(new FlightsData.fromJson(v));
      });
    }
  }
  }


class FlightsData {
   String? flight_date ;
   String? departure_airport;
   String? departure_iata ;
   String? arrival_iata;
   String? timezone;
   String? departure_time;
   String? arrival_time;
   String? arrival_airport;
   String? flight_iata;
   String? airline_iata;


  FlightsData(this.flight_date, this.departure_iata, this.arrival_iata, this.timezone, this.departure_time ,
      this.arrival_time ,this.departure_airport , this.arrival_airport , this.flight_iata, this.airline_iata);

  FlightsData.fromJson(Map<String, dynamic> json) {
    flight_date = json['flight_date'] as String;
    departure_airport = json['departure']['airport'];
    timezone = json['departure']['timezone'];
    departure_iata = json['departure']['iata'];
    departure_time = json['departure']['scheduled'];
    arrival_airport = json['arrival']['airport'];
    arrival_iata = json['arrival']['iata'];
    arrival_time = json['arrival']['scheduled'];
    flight_iata = json['flight']['iata'];
    airline_iata = json['airline']['iata'];

  }
}