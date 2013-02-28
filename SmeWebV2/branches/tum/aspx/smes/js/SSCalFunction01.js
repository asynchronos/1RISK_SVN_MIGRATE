//My Class
var MyNumber = function (numInput) {
    this.className = "MyNumber";

    this.prepareArithmetic = function (numValue) {
        return Math.round(numValue * (Math.pow(10, _precisionDigit)));
    };
    this.afterArithmetic = function (numValue) {
        return numValue / (Math.pow(10, _precisionDigit));
    };

    this.toNumber = function (input) {
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
    this.getSrc = function () {
        return _src;
    };

    var _value = this.toNumber(numInput);
    this.getValue = function () {
        return _value;
    };

    var _precisionDigit = 2;
    this.getPrecisionDigit = function () {
        return _value;
    };
    this.setPrecisionDigit = function (value) {
        _precisionDigit = value;
    };

    //return this.getValue();
};

MyNumber.prototype = {
    addition: function (myNumberObj) {
        var operand1 = this.getValue();
        var operand2 = this.toNumber(myNumberObj);

        return new MyNumber(this.afterArithmetic(this.prepareArithmetic(operand1) + this.prepareArithmetic(operand2)));
    },
    subtraction: function (myNumberObj) {
        var operand1 = this.getValue();
        var operand2 = this.toNumber(myNumberObj);

        return new MyNumber(this.afterArithmetic(this.prepareArithmetic(operand1) - this.prepareArithmetic(operand2)));
    },
    multiplication: function (myNumberObj) {
        var operand1 = this.getValue();
        var operand2 = this.toNumber(myNumberObj);

        return new MyNumber(operand1 * operand2);
    },
    division: function (myNumberObj) {
        var operand1 = this.getValue();
        var operand2 = this.toNumber(myNumberObj);

        return new MyNumber(operand1 / operand2);
    },
    modulus: function (myNumberObj) {
        var operand1 = this.getValue();
        var operand2 = this.toNumber(myNumberObj);

        return new MyNumber(operand1 % operand2);
    },
    toCurrency: function (precision) {
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

// JScript source code
var SSProject = function () {

    this.ShowNotAssignedMsg = function (fieldName) {
        alert(fieldName + " not assigned.");
        return NaN;
    };

    this.RoundUp = function (number, num_digits) {
        // alert(number);
        ///alert(num_digits);
        return (number / Math.abs(number)) * Math.ceil(Math.abs(number) * Math.pow(10, num_digits)) / Math.pow(10, num_digits);
    };

    this.RoundDown = function (number, num_digits) {
        return (number / Math.abs(number)) * Math.floor(Math.abs(number) * Math.pow(10, num_digits)) / Math.pow(10, num_digits);
    };

    this.PV = function (rate, nper, pmt) {
        //         alert('rate' + rate);
        //         alert('nper' + nper);
        //        alert('pmt' + pmt);
        return -1 * pmt * (1 / (rate)) * (1 - Math.pow(1 / (1 + rate), nper));
    };

    this.PMT = function (rate, nper, pv) {
        //        alert('rate' + rate);
        //        alert('nper' + nper);
        //        alert('pv' + pv);
        //        alert(pv / ((1 / (rate)) * (1 - Math.pow(1 / (1 + rate), nper))));
        if (pv / ((1 / (rate)) * (1 - Math.pow(1 / (1 + rate), nper)))) {
            return -1 * pv / ((1 / (rate)) * (1 - Math.pow(1 / (1 + rate), nper)));
        }
        else {
            return 0
        }
    };

    var C5, C6;

    var D8, D9, D10;

    var D13, D14, D15, D16, D17;

    var D20, D21, D24, D25, D26, D27, D28;

    var D29, D30, D31, D32, D33, D34, D35, D36, D37, D38, D39, D40, D41;

    var D43, D44, D45;

    var F10, F15, F21;

    var DX06, DX07;


    //RM Input
    var I33, I34, I35, I36, I37;

    var I39, I40, I41, I42, I43, I44, I45, I46;

    var M25, M27, O27;


    // Table Lookup  
    var O35, O37;
    var USE_TABLE;
    var MARGIN, DSCR, AP, AR, STOCK, LTV, WORKING_CAPITAL, RATE, CONTRACT;

    // ฟิวที่เพิ่มภายหลัง
   
    var CURRENT_ASSET_OTHER; // สินทรัพถาวรอื่น ๆ
    var NEW_WORKING_CAPITAL; // เงินทุนหมุนเวียนเกิดใหม่
    var REFINANCE_WORKING_CAPITAL_BAY // refinance wc bay
    var REFINANCE_WORKING_LOAN_BAY // refinnance loan bay
    var REFINANCE_REPAYMENT_BAY  // ภาระผ่อน
      
};

SSProject.prototype = {
    setC5: function (input) {
        this.C5 = (new MyNumber(input)).getValue();
        return this;
    },
    getC5: function () {
        if (!this.C5 && this.C5 != 0) {
            return this.ShowNotAssignedMsg("C5");
        } else {
            return this.C5;
        }
    },

    setC6: function (input) {
        this.C6 = (new MyNumber(input)).getValue();
        return this;
    },
    getC6: function () {
        if (!this.C6 && this.C6 != 0) {
            return this.ShowNotAssignedMsg("C6");
        } else {
            return this.C6;
        }
    },

    setD8: function (input) {
        this.D8 = (new MyNumber(input)).getValue();
        return this;
    },
    getD8: function () {
        if (!this.D8 && this.D8 != 0) {
            return this.ShowNotAssignedMsg("D8");
        } else {
            return this.D8;
        }
    },

    setD9: function (input) {
        this.D9 = (new MyNumber(input)).getValue();
        return this;
    },
    getD9: function () {
        if (!this.D9 && this.D9 != 0) {
            return this.ShowNotAssignedMsg("D9");
        } else {
            return this.D9 / 100; // เป็น % จึงหาร 100 
        }
    },

    setD10: function (input) {
        this.D10 = (new MyNumber(input)).getValue();
        return this;
    },
    getD10: function () {
        if (!this.D10 && this.D10 != 0) {
            return this.ShowNotAssignedMsg("D10");
        } else {
            return this.D10;
        }
    },

    setD13: function (input) {
        this.D13 = (new MyNumber(input)).getValue();
        return this;
    },
    getD13: function () {
        if (!this.D13 && this.D13 != 0) {
            return this.ShowNotAssignedMsg("D13");
        } else {
            return this.D13;
        }
    },

    setD14: function (input) {
        this.D14 = (new MyNumber(input)).getValue();
        return this;
    },
    getD14: function () {
        if (!this.D14 && this.D14 != 0) {
            return this.ShowNotAssignedMsg("D14");
        } else {
            return this.D14 / 100; // เป็น % จึงหาร 100 ;
        }
    },

    setD15: function (input) {
        this.D15 = (new MyNumber(input)).getValue();
        return this;
    },
    getD15: function () {
        if (!this.D15 && this.D15 != 0) {
            return this.ShowNotAssignedMsg("D15");
        } else {
            return this.D15;
        }
    },

    setD16: function (input) {
        this.D16 = (new MyNumber(input)).getValue();
        return this;
    },
    getD16: function () {
        if (!this.D16 && this.D16 != 0) {
            return this.ShowNotAssignedMsg("D16");
        } else {
            return this.D16 / 100; // return percen value
        }
    },

    setD17: function (input) {
        this.D17 = (new MyNumber(input)).getValue();
        return this;
    },
    getD17: function () {
        if (!this.D17 && this.D17 != 0) {
            return this.ShowNotAssignedMsg("D17");
        } else {
            return this.D17 / 100;  // percen
        }
    },

    setD20: function (input) {
        this.D20 = (new MyNumber(input)).getValue();
        return this;
    },
    getD20: function () {
        if (!this.D20 && this.D20 != 0) {
            return this.ShowNotAssignedMsg("D20");
        } else {
            return this.D20;
        }
    },

    setD21: function (input) {
        this.D21 = (new MyNumber(input)).getValue();
        return this;
    },
    getD21: function () {
        if (!this.D21 && this.D21 != 0) {
            return this.ShowNotAssignedMsg("D21");
        } else {
            return this.D21;
        }
    },

    setD24: function (input) {
        this.D24 = (new MyNumber(input)).getValue();
        return this;
    },
    getD24: function () {
        if (!this.D24 && this.D24 != 0) {
            return this.ShowNotAssignedMsg("D24");
        } else {
            return this.D24;
        }
    },

    setD25: function (input) {
        this.D25 = (new MyNumber(input)).getValue();
        return this;
    },
    getD25: function () {
        if (!this.D25 && this.D25 != 0) {
            return this.ShowNotAssignedMsg("D25");
        } else {
            return this.D25;
        }
    },

    setD26: function (input) {
        this.D26 = (new MyNumber(input)).getValue();
        return this;
    },
    getD26: function () {
        if (!this.D26 && this.D26 != 0) {
            return this.ShowNotAssignedMsg("D26");
        } else {
            return this.D26;
        }
    },
    setDX06: function (input) {
        this.DX06 = (new MyNumber(input)).getValue();
        return this;
    },
    getDX06: function () {
        if (!this.DX06 && this.DX06 != 0) {
            return this.ShowNotAssignedMsg("DX06");
        } else {
            return this.DX06;
        }
    },

    setD27: function (input) {
        this.D27 = (new MyNumber(input)).getValue();
        return this;
    },
    getD27: function () {
        if (!this.D27 && this.D27 != 0) {
            return this.ShowNotAssignedMsg("D27");
        } else {
            return this.D27;
        }
    },

    setD28: function (input) {
        this.D28 = (new MyNumber(input)).getValue();
        return this;
    },
    getD28: function () {
        if (!this.D28 && this.D28 != 0) {
            return this.ShowNotAssignedMsg("D28");
        } else {
            return this.D28;
        }
    },

    setD29: function (input) {
        this.D29 = (new MyNumber(input)).getValue();
        return this;
    },
    getD29: function () {
        if (!this.D29 && this.D29 != 0) {
            return this.ShowNotAssignedMsg("D29");
        } else {
            return this.D29 / 100;  // return percent value 
        }
    },

    setD30: function (input) {
        this.D30 = (new MyNumber(input)).getValue();
        return this;
    },
    getD30: function () {
        if (!this.D30 && this.D30 != 0) {
            return this.ShowNotAssignedMsg("D30");
        } else {
            return this.D30;
        }
    },

    setD31: function (input) {
        this.D31 = (new MyNumber(input)).getValue();
        return this;
    },
    getD31: function () {
        if (!this.D31 && this.D31 != 0) {
            return this.ShowNotAssignedMsg("D31");
        } else {
            return this.D31;
        }
    },

    setD32: function (input) {
        this.D32 = (new MyNumber(input)).getValue();
        return this;
    },
    getD32: function () {
        if (!this.D32 && this.D32 != 0) {
            return this.ShowNotAssignedMsg("D32");
        } else {
            return this.D32;
        }
    },

    setD33: function (input) {
        this.D33 = (new MyNumber(input)).getValue();
        return this;
    },
    getD33: function () {
        if (!this.D33 && this.D33 != 0) {
            return this.ShowNotAssignedMsg("D33");
        } else {
            return this.D33;
        }
    },

    setD34: function (input) {
        this.D34 = (new MyNumber(input)).getValue();
        return this;
    },
    getD34: function () {
        if (!this.D34 && this.D34 != 0) {
            return this.ShowNotAssignedMsg("D34");
        } else {
            return this.D34;
        }
    },

    setD35: function (input) {
        this.D35 = (new MyNumber(input)).getValue();
        return this;
    },
    getD35: function () {
        if (!this.D35 && this.D35 != 0) {
            return this.ShowNotAssignedMsg("D35");
        } else {
            return this.D35;
        }
    },

    setD36: function (input) {
        this.D36 = (new MyNumber(input)).getValue();
        return this;
    },
    getD36: function () {
        if (!this.D36 && this.D36 != 0) {
            return this.ShowNotAssignedMsg("D36");
        } else {
            return this.D36;
        }
    },

    setD37: function (input) {
        this.D37 = (new MyNumber(input)).getValue();
        return this;
    },
    getD37: function () {
        if (!this.D37 && this.D37 != 0) {
            return this.ShowNotAssignedMsg("D37");
        } else {
            return this.D37;
        }
    },

    setD38: function (input) {
        this.D38 = (new MyNumber(input)).getValue();
        return this;
    },
    getD38: function () {
        if (!this.D38 && this.D38 != 0) {
            return this.ShowNotAssignedMsg("D38");
        } else {
            return this.D38;
        }
    },

    setD39: function (input) {
        this.D39 = (new MyNumber(input)).getValue();
        return this;
    },
    getD39: function () {
        if (!this.D39 && this.D39 != 0) {
            return this.ShowNotAssignedMsg("D39");
        } else {
            return this.D39;
        }
    },

    setD40: function (input) {
        this.D40 = (new MyNumber(input)).getValue();
        return this;
    },
    getD40: function () {
        if (!this.D40 && this.D40 != 0) {
            return this.ShowNotAssignedMsg("D40");
        } else {
            return this.D40;
        }
    },

    setD41: function (input) {
        this.D41 = (new MyNumber(input)).getValue();
        return this;
    },
    getD41: function () {
        if (!this.D41 && this.D41 != 0) {
            return this.ShowNotAssignedMsg("D41");
        } else {
            return this.D41;
        }
    },

    setD43: function (input) {
        this.D43 = (new MyNumber(input)).getValue();
        return this;
    },
    getD43: function () {
        if (!this.D43 && this.D43 != 0) {
            return this.ShowNotAssignedMsg("D43");
        } else {
            return this.D43;
        }
    },

    setD44: function (input) {
        this.D44 = (new MyNumber(input)).getValue();
        return this;
    },
    getD44: function () {
        if (!this.D44 && this.D44 != 0) {
            return this.ShowNotAssignedMsg("D44");
        } else {
            return this.D44;
        }
    },

    setD45: function (input) {
        this.D45 = (new MyNumber(input)).getValue();
        return this;
    },
    getD45: function () {
        if (!this.D45 && this.D45 != 0) {
            return this.ShowNotAssignedMsg("D45");
        } else {
            return this.D45;
        }
    },

    setF10: function (input) {
        this.F10 = (new MyNumber(input)).getValue();
        return this;
    },
    getF10: function () {
        if (!this.F10 && this.F10 != 0) {
            return this.ShowNotAssignedMsg("F10");
        } else {
            return this.F10;
        }
    },

    setF15: function (input) {
        this.F15 = (new MyNumber(input)).getValue();
        return this;
    },
    getF15: function () {
        if (!this.F15 && this.F15 != 0) {
            return this.ShowNotAssignedMsg("F15");
        } else {
            return this.F15;
        }
    },

    setF21: function (input) {
        this.F21 = (new MyNumber(input)).getValue();
        return this;
    },
    getF21: function () {
        if (!this.F21 && this.F21 != 0) {
            return this.ShowNotAssignedMsg("F21");
        } else {
            return this.F21;
        }
    },

    setI33: function (input) {
        this.I33 = (new MyNumber(input)).getValue();
        return this;
    },
    getI33: function () {
        if (!this.I33 && this.I33 != 0) {
            return this.ShowNotAssignedMsg("I33");
        } else {
            return this.I33;
        }
    },

    setI34: function (input) {
        this.I34 = (new MyNumber(input)).getValue();
        return this;
    },
    getI34: function () {

        if (!this.I34 && this.I34 != 0) {
            return this.ShowNotAssignedMsg("I34");
        } else {
            return this.I34;
        }
    },

    setI35: function (input) {
        this.I35 = (new MyNumber(input)).getValue();
        return this;
    },
    getI35: function () {
        if (!this.I35 && this.I35 != 0) {
            return this.ShowNotAssignedMsg("I35");
        } else {
            return this.I35;
        }
    },

    setI36: function (input) {
        this.I36 = (new MyNumber(input)).getValue();
        return this;
    },
    getI36: function () {
        if (!this.I36 && this.I36 != 0) {
            return this.ShowNotAssignedMsg("I36");
        } else {
            return this.I36;
        }
    },


    setI37: function (input) {
        this.I37 = (new MyNumber(input)).getValue();
        return this;
    },
    getI37: function () {
        if (!this.I37 && this.I37 != 0) {
            return this.ShowNotAssignedMsg("I37");
        } else {
            return this.I37;
        }
    },

    setI39: function (input) {
        this.I39 = (new MyNumber(input)).getValue();
        return this;
    },
    getI39: function () {
        if (!this.I39 && this.I39 != 0) {
            return this.ShowNotAssignedMsg("I39");
        } else {
            return this.I39;
        }
    },

    setI40: function (input) {
        this.I40 = (new MyNumber(input)).getValue();
        return this;
    },
    getI40: function () {
        if (!this.I40 && this.I40 != 0) {
            return this.ShowNotAssignedMsg("I40");
        } else {
            return this.I40;
        }
    },

    setI41: function (input) {
        this.I41 = (new MyNumber(input)).getValue();
        return this;
    },
    getI41: function () {
        if (!this.I41 && this.I41 != 0) {
            return this.ShowNotAssignedMsg("I41");
        } else {
            return this.I41;
        }
    },

    setI42: function (input) {
        this.I42 = (new MyNumber(input)).getValue();
        return this;
    },
    getI42: function () {
        if (!this.I42 && this.I42 != 0) {
            return this.ShowNotAssignedMsg("I42");
        } else {
            return this.I42;
        }
    },

    setI43: function (input) {
        this.I43 = (new MyNumber(input)).getValue();
        return this;
    },
    getI43: function () {
        if (!this.I43 && this.I43 != 0) {
            return this.ShowNotAssignedMsg("I43");
        } else {
            return this.I43;
        }
    },

    setI44: function (input) {
        this.I44 = (new MyNumber(input)).getValue();
        return this;
    },
    getI44: function () {
        if (!this.I44 && this.I44 != 0) {
            return this.ShowNotAssignedMsg("I44");
        } else {
            return this.I44;
        }
    },
    setI45: function (input) {
        this.I45 = (new MyNumber(input)).getValue();
        return this;
    },
    getI45: function () {
        if (!this.I45 && this.I45 != 0) {
            return this.ShowNotAssignedMsg("I45");
        } else {
            return this.I45;
        }
    },
    setI46: function (input) {
        this.I46 = (new MyNumber(input)).getValue();
        return this;
    },
    getI46: function () {
        if (!this.I46 && this.I46 != 0) {
            return this.ShowNotAssignedMsg("I46");
        } else {
            return this.I46;
        }
    },
    setM25: function (input) {
        this.M25 = (new MyNumber(input)).getValue();
        return this;
    },
    getM25: function () {
        if (!this.M25 && this.M25 != 0) {
            return this.ShowNotAssignedMsg("M25");
        } else {
            return this.M25;
        }
    },

    setO27: function (input) {
        this.O27 = (new MyNumber(input)).getValue();
        return this;
    },
    getO27: function () {
        if (!this.O27 && this.O27 != 0) {
            return this.ShowNotAssignedMsg("O27");
        } else {
            return this.O27;
        }
    },

    setM33: function (input) {
        this.M33 = (new MyNumber(input)).getValue();
        return this;
    },
    getM33: function () {
        if (!this.M33 && this.M33 != 0) {
            return this.ShowNotAssignedMsg("M33");
        } else {
            return this.M33 / 100;  // get ค่าเป็น percent
        }
    },

    setM34: function (input) {
        this.M34 = (new MyNumber(input)).getValue();
        return this;
    },
    getM34: function () {
        if (!this.M34 && this.M34 != 0) {
            return this.ShowNotAssignedMsg("M34");
        } else {
            return this.M34 / 100; // get ค่าเป็น percent
        }
    },

    setO34: function (input) {
        this.O34 = (new MyNumber(input)).getValue();
        return this;
    },
    getO34: function () {
        if (!this.O34 && this.O34 != 0) {
            return this.ShowNotAssignedMsg("O34");
        } else {
            return this.O34;
        }
    },

    setO35: function (input) {
        // this.M35 = (new MyNumber(input)).getValue();
        this.O35 = (new MyNumber(input)).getValue();
        return this;
    },
    getO35: function () {
        if (!this.O35 && this.O35 != 0) {
            return this.ShowNotAssignedMsg("O35");
        } else {
            return this.O35;
        }
    },

    setO37: function (input) {
        this.O37 = (new MyNumber(input)).getValue();
        return this;
    },
    getO37: function () {
        if (!this.O37 && this.O37 != 0) {
            return this.ShowNotAssignedMsg("O37");
        } else {
            return this.O37;
        }
    },
    // ลบ set get N40 
    // tam
    // get table lookup 


    setUSE_TABLE: function (newUSE_TABLE) {
        // กำหนดค่าว่าให้ใช้ table lookup หรือไม่ 1=yes,0=no
        this.USE_TABLE = newUSE_TABLE;
    },
    getDSCR: function () {
        return this.DSCR;
    },
    setDSCR: function (input) {
        this.DSCR = (new MyNumber(input)).getValue();
        return this;
    },
    getMARGIN: function () {
         return this.MARGIN;
    },
    setMARGIN: function (input) {
        this.MARGIN = (new MyNumber(input)).getValue();
        return this;
    },
    getAP: function () {
        return this.AP;
    },
    setAP: function (input) {
        this.AP = (new MyNumber(input)).getValue();
        return this;
    },
    getAR: function () {
        return this.AR;
    },
    setAR: function (input) {
        this.AR = (new MyNumber(input)).getValue();
        return this;
    },
    getSTOCK: function () {
        return this.STOCK;
    },
    setSTOCK: function (input) {
        this.STOCK = (new MyNumber(input)).getValue();
        return this;
    },
    getLTV: function () {
        return this.LTV;
    },
    setLTV: function (input) {
        this.LTV = (new MyNumber(input)).getValue();
        return this;
    },
    setRATE: function (input) {
        this.RATE = (new MyNumber(input)).getValue();
        return this;
    },
    getRATE: function () {
        return this.RATE;
    }
    , setWORKING_CAPITAL: function (input) {
        this.WORKING_CAPITAL = (new MyNumber(input)).getValue();
        return this;
    }
    , getWORKING_CAPITAL: function () {
        return this.WORKING_CAPITAL;
    }
    , setCONTRACT: function () {
        return this.CONTRACT;
    }
    , getCONTRACT: function (input) {
        this.CONTRACT = (new MyNumber(input)).getValue();
        return this;
    }
    // other field
    , setNEW_WORKING_CAPITAL: function (newCURRENT_ASSET_OTHER) {
        this.NEW_WORKING_CAPITAL = newCURRENT_ASSET_OTHER;
    },
    getNEW_WORKING_CAPITAL: function () {
        this.NEW_WORKING_CAPITAL = this.getI33() + this.getI34() + this.getI36();
        return this.NEW_WORKING_CAPITAL;
    }
   , setCURRENT_ASSET_OTHER: function (newCURRENT_ASSET_OTHER) {
        this.CURRENT_ASSET_OTHER = newCURRENT_ASSET_OTHER;
    },
    getCURRENT_ASSET_OTHER: function () {
        return this.CURRENT_ASSET_OTHER;
    }
   , setREFINANCE_WORKING_CAPITAL_BAY: function (newREFINANCE_WORKING_CAPITAL_BAY) {
        this.REFINANCE_WORKING_CAPITAL_BAY = newREFINANCE_WORKING_CAPITAL_BAY;
    },
    getREFINANCE_WORKING_CAPITAL_BAY: function () {
        return this.REFINANCE_WORKING_CAPITAL_BAY;
    }
  , setREFINANCE_WORKING_LOAN_BAY: function (newREFINANCE_WORKING_LOAN_BAY) {
        this.REFINANCE_WORKING_LOAN_BAY = newREFINANCE_WORKING_LOAN_BAY;
    },
    getREFINANCE_WORKING_LOAN_BAY: function () {
        return this.REFINANCE_WORKING_LOAN_BAY;
    }
    ,setREFINANCE_REPAYMENT_BAY: function (newREFINANCE_REPAYMENT_BAY) {
        this.REFINANCE_REPAYMENT_BAY = newREFINANCE_REPAYMENT_BAY;
    },
    getREFINANCE_REPAYMENT_BAY: function () {
        return this.REFINANCE_REPAYMENT_BAY;
    }
  

    //calculator functional
   , I9: function () {
       return this.getD28() + this.getI37();
   }
    , I10: function () {
        if (this.USE_TABLE == 1) { 
             // ยอดขาย * % ขายเชื่อ * AR_table / 30
             return this.getD8() * this.getD9() * this.getAR() / 30;
        } else {
          if (this.getD8() * this.getD9() > 0) {
                if (this.getD10() == 0) { 
                    return 0; 
                } else {
                    return this.getD8() * this.getD9() * this.getD10() / 30;
                }
            } else {
                return 0;
            } 
         } // use table
    }
    , I11: function () {
        if (this.USE_TABLE == 1) {
            // ยอดซื้อ  *  จำนวนวัน default /30
            return this.getD13() * this.getSTOCK() / 30
        } else {
            // กรณีที่ไม่ใช้ค่า  table ให้คำนวณค่า stock จากการกรอก
            if (this.getD21() == 0) {
                return this.getD20();
            } else {
                return this.getD21();  // ไม่ใช้ code ด้านล่างเนื่องจากไม่ได้เป็นสูตร Default
                //                if (this.getD21() < this.getD13() * this.getF21() / 30) {
                //                    return this.getD21()
                //                } else {
                //                    return this.getD13() * this.getF21() / 30
                //                }
            }
        } // use table
    }
    , I13: function () {
        return this.I9() + this.I10() + this.I11() + this.getCURRENT_ASSET_OTHER() + this.getNEW_WORKING_CAPITAL();
    }
    , I15: function () {
        return this.getD25();
    }
    , I16: function () {
        return this.getD26();
    }
    , I17: function () {
        return this.getD27();
    }
    , I18: function () {
        return this.getI36();
    }
    , DX07: function () {
        return this.getDX06();
    }
    , I20: function () {
        return this.I15() + this.I16() + this.I17() + this.I18() + this.DX07();
    }
    , I22: function () {
        return this.I13() + this.I20();
    }
    , H25: function () {
        //percentage
        return (100 - this.getM25()) / 100;

    }
    , I25: function (useNop) {  // ebida
         if (this.USE_TABLE == 1) { 
             // ยอดขาย * 12 (เป็นปี) * Margin table * % ebda
             return (this.getD8() * 12 * this.getMARGIN()) * this.H25();
         }  else {
             // ยอดขาย * 12 (เป็นปี) * กำไรจากการดำเนินการ * % ebda
             return (this.getD8() * 12 * this.getD17()) * this.H25();
         }
    }
    , I26: function () {


        var chkDiv0 = (this.I22() - this.getI35() - this.getI36()) - (this.N18() - this.getI33() - this.getI34());
        //   var chkDiv0 = (this.I22() - this.getI35() - this.getI36()) - (this.getN18() - this.getI33() - this.getI34());

        if (chkDiv0 == 0) {
            return NaN;
        } else {
            //alert((this.N18() - this.getI33() - this.getI34()));
            //alert((this.N18() - this.getI33() - this.getI34()) / chkDiv0);
            return (this.N18() - this.getI33() - this.getI34()) / chkDiv0;

            //     return (this.getN18() - this.getI33() - this.getI34()) / chkDiv0;
        }
    }
    , I27: function (useNop) {

        if (this.getD31() + this.getD32() + this.getD33() + this.getD35() + this.getD37() + this.getD39() == 0) {
            return NaN;
        } else {
            // remark getN25();
            // return ((this.I25() + this.getN25()) / 12) / ((this.getD35() + this.getD37() + this.getD39()) + (((this.getD31() + this.getD32() + this.getD33()) * M27) / 12));

            return ((this.I25() + this.N25()) / 12) /
                            ((this.getD35() + this.getD37() + this.getD39()) + (((this.getD31() + this.getD32() + this.getD33()) * this.M27()) / 12));
        }

    }
    , I28: function () {
        if (this.getJ28() > 1.15 * this.getD10) {
            alert("J28 Value not match.");
        } else {
            //no warning
        }
    }
    , J28: function () {
        var chkDiv0 = this.getD8() * this.getD9();
        if (this.I10() != 0 && chkDiv0 != 0 && this.getD24() != 0) {
            return 365 / (this.getD8() * (this.getD9()) * 12 / this.getD24());
        } else {
            return 0;
        }
    }
    , I29: function () {
        if (this.J29() > 1.15 * this.getF21) {
            alert("J29 Value not match.");
        } else {
            //no warning
        }
    }
    , J29: function () {
        if (this.I11() == 0) {
            return 0;
        } else if (this.getD13() != 0) {
            if (this.getD21() == 0) {
                return 365 / (this.getD13() * 12 / this.getD20());
            } else {
                return 365 / (this.getD13() * 12 / this.getD21());
            }
        } else {
            return NaN;
        }
    }
    , I30: function () {
        if (this.I11() + this.I10() - this.N9() < 0) {
            return 0;
        } else {
            return this.RoundUp(this.I11() + this.I10() - this.N9(), -4);
        }
    }
    , I31: function () {
        //if (this.O35() == 0) {
        if (this.getO35() == 0) {
            //alert('1');
            return 0;
        } else {
            //            alert(this.I25() / this.getO35());
            var I30;
            if (this.I30()) {
                I30 = this.I30(); // รับค่าจาก working cap ในกรณ๊ที่ working cap ไม่มีค่าจะได้ค่ำนวนได้
            } else {
                I30 = 0;
            }

            // alert(I30);
            //  alert(this.M27());
            //alert(this.I25());
            //alert(this.I25() / this.getO35());
            // alert(I30 * this.M27());
            if ((this.I25() / this.getO35()) - (I30 * this.M27()) > 0) {
                // alert(' xx more 0');
                return this.RoundDown(
                     -1 * this.PV(
                        this.M27() / 12
                        , this.getO27() * 12
                        , ((this.I25() / this.getO35()) - (I30 * this.M27())) / 12)
                    , -4
                   );
            } else {
                // alert(' xx less 0');
                return 0;
            }
        }
    }
    , N9: function () { // เจ้าหนี้การค้า
        if (this.USE_TABLE == 1) {
            //alert(this.getAP() );
            // ยอดซื้อ * % ซื้อเชื่อ * ap_table / 30
             return this.getD13() * this.getD14() * this.getAP() / 30;
        } else {
            if (this.getD13() * this.getD14() > 0) {
               // alert('not use table');
                 return this.getD13() * this.getD14() * this.getD15() / 30;
            } else {
                if (this.getD30() > 0) {
                    return 0; //"ลูกค้าไม่มีรายการซื้อเชื่อ";
                } else {
                    return 0;
                }
            }
        }
    }
    , N10: function () {
        return this.getD31() + this.getI33() - this.getREFINANCE_WORKING_CAPITAL_BAY();
    }
    , N11: function () {
        if (this.getI33() + this.getI34() == 0) {
            return this.getD32() + this.getD33();
        } else {
            return this.getD32() + this.getD33() - (this.getD43() + this.getREFINANCE_WORKING_CAPITAL_BAY());
        }
    }
    , N13: function () {
        return this.N9() + this.N10() + this.N11();
    }
    , N15: function () {
        return this.getD34() + this.getI34() - this.getREFINANCE_WORKING_LOAN_BAY();
    }
    , N16: function () {
        if (this.getI33() + this.getI34() == 0) {
            return this.getD36() + this.getD38();
        } else {
            return this.getD36() + this.getD38() - this.getD44();
        }
    }
    , N18: function () {
        return this.N13() + this.N15() + this.N16();
    }
    , N20: function () {
        return this.getD40();
    }
    , N21: function () {
        return this.I22() - this.N18() - this.N20();
    }
    , N22: function () {
        return this.N18() + this.N20() + this.N21();
    }
    // add by tam
    , N25: function () {
        return (this.I25() * this.getM25() / 100) / this.H25();
    }
    , N28: function () {
        if (this.O28() > 1.15 * this.getD15()) {
            return "***";
        } else {
            return "";
        }
    }
    , O28: function () {
        if (this.N9() == 0) {
            return 0;
        } else {
            return 365 / ((this.getD13() * this.getD14() * 12) / this.getD30());
        }
    }
    , N30: function (useNop) {
        useNop = true;
        if (useNop) { // use p'nop function in excel
            if (this.getO35() == 0) {
                return 0;
            } else {
                var I30;
                if (this.I30()) {
                    I30 = this.I30(); // รับค่าจาก working cap ในกรณ๊ที่ working cap ไม่มีค่าจะได้ค่ำนวนได้
                } else {
                    I30 = 0;
                }

                if ((this.I25() / this.getO35() / 12) - (this.getD35() + this.getD37() + this.getD39() - (this.getD45() + this.getREFINANCE_REPAYMENT_BAY())) > 0) {
                    if (((this.I25() / this.getO35()) / 12) - ((I30 * this.M27()) / 12) - (this.getD35() + this.getD37() + this.getD39() - (this.getD45() + this.getREFINANCE_REPAYMENT_BAY())) > 0) {
                        return this.RoundDown(I30 - (this.N10() + this.N11() - (this.getD43() + this.getREFINANCE_WORKING_CAPITAL_BAY())), -4);
                    } else {
                        return this.RoundDown(((((this.I25() / this.getO35()) / 12) - (this.getD35() + this.getD37() + this.getD39() - (this.getD45() + this.getREFINANCE_REPAYMENT_BAY()))) * 12) / this.M27() - (this.N10() + this.N11() - (this.getD43() + this.getREFINANCE_WORKING_CAPITAL_BAY())), -4);
                    }
                } else {
                    return this.RoundDown(0 - (this.N10() + this.N11() - (this.getD43() + this.getREFINANCE_WORKING_CAPITAL_BAY())), -4);
                }
            }
        } else { //use my function
            if (this.getO35() == 0) {
                return 0;
            } else {
                var temp1 = this.I25() / this.getO35() / 12;
                var temp2 = this.getD35() + this.getD37() + this.getD39() - (this.getD45() + this.getREFINANCE_REPAYMENT_BAY());

                if (temp1 - temp2 > 0) {
                    if (temp1 - (this.I30() * this.M27() / 12) - temp2 > 0) {
                        return this.RoundDown(this.I30() - this.N10() + this.N11() - (this.getD43() + this.getREFINANCE_WORKING_CAPITAL_BAY()), -4);
                    } else {
                        return this.RoundDown(temp1 - (temp2 * 12 / this.M27()) - (this.N10() + this.N11() - (this.getD43() + this.getREFINANCE_WORKING_CAPITAL_BAY())), -4);
                    }
                } else {
                    return this.RoundDown(0 - (this.N10() + this.N11() - (this.getD43() + this.getREFINANCE_WORKING_CAPITAL_BAY())), -4);
                }
            }
        }
    }
    , N31: function () {
        if (this.getO35() == 0) {
            return 0;
        } else {
            var a, b, c, d, e, f, pmt;
            if (this.M27() / 12) {
                a = this.M27() / 12;
            }
            else {
                a = 0;
            }
            if (this.getO27() * 12) {
                b = this.getO27() * 12;
            } else {
                b = 0;
            }
            //            alert('I25=' + this.I25());
            //            alert('O35=' + this.getO35());
            if ((this.I25() / this.getO35())) {
                c = this.I25() / this.getO35();
            } else {
                c = 0;
            }
            if (((this.getD31() + this.getD32() + this.getD33() - (this.getD43() + this.getREFINANCE_WORKING_CAPITAL_BAY())) * this.M27())) {
                d = ((this.getD31() + this.getD32() + this.getD33() - (this.getD43() + this.getREFINANCE_WORKING_CAPITAL_BAY())) * this.M27());
            } else {
                d = 0;
            }
            if ((this.getI33() * this.getM33())) {
                e = (this.getI33() * this.getM33());
            } else {
                e = 0;
            }


            if ((this.getD35() + this.getD37() + this.getD39() - (this.getD45() + this.getREFINANCE_REPAYMENT_BAY()))) {
                f = (this.getD35() + this.getD37() + this.getD39() - (this.getD45() + this.getREFINANCE_REPAYMENT_BAY()));
            } else {
                f = 0;
            }
            //var pmt;
            // if (this.PMT(this.getM34() / 12, this.getO34() * 12, this.getI34(), 0)) {
            //  alert('m34=' + this.getM34() * 100);
            // alert('o34= ' + this.getO34());
            //  alert('i34=' + this.getI34());
            pmt = this.PMT((this.getM34()) / 12, this.getO34() * 12, this.getI34(), 0);  // pmt ok

            //            alert(this.getM34() / 12);
            //            alert(this.getO34() * 12);
            //            alert(this.getI34());
            //            alert('pmt=' + pmt);
            //            // ที่กำหนดให้มีตัวแปรแทนแต่ละช่วงเพราะบางช่วงอาจมีค่า 0 หรือ nan ทำให้ค่าไม่ตรง
            //            alert('a=' + a);
            //            alert('b=' + b);
            //            alert('d=' + d);
            //            alert('e=' + e);
            var g = (c - d - e) / 12;
            //alert('c=' + c);
            //alert('cde/12' + (c - d - e) / 12);
            // alert('f=' + f);
            //            alert('(c - d - e) / 12) ' + (c - d - e) / 12);
            //            alert('(f + pmt)' + (f + pmt));
            //            alert('((c - d - e) / 12) - (f + pmt)' + ((c - d - e) / 12) - (f + pmt));
            var z = parseFloat(g - f + pmt);
            //alert('z=' + z);
            return this.RoundDown(
               -1 * this.PV(a, b, z)
            , -4);
        }
    }
    // tam modified 
    // ระวัง rate ในตารางต้องเป็น จุดทศนิยมเช่น 0.08=8%
    , M27: function () {
        //        alert('d29' + this.getD29());
        //        alert('getRate' + this.getRATE());
        //if (this.getD29() > this.getRATE()) {
        return this.getD29();
        //} else {
        //    return this.getRATE();
        //}
    }
    , M35: function () {
        // ไม่ต้องเช็ค woking cap และ loan ว่าเป็น 0 หรือไม่ เพราะทำให้ dscr เป็น 0
        //if (this.getI33() + this.getI34() == 0) {
        //    return 0;
        // } else {
        var temp = 0;
        if (this.getO34() != 0) {
            temp = -1 * this.PMT(this.getM34() / 12, this.getO34() * 12, this.getI34());
        }
        return ((this.I25() / 12) / (this.getD39() + this.getD37() + this.getD35() - (this.getD45() + this.getREFINANCE_REPAYMENT_BAY()) + (((this.getD31() + this.getD32() + this.getD33() - (this.getD43() + this.getREFINANCE_WORKING_CAPITAL_BAY())) * this.M27()) / 12) + ((this.getI33() * this.getM33()) / 12) + temp));
        // }
    }
    , M36: function () {
        //        alert('F N18' + this.N18());
        //        alert('F N20' + this.N20());
        //        alert('F N21' + this.N21());
        if (this.N20() + this.N21() == 0) {
            return 0;
        } else {
            //            alert('F M36()=' + this.N18() / (this.N20() + this.N21()));
            return this.N18() / (this.N20() + this.N21());
        }
    }
    , M37: function () {
        if (this.getI39() + this.getI40() + this.getI41() + this.getI42() + this.getI43() == 0) {
            return 0;
        } else {

            return (this.N10() + this.N15() + this.getD41() + this.getI35() - this.getI44()) / (this.getI39() + this.getI40() + this.getI41() + this.getI42() + this.getI43());
        }
    }
    , N40: function () {
        return this.I30(); // แก้ไขให้ตรงกับ workingcap need
        // return this.RoundDown(this.getWORKING_CAPITAL() * this.getD8(), -4);
    }
    , N41: function () {
        if ((this.getO35() != 0) && ((this.I25() / this.getO35()) - (this.N40() * this.M27())) > 0) {
            return this.RoundDown(-1 * this.PV(this.M27() / 12, this.getO27() * 12, ((this.I25() / this.getO35()) - (this.N40() * this.M27())) / 12), -4);
        } else {
            return 0;
        }
    }
    , N43: function () {
        // alert('O35:' + this.getO35());

        if (this.getO35() == 0) {
            return 0;
        } else {
            // (ebida / dscr /12) -  (หนี้สินหมุนเวียน * อัตราดอกเบี้ย /12) -(ทุก ๆ ภาระผ่อนชำระหนี้ต่อเดือน )
            x = (((this.I25() / this.getO35()) / 12) - ((this.N11() * this.M27() / 12) - (this.getD35() + this.getD37() + this.getD39() - (this.getD45() + this.getREFINANCE_REPAYMENT_BAY()))));
            //alert('x=' + x);
            if (x > 0) {
                y = ((this.N40() * this.M27()) / 12);
                if ((x - y) > 0) {
                    if ((this.N40() + this.N15() + this.getD41() - this.getI44()) > (this.T17() * this.getO37())) {
                        // alert('x1');
                        return this.RoundDown((this.T17() * this.getO37()) - this.N15() - this.getD41() - this.N10(), -4);  // x1

                    } else {
                        //alert('x2');
                        return this.RoundDown((this.N40() - this.N10()), -4);
                    }
                } else {
                    if ((((x * 12) / this.M27()) + this.N15() + this.getD41() - this.getI44()) > (this.T17() * this.getO37())) {
                        // alert('x3');
                        return this.RoundDown((this.T17() * this.getO37()) - this.N15() - this.getD41() - this.N10(), -4);
                    } else {
                        //alert('x4');  // correct
                        // alert(this.M27());
                        //  return this.RoundDown(((((((this.I25() / this.getO35()) / 12) - ((this.N11() * this.M27()) / 12) - (this.getD35() + this.getD37() + this.getD39() - this.getD45())) * 12) / this.M27()) - this.N10()), -4);
                        return this.RoundDown((((x * 12) / this.M27()) - this.N10()), -4);
                    }
                }
            } else {
                //  alert('x5');
                return this.RoundDown(0 - this.N10(), -4);
            }
        }
    }
    , N44: function () {
        //         alert(this.N10() + this.N15() + this.getD41() + this.getI35());
        //         alert(this.getI44() + this.R44());
        //         alert((this.N10() + this.N15() + this.getD41() + this.getI35()) - this.getI44() + this.R44());

        if ((this.N10() + this.N15() + this.getD41() + this.getI35()) - this.getI44() + this.R44() > (this.T17() * this.getO37())) {
            //alert('1');
            return this.RoundDown((this.T17() * this.getO37()) - (this.N10() + this.N15() + this.getD41() + this.getI35() - this.getI44()), -4);

        } else {
            //alert('2');
            return this.RoundDown(this.R44(), -4);

        }
    }
    , R44: function () {
        if (this.getO35() == 0) {
            return 0;
        } else {

            if (this.RoundDown(-1 * this.PV(this.M27() / 12, this.getO27() * 12, (this.I25() / this.getO35() / 12) - ((this.N10() + this.N11() - this.getI33()) * this.M27() / 12) - (this.getI33() * this.getM33() / 12) - (this.getD35() + this.getD37() + this.getD39() - (this.getD45() + this.getREFINANCE_REPAYMENT_BAY())) + this.PMT(this.getM34() / 12, this.getO34() * 12, this.getI34())), -4)) {
                return this.RoundDown((-1 * this.PV(this.M27() / 12
                                                                     , this.getO27() * 12
                                                                     , ((this.I25() / this.getO35()) / 12) - (((this.N10() + this.N11() - this.getI33()) * this.M27()) / 12)
                                                                        - ((this.getI33() * this.getM33()) / 12)
                                                                        - (this.getD35() + this.getD37() + this.getD39() - (this.getD45() + this.getREFINANCE_REPAYMENT_BAY()))
                                                                        + this.PMT(this.getM34() / 12, this.getO34() * 12, this.getI34(), 0)
                                                                     , 0
                                                             )
                                                  ), -4);
            } else {
                return 0;
            }
        }
    }
    , T7: function () {
        return this.getI39();
    }
    , T8: function () {
        return this.getI40();
    }
    , T9: function () {
        return this.getI41();
    }
    , T10: function () {
        return this.getI42();
    }
    , T11: function () {
        return this.getI43();
    }
     , T12: function () {
         return this.getI45();
     }
    , T13: function () {
        return this.getI46();
    }
    , T17: function () {
        return this.T7() + this.T8() + this.T9() + this.T10() + this.T11() + this.T12() + this.T13();
    }
    , X99: function () {
        if (useNop) { // use p'nop function in excel

        } else { //use my function

        }
    }
};