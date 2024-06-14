class DialogParams {
  const DialogParams({
    required this.title,
    required this.content,
    required this.lButtonText,
    required this.rButtonText,
    required this.lRoute,
    required this.rRoute,
  });

  final String title;
  final String content;
  final String lButtonText;
  final String rButtonText;
  final String? lRoute;
  final String? rRoute;
}
