import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/providor/tableprovidor.dart';


class FlightsTable extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FlightsTable();
  }

}

class _FlightsTable extends State<FlightsTable>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider<TableProvider>(
      create: (context) => TableProvider(),
      child: Consumer<TableProvider>(
        builder: (context, provider, child) {
          if (provider.data ==null) {
            provider.getData();
            return Center(child: CircularProgressIndicator());
          }
          // when we have the json loaded... let's put the data into a data table widget
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            // Data table widget in not scrollable so we have to wrap it in a scroll view when we have a large data set..
            child: SingleChildScrollView(
              child: DataTable(
                columns: [
                  DataColumn(
                      label: Text('flight iata'),
                      tooltip: 'flight iata'),
                  DataColumn(
                      label: Text('airline iata'),
                      tooltip: 'airline iata'),
                  DataColumn(
                      label: Text('departure iata'),
                      tooltip: 'departure airport'),
                  DataColumn(
                      label: Text('arrival iata'),
                      tooltip: 'arrival airport'),
                  DataColumn(
                      label: Text('departure time'),
                      tooltip: 'departure time'),
                  DataColumn(
                      label: Text('arrival time'),
                      tooltip: 'arrival time'),
                ],
                rows: provider.data!.flights
                    .map((data) =>
                // we return a DataRow every time
                DataRow(
                  // List<DataCell> cells is required in every row
                    cells: [
                      DataCell(Text(data.flight_iata?? " ")),
                      DataCell(Text(data.airline_iata?? " ")),
                      DataCell(Text(data.dep_iata?? ' ')),
                      DataCell(Text(data.arr_iata?? ' ')),
                      DataCell(Text(data.dep_time?? ' ')),
                      DataCell(Text(data.arr_time?? ' ')),
                    ]))
                    .toList(),
              ),
            ),
          );
        },
      ),
    );
  }

}