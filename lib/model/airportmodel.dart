//Airport class Model
class AirportModel{
  late List<AirportData> airport;


  AirportModel( this.airport);

   AirportModel.fromJson(Map<String, dynamic> json) {

    if (json['response']!=null) {
      print('im in');
      airport = <AirportData>[];
       json['response'].forEach((v) {
         airport.add( new AirportData.fromJson(v));
         print(airport);
      });
//if the data is empty show error message
    }    else if(airport.isEmpty){print('passenger data is empty');}

  }
}
//new class for the list data
class AirportData{
  late String name ;
  late String id ;
  late String countryId;
AirportData(this.name , this.id , this.countryId);

  AirportData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['iata_code'];
    countryId = json['country_code'];

  }
}