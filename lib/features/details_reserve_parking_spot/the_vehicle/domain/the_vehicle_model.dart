class VehicleItem {
  final String id;
  final String title;
  final bool isAddNew;

  VehicleItem({
    required this.id,
    required this.title,
    this.isAddNew = false,
  });
}
