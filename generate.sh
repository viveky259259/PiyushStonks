flutter pub run pigeon \
  --input pigeons/stock.dart \
  --dart_out lib/pigeon.dart \
  --objc_header_out ios/Runner/pigeon.h \
  --objc_source_out ios/Runner/pigeon.m \
  --swift_out ios/Runner/Pigeon.swift \
  --kotlin_out ./android/app/src/main/kotlin/dev/flutter/pigeon/Pigeon.kt \
  --experimental_kotlin_package "dev.flutter.pigeon" \
  --java_out ./android/app/src/main/java/io/flutter/plugins/Pigeon.java \
  --java_package "io.flutter.plugins"