enum BlocStatus {
  notInitialized,
  inProgress,
  completed,
  failed,
  connectionFailed,
  unAutorized;

  bool get isComplated => this == BlocStatus.completed;
  bool get isProgress => this == BlocStatus.inProgress;
}
