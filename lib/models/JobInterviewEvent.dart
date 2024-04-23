class JobInterviewEvent {
  final String guestName;
  final String interviewerName;
  final DateTime dueDate;
  final String startTime;
  final String endTime;
  final String location;
  final String description;
  final String joinLink;
  final String meetingId;
  final String password;

  JobInterviewEvent({
    required this.guestName,
    required this.interviewerName,
    required this.dueDate,
    required this.startTime,
    required this.endTime,
    required this.location,
    required this.description,
    required this.joinLink,
    required this.meetingId,
    required this.password,
  });
}

