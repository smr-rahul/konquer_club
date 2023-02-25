class Fighter {
  int? id;
  int? eventId;
  String? firstName;
  String? lastName;
  String? usaBoxingId;
  int? numberOfFights;
  String? gender;
  String? dateOfBirth;
  String? picture;
  String? checkinCountry;
  bool? onHold;

  Fighter(
      {this.id,
        this.eventId,
        this.firstName,
        this.lastName,
        this.usaBoxingId,
        this.numberOfFights,
        this.gender,
        this.dateOfBirth,
        this.picture,
        this.checkinCountry,
        this.onHold});

  Fighter.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    eventId = json['event_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    usaBoxingId = json['usa_boxing_id'];
    numberOfFights = json['number_of_fights'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    picture = json['picture'];
    checkinCountry = json['checkin_country'];
    onHold = json['on_hold'];
  }

}