class Task {
  final String name;
  final int key;
  bool isDone;

  Task({required this.name,required this.key, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }

}
