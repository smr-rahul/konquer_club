

import '../models/winner.dart';
import 'fighter.dart';

class Bout {
  int? id;
  int? boutsheetId;
  String? boutType;
  Fighter? redFighter;
  String? redFighterStatus;
  int? boutOrder;
  Fighter? blueFighter;
  String? blueFighterStatus;
  int? age;
  int? weight;
  String? minsLength;
  int? status;
  String? createdAt;
  String? updatedAt;
  Winner? winner;
  String? usaBoxingId;
  Bout(
      {this.id,
        this.boutsheetId,
        this.boutType,
        this.redFighter,
        this.redFighterStatus,
        this.boutOrder,
        this.blueFighter,
        this.blueFighterStatus,
        this.age,
        this.weight,
        this.minsLength,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.winner,
        this.usaBoxingId
      });

  Bout.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    boutsheetId = json['boutsheet_id'];
    boutType = json['bout_type'];
    redFighter = json['bout_type']=='FIGHT' && json['red_fighter'] != null
        ? new Fighter.fromJson(json['red_fighter'])
        : null;
    redFighterStatus = json['red_fighter_status'];
    boutOrder = json['bout_order'];
    blueFighter = json['bout_type']=='FIGHT' && json['blue_fighter'] != null
        ? new Fighter.fromJson(json['blue_fighter'])
        : null;
    blueFighterStatus = json['blue_fighter_status'];
    age = json['age'];
    weight = json['weight'];
    minsLength = json['mins_length'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    winner =
    json['winner'] != null ? new Winner.fromJson(json['winner']) : null;
    usaBoxingId = json['usa_boxing_id'];
  }


}

