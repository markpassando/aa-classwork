class Clock {
  constructor() {
    // 1. Create a Date object.
    this.startTime = new Date();

    // 2. Store the hours, minutes, and seconds.
    this.hours = this.startTime.getHours();
    this.minutes = this.startTime.getMinutes();
    this.seconds = this.startTime.getSeconds();

    // 3. Call printTime.
    //this.printTime();
    this.printTime();
    //printTime().bind(this)
    // 4. Schedule the tick at 1 second intervals.
    this._tick();
  }

  printTime() {
    // Format the time in HH:MM:SS
    // Use console.log to print it.
    console.log(`${this.hours} : ${this.minutes} : ${this.seconds}`);
  }//.bind?

  _tick() {
    // 1. Increment the time by one second.
    // 2. Call printTime.
    setInterval((printTime) => {
      // debugger;

      this.seconds += 1;
      // check if seconds is > 59
      //   then add to minute
      //   make secons 00
      //   check mins > 59
      //   add to hour
      //   check hour > 23
      //   reset 0
      if (this.seconds > 59) {
        this.seconds = 0;
        this.minutes += 1;
        if (this.minutes > 59) {
          this.minutes = 0;
          this.hours += 1;
          if (this.hours > 23) {
            this.hours = 0;
          }
        }
      }
      //this.printTime();
      this.printTime();
// do math
//printTime()
    }, 1000);

    }
  }

const clock = new Clock();
