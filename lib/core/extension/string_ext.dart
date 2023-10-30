extension StringExtension on String {
  String getYoutubeId() {
    final regExp = RegExp(r'(?<=v=)[A-Za-z0-9_-]+(?=&|$)');
    final match = regExp.firstMatch(this);
    return match!.group(0)!;
  }
}
