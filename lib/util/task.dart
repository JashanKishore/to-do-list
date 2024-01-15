class Task {
  final String name;        // Name of the task
  bool completed;           // Completion status of the task

  Task({
    required this.name,     // Required parameter for task name
    this.completed = false,  // Default completion status is false
  });
}
