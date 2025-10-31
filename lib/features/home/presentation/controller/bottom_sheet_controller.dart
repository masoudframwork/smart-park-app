import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/parking_area_model.dart';

// Enhanced Bottom Sheet Controller with Business Logic
class BottomSheetController extends ChangeNotifier {
  // UI State
  bool _isVisible = true;
  bool _isLoading = false;
  String? _errorMessage;
  
  // Business State
  List<ParkingArea> _parkingAreas = [];
  ParkingArea? _selectedArea;
  ParkingSession? _activeSession;
  
  // Filter State
  bool _showOnlyAvailable = false;
  double _maxWaitTime = 30.0;
  double _maxDistance = 5.0;
  
  // Getters for UI State
  bool get isVisible => _isVisible;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  
  // Getters for Business State
  List<ParkingArea> get parkingAreas => _getFilteredAreas();
  ParkingArea? get selectedArea => _selectedArea;
  ParkingSession? get activeSession => _activeSession;
  bool get hasActiveSession => _activeSession != null && _activeSession!.isActive;
  
  // Getters for Filter State
  bool get showOnlyAvailable => _showOnlyAvailable;
  double get maxWaitTime => _maxWaitTime;
  double get maxDistance => _maxDistance;
  
  // Constructor - Initialize with sample data
  BottomSheetController() {
    _initializeParkingAreas();
    _checkForActiveSession();
  }
  
  // Initialize parking areas (would typically fetch from API)
  void _initializeParkingAreas() {
    _parkingAreas = [
      ParkingArea(
        id: '1',
        code: '013',
        name: 'المنطقة',
        location: 'الطريق الدائري الشرقي، المنطقة العزيزية السعودية',
        waitTimeMinutes: 5,
        availableSpots: 70,
        totalSpots: 83,
        latitude: 24.7136,
        longitude: 46.6753,
        pricePerHour: 5.0,
      ),
      ParkingArea(
        id: '2',
        code: '025',
        name: 'المنطقة',
        location: 'شارع الملك فهد، الرياض',
        waitTimeMinutes: 10,
        availableSpots: 45,
        totalSpots: 53,
        latitude: 24.7136,
        longitude: 46.6753,
        pricePerHour: 7.0,
      ),
      ParkingArea(
        id: '3',
        code: '037',
        name: 'المنطقة',
        location: 'حي العليا، الرياض',
        waitTimeMinutes: 3,
        availableSpots: 120,
        totalSpots: 145,
        latitude: 24.6981,
        longitude: 46.6847,
        pricePerHour: 10.0,
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
        pricePerHour: 6.0,
      ),
      ParkingArea(
        id: '5',
        code: '052',
        name: 'المنطقة',
        location: 'حي النخيل، الرياض',
        waitTimeMinutes: 15,
        availableSpots: 0,
        totalSpots: 50,
        latitude: 24.7748,
        longitude: 46.7385,
        pricePerHour: 4.0,
      ),
    ];
  }
  
  // Check for active parking session (would typically fetch from storage/API)
  void _checkForActiveSession() {
    // Simulate checking for active session
    // In real app, this would check local storage or API
  }
  
  // Get filtered parking areas based on current filters
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
  
  // Business Logic Methods
  
  // Refresh parking areas from API
  Future<void> refreshParkingAreas() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
      
      // Update with fresh data
      _initializeParkingAreas();
      
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _errorMessage = 'فشل تحميل المواقف المتاحة';
      notifyListeners();
    }
  }
  
  // Select a parking area
  void selectParkingArea(ParkingArea area) {
    _selectedArea = area;
    notifyListeners();
  }
  
  // Start booking process
  Future<bool> startBooking(String parkingAreaId, int durationMinutes) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));
      
      final area = _parkingAreas.firstWhere((a) => a.id == parkingAreaId);
      
      // Check availability
      if (area.isFull) {
        _errorMessage = 'هذا الموقف ممتلئ حالياً';
        _isLoading = false;
        notifyListeners();
        return false;
      }
      
      // Create session
      _activeSession = ParkingSession(
        sessionId: DateTime.now().millisecondsSinceEpoch.toString(),
        parkingAreaId: parkingAreaId,
        startTime: DateTime.now(),
        durationMinutes: durationMinutes,
        totalCost: (durationMinutes / 60) * area.pricePerHour,
      );
      
      // Update available spots
      final index = _parkingAreas.indexWhere((a) => a.id == parkingAreaId);
      _parkingAreas[index] = area.copyWith(
        availableSpots: area.availableSpots - 1,
      );
      
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      _errorMessage = 'فشل الحجز. حاول مرة أخرى';
      notifyListeners();
      return false;
    }
  }
  
  // End active parking session
  Future<bool> endParkingSession() async {
    if (_activeSession == null) return false;
    
    _isLoading = true;
    notifyListeners();
    
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
      
      // Update available spots
      final area = _parkingAreas.firstWhere(
        (a) => a.id == _activeSession!.parkingAreaId,
      );
      final index = _parkingAreas.indexOf(area);
      _parkingAreas[index] = area.copyWith(
        availableSpots: area.availableSpots + 1,
      );
      
      _activeSession = null;
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      _errorMessage = 'فشل إنهاء الجلسة';
      notifyListeners();
      return false;
    }
  }
  
  // Extend active session
  Future<bool> extendSession(int additionalMinutes) async {
    if (_activeSession == null) return false;
    
    _isLoading = true;
    notifyListeners();
    
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
      
      final area = _parkingAreas.firstWhere(
        (a) => a.id == _activeSession!.parkingAreaId,
      );
      
      _activeSession = ParkingSession(
        sessionId: _activeSession!.sessionId,
        parkingAreaId: _activeSession!.parkingAreaId,
        startTime: _activeSession!.startTime,
        durationMinutes: _activeSession!.durationMinutes + additionalMinutes,
        totalCost: (((_activeSession!.durationMinutes + additionalMinutes) / 60) * 
                    area.pricePerHour),
      );
      
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      _errorMessage = 'فشل تمديد الوقت';
      notifyListeners();
      return false;
    }
  }
  
  // Filter Methods
  void setShowOnlyAvailable(bool value) {
    _showOnlyAvailable = value;
    notifyListeners();
  }
  
  void setMaxWaitTime(double minutes) {
    _maxWaitTime = minutes;
    notifyListeners();
  }
  
  void setMaxDistance(double kilometers) {
    _maxDistance = kilometers;
    notifyListeners();
  }
  
  // Clear any errors
  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
  
  // Calculate estimated arrival time
  DateTime getEstimatedArrivalTime(String parkingAreaId) {
    final area = _parkingAreas.firstWhere((a) => a.id == parkingAreaId);
    return DateTime.now().add(Duration(minutes: area.waitTimeMinutes));
  }
  
  // Get parking statistics
  Map<String, dynamic> getParkingStatistics() {
    final totalSpots = _parkingAreas.fold<int>(
      0, (sum, area) => sum + area.totalSpots,
    );
    final availableSpots = _parkingAreas.fold<int>(
      0, (sum, area) => sum + area.availableSpots,
    );
    final averageWaitTime = _parkingAreas.isNotEmpty
        ? _parkingAreas.fold<int>(0, (sum, area) => sum + area.waitTimeMinutes) / 
          _parkingAreas.length
        : 0;
    
    return {
      'totalAreas': _parkingAreas.length,
      'totalSpots': totalSpots,
      'availableSpots': availableSpots,
      'occupancyRate': ((totalSpots - availableSpots) / totalSpots * 100).toStringAsFixed(1),
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
final bottomSheetProvider = ChangeNotifierProvider<BottomSheetController>((ref) {
  return BottomSheetController();
});