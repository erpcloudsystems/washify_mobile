import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:washify_mobile/features/authentication/data/services/otp_services.dart';
import 'package:washify_mobile/features/authentication/logic/otp/cubit/otp_cubit.dart';
import 'package:washify_mobile/features/car/data/services/car_service.dart';
import 'package:washify_mobile/features/car/logic/cubit/car_cubit.dart';
import 'package:washify_mobile/features/subscription/controller/cubit/subscription_cubit.dart';
import 'package:washify_mobile/features/subscription/data/services/subscription_services.dart';

import '../../features/authentication/data/services/auth_repository.dart';
import '../../features/authentication/logic/auth/auth_cubit.dart';

class StateManagement {
  static dynamic providers = [
    BlocProvider(
      create: (context) => AuthCubit(AuthAPI()),
    ),
    BlocProvider(
      create: (context) => OtpCubit(OtpServices()),
    ),
    BlocProvider(
      create: (context) => SubscriptionCubit(SubscriptionServices()),
    ),
    BlocProvider(
      create: (context) => CarCubit(CarServices()),
    ),
  ];
}
