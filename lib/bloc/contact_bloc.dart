import 'package:bloc/bloc.dart';
import 'package:contact_manager/models/user_contact_model.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(ContactInitial()) {
    on<AddContactEvent>((event, emit) async {
      emit(ContactLoading());

      try {
        final contact = UserContactModel(
          userName: event.userName,
          userPhoneNumber: event.userPhoneNumber,
        );

        final contactBox = Hive.box("CMContacts");
        await contactBox.add(contact.toMap());

        emit(ContactSuccess());
      } catch (e) {
        emit(ContactFailureState(e.toString()));
      }
    });
  }
}
