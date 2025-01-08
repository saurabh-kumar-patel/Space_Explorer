/// UUID : "65d148881cc0f9e2e36bee0f"
/// Name : "GSLV-F14/INSAT-3DS Mission"
/// SerialNumber : "96"
/// LaunchDate : "2024-02-17"
/// LaunchType : "GSLV"
/// Payload : "INSAT-3DS"
/// Link : "https://www.isro.gov.in/GSLV-F14_INSAT-3DS_mission.html"
/// MissionStatus : "MISSION SUCCESSFUL"

class LaunchersModel {
  LaunchersModel({
      String? uuid, 
      String? name, 
      String? serialNumber, 
      String? launchDate, 
      String? launchType, 
      String? payload, 
      String? link, 
      String? missionStatus,}){
    _uuid = uuid;
    _name = name;
    _serialNumber = serialNumber;
    _launchDate = launchDate;
    _launchType = launchType;
    _payload = payload;
    _link = link;
    _missionStatus = missionStatus;
}

  LaunchersModel.fromJson(dynamic json) {
    _uuid = json['UUID'];
    _name = json['Name'];
    _serialNumber = json['SerialNumber'];
    _launchDate = json['LaunchDate'];
    _launchType = json['LaunchType'];
    _payload = json['Payload'];
    _link = json['Link'];
    _missionStatus = json['MissionStatus'];
  }
  String? _uuid;
  String? _name;
  String? _serialNumber;
  String? _launchDate;
  String? _launchType;
  String? _payload;
  String? _link;
  String? _missionStatus;
LaunchersModel copyWith({  String? uuid,
  String? name,
  String? serialNumber,
  String? launchDate,
  String? launchType,
  String? payload,
  String? link,
  String? missionStatus,
}) => LaunchersModel(  uuid: uuid ?? _uuid,
  name: name ?? _name,
  serialNumber: serialNumber ?? _serialNumber,
  launchDate: launchDate ?? _launchDate,
  launchType: launchType ?? _launchType,
  payload: payload ?? _payload,
  link: link ?? _link,
  missionStatus: missionStatus ?? _missionStatus,
);
  String? get uuid => _uuid;
  String? get name => _name;
  String? get serialNumber => _serialNumber;
  String? get launchDate => _launchDate;
  String? get launchType => _launchType;
  String? get payload => _payload;
  String? get link => _link;
  String? get missionStatus => _missionStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['UUID'] = _uuid;
    map['Name'] = _name;
    map['SerialNumber'] = _serialNumber;
    map['LaunchDate'] = _launchDate;
    map['LaunchType'] = _launchType;
    map['Payload'] = _payload;
    map['Link'] = _link;
    map['MissionStatus'] = _missionStatus;
    return map;
  }

}