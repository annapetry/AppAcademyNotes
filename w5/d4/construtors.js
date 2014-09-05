function Cat (name, owner) {
  this.name = name;
  this.owner = owner;
};

Cat.prototype.cuteStatement = function() {
  return this.owner + " loves " + this.name;
};

var kitty = new Cat("Sox", "CJ");

console.log(kitty.cuteStatement());

Cat.prototype.cuteStatement = function() {
  return "Everybody loves " + this.name;
};

var kitty = new Cat("Rocks", "CJ");