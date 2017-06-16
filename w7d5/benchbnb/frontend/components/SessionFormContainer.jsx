import SessionForm from './SessionForm';
import { login, signup } from '../actions/session_actions';
import { connect } from 'react-redux';

const mapStateToProps = (state, ownProps) => {
  return ({
    loggedIn: Boolean(state.session.currentUser),
    errors: state.session.errors,
    formType: (ownProps.location.pathname === '/login' ? 'login' : 'signup')
  });
};

const mapDispatchToProps = (dispatch, ownProps) => {
  const processFormType = (user) => {
    // debugger
    if (ownProps.location.pathname === '/login') {
      return dispatch(login(user));
    } else {
      return dispatch(signup(user));
    }
  };

  return ({
    processForm: (user) => processFormType(user)
  });
};

export default connect(mapStateToProps, mapDispatchToProps)(SessionForm);
