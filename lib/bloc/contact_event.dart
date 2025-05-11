part of 'contact_bloc.dart';

sealed class ContactEvent extends Equatable {
  const ContactEvent();
}

// Add Contact Event
class AddContactEvent extends ContactEvent {
  final String userName;
  final String userPhoneNumber;

  const AddContactEvent(this.userName, this.userPhoneNumber);
  @override
  List<Object> get props => [userName, userPhoneNumber];
}
