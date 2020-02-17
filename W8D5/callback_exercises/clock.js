class Clock {
  constructor() {
    // 1. Create a Date object.
    const day = new Date()
    // 2. Store the hours, minutes, and seconds.
    this.hours = day.getHours()
    this.minutes = day.getMinutes()
    this.seconds = day.getSeconds()
    // 3. Call printTime.
    this.printTime()
    // 4. Schedule the tick at 1 second intervals.
    const that = this ; 
    setInterval(()=> that._tick() ,1000);

  }

  printTime() {
    // Format the time in HH:MM:SS
    // Use console.log to print it.
    let sec = this.seconds;
    let min = this.minutes;
    let hr = this.hours; 
    if (this.seconds < 10) {
      sec = `0${this.seconds}`;
    }
    if (this.minutes < 10) {
      min = `0${this.minutes}`;
    }
    if (this.hours < 10 ) {
      hr = `0${this.hours}`
    }
    console.log(`${hr}:${min}:${sec}`)
  }

  _tick() {
    this.seconds++;
    if (this.seconds >= 60){
      this.minutes++
      this.seconds -= 60
    }
    
    if (this.minutes >= 60){
      this.hours ++;
      this.minutes -= 60; 
    } 
    if (this.hours >= 24){
      this.hours = 0; 
    }
    // console.log(typeof this);
    // console.log(`${this.hours}:${this.minutes}:${this.seconds}`)
    this.printTime();
    // 1. Increment the time by one second.
    // 2. Call printTime.
  }
}

const clock = new Clock();
// console.log(clock.printTime())