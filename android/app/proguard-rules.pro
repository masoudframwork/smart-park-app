# Keep Mobile Scanner classes
-keep class com.google.mlkit.** { *; }
-keep class com.google.android.gms.** { *; }

# Keep camera2
-keep class androidx.camera.** { *; }

# Prevent ML Kit stripping
-keep class com.google.android.odml.** { *; }
