import { connect } from 'react-redux';
import PostIndex from './PostIndex';
import { requestAllPosts, deletePost } from '../actions/post_actions';
import { selectAllPosts } from '../reducers/selectors';

const mapStateToProps = state => ({
  posts: selectAllPosts(state),
});

const mapDispatchToProps = dispatch => ({
  requestAllPosts: () => dispatch(requestAllPosts()),
  deletePost: (post) => dispatch(deletePost(post))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PostIndex);
