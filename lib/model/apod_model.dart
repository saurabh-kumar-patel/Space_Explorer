/// date : "2024-09-06"
/// explanation : "Ringed ice giant Neptune lies near the center of this sharp near-infrared image from the James Webb Space Telescope. The dim and distant world is the farthest planet from the Sun, about 30 times farther away than planet Earth. But in the stunning Webb view, the planet's dark and ghostly appearance is due to atmospheric methane that absorbs infrared light. High altitude clouds that reach above most of Neptune's absorbing methane easily stand out in the image though. Coated with frozen nitrogen, Neptune's largest moon Triton is brighter than Neptune in reflected sunlight, seen at the upper left sporting the Webb telescope's characteristic diffraction spikes. Including Triton, seven of Neptune's 14 known moons can be identified in the field of view. Neptune's faint rings are striking in this space-based planetary portrait. Details of the complex ring system are seen here for the first time since Neptune was visited by the Voyager 2 spacecraft in August 1989."
/// hdurl : "https://apod.nasa.gov/apod/image/2409/NeptuneTriton_webb1059.png"
/// media_type : "image"
/// service_version : "v1"
/// title : "Ringed Ice Giant Neptune"
/// url : "https://apod.nasa.gov/apod/image/2409/NeptuneTriton_webb1059.png"

class APOD {            //Astronomy Picture of the Day (APOD)
  APOD({
    String? date,
    String? explanation,
    String? hdurl,
    String? mediaType,
    String? serviceVersion,
    String? title,
    String? url,
  }) {
    _date = date;
    _explanation = explanation;
    _hdurl = hdurl;
    _mediaType = mediaType;
    _serviceVersion = serviceVersion;
    _title = title;
    _url = url;
  }

  APOD.fromJson(dynamic json) {
    _date = json['date'];
    _explanation = json['explanation'];
    _hdurl = json['hdurl'];
    _mediaType = json['media_type'];
    _serviceVersion = json['service_version'];
    _title = json['title'];
    _url = json['url'];
  }
  String? _date;
  String? _explanation;
  String? _hdurl;
  String? _mediaType;
  String? _serviceVersion;
  String? _title;
  String? _url;
  APOD copyWith({
    String? date,
    String? explanation,
    String? hdurl,
    String? mediaType,
    String? serviceVersion,
    String? title,
    String? url,
  }) =>
      APOD(
        date: date ?? _date,
        explanation: explanation ?? _explanation,
        hdurl: hdurl ?? _hdurl,
        mediaType: mediaType ?? _mediaType,
        serviceVersion: serviceVersion ?? _serviceVersion,
        title: title ?? _title,
        url: url ?? _url,
      );
  String? get date => _date;
  String? get explanation => _explanation;
  String? get hdurl => _hdurl;
  String? get mediaType => _mediaType;
  String? get serviceVersion => _serviceVersion;
  String? get title => _title;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = _date;
    map['explanation'] = _explanation;
    map['hdurl'] = _hdurl;
    map['media_type'] = _mediaType;
    map['service_version'] = _serviceVersion;
    map['title'] = _title;
    map['url'] = _url;
    return map;
  }
}
