class TFirebaseAuthException implements Exception {
  final String code;

  TFirebaseAuthException(this.code);

  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'This email address is already registered. Please use a different email.';
      case 'invalid-email':
        return 'The email address provided is invalid.';
      case 'weak-password':
        return 'The password is too weak. Please choose a stronger password.';
      case 'user-disabled':
        return 'This user account has been disabled. Please contact support for assistance.';
      case 'user-not-found':
        return 'Invalid login details. User not found.';
      case 'wrong-password':
        return 'Incorrect password. Please check your password and try again.';
      case 'invalid-verification-code':
        return 'Invalid verification code. Please enter a valid code.';
      case 'invalid-verification-id':
        return 'Invalid verification ID. Please request a new verification code.';
      case 'quota-exceeded':
        return 'Quota exceeded. Please try again later.';
      case 'email-already-exist':
        return 'The email address already exists. Please use a different email.';
      case 'provider-already-linked':
        return 'The account is already linked with another provider.';
      case 'operation-not-allowed':
        return 'This operation is not allowed. Please contact support.';
      case 'too-many-requests':
        return 'Too many requests. Please wait and try again later.';
      case 'credential-already-in-use':
        return 'This credential is already associated with a different user account.';
      case 'invalid-credential':
        return 'The credential provided is invalid or has expired.';
      case 'network-request-failed':
        return 'Network error. Please check your connection and try again.';
      case 'requires-recent-login':
        return 'Please log in again to perform this action.';
      case 'account-exists-with-different-credential':
        return 'An account already exists with the same email but different credentials. Use the associated login method.';
      case 'invalid-phone-number':
        return 'The provided phone number is not valid. Please enter a valid phone number.';
      case 'timeout':
        return 'The request timed out. Please try again.';
      default:
        return 'A platform error occurred. Please try again.';
    }
  }
}
