import '../../careers/models/career_model.dart';

abstract class CareersEvent {}

class LoadCareers extends CareersEvent{}

class AddCareers extends CareersEvent{
    final Careers careers;
    
    AddResult(this.careers);
}

class DeleteCareers extends CareersEvent{
    final int careersId;

    DeleteResult(this.careersId);
}