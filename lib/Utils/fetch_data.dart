import 'dart:convert';
import 'package:http/http.dart' as http;

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
    }
  }

  verifyTeamID(String enteredId){
    return teamIds.contains(enteredId);
  }
}