import '../../careers/models/career_model.dart';

abstract class CareersState {}

class CareersInitial extends CareersState {}

class CareersLoading extends CareersState {}

class CareersLoaded extends CareersState {
    final List<Careers> careers;

    CareersLoaded(this.careers);
}

class CareersError extends CareersState {
    final String message;

    CareersError(this.message);
}