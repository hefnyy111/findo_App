part of 'verify_code_cubit.dart';

@immutable
sealed class VerifyCodeState {}

final class VerifyCodeInitial extends VerifyCodeState {}

final class VerifyCodeDone extends VerifyCodeState {}

final class VerifyCodeDigitsUpdated extends VerifyCodeState {}

final class VerifyCodeValidationResult extends VerifyCodeState {}

final class VerifyCodeValid extends VerifyCodeState {}
class VerifyCodeLoading extends VerifyCodeState {}
