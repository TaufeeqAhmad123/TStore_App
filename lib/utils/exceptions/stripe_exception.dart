/// Exception class for handling various Stripe errors.
class StripeExceptions implements Exception {
  /// The associated error message.
  final String message;

  /// Default constructor with a generic error message.
  const StripeExceptions([this.message = 'An unexpected error occurred during the payment process. Please try again.']);

  /// Create a Stripe exception from a Stripe error code.
  factory StripeExceptions.fromCode(String code) {
    switch (code) {
      case 'authentication_error':
        return const StripeExceptions('Authentication with Stripe failed. Please check your credentials.');
      case 'api_connection_error':
        return const StripeExceptions('Network error: Failed to connect to Stripe. Please check your internet connection.');
      case 'api_error':
        return const StripeExceptions('An error occurred with the Stripe API. Please try again later.');
      case 'card_error':
        return const StripeExceptions('There was an error with your card. Please check your card details.');
      case 'idempotency_error':
        return const StripeExceptions('Duplicate request detected. Please wait a moment and try again.');
      case 'invalid_request_error':
        return const StripeExceptions('Invalid request made to Stripe. Please check your request parameters.');
      case 'rate_limit_error':
        return const StripeExceptions('Too many requests made to Stripe in a short period. Please try again later.');
      case 'validation_error':
        return const StripeExceptions('Validation failed. Please ensure all information is correct and try again.');
      case 'expired_card':
        return const StripeExceptions('The card has expired. Please use a different card.');
      case 'incorrect_cvc':
        return const StripeExceptions('The CVC code is incorrect. Please check and try again.');
      case 'incorrect_number':
        return const StripeExceptions('The card number is incorrect. Please check and try again.');
      case 'insufficient_funds':
        return const StripeExceptions('Insufficient funds. Please use a different payment method.');
      case 'invalid_expiry_month':
        return const StripeExceptions('The card\'s expiry month is invalid. Please check and try again.');
      case 'invalid_expiry_year':
        return const StripeExceptions('The card\'s expiry year is invalid. Please check and try again.');
      case 'invalid_number':
        return const StripeExceptions('The card number is invalid. Please check and try again.');
      case 'processing_error':
        return const StripeExceptions('An error occurred while processing the payment. Please try again later.');
     default:
        return const StripeExceptions();
    }}}