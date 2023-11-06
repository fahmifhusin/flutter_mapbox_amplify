part of constants;

class StringConstant{
  static final StringConstant _stringConstant = StringConstant._internal();

  StringConstant._internal();

  factory StringConstant() {
    return _stringConstant;
  }
  ///env
  final String development = 'Development';
  final String production = 'Production';
  ///home
  final String appName = 'Map Box';
  final String countDistance = 'Count Distance';
  final String currentLocationToPickup = 'Current Location to Pickup';
  final String currentLocationToDestination = 'Current Location to Destination';
  final String destination = 'Destination';
  final String msgErrorLocationDeny = 'Please allow permission from app settings';
  final String msgGetCurrentLocation = 'Get Current Location';
  final String msgLoadLocation = 'Getting your location...';
  final String msgMarkPoint = 'Switch to Mark';
  final String msgTitleErrorLocationDeny = 'Failed to get your location';
  final String pickup = 'Pick Up';
  final String pickupToDestination = 'Pickup to Destination';
  final String meters = 'Meters';
  final String from = 'from';
  final String to = 'to';
  final String distance = 'distance';
  final String startNavigation = 'Start Navigation';
  final String stopNavigation = 'Stop Navigation';
  final String action = 'Action';
  final String save = 'Save';

  ///sign up
  final String headerSignUp =
      'Register to Mapbox to Save your location';
  final String headerSignUpVerification = 'We have sent a verification code to';
  final String signUp = 'Register';
  final String emailOrPhone = 'Email / Phone Number';
  final String name = 'Full Name';
  final String email = 'Email';
  final String phoneNumber = 'Phone Number';
  final String password = 'Password';
  final String confirmPassword = 'Confirm Password';
  final String currentWeight = 'Current Weight (Kg)';
  final String weightGoals = 'Weight Goals (Kg)';
  final String or = 'or';
  final String alreadyHaveAccount = 'Already have an account? ';
  final String verifySignUp = 'Verify my Account';
  final String verificationCode = 'Verification Code';
  final String verificationSuccess= 'Verification Success';
  final String successVerify ='Register account Success!';
  final String hi = 'Hi,';
  final String tapMap = 'Tap the map to choose the destination';

  ///sign in
  final String signInHeader =
      'Log In to Mapbox to Save your location';
  final String signIn = 'Log in';
  final String dontHaveAccount = 'Don\'t have an account? ';

  ///other
  final String error = 'Error';
  final String generalMsgError = 'An error occurred, please try again in a few moments.';
}
