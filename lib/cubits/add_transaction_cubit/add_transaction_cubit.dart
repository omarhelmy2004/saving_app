import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:saving_app/models/outcome_transaction_model.dart';

part 'add_transaction_state.dart';

class AddTransactionCubit extends Cubit<AddTransactionState> {
  AddTransactionCubit() : super(AddTransactionInitial());
  addOutComeTransaction(OutcomeModel outcomeModel){
    
  }
}
