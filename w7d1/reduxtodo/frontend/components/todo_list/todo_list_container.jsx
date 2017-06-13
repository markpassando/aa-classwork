import React from 'react';
import { connect } from 'react-redux';
import TodoList from './todo_list.jsx';
import { allTodos } from '../../reducers/selectors.js';
import { createTodo, removeTodo, fetchTodos, receiveErrors, clearErrors } from '../../actions/todo_actions.js';

const mapStateToProps = (state) => {
  return ({
    todos: allTodos(state)
  });
};

const mapDispatchToProps = (dispatch) => {
  return ({
    createTodo: (todo) => dispatch(createTodo(todo)),
    removeTodo: (todo) => dispatch(removeTodo(todo)),
    fetchTodos: () => dispatch(fetchTodos()),
    getErrors: (errors) => dispatch(receiveErrors(errors)),
    clearErrors: () => dispatch(clearErrors())
  });
};

export default connect (
  mapStateToProps,
  mapDispatchToProps
)(TodoList);
