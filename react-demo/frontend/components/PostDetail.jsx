import React from 'react';
import { Link } from 'react-router-dom';

class PostDetail extends React.Component {

  componentDidMount() {
    this.props.requestSinglePost(this.props.match.params.postId);
  }

  componentWillReceiveProps(nextProps) {
    if (this.props.match.params.postId !== nextProps.match.params.postId) {
      this.props.requestSinglePost(nextProps.match.params.postId);
    }
  }

  render() {
    const { currentPost } = this.props;
    // if (!currentPost) return null;

    if (!currentPost) return null;
    return (
      <div className="show-post">
        <h1>{ currentPost.title }</h1>
        <p>{ currentPost.body }</p>
      </div>
    );
  }
}

export default PostDetail;
