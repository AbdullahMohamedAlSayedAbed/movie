bool shouldFetchFromNetwork(int? lastUpdateTimestamp) {
  if (lastUpdateTimestamp == null) return true;
  final lastUpdateTime =
      DateTime.fromMillisecondsSinceEpoch(lastUpdateTimestamp);
  final currentTime = DateTime.now();
  return currentTime.difference(lastUpdateTime).inMinutes > 10;
}
