import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/parking_area_model.dart';

// Enhanced Bottom Sheet Controller with Business Logic
class BottomSheetController extends ChangeNotifier {
  // UI State
  bool _isVisible = true;
  final bool _isLoading = false;
  String? _errorMessage;

  List<ParkingArea> _parkingAreas = [];
  ParkingArea? _selectedArea;
  ParkingSession? _activeSession;

  final bool _showOnlyAvailable = false;
  final double _maxWaitTime = 30.0;
  final double _maxDistance = 5.0;

  // Getters for UI State
  bool get isVisible => _isVisible;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Getters for Business State
  List<ParkingArea> get parkingAreas => _getFilteredAreas();
  ParkingArea? get selectedArea => _selectedArea;
  ParkingSession? get activeSession => _activeSession;
  bool get hasActiveSession =>
      _activeSession != null && _activeSession!.isActive;

  // Getters for Filter State
  bool get showOnlyAvailable => _showOnlyAvailable;
  double get maxWaitTime => _maxWaitTime;
  double get maxDistance => _maxDistance;

  // Constructor - Initialize with sample data
  BottomSheetController() {
    _initializeParkingAreas();
  }

  // Initialize parking areas (would typically fetch from API)
  void _initializeParkingAreas() {
    _parkingAreas = [
      ParkingArea(
        id: '1',
        code: '013',
        name: 'المنطقة',
        location: 'الطريق الدائري الشرقي، العزيزية، الرياض',
        waitTimeMinutes: 5,
        availableSpots: 70,
        totalSpots: 83,
        latitude: 24.7085, // NEW
        longitude: 46.7303, // NEW
        pricePerHour: 5,
      ),
      ParkingArea(
        id: '2',
        code: '025',
        name: 'المنطقة',
        location: 'طريق الملك فهد، الرياض',
        waitTimeMinutes: 10,
        availableSpots: 45,
        totalSpots: 53,
        latitude: 24.7240, // NEW
        longitude: 46.6705, // NEW
        pricePerHour: 7,
      ),
      ParkingArea(
        id: '3',
        code: '037',
        name: 'المنطقة',
        location: 'حي العليا، الرياض',
        waitTimeMinutes: 3,
        availableSpots: 20,
        totalSpots: 45,
        latitude: 24.6981,
        longitude: 46.6847,
        pricePerHour: 10,
      ),
      ParkingArea(
        id: '4',
        code: '041',
        name: 'المنطقة',
        location: 'طريق الملك عبدالله، الرياض',
        waitTimeMinutes: 7,
        availableSpots: 85,
        totalSpots: 103,
        latitude: 24.7492,
        longitude: 46.7263,
        pricePerHour: 6,
      ),
      ParkingArea(
        id: '5',
        code: '052',
        name: 'المنطقة',
        location: 'حي النخيل، الرياض',
        waitTimeMinutes: 15,
        availableSpots: 9,
        totalSpots: 50,
        latitude: 24.7748,
        longitude: 46.7385,
        pricePerHour: 4,
      ),
    ];
  }

  List<ParkingArea> _getFilteredAreas() {
    return _parkingAreas.where((area) {
      if (_showOnlyAvailable && area.isFull) return false;
      if (area.waitTimeMinutes > _maxWaitTime) return false;
      // Add distance filter logic here if user location is available
      return true;
    }).toList();
  }

  // UI Control Methods
  void show() {
    _isVisible = true;
    notifyListeners();
  }

  void hide() {
    _isVisible = false;
    notifyListeners();
  }

  void toggle() {
    _isVisible = !_isVisible;
    notifyListeners();
  }

  // Get parking statistics
  Map<String, dynamic> getParkingStatistics() {
    final totalSpots = _parkingAreas.fold<int>(
      0,
      (sum, area) => sum + area.totalSpots,
    );
    final availableSpots = _parkingAreas.fold<int>(
      0,
      (sum, area) => sum + area.availableSpots,
    );
    final averageWaitTime = _parkingAreas.isNotEmpty
        ? _parkingAreas.fold<int>(
                0, (sum, area) => sum + area.waitTimeMinutes) /
            _parkingAreas.length
        : 0;

    return {
      'totalAreas': _parkingAreas.length,
      'totalSpots': totalSpots,
      'availableSpots': availableSpots,
      'occupancyRate':
          ((totalSpots - availableSpots) / totalSpots * 100).toStringAsFixed(1),
      'averageWaitTime': averageWaitTime.toStringAsFixed(0),
      'fullAreas': _parkingAreas.where((a) => a.isFull).length,
    };
  }

  @override
  void dispose() {
    // Clean up any resources
    super.dispose();
  }
}

// Provider
final bottomSheetProvider =
    ChangeNotifierProvider<BottomSheetController>((ref) {
  return BottomSheetController();
});
