class Task {
  final String name;        // Name of the task
  bool isCompleted;           // Completion status of the task

  Task({
    required this.name,     // Required parameter for task name
    this.isCompleted = false,  // Default completion status is false
  });
}
