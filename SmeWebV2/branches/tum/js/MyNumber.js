//My Class
var MyNumber = function(numInput) {
    this.className = "MyNumber";

    this.prepareArithmetic = function(numValue) {
        return Math.round(numValue * (Math.pow(10, _precisionDigit)));
    };
    this.afterArithmetic = function(numValue) {
        return numValue / (Math.pow(10, _precisionDigit));
    };

    this.toNumber = function(input) {
        if (typeof (input) == "number") {
            result = input;
        } else if ((typeof (input) == "object") && (input.className == this.className)) {
            result = input.getValue();
        } else {
            while (input.indexOf(".") != input.lastIndexOf(".")) {
                input = input.substr(0, input.lastIndexOf("."));
            }
            //            if (input.indexOf(".") != input.lastIndexOf(".")) {
            //                input = input.substr(0, input.lastIndexOf("."));
            //            }
            result = new Number(input.replace(/[^0123456789.-]/g, ""));
        }

        return result;
    };

    //properties
    var _src = numInput;
    this.getSrc = function() {
        return _src;
    };

    var _value = this.toNumber(numInput);
    this.getValue = function() {
        return _value;
    };

    var _precisionDigit = 2;
    this.getPrecisionDigit = function() {
        return _value;
    };
    this.setPrecisionDigit = function(value) {
        _precisionDigit = value;
    };

    //return this.getValue();
};

MyNumber.prototype = {
    addition: function(myNumberObj) {
        var operand1 = this.getValue();
        var operand2 = this.toNumber(myNumberObj);

        return new MyNumber(this.afterArithmetic(this.prepareArithmetic(operand1) + this.prepareArithmetic(operand2)));
    },
    subtraction: function(myNumberObj) {
        var operand1 = this.getValue();
        var operand2 = this.toNumber(myNumberObj);

        return new MyNumber(this.afterArithmetic(this.prepareArithmetic(operand1) - this.prepareArithmetic(operand2)));
    },
    multiplication: function(myNumberObj) {
        var operand1 = this.getValue();
        var operand2 = this.toNumber(myNumberObj);

        return new MyNumber(operand1 * operand2);
    },
    division: function(myNumberObj) {
        var operand1 = this.getValue();
        var operand2 = this.toNumber(myNumberObj);

        return new MyNumber(operand1 / operand2);
    },
    modulus: function(myNumberObj) {
        var operand1 = this.getValue();
        var operand2 = this.toNumber(myNumberObj);

        return new MyNumber(operand1 % operand2);
    },
    toCurrency: function(precision) {
        var result;
        var leftDot = "0";
        var rightDot = "";

        if (precision) {
            if (typeof (precision) == "number") {
                for (var i = 0; i < precision; i++) {
                    rightDot = rightDot + "0";
                }
            } else {
                rightDot = "00";
            }
        }

        var inputStr = this.getValue().toFixed(precision);
        if (inputStr.search(/[.]/) == -1) {
            inputStr = inputStr + "." + rightDot;
        }

        var strArray = inputStr.split(".", 2);

        leftDot = strArray[0];
        rightDot = strArray[1];

        if (leftDot.length < 1) {
            leftDot = "0";
        }
        for (var i = rightDot.length; i < precision; i++) {
            rightDot = rightDot + "0";
        }

        var newLeftDot = "";
        var splitCount = 0;
        var isMinus = (Number(leftDot) < 0) ? true : false;
        var absoluteValue = leftDot.replace("-", "");

        for (var i = (absoluteValue.length - 1); i >= 0; i--) {
            if (splitCount == 3) {
                newLeftDot = "," + newLeftDot
                splitCount = 0;
                i++;
                continue;
            }

            newLeftDot = absoluteValue.charAt(i) + newLeftDot;
            splitCount++;
        }

        if (isMinus) {
            newLeftDot = "-" + newLeftDot;
        }

        if (rightDot.length > 0) {
            result = newLeftDot + "." + rightDot;
        } else {
            result = newLeftDot;
        }

        if (this.getSrc().length == 0) {
            result = this.getSrc();
        }

        return result;
    }
};