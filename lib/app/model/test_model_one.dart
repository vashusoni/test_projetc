// To parse this JSON data, do
//
//     final testModelOne = testModelOneFromMap(jsonString);

import 'dart:convert';

TestModelOne testModelOneFromMap(String str) => TestModelOne.fromMap(json.decode(str));

String testModelOneToMap(TestModelOne data) => json.encode(data.toMap());

class TestModelOne {
  TestModelOne({
    required this.links,
    required this.elementCount,
    required this.nearEarthObjects,
  });

  TestModelOneLinks links;
  int elementCount;
  Map<String, List<NearEarthObject>> nearEarthObjects;

  factory TestModelOne.fromMap(Map<String, dynamic> json) => TestModelOne(
    links: TestModelOneLinks.fromMap(json["links"]),
    elementCount: json["element_count"],
    nearEarthObjects: Map.from(json["near_earth_objects"]).map((k, v) => MapEntry<String, List<NearEarthObject>>(k, List<NearEarthObject>.from(v.map((x) => NearEarthObject.fromMap(x))))),
  );

  Map<String, dynamic> toMap() => {
    "links": links.toMap(),
    "element_count": elementCount,
    "near_earth_objects": Map.from(nearEarthObjects).map((k, v) => MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x.toMap())))),
  };
}

class TestModelOneLinks {
  TestModelOneLinks({
    required this.next,
    required this.previous,
    required this.self,
  });

  String next;
  String previous;
  String self;

  factory TestModelOneLinks.fromMap(Map<String, dynamic> json) => TestModelOneLinks(
    next: json["next"],
    previous: json["previous"],
    self: json["self"],
  );

  Map<String, dynamic> toMap() => {
    "next": next,
    "previous": previous,
    "self": self,
  };
}

class NearEarthObject {
  NearEarthObject({
    required this.links,
    required this.id,
    required  this.neoReferenceId,
    required this.name,
    required this.nasaJplUrl,
    required  this.absoluteMagnitudeH,
    required this.estimatedDiameter,
    required this.isPotentiallyHazardousAsteroid,
    required this.closeApproachData,
    required this.isSentryObject,
  });

  NearEarthObjectLinks links;
  String id;
  String neoReferenceId;
  String name;
  String nasaJplUrl;
  double absoluteMagnitudeH;
  EstimatedDiameter estimatedDiameter;
  bool isPotentiallyHazardousAsteroid;
  List<CloseApproachDatum> closeApproachData;
  bool isSentryObject;

  factory NearEarthObject.fromMap(Map<dynamic, dynamic> json) => NearEarthObject(
    links: NearEarthObjectLinks.fromMap(json["links"]),
    id: json["id"],
    neoReferenceId: json["neo_reference_id"],
    name: json["name"],
    nasaJplUrl: json["nasa_jpl_url"],
    absoluteMagnitudeH: json["absolute_magnitude_h"].toDouble(),
    estimatedDiameter: EstimatedDiameter.fromMap(json["estimated_diameter"]),
    isPotentiallyHazardousAsteroid: json["is_potentially_hazardous_asteroid"],
    closeApproachData: List<CloseApproachDatum>.from(json["close_approach_data"].map((x) => CloseApproachDatum.fromMap(x))),
    isSentryObject: json["is_sentry_object"],
  );

  Map<String, dynamic> toMap() => {
    "links": links.toMap(),
    "id": id,
    "neo_reference_id": neoReferenceId,
    "name": name,
    "nasa_jpl_url": nasaJplUrl,
    "absolute_magnitude_h": absoluteMagnitudeH,
    "estimated_diameter": estimatedDiameter.toMap(),
    "is_potentially_hazardous_asteroid": isPotentiallyHazardousAsteroid,
    "close_approach_data": List<dynamic>.from(closeApproachData.map((x) => x.toMap())),
    "is_sentry_object": isSentryObject,
  };
}

class CloseApproachDatum {
  CloseApproachDatum({
    required this.closeApproachDate,
    required this.closeApproachDateFull,
    required this.epochDateCloseApproach,
    required this.relativeVelocity,
    required this.missDistance,
    required  this.orbitingBody,
  });

  DateTime closeApproachDate;
  String closeApproachDateFull;
  int epochDateCloseApproach;
  RelativeVelocity relativeVelocity;
  MissDistance missDistance;
  OrbitingBody orbitingBody;

  factory CloseApproachDatum.fromMap(Map<String, dynamic> json) => CloseApproachDatum(
    closeApproachDate: DateTime.parse(json["close_approach_date"]),
    closeApproachDateFull: json["close_approach_date_full"],
    epochDateCloseApproach: json["epoch_date_close_approach"],
    relativeVelocity: RelativeVelocity.fromMap(json["relative_velocity"]),
    missDistance: MissDistance.fromMap(json["miss_distance"]),
    orbitingBody: orbitingBodyValues.map[json["orbiting_body"]]!,
  );

  Map<String, dynamic> toMap() => {
    "close_approach_date": "${closeApproachDate.year.toString().padLeft(4, '0')}-${closeApproachDate.month.toString().padLeft(2, '0')}-${closeApproachDate.day.toString().padLeft(2, '0')}",
    "close_approach_date_full": closeApproachDateFull,
    "epoch_date_close_approach": epochDateCloseApproach,
    "relative_velocity": relativeVelocity.toMap(),
    "miss_distance": missDistance.toMap(),
    "orbiting_body": orbitingBodyValues.reverse[orbitingBody],
  };
}

class MissDistance {
  MissDistance({
    required this.astronomical,
    required  this.lunar,
    required this.kilometers,
    required this.miles,
  });

  String astronomical;
  String lunar;
  String kilometers;
  String miles;

  factory MissDistance.fromMap(Map<String, dynamic> json) => MissDistance(
    astronomical: json["astronomical"],
    lunar: json["lunar"],
    kilometers: json["kilometers"],
    miles: json["miles"],
  );

  Map<String, dynamic> toMap() => {
    "astronomical": astronomical,
    "lunar": lunar,
    "kilometers": kilometers,
    "miles": miles,
  };
}

enum OrbitingBody { EARTH }

final orbitingBodyValues = EnumValues({
  "Earth": OrbitingBody.EARTH
});

class RelativeVelocity {
  RelativeVelocity({
    required this.kilometersPerSecond,
    required this.kilometersPerHour,
    required this.milesPerHour,
  });

  String kilometersPerSecond;
  String kilometersPerHour;
  String milesPerHour;

  factory RelativeVelocity.fromMap(Map<String, dynamic> json) => RelativeVelocity(
    kilometersPerSecond: json["kilometers_per_second"],
    kilometersPerHour: json["kilometers_per_hour"],
    milesPerHour: json["miles_per_hour"],
  );

  Map<String, dynamic> toMap() => {
    "kilometers_per_second": kilometersPerSecond,
    "kilometers_per_hour": kilometersPerHour,
    "miles_per_hour": milesPerHour,
  };
}

class EstimatedDiameter {
  EstimatedDiameter({
    required this.kilometers,
    required this.meters,
    required this.miles,
    required this.feet,
  });

  Feet kilometers;
  Feet meters;
  Feet miles;
  Feet feet;

  factory EstimatedDiameter.fromMap(Map<String, dynamic> json) => EstimatedDiameter(
    kilometers: Feet.fromMap(json["kilometers"]),
    meters: Feet.fromMap(json["meters"]),
    miles: Feet.fromMap(json["miles"]),
    feet: Feet.fromMap(json["feet"]),
  );

  Map<String, dynamic> toMap() => {
    "kilometers": kilometers.toMap(),
    "meters": meters.toMap(),
    "miles": miles.toMap(),
    "feet": feet.toMap(),
  };
}

class Feet {
  Feet({
    required this.estimatedDiameterMin,
    required this.estimatedDiameterMax,
  });

  double estimatedDiameterMin;
  double estimatedDiameterMax;

  factory Feet.fromMap(Map<String, dynamic> json) => Feet(
    estimatedDiameterMin: json["estimated_diameter_min"].toDouble(),
    estimatedDiameterMax: json["estimated_diameter_max"].toDouble(),
  );

  Map<String, dynamic> toMap() => {
    "estimated_diameter_min": estimatedDiameterMin,
    "estimated_diameter_max": estimatedDiameterMax,
  };
}

class NearEarthObjectLinks {
  NearEarthObjectLinks({
    required this.self,
  });

  String self;

  factory NearEarthObjectLinks.fromMap(Map<String, dynamic> json) => NearEarthObjectLinks(
    self: json["self"],
  );

  Map<String, dynamic> toMap() => {
    "self": self,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) =>  MapEntry(v, k));
    }
    return reverseMap!;
  }
}
