extension DateTimeTimezone on DateTime {
  /// Convert DateTime to UTC
  DateTime toUtc() {
    return DateTime.utc(
        year, month, day, hour, minute, second, millisecond, microsecond);
  }

  /// Convert DateTime to local timezone
  DateTime toLocal() {
    return DateTime(
        year, month, day, hour, minute, second, millisecond, microsecond);
  }

  /// convert datetime to ISO 8601 format with timezone
  /// example: 2021-01-01T00:00:00.000+07:00
  String toIso8601StringWithTimezone() {
    return toUtc().toIso8601String();
  }
}
