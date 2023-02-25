import 'dart:convert';
import 'package:http/http.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:konquer_club/models/bout.dart';

import 'package:konquer_club/utils/constants.dart';

import '../models/fighter.dart';

class KonquerService {
  var headers = {
    'authority': 'staging-api.konquer.club',
    'accept': '*/*',
    'accept-language': 'en-US,en;q=0.9',
    'authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzA4ODI1Mzg5LCJpYXQiOjE2NzcyODkzODksImp0aSI6ImM1MTM2MzMwZWJkZDQyYTRiOTZhMTU3OGZjNGI3ZTczIiwidXNlcl9pZCI6MjQ0OX0.uJgdWbbHdBWwVImt8XM8UKMEMkuUuGvGXF0Qkl0D0Tw',
    'dnt': '1',
    'origin': 'https://stg-konquer.web.app',
    'referer': 'https://stg-konquer.web.app/',
    'sec-ch-ua': '"Chromium";v="110", "Not A(Brand";v="24", "Google Chrome";v="110"',
    'sec-ch-ua-mobile': '?0',
    'sec-ch-ua-platform': '"macOS"',
    'sec-fetch-dest': 'empty',
    'sec-fetch-mode': 'cors',
    'sec-fetch-site': 'cross-site',
    'user-agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36',
    'Accept-Encoding': 'gzip',
  };
  Future<List<Bout>> loadBouts() async {
    Response response = await get(
      Uri.parse(Constants.matchesUrl),
      headers: headers,
    );
    if(response.statusCode==200){
      final List result = jsonDecode(response.body) as List<dynamic>;
      List<Bout> bouts = [];
      for(Map<String, dynamic> json  in result){
        if(json['bout_type']=='FIGHT'){
          bouts.add(Bout.fromJson(json));
        }
      }
      return bouts;
    }else{
      throw Exception(response.reasonPhrase);
    }

  }
  Future<List<Fighter>> loadFighters() async {
    Response response = await get(
      Uri.parse(Constants.fightersUrl),
      headers: headers,
    );
    if(response.statusCode==200){
      final List result = jsonDecode(response.body) as List<dynamic>;
      return result.map((e) => Fighter.fromJson(e)).toList();
    }else{
      throw Exception(response.reasonPhrase);
    }

  }
  Future<bool> cancelBout(int matchId) async {
    Response response = await delete(
      Uri.parse(Constants.cancelMatchUrl+matchId.toString()),
      headers: headers,
    );
    if(response.statusCode==200){
      print(jsonDecode(response.body));

      return true;
    }else{
      throw Exception(response.reasonPhrase);
    }

  }
}

final konquerServiceProvider = Provider<KonquerService>((ref)=>KonquerService());
