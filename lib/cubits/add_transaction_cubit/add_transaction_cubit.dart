import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_transaction_state.dart';

class AddTransactionCubit extends Cubit<AddTransactionState> {
  AddTransactionCubit() : super(AddTransactionInitial());
}
