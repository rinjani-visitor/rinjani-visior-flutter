enum BookingStatus {
  offering,
  waitingForPayment,
  declined,
  paymentReview,
  paymentFailed,
  success,
  unknown;

  factory BookingStatus.fromString(String value) {
    switch (value) {
      case 'Offering':
        return BookingStatus.offering;
      case 'Waiting for Payment':
        return BookingStatus.waitingForPayment;
      case 'Declined':
        return BookingStatus.declined;
      case 'Payment Reviewing':
        return BookingStatus.paymentReview;
      case 'Payment Failed':
        return BookingStatus.paymentFailed;
      case 'Success':
        return BookingStatus.success;
      default:
        return BookingStatus.unknown;
    }
  }
  String get value {
    switch (this) {
      case BookingStatus.offering:
        return 'Offering';
      case BookingStatus.waitingForPayment:
        return 'Waiting for Payment';
      case BookingStatus.declined:
        return 'Declined';
      case BookingStatus.paymentReview:
        return 'Payment Reviewing';
      case BookingStatus.paymentFailed:
        return 'Payment Failed';
      case BookingStatus.success:
        return 'Success';
      default:
        return 'unknown';
    }
  }
}

const bookingHistoryStatus = [
  'Offering',
  'Waiting for Payment',
  'Declined',
  'Payment Reviewing',
  'Payment Failed',
  'Success',
];
