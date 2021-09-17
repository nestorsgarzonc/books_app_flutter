class CustomDateUtils {
  static String getGreeting({DateTime? dateTime}) {
    final hour = (dateTime ?? DateTime.now()).hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 18) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }
}
