class info {
  String? _name;
  String? _number;
  String? _avatar;
  String? _type;

  info({String? name, String? number, String? avatar, String? type}) {
    if (name != null) {
      this._name = name;
    }
    if (number != null) {
      this._number = number;
    }
    if (avatar != null) {
      this._avatar = avatar;
    }
    if (type != null) {
      this._type = type;
    }
  }

  String? get name => _name;
  set name(String? name) => _name = name;
  String? get number => _number;
  set number(String? number) => _number = number;
  String? get avatar => _avatar;
  set avatar(String? avatar) => _avatar = avatar;
  String? get type => _type;
  set type(String? type) => _type = type;

  info.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _number = json['number'];
    _avatar = json['avatar'];
    _type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['number'] = this._number;
    data['avatar'] = this._avatar;
    data['type'] = this._type;
    return data;
  }
}

