import React, { Component } from 'react';
import LeftPane from './LeftPane';
import RightPane from './RightPane';

class App extends Component {
  constructor() {
    super();

    this.state = {
      selected: null,
      files: [
        {
          // TODO: Remove "content" as this should be read from file
          loc: 'file_one.jpg',
          content: 'def henk; binding.pry; end',
          methods: [
            {
              name: 'one()',
              fromLine: 0,
              toLine: 10,
              original: true
              // dupLocs: ["path/to/file_two.jpg", "path/to/file_three.jpg"]
            },
            {
              name: 'two()',
              fromLine: 0,
              toLine: 10,
              original: true
              // dupLocs: ["path/to/file_two.jpg", "path/to/file_three.jpg"]
            },
          ]
        }
      ]
    };
  }

  changeSelected(props) {
    this.setState({
      selected: props.selected,
      files: props.files
    });
  }

  render() {
    return (
      <div className="container">
        <LeftPane state={this.state} changeHook={this.changeSelected.bind(this)} />
        <div className="divider" />
        <RightPane />
      </div>
    );
  }
}

export default App;
