class SelectionPopupModel {
  SelectionPopupModel(
      {this.id, required this.title, this.value, this.isSelected = false});
  int? id;
  String title;
  dynamic value; // dynamic untuk menampung tipe data yang diinput
  bool isSelected; // bool untuk menampung status checkbox
}
