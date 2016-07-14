var Timer = React.createClass({
  propTypes: {
    times: React.PropTypes.array,
    exercises: React.PropTypes.array
  },

  getInitialState: function() {
      return {
        secondsLeft: 0,
        index: 0
      };
    },
    tick: function() {
      if (this.state.secondsLeft > 0) {
        this.setState({secondsLeft: this.state.secondsLeft - 1});
      } else if (this.state.index < this.props.times.length) {
        this.setState({
          index: this.state.index + 1,
          secondsLeft: this.props.times[this.state.index + 1]
        });
      } else {
        alert("YOU DID ONE ROUND! KEEP GOING :D");
        clearInterval(this.interval);
        this.interval = null;
      }
    },
    componentDidMount: function() {
      this.setState({secondsLeft: this.props.times[0]});
    },
    componentWillUnmount: function() {
      clearInterval(this.interval);
      this.interval = null;
    },

getExerciseTimes: function() {
  var exerciseTimes = [];
  var time;

  for (var i = 0; i < this.props.times.length; i++) {
    if(i === this.state.index) {
      time = this.state.secondsLeft;
    } else if (i > this.state.index) {
      time = this.props.times[i];
    } else {
      time = 0;
    }

    var timeClass = time > 5 ? "orange": "red";

    exerciseTimes.push(
      <p className= "timer">
        {this.props.exercises[i]}:
        &nbsp;
        <span className={timeClass}>{time}</span>
      </p>
    );
  }

  return exerciseTimes;
},

  startTimer: function() {
    if (!this.interval){
      this.interval = setInterval(this.tick, 1000);
    }
  },

  resetTimer: function() {
    clearInterval(this.setInterval);
    this.interval = null;
    this.setState({
      secondsLeft: this.props.times[0],
      index: 0,
    });
  },

  render: function() {
    return (
      <div>
        {this.getExerciseTimes()}
        <button className="button button-primary" onClick={this.startTimer}>Start Timer</button>
        &nbsp;
        <button className="button button-primary" onClick={this.resetTimer}>Reset Timer</button>
    </div>
    );
  }
});
