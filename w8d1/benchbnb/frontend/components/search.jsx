import React from 'react';
import BenchMap from './bench_map';
import BenchIndex from './bench_index';

const Search = (props) => {
// debugger
  return (
    <div>
    Search
      <BenchMap benches={props.benches} updateBounds={props.updateBounds} />
      <BenchIndex benches={props.benches} fetchBenches={props.fetchBenches} />
    </div>
  );
};

export default Search;
