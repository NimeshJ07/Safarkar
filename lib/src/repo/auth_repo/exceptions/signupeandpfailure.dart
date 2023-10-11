class SignUpEandPFailure {
  final String msg;

  const SignUpEandPFailure([this.msg = "An Unknown error Ocurred!"]);

  factory SignUpEandPFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SignUpEandPFailure('Please enter a Strong Password.');
      case 'invalid-email':
        return const SignUpEandPFailure(
            'E-Mail is not valid or badly formatted.');
      case 'email-already-in-use':
        return const SignUpEandPFailure(
            'An Account is already added for this email.');
      case 'operation-not-allowed':
        return const SignUpEandPFailure(
            'This operation is not allowed, Please contact support');
      case 'user-disabled':
        return const SignUpEandPFailure('This user has been disabled');
      default:
        return const SignUpEandPFailure();
    }
  }
}
