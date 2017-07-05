import React from 'react';
import {connect} from 'react-redux';
import { editPost, requestSinglePost } from '../actions/post_actions';

class EditPostContainer extends React.Component {
  constructor(props) {
    super(props);
    this.state =  {
      title: '',
      body: '',
      id: this.props.match.params.postId
    };

    this.handleSubmit = this.handleSubmit.bind(this);
  }

  componentDidMount() {
    this.props.requestSinglePost(this.props.match.params.postId).then(() => {
      this.setState({title: this.props.currentPost.title, body: this.props.currentPost.body });
    });
  }

  update(field) {
    return e => {
      this.setState({[field]: e.currentTarget.value});
    };
  }

  handleSubmit(e) {
    e.preventDefault();
    const post = this.state;
    // post.id = this.props.match.params.postId;
    this.props.editPost({post}).then(action => this.props.history.push("/"));
    // this.props.editPost({post}).then(action => this.props.history.push("/"));
  }


  render(){
    const { currentPost } = this.props;
    if (!currentPost) return null;

    return (
      <div className="edit-form">
        <div className="form">
          <h1>Edit Post</h1>
          <form onSubmit={this.handleSubmit}>

            <div className="form-inputs">
              <label>Title</label>
              <input onChange={this.update("title")} value={this.state.title} />
            </div>

            <br />

            <div className="form-inputs">
              <label>Body</label>
              <input onChange={this.update("body")} value={this.state.body} />
            </div>

            <br />
            <div className="btn-container">
              <input className="btn" type="submit" value="Submit"/>
            </div>
          </form>
        </div>
      </div>
    );
  }
}

const mapStateToProps = state => ({
  currentPost: state.posts.currentPost
});

const mapDispatchToProps = dispatch => ({
  editPost: post => dispatch(editPost(post)),
  requestSinglePost: (id) => dispatch(requestSinglePost(id))
});

export default connect(mapStateToProps, mapDispatchToProps)(EditPostContainer);
