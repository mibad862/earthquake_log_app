class EarthquakeModel {
  EarthquakeModel({
      this.type, 
      this.metadata, 
      this.features, 
      this.bbox,});

  EarthquakeModel.fromJson(dynamic json) {
    type = json['type'];
    metadata = json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['features'] != null) {
      features = [];
      json['features'].forEach((v) {
        features?.add(Features.fromJson(v));
      });
    }
    bbox = json['bbox'] != null ? json['bbox'].cast<double>() : [];
  }
  String? type;
  Metadata? metadata;
  List<Features>? features;
  List<double>? bbox;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    if (metadata != null) {
      map['metadata'] = metadata?.toJson();
    }
    if (features != null) {
      map['features'] = features?.map((v) => v.toJson()).toList();
    }
    map['bbox'] = bbox;
    return map;
  }

}

class Features {
  Features({
      this.type, 
      this.properties, 
      this.geometry, 
      this.id,});

  Features.fromJson(dynamic json) {
    type = json['type'];
    properties = json['properties'] != null ? Properties.fromJson(json['properties']) : null;
    geometry = json['geometry'] != null ? Geometry.fromJson(json['geometry']) : null;
    id = json['id'];
  }
  String? type;
  Properties? properties;
  Geometry? geometry;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    if (properties != null) {
      map['properties'] = properties?.toJson();
    }
    if (geometry != null) {
      map['geometry'] = geometry?.toJson();
    }
    map['id'] = id;
    return map;
  }

}

class Geometry {
  Geometry({
      this.type, 
      this.coordinates,});

  Geometry.fromJson(dynamic json) {
    type = json['type'];
    coordinates = json['coordinates'] != null ? json['coordinates'].cast<double>() : [];
  }
  String? type;
  List<double>? coordinates;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['coordinates'] = coordinates;
    return map;
  }

}

class Properties {
  Properties({
      this.mag, 
      this.place, 
      this.time, 
      this.updated, 
      this.tz, 
      this.url, 
      this.detail, 
      this.felt, 
      this.cdi, 
      this.mmi, 
      this.alert, 
      this.status, 
      this.tsunami, 
      this.sig, 
      this.net, 
      this.code, 
      this.ids, 
      this.sources, 
      this.types, 
      this.nst, 
      this.dmin, 
      this.rms, 
      this.gap, 
      this.magType, 
      this.type, 
      this.title,});

  Properties.fromJson(dynamic json) {
    mag = json['mag'];
    place = json['place'];
    time = json['time'];
    updated = json['updated'];
    tz = json['tz'];
    url = json['url'];
    detail = json['detail'];
    felt = json['felt'];
    cdi = json['cdi'];
    mmi = json['mmi'];
    alert = json['alert'];
    status = json['status'];
    tsunami = json['tsunami'];
    sig = json['sig'];
    net = json['net'];
    code = json['code'];
    ids = json['ids'];
    sources = json['sources'];
    types = json['types'];
    nst = json['nst'];
    dmin = json['dmin'];
    rms = json['rms'];
    gap = json['gap'];
    magType = json['magType'];
    type = json['type'];
    title = json['title'];
  }
  double? mag;
  String? place;
  int? time;
  int? updated;
  dynamic tz;
  String? url;
  String? detail;
  dynamic felt;
  dynamic cdi;
  double? mmi;
  String? alert;
  String? status;
  int? tsunami;
  int? sig;
  String? net;
  String? code;
  String? ids;
  String? sources;
  String? types;
  dynamic nst;
  double? dmin;
  double? rms;
  int? gap;
  String? magType;
  String? type;
  String? title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mag'] = mag;
    map['place'] = place;
    map['time'] = time;
    map['updated'] = updated;
    map['tz'] = tz;
    map['url'] = url;
    map['detail'] = detail;
    map['felt'] = felt;
    map['cdi'] = cdi;
    map['mmi'] = mmi;
    map['alert'] = alert;
    map['status'] = status;
    map['tsunami'] = tsunami;
    map['sig'] = sig;
    map['net'] = net;
    map['code'] = code;
    map['ids'] = ids;
    map['sources'] = sources;
    map['types'] = types;
    map['nst'] = nst;
    map['dmin'] = dmin;
    map['rms'] = rms;
    map['gap'] = gap;
    map['magType'] = magType;
    map['type'] = type;
    map['title'] = title;
    return map;
  }

}

class Metadata {
  Metadata({
      this.generated, 
      this.url, 
      this.title, 
      this.status, 
      this.api, 
      this.count,});

  Metadata.fromJson(dynamic json) {
    generated = json['generated'];
    url = json['url'];
    title = json['title'];
    status = json['status'];
    api = json['api'];
    count = json['count'];
  }
  int? generated;
  String? url;
  String? title;
  int? status;
  String? api;
  int? count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['generated'] = generated;
    map['url'] = url;
    map['title'] = title;
    map['status'] = status;
    map['api'] = api;
    map['count'] = count;
    return map;
  }

}