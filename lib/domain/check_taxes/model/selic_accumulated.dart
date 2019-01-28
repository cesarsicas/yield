class SelicAccumulated {
  String date;
  String value;

  SelicAccumulated(this.date, this.value);

  SelicAccumulated.fromJson(Map<String, dynamic> json)
      : date = json["data"],
        value = json["valor"];

  Map<String, dynamic> toJson() => {
        'data': date,
        'valor': value,
      };
}
