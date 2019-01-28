class SelicAccumulated {
  String date;
  String value;

  SelicAccumulated(this.date, this.value);

  static  SelicAccumulated fromJson(Map<String, dynamic> json) {
    return SelicAccumulated(json['data'], json['valor']);
  }

  static List<SelicAccumulated> fromJsonList(List<Map<String, dynamic>> json) {
    List<SelicAccumulated> list = List<SelicAccumulated>();

    json.forEach((element) {
      list.add(SelicAccumulated.fromJson(element));
    });

    return list;
  }
  Map<String, dynamic> toJson() => {
        'data': date,
        'valor': value,
      };
}
