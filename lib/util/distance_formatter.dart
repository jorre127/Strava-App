class DistanceFormatter {
  static String format(double distance) {
    final roundedDistance = distance.round();
    if (roundedDistance.toString().length >= 4) {
      return '${(distance / 1000).toStringAsFixed(2)} Km';
    } else {
      return '${distance.toStringAsFixed(2)} Meters';
    }
  }
}
