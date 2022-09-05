class DraggableQuestion {
  final String imageUrl;
  final String correctOptionUrl;

  DraggableQuestion({required this.imageUrl, required this.correctOptionUrl});
}

final List<DraggableQuestion> allNVRDraggableQuestions = [
  DraggableQuestion(
      imageUrl: "lib/assets/nvr_draggable.png",
      correctOptionUrl: "lib/assets/correct_q1.png"),
  DraggableQuestion(
      imageUrl: "lib/assets/nvr_draggable_2.png",
      correctOptionUrl: "lib/assets/correct_q2.png"),
];
