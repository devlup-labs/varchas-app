import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:varchas_app/Utils/constants.dart';

Future<TeamData> fetchTeamData() async {
  // final response = await http
  //     .get(Uri.parse('https://varchas22.in/registration/teamsApi/?format=json'));
  //
  // if (response.statusCode == 200) {
  //   // If the server did return a 200 OK response,
  //   // then parse the JSON.
  //   // return TeamData.fromJson(jsonDecode(response.body));
  //   return TeamData.fromJson(jsonDecode(response.body));
  // } else {
  //   // If the server did not return a 200 OK response,
  //   // then throw an exception.
  //   throw Exception('Failed to load album');
  // }
  print("Fetching data");
  TeamData td = TeamData();
  await td.getDataFromUrl('https://varchas22.in/registration/teamsApi/?format=json');
  return td;

}

class TeamData {
  List<dynamic> teamIds = [];
  List<dynamic> teamNames = [];
  List<dynamic> results = [];


  getDataFromUrl(String url) async {
    http.Response response;
    dynamic json;

    String? nextLink = url;
    while(nextLink != null){
      response = await http.get(Uri.parse(nextLink));
      if (response.statusCode != 200) {
        throw Exception('Failed to load album');
      }
      json = jsonDecode(response.body);
      results += json['results'];
      nextLink = json['next'];
    }
    print("Successfully fetched ${results.length} teams !!");
    for(int i = 0; i<results.length; i++){
      teamIds.add(results[i]['teamId']);
      teamNames.add(results[i]['college']);
    }
  }

  verifyTeamIDandGetDetails(String enteredId){
    return teamIds.indexOf(enteredId);
  }

  getSportResults(String sportNumber){
    var output = results;
    output.sort(
          (s1, s2) {
            if(s1['score'] < s2['score']){
              return -1;
            }
            else if(s1['score'] > s2['score']){
              return 1;
            }
            else{
              return 0;
            }
          }
    );
    output = output.where((element) => element['sport'] == sportNumber).toList();
    return output;
  }
}

getScheduleResults(int day, {String teamId = ""}) async {
  List<dynamic> results = [];
  String date = dates[day-1];

  http.Response response;
  dynamic json;

  String? nextLink = "https://varchas22.in/events/MatchApi/";
  while(nextLink != null){
    response = await http.get(Uri.parse(nextLink));
    if (response.statusCode != 200) {
      throw Exception('Failed to load album');
    }
    json = jsonDecode(response.body);
    results += json['results'];
    nextLink = json['next'];
  }
  // print("Successfully fetched ${results.length} matches !!");

  if(teamId == ""){
    var output = results;
    output = output.where((element) => element['date'] == date).toList();
    output.sort((a,b) {
      if(int.parse(a['event']) < int.parse(b['event'])){
        return -1;
      }
      else if(int.parse(a['event']) > int.parse(b['event'])){
        return 1;
      }
      else{
        if(int.parse(a['time'].toString().substring(0, 2)) < int.parse(b['time'].toString().substring(0, 2))){
          return -1;
        }
        else if(int.parse(a['time'].toString().substring(0, 2)) > int.parse(b['time'].toString().substring(0, 2))){
          return 1;
        }
        else{
          return 0;
        }
      }
    });
    return output;
  }
  else{
    results = results.where((element) => element['date'] == date).toList();
    var output1 = results;
    output1 = output1.where((element) => element['team1'] == teamId).toList();

    var output2 = results;
    output2 = output2.where((element) => element['team2'] == teamId).toList();
    return output1+output2;
  }
}