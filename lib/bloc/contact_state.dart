part of 'contact_bloc.dart';

sealed class ContactState extends Equatable {
  const ContactState();
}

final class ContactInitial extends ContactState {
  @override
  List<Object> get props => [];
}

// Contact Loading state
class ContactLoading extends ContactState {
  @override
  List<Object> get props => [];
}

// Contact Success state
class ContactSuccess extends ContactState {
  @override
  List<Object?> get props => [];
}

// Contact Error State
class ContactFailureState extends ContactState {
  final String error;

  const ContactFailureState(this.error);

  @override
  List<Object?> get props => [error];
}
