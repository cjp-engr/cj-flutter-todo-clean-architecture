part of 'add_todo_bloc.dart';

abstract class AddTodoState extends Equatable {
  const AddTodoState();  

  @override
  List<Object> get props => [];
}
class AddTodoInitial extends AddTodoState {}
