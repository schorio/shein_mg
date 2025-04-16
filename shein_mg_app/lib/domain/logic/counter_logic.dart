import 'dart:async';

class Counter {
  late DateTime _expirationDate;
  Duration _remainingTime = Duration.zero;
  final Function(Duration) onTimeUpdated;
  Timer? _timer;

  Counter({
    required String articleCreationDate,
    required String expirationDuration,
    required this.onTimeUpdated,
  }) {
    _initTimer(articleCreationDate, expirationDuration);
  }

  void _initTimer(String creationDateStr, String durationStr) {
    final creationDateParts = creationDateStr.split('-');
    final durationParts = durationStr.split(':');
    final creationDate = DateTime(
      int.parse(creationDateParts[0]),
      int.parse(creationDateParts[1]),
      int.parse(creationDateParts[2]),
      int.parse(creationDateParts[3]),
      int.parse(creationDateParts[4]),
      int.parse(creationDateParts[5]),
    );
    final duration = Duration(
      hours: int.parse(durationParts[0]),
      minutes: int.parse(durationParts[1]),
      seconds: int.parse(durationParts[2]),
    );
    _expirationDate = creationDate.add(duration);
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final now = DateTime.now();
      final difference = _expirationDate.difference(now);
      _remainingTime = difference.isNegative ? Duration.zero : difference;
      onTimeUpdated(_remainingTime);
      if (difference.isNegative) _timer?.cancel();
    });
  }

  static String formatDuration(Duration d) {
    return "${d.inHours.toString().padLeft(2, '0')}h :"
        "${(d.inMinutes % 60).toString().padLeft(2, '0')}m :"
        "${(d.inSeconds % 60).toString().padLeft(2, '0')}s ";
  }

  void dispose() => _timer?.cancel();
}
