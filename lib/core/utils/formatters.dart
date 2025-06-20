import 'package:intl/intl.dart';

class Formatters {
  static String date(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  static String dateTime(DateTime dateTime) {
    return DateFormat('dd/MM/yyyy HH:mm').format(dateTime);
  }

  static String time(DateTime time) {
    return DateFormat('HH:mm').format(time);
  }

  static String monthYear(DateTime date) {
    return DateFormat('MMMM yyyy', 'es_ES').format(date);
  }

  static String dayMonth(DateTime date) {
    return DateFormat('dd MMM', 'es_ES').format(date);
  }

  static String currency(double amount) {
    return NumberFormat.currency(
      locale: 'es_PE',
      symbol: 'S/',
      decimalDigits: 2,
    ).format(amount);
  }

  static String percentage(double value) {
    return '${value.toStringAsFixed(0)}%';
  }

  static String duration(int seconds) {
    final duration = Duration(seconds: seconds);
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final secs = duration.inSeconds.remainder(60);

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else if (minutes > 0) {
      return '${minutes}m ${secs}s';
    } else {
      return '${secs}s';
    }
  }

  static String phone(String phone) {
    // Format: +51 987 654 321
    if (phone.length >= 9) {
      final cleaned = phone.replaceAll(RegExp(r'[^\d+]'), '');
      if (cleaned.startsWith('+')) {
        return cleaned.replaceAllMapped(
          RegExp(r'^(\+\d{2})(\d{3})(\d{3})(\d{3})$'),
              (match) => '${match[1]} ${match[2]} ${match[3]} ${match[4]}',
        );
      } else {
        return cleaned.replaceAllMapped(
          RegExp(r'^(\d{3})(\d{3})(\d{3})$'),
              (match) => '${match[1]} ${match[2]} ${match[3]}',
        );
      }
    }
    return phone;
  }

  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  static String capitalizeWords(String text) {
    return text.split(' ').map((word) => capitalize(word)).join(' ');
  }

  static String initials(String fullName) {
    final parts = fullName.trim().split(' ');
    if (parts.isEmpty) return '';

    if (parts.length == 1) {
      return parts[0].substring(0, 2).toUpperCase();
    }

    return parts.take(2).map((part) => part[0].toUpperCase()).join();
  }
}