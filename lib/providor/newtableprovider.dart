import 'package:http/http.dart' as https;
import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:untitled/model/newtablemodel.dart';


class NewTableProvider extends ChangeNotifier {
   NewTableModel? data;
  Future getData() async {
    // You can call an API to get data, once we've the data from API or any other flow... Following part would always be the same.

    // We need access to http for loading this data..
    var response = await https
        .get(Uri.parse('https://airlabs.co/api/v9/schedules?dep_iata=MJI&api_key=3db1de03-948f-442f-a84f-90a54ac7666b'));

    // now we have response as String from local json or and API request...
    var mJson = jsonDecode(response.body);
    // we have a JSON.
    this.data = NewTableModel.fromJson(mJson);

    // for callback to view
    this.notifyListeners();

  }
}