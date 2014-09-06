Function.prototype.myBind = function(obj) {
	var fn = this;
	return function() {		
		fn.apply(obj);
	};
};



function Clock () {
}

Clock.TICK = 5000;

Clock.prototype.printTime = function (){
	console.log("Current Time: " + this.hours + ":" + 
	this.minutes + ":" + this.seconds);
};

Clock.prototype.run = function() {
	var timeNow = new Date();
	this.seconds = timeNow.getSeconds(),
	this.minutes = timeNow.getMinutes(),
	this.hours = timeNow.getHours();
	this.printTime();
	setInterval(this._tick.myBind(this), Clock.TICK);
};

Clock.prototype._tick = function() {
	this.seconds += 5;
	if(this.seconds > 59){
		this.seconds -= 60;
		this.minutes += 1;
		if(this.minutes > 59){
			this.minutes -= 60;
			this.hours += 1;
			if(this.hours > 23){
				this.hours -= 24;
			}
		}
	}
	this.printTime();
};

var clock = new Clock();
clock.run();
