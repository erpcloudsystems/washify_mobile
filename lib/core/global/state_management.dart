import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:washify_mobile/features/authentication/presentation/data/services/otp_services.dart';
import 'package:washify_mobile/features/authentication/presentation/logic/otp/cubit/otp_cubit.dart';

import '../../features/authentication/presentation/data/services/auth_repository.dart';
import '../../features/authentication/presentation/logic/auth/auth_cubit.dart';

class StateManagement {
  static dynamic providers = [
    BlocProvider(
      create: (context) => AuthCubit(AuthAPI()),
    ),
    BlocProvider(
      create: (context) => OtpCubit(OtpServices()),
    ),
  ];
}
