class BookingStep1State {
  final String? selectedVehicleId;
  final String? selectedDurationId;

  const BookingStep1State({
    this.selectedVehicleId,
    this.selectedDurationId,
  });

  int get currentStep {
    if (selectedVehicleId == null) return 1;
    if (selectedDurationId == null) return 2;
    return 3;
  }

  BookingStep1State copyWith({
    String? selectedVehicleId,
    String? selectedDurationId,
  }) {
    return BookingStep1State(
      selectedVehicleId: selectedVehicleId ?? this.selectedVehicleId,
      selectedDurationId: selectedDurationId ?? this.selectedDurationId,
    );
  }

  bool get hasVehicle => selectedVehicleId != null;
  bool get hasDuration => selectedDurationId != null;
}
