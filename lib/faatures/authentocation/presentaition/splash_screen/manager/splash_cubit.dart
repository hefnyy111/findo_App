// faatures/authentocation/presentaition/splash_screen/manager/splash_cubit.dart
import 'package:findo/faatures/authentocation/presentaition/splash_screen/manager/splash_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashStates> {
 SplashCubit() : super(SplashInitialStates());

 static SplashCubit get(context) => BlocProvider.of(context);

  // ====================== Loading Splash ======================
 void LoadingSplash() {
  Future.delayed(Duration(seconds: 3), () {
    emit(SplashTimeFinishStates());
  });
 }

}