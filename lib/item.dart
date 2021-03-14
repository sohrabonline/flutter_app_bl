class Item {
  int id;
  String name;
  bool isCompleted;
  bool isArchived;

  Item({this.id, this.name, this.isCompleted, this.isArchived});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isCompleted = json['isCompleted'];
    isArchived = json['isArchived'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['isCompleted'] = this.isCompleted;
    data['isArchived'] = this.isArchived;
    return data;
  }
}