
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/authentication/presentation/data/services/auth_repository.dart';
import '../../features/authentication/presentation/logic/cubit/auth_cubit.dart';


class StateManagement {
  static dynamic providers = [
 
    BlocProvider(
      create: (context) => AuthCubit(AuthAPI()),
    ),
  
  ];
}
