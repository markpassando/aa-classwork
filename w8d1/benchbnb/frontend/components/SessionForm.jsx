import React from 'react';
import { Link } from 'react-router-dom';

class SessionForm extends React.Component {
	constructor(props) {
    // debugger
		super(props);
		this.state = {
			username: "",
			password: ""
		};

    this.handleSubmit = this.handleSubmit.bind(this);
  }

  componentWillUnmount() {
    // debugger

      this.props.clearErrors();

  }

  update(field) {
    return e => {
      this.setState({[field]: e.currentTarget.value});
    };
  }

  handleSubmit(e) {
    e.preventDefault();
    const user = Object.assign({}, this.state);
    this.props.processForm(user).then(action => this.props.history.push("/"));
  }

  render() {
    const { formType, errors } = this.props;

    let otherForm;
    if (formType === 'login') {
      otherForm = <Link to='/signup'>Sign Up</Link>;
    } else {
      otherForm = <Link to='/login'>Log In</Link>;
    }

    const showErrors = () => {
      if (errors) {
        return errors.map( (el, i) => <li key={i}>{el}</li>);
      }
    };

    return (
      <div>
        <h2>{formType}</h2>
        <div>
          { otherForm }
          <ul>
            {showErrors()}
          </ul>
        </div>
        <form onSubmit={this.handleSubmit}>
          <label> Username:
          <input onChange={this.update("username")} value={this.state.username} />
          </label>

          <label> Password:
          <input onChange={this.update("password")} value={this.state.password} />
          </label>

          <input type="submit" value={formType}/>
        </form>
      </div>
    );
  }
}

export default SessionForm;
