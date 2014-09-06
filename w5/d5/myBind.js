Function.prototype.myBind = function (obj) {
	var fn = this;
	return function () {
		fn.apply(obj);
	};
};
