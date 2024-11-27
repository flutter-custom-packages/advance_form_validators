enum ErrorMessage {
  /// Basic Text Validation
  exactLength('This field must contain exactly {length} characters.'),
  lengthRange('This field must contain between {min} and {max} characters.'),
  maxLength('This field must contain no more than {max} characters.'),
  minLength('This field must contain at least {min} characters.'),
  pattern('The input does not match the required pattern.'),
  required('This field is required.'),

  /// Numeric Validation
  decimal('Please enter a valid decimal number.'),
  decimalValue('Please enter a value with at least {decimal} decimal places.'),
  maxValue('The value cannot exceed {max}.'),
  minValue('The value must be at least {min}.'),
  negativeNumber('Please enter a negative number.'),
  numberOnly('Please enter a valid number.'),
  positiveNumber('Please enter a positive number.'),
  numberRange('The value must be between {min} and {max}.'),

  /// Email/Password Validation
  confirmPassword('Passwords do not match.'),
  email('Please enter a valid email address.'),
  passwordStrength('The password does not meet the required strength.'),
  minimumLenght('The password must be at least {min} characters long.'),
  uppercase('The password must contain at least one uppercase letter.'),
  lowercase('The password must contain at least one lowercase letter.'),
  number('This field must contain at least one number.'),
  username('Please enter a valid username.'),

  /// Date/Time Validation

  afterDate('The date must be after {afterDate}.'),
  afterTime('The time must be after {afterTime}.'),
  beforeDate('The date must be before {beforeDate}.'),
  beforeTime('The time must be before {beforeTime}.'),
  dateGeneral('Invalid date format'),
  dateFormat('Please enter a valid date format {formatType}'),
  dateRange('The date must be between {startDate} and {endDate}.'),
  timeGeneral('Invalid time format'),
  timeFormat('Please enter a valid time format {formatType}'),
  timeRange('The time must be between {startTime} and {endTime}.');

  final String message;

  const ErrorMessage(this.message);
}
