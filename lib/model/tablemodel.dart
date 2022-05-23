class TableModel {
  late List<Flights> flights;


  TableModel(this.flights);

  TableModel.fromJson(Map<String, dynamic> json) {
    if (json['response'] != null) {
      flights = <Flights>[];
      json['response'].forEach((v) {
        flights.add(new Flights.fromJson(v));
      });
    }
  }
}

class Flights {
   String? airline_iata;
   String? flight_iata;
   String? dep_iata;
   String? arr_iata;
   String? dep_time;
   String? arr_time;


  Flights(this.airline_iata, this.flight_iata, this.dep_iata, this.dep_time, this.arr_time,
      this.arr_iata);

  Flights.fromJson(Map<String, dynamic> json) {
    airline_iata = json['airline_iata'];
    flight_iata = json['flight_iata'];
    dep_iata = json['dep_iata'];
    arr_iata = json['arr_iata'];
    arr_time = json['arr_time'];
    dep_time = json['dep_time'];
  }
}