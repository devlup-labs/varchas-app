import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:varchas_app/Utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

var base_url = "Your IP Address"; // varchas22.in
Future<TeamData> fetchTeamData() async {
  // final response = await http
  //     .get(Uri.parse('http://$base_url/registration/teamsApi/?format=json'));
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
  await td
      .getDataFromUrl('http://$base_url/registration/teamsApi/?format=json');
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
    while (nextLink != null) {
      response = await http.get(Uri.parse(nextLink));
      if (response.statusCode != 200) {
        throw Exception('Failed to load album');
      }
      json = jsonDecode(response.body);
      results += json['results'];
      nextLink = json['next'];
    }
    print("Successfully fetched ${results.length} teams !!");
    for (int i = 0; i < results.length; i++) {
      teamIds.add(results[i]['teamId']);
      teamNames.add(results[i]['college']);
    }
  }

  verifyTeamIDandGetDetails(String enteredId) {
    return teamIds.indexOf(enteredId);
  }

  getSportResults(String sportNumber) {
    var output = results;
    output.sort((s1, s2) {
      if (s1['score'] < s2['score']) {
        return 1;
      } else if (s1['score'] > s2['score']) {
        return -1;
      } else {
        return 0;
      }
    });
    output =
        output.where((element) => element['sport'] == sportNumber).toList();
    return output;
  }
}

getScheduleResults(int day, {String? teamId = ""}) async {
  List<dynamic> results = [];
  String date = dates[day - 1];

  http.Response response;
  dynamic json;

  String? nextLink = "http://$base_url/app_apis/get_matches/";
  response = await http.get(Uri.parse(nextLink));
  if (response.statusCode != 200) {
    throw Exception('Failed to load album');
  }
  json = jsonDecode(response.body);
  print("Successfully fetched ${json.length} matches !!");

  if (teamId == "") {
    var output = json;
    output = output.where((element) => element['date'] == date).toList();
    output.sort((a, b) {
      if (int.parse(a['event']) < int.parse(b['event'])) {
        return -1;
      } else if (int.parse(a['event']) > int.parse(b['event'])) {
        return 1;
      } else {
        if (int.parse(a['time'].toString().substring(0, 2)) <
            int.parse(b['time'].toString().substring(0, 2))) {
          return -1;
        } else if (int.parse(a['time'].toString().substring(0, 2)) >
            int.parse(b['time'].toString().substring(0, 2))) {
          return 1;
        } else {
          return 0;
        }
      }
    });
    return output;
  } else {
    results = json.where((element) => element['date'] == date).toList();
    var output1 = results;
    output1 = output1.where((element) => element['team1'] == teamId).toList();

    var output2 = results;
    output2 = output2.where((element) => element['team2'] == teamId).toList();
    return output1 + output2;
  }
}

getTransportDetails(int day, {String transportId = ""}) async {
  List<dynamic> results = [];
  String date = dates[day - 1];

  http.Response response;
  dynamic json;

  String? nextLink = "http://$base_url/events/TransportApi/";
  while (nextLink != null) {
    response = await http.get(Uri.parse(nextLink));
    if (response.statusCode != 200) {
      throw Exception('Failed to load album');
    }
    json = jsonDecode(response.body);
    results += json['results'];
    nextLink = json['next'];
  }
  // print("Successfully fetched ${results.length} matches !!");
  if (transportId == "") {
    var output = results;
    output = output.where((element) => element['date'] == date).toList();
    output.sort((a, b) {
      if (int.parse(a['source']) < int.parse(b['source'])) {
        return -1;
      } else if (int.parse(a['source']) > int.parse(b['source'])) {
        return 1;
      } else {
        if (int.parse(a['time'].toString().substring(0, 2)) <
            int.parse(b['time'].toString().substring(0, 2))) {
          return -1;
        } else if (int.parse(a['time'].toString().substring(0, 2)) >
            int.parse(b['time'].toString().substring(0, 2))) {
          return 1;
        } else {
          return 0;
        }
      }
    });
    return output;
  } else {
    results = results.where((element) => element['date'] == date).toList();
    var output1 = results;
    output1 =
        output1.where((element) => element['source'] == transportId).toList();

    var output2 = results;
    output2 = output2
        .where((element) => element['destination'] == transportId)
        .toList();
    return output1 + output2;
  }
}

getSponsors() async {
  List<dynamic> results = [];

  http.Response response;
  dynamic json;
  String? nextLink = "http://$base_url/app_apis/sponsors/";
  response = await http.get(Uri.parse(nextLink));
  if (response.statusCode != 200) {
    throw Exception('Failed to load sponsors');
  }
  json = jsonDecode(response.body);
  return json;
}
