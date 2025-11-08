# Home Feature - Google Maps Integration

This feature provides a Google Maps widget with custom markers for parking spots, charging stations, and service centers near the user's location.

## Features

- **Google Maps Integration**: Shows user location and nearby points of interest
- **Custom Markers**: Different icons for parking, charging stations, and service centers
- **Interactive Markers**: Tap markers to see detailed information
- **Location Services**: Automatic location detection and permission handling
- **Riverpod State Management**: Clean state management with Riverpod

## Files Structure

```
lib/features/home/
├── data/
│   └── location_service.dart          # Location services and API calls
├── presentation/
│   ├── controller/
│   │   └── home_controller.dart       # Riverpod controller for map state
│   ├── widgets/
│   │   ├── custom_marker_widget.dart  # Custom marker widget
│   │   └── marker_info_card.dart      # Marker information card
│   └── home_page.dart                 # Main home page with Google Maps
└── README.md                          # This file
```

## Usage

### 1. Add Google Maps API Key

The API key is already configured in `lib/core/constants/api_keys.dart`:
```dart
static const String googleMapsApiKey = 'AIzaSyDzQHicCwTr6DHnqQds5k43WLaNI6E0gko';
```

### 2. Android Configuration

Add the API key to `android/app/src/main/AndroidManifest.xml`:
```xml
<application>
    <meta-data
        android:name="com.google.android.geo.API_KEY"
        android:value="AIzaSyDzQHicCwTr6DHnqQds5k43WLaNI6E0gko"/>
</application>
```

### 3. iOS Configuration

Add the API key to `ios/Runner/AppDelegate.swift`:
```swift
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GMSServices.provideAPIKey("AIzaSyDzQHicCwTr6DHnqQds5k43WLaNI6E0gko")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
```

## Widget Components

### HomePage
The main widget that displays the Google Maps with custom markers.

**Features:**
- Shows user location
- Displays custom markers for nearby locations
- Handles marker selection and actions
- Provides floating action button for additional actions

### HomeController
Riverpod controller that manages the map state and location services.

**State Management:**
- User location tracking
- Marker data management
- Loading and error states
- Marker selection handling

### LocationService
Service class for handling location-related operations.

**Functions:**
- Get current user location
- Request location permissions
- Generate nearby locations (mock data)
- Calculate distances

### MarkerInfoCard
Custom widget that displays detailed information about selected markers.

**Features:**
- Shows marker type, title, and description
- Displays availability status
- Shows pricing information
- Provides action buttons (Navigate, Details)

## Customization

### Adding New Marker Types

1. Update the `LocationService` to include new marker types
2. Add corresponding icons and colors in `MarkerInfoCard`
3. Update the marker handling logic in `HomeController`

### Styling

The widgets use `flutter_screenutil` for responsive design. All dimensions are defined using `.w`, `.h`, and `.sp` for width, height, and font size respectively.

### API Integration

To connect with a real backend API:
1. Update `LocationService.getNearbyLocations()` to make HTTP requests
2. Replace mock data with real API responses
3. Add proper error handling for network requests

## Dependencies

- `google_maps_flutter`: Google Maps integration
- `geolocator`: Location services
- `flutter_riverpod`: State management
- `flutter_screenutil`: Responsive design
- `flutter_svg`: SVG support for custom icons

## Permissions

The app requires the following permissions:

**Android** (`android/app/src/main/AndroidManifest.xml`):
```xml
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
```

**iOS** (`ios/Runner/Info.plist`):
```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>This app needs location access to show nearby parking spots and services.</string>
```
