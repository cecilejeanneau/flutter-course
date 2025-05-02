String formatDuration(int timestampInSeconds) {
  final now = DateTime.now();
  final date = DateTime.fromMillisecondsSinceEpoch(timestampInSeconds * 1000);
  final diff = now.difference(date);

  if (diff.inSeconds < 60) return "${diff.inSeconds}s";
  if (diff.inMinutes < 60) return "${diff.inMinutes}m ${diff.inSeconds % 60}s";
  if (diff.inHours < 24) return "${diff.inHours}h ${diff.inMinutes % 60}m";
  if (diff.inDays < 30) return "${diff.inDays}j ${(diff.inHours % 24)}h";
  if (diff.inDays < 365) {
    final months = (diff.inDays / 30).floor();
    final days = diff.inDays % 30;
    return "${months}mois ${days}j";
  } else {
    final years = (diff.inDays / 365).floor();
    final months = ((diff.inDays % 365) / 30).floor();
    final days = (diff.inDays % 365) % 30;
    return "${years}a ${months}mois ${days}j";
  }
}
