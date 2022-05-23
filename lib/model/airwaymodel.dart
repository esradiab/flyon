class AirwayModel{
  late String name ;
  late String id ;
  late List<String> Pic ;





     AirwayModel( this.name,  this.id,  this.Pic);

   AirwayModel.fromJson(Map<String , dynamic> json){
      name= json["name"];
      id= json["id"];
      Pic=  json["Pic"];
   }
}
