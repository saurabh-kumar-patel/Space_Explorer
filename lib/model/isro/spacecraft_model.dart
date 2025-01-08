/// _id : "64463f6a19c0c8b8f4891fe4"
/// serialNumber : "114"
/// name : "INS-2TD"
/// launchDate : "2022-02-14"
/// launchVehicle : "PSLV-C52/EOS-04 Mission"
/// orbitType : ""
/// application : "Experimental"
/// link : "https://www.isro.gov.in/mission_PSLV_C52_INS_2TD.html"
/// missionStatus : "MISSION SUCCESSFUL"

class SpacecraftModel {
  SpacecraftModel({
      String? id, 
      String? serialNumber, 
      String? name, 
      String? launchDate, 
      String? launchVehicle, 
      String? orbitType, 
      String? application, 
      String? link, 
      String? missionStatus,}){
    _id = id;
    _serialNumber = serialNumber;
    _name = name;
    _launchDate = launchDate;
    _launchVehicle = launchVehicle;
    _orbitType = orbitType;
    _application = application;
    _link = link;
    _missionStatus = missionStatus;
}

  SpacecraftModel.fromJson(dynamic json) {
    _id = json['_id'];
    _serialNumber = json['serialNumber'];
    _name = json['name'];
    _launchDate = json['launchDate'];
    _launchVehicle = json['launchVehicle'];
    _orbitType = json['orbitType'];
    _application = json['application'];
    _link = json['link'];
    _missionStatus = json['missionStatus'];
  }
  String? _id;
  String? _serialNumber;
  String? _name;
  String? _launchDate;
  String? _launchVehicle;
  String? _orbitType;
  String? _application;
  String? _link;
  String? _missionStatus;
SpacecraftModel copyWith({  String? id,
  String? serialNumber,
  String? name,
  String? launchDate,
  String? launchVehicle,
  String? orbitType,
  String? application,
  String? link,
  String? missionStatus,
}) => SpacecraftModel(  id: id ?? _id,
  serialNumber: serialNumber ?? _serialNumber,
  name: name ?? _name,
  launchDate: launchDate ?? _launchDate,
  launchVehicle: launchVehicle ?? _launchVehicle,
  orbitType: orbitType ?? _orbitType,
  application: application ?? _application,
  link: link ?? _link,
  missionStatus: missionStatus ?? _missionStatus,
);
  String? get id => _id;
  String? get serialNumber => _serialNumber;
  String? get name => _name;
  String? get launchDate => _launchDate;
  String? get launchVehicle => _launchVehicle;
  String? get orbitType => _orbitType;
  String? get application => _application;
  String? get link => _link;
  String? get missionStatus => _missionStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['serialNumber'] = _serialNumber;
    map['name'] = _name;
    map['launchDate'] = _launchDate;
    map['launchVehicle'] = _launchVehicle;
    map['orbitType'] = _orbitType;
    map['application'] = _application;
    map['link'] = _link;
    map['missionStatus'] = _missionStatus;
    return map;
  }

}