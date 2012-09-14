var ns4 = (document.layers) ? true : false;
var ie4 = (document.all) ? true : false;

//function for get element by id
function ele(id, obj, debug) {
    var functionName = "ele(id,obj)";

    if (!debug) { debug = false; }
    if (!obj) obj = window;

    var result = null;

    try {
        result = obj.document.getElementById(id);
    } catch (err) {
        if (debug) {
            alert(functionName + ":failure \nCan't find id " + id);
            result = false;
        }
    }

    return result;
}

//function for get elements by name
function arrayE(name, obj) {
    if (!obj) obj = this;
    return document.getElementsByName(name);
}
//show hide elements object
function showHide(divId) {
    var visibility = null;
    if (ns4) {
        if ((visibility = ele(divId).style.visibility) == "show")
            ele(divId).style.visibility = "hide";
        else if (visibility == "hide")
            ele(divId).style.visibility = "show";
    } else {
        if ((visibility = ele(divId).style.visibility) == "visible")
            ele(divId).style.visibility = "hidden";
        else if (visibility == "hidden")
            ele(divId).style.visibility = "visible";
    }
}
//show elements object
function show(divId) {
    if (ns4) ele(divId).style.visibility = "show";
    else ele(divId).style.visibility = "visible";
}
//hide elements object
function hide(divId) {
    if (ns4) ele(divId).style.visibility = "hide";
    else ele(divId).style.visibility = "hidden";
}

function changeDisplay(domId, displayValue) {
    ele(domId).style.display = displayValue;
}

// <summary>
// find value in query string by key
// </summmary>
// <param name="key" type="string">key of query string</param>
function getValueFromQueryString(key) {
    //new array
    var result = new Array("No Query String", "No Query String");

    //search get ?key1=value1&key2=value2&...
    //substring get key1=value1&key2=value2&...
    var queryStr = window.location.search.substring(1);

    if (queryStr != undefined) {
        //split value to array 
        //ex key1=value1,key2=value2,...
        var queryArray = queryStr.split("&");

        for (i = 0; i < queryArray.length; i++) {
            if (queryArray[i].indexOf(key) >= 0) {
                //key1,value1
                result = queryArray[i].split("=");
                break;
            }
        }
    }

    return result[1];
}

//copy any value to clipboard
function copy2Clipboard(id) {
    window.clipboardData.setData('Text', ele(id).innerHTML);
    return false;
    // get the clipboard data
    //var emailText = window.clipboardData.getData('Text');

    //clear clipboard data
    //window.clipboardData.clearData();
}

// <summary>
// use for set value
// </summmary>
// <param name="dom" type="dom">dom element to set value</param>
// <param name="value" type="string">value to set</param>
function setDomValue(dom, value) {
    if (!dom) return false;

    dom.value = value;
}

// <summary>
// use for set value with seperate
// </summmary>
// <param name="dom" type="dom">dom element to set value</param>
// <param name="value" type="string">value to set</param>
// <param name="seperate" type="string">ตัวคั่นระหว่างคำ</param>
function setDomValueWithSeperate(dom, value, seperate) {
    if (!dom) return false;

    if (!seperate) seperate = "";
    dom.value = dom.value + seperate + value;
}

// <summary>
// use for set value
// </summmary>
// <param name="domId" type="string">id of dom element to set value</param>
// <param name="value" type="string">value to set</param>
function setDomValueById(domId, value) {
    setValueToDOM(ele(domId), value);
}

// <summary>
// use for get value
// </summmary>
// <param name="dom" type="dom">dom element to get value</param>
// <param name="value" type="string">value to get</param>
function getDomValue(dom) {
    if (!dom) return false;

    var result = null;

    elemNodeName = dom.nodeName.toLowerCase();

    if (elemNodeName == "input"
	|| elemNodeName == "select"
	|| elemNodeName == "option"
	|| elemNodeName == "textarea") {
        result = dom.value;
    } else {
        result = dom.innerHTML;
    }

    return result;
}

// <summary>
// use for get value
// </summmary>
// <param name="domId" type="string">id of dom element to get value</param>
// <param name="value" type="string">value to get</param>
function getDomValueById(domId) {
    return getDomValue(ele(domId));
}

function mapDropdown2TextboxById(dropdownId, textboxId, propertyName) {
    if (!ele(dropdownId) || !ele(textboxId)) return false;

    mapDropdown2Textbox(ele(dropdownId), ele(textboxId), propertyName);
}

function mapDropdown2Textbox(dropdownObj, textboxObj, propertyName) {
    if (!dropdownObj || !textboxObj) return false;

    if (!propertyName) { propertyName = "value"; }

    if (propertyName == "value") {
        textboxObj.value = dropdownObj.options[dropdownObj.selectedIndex].value;
    } else {
        textboxObj.value = dropdownObj.options[dropdownObj.selectedIndex].text;
    }
}

// <summary>
//      
// </summmary>
// <param name="targetDomId" type="string">id ของ dom ที่จะทำการ set property</param>
// <param name="targetDomParent" type="string">parent ของ target dom เช่น window.opener,this </param>
// <param name="propertyName" type="string">property ที่ต้องการจะ set, Default:innerHTML </param>
// <param name="value" type="string">ค่าที่จะ set</param>
function setPropertyValueById(targetDomId, targetDomParent, propertyName, value, debug) {
    var functionName = "setPropertyValueById";
    var result = "";

    try {
        if (!debug) { debug = false; }
        if (!targetDomParent) { targetDomParent = "this"; }

        var targetDom = ele(targetDomId, eval(targetDomParent));
        result = setPropertyValue(targetDom, propertyName, value);
    } catch (err) {
        if (debug) {
            result = "Failure";
            alert(functionName + ":Failure \n" + err.description);
        }
    }

    return result;
}

// <summary>
//      
// </summmary>
// <param name="targetDom" type="string">dom object ที่จะทำการ set property</param>
// <param name="propertyName" type="string">property ที่ต้องการจะ set, Default:innerHTML </param>
// <param name="value" type="string">ค่าที่จะ set</param>
function setPropertyValue(targetDom, propertyName, value, debug) {
    var functionName = "setPropertyValue";
    var result = "Success";

    try {
        if (!debug) { debug = false; }
        if (!propertyName) { propertyName = "innerHTML"; }

        var script = "targetDom." + propertyName + " = value;";
        eval(script);
    } catch (err) {
        if (debug) {
            result = "Failure";
            alert(functionName + ":Failure \n" + err.description);
        }
    }

    return result;
}

// <summary>
//      
// </summmary>
// <param name="targetDom" type="string">dom object ที่จะทำการ get property</param>
// <param name="targetDomParent" type="string">parent ของ target dom เช่น window.opener,this </param>
// <param name="propertyName" type="string">property ที่ต้องการจะ get value, Default:innerHTML </param>
function getPropertyValueById(targetDomId, targetDomParent, propertyName, debug) {
    var functionName = "getPropertyValueById";
    var result = "";

    try {
        if (!debug) { debug = false; }
        if (!targetDomParent) { targetDomParent = "this"; }

        var targetDom = ele(targetDomId, eval(targetDomParent));
        result = getPropertyValue(targetDom, propertyName);
    } catch (err) {
        if (debug) {
            result = "Failure";
            alert(functionName + ":Failure \n" + err.description);
        }
    }

    return result;
}

// <summary>
//      
// </summmary>
// <param name="targetDom" type="string">dom object ที่จะทำการ get property</param>
// <param name="propertyName" type="string">property ที่ต้องการจะ get value, Default:innerHTML </param>
function getPropertyValue(targetDom, propertyName, debug) {
    var functionName = "getPropertyValue";
    var result = "";

    try {
        if (!debug) { debug = false; }
        if (!propertyName) { propertyName = "innerHTML"; }

        var script = "result = targetDom." + propertyName + ";";
        eval(script);
    } catch (err) {
        if (debug) {
            result = "Failure";
            alert(functionName + ":Failure \n" + err.description);
        }
    }

    return result;
}

// <summary>
//      ใช้หาว่า key ตัวอักษรอะไรเข้ามา return เป็น keynum(ASCII CODE)
// </summmary>
// <param name="e" type="event">event</param>
function eventKeyCode(e) {
    //    if (!e) e = window.event; 
    //    try{// IE
    //       keyNum = e.keyCode;
    //    }catch(err){// Netscape/Firefox/Opera
    //        try{
    //            keyNum = e.which;
    //        }catch(err2){
    //            keyNum = e.charCode;
    //        }
    //    }

    var keyNum = null;

    if (window.event) {// IE
        keyNum = e.keyCode;
    } else if (e.which) {// Netscape/Firefox/Opera
        keyNum = e.which;
    } else if (e.charCode) {
        keyNum = e.charCode;
    }

    return keyNum;
}

function numberOnly(sender, e) {
    var keyNum = eventKeyCode(e);
    var keychar = String.fromCharCode(keyNum);
    var numcheck = /[0123456789.-]/;

    return numcheck.test(keychar);
}


function numericOnly(sender, e) {

    var keyNum = MyTextBox_eventKeyCode(e);
    if (sender.value.indexOf('.') != -1 && keyNum == 46) {
        return false;
    }
    if (sender.value.length != 0 && keyNum == 45) return false;

    if (keyNum >= 48 && keyNum <= 57 || keyNum == 8 || keyNum == 46
        || keyNum == 16 || keyNum == 9 || keyNum == 37 || keyNum == 45) {
        return true;
    }
    return false;
}

function formatCurrency(strValue) {
    var result;
    var leftDot = "0";
    var rightDot = "00";

    var inputStr = strValue.replace(/[^0123456789.-]/g, "");
    if (inputStr.search(/[.]/) == -1) {
        inputStr = inputStr + "." + rightDot;
    }

    var strArray = inputStr.split(".", 2);

    leftDot = strArray[0];
    rightDot = strArray[1];

    if (leftDot.length < 1) {
        leftDot = "0";
    }
    for (var i = rightDot.length; i < 2; i++) {
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

    result = newLeftDot + "." + rightDot;
    return result;
}

function formatCurrencyOnkeyup(sender, e) {
    //alert("keyup");
    try {
        var keyNum = eventKeyCode(e);

        if (keyNum == 109) return;
        if (sender.value.length == 0) return;
        if (keyNum <= 40 && keyNum != 8) return;

        var valueArray = sender.value.split(".");
        var intValueStrArray = valueArray[0].split(",");
        var intValueStr = "";

        for (var i = 0; i < intValueStrArray.length; i++) {
            intValueStr += intValueStrArray[i];
        }

        intValueStr = String(Number(intValueStr));

        var result = "";
        var splitCount = 0;
        var isMinus = (Number(intValueStr) < 0) ? true : false;
        var absoluteValue = intValueStr.replace("-", "");

        for (var i = (absoluteValue.length - 1); i >= 0; i--) {
            if (splitCount == 3) {
                result = "," + result
                splitCount = 0;
                i++;
                continue;
            }

            result = absoluteValue.charAt(i) + result;
            splitCount++;
        }

        if (valueArray.length > 1) {
            result = result + "." + valueArray[1];
        }

        if (isMinus) {
            result = "-" + result;
        }

        sender.value = result;

    } catch (err) {
        alert("error : " + err);
    }
}


//function ต่อไปนี้ต้องมี jquery ด้วยจึงจะใช้ได้
function getEleByProperty(tagName, propertyName, propertyValue) {
    var result = null;

    if (!tagName) { tagName = "input"; }
    if (!propertyName) { propertyName = "clientId"; }

    //$("input[clientId='textbox_cif']");
    var eleArray = $(tagName + "[" + propertyName + "='" + propertyValue + "']");

    if (eleArray.length > 0) {
        result = eleArray[0];
    } else {
        alert("Can not find property " + propertyName + "=" + propertyValue + ".\nPlease, contact administrator.");
    }

    return result;
}

function getEleIdByProperty(tagName, propertyName, propertyValue) {
    return getEleByProperty(tagName, propertyName, propertyValue).id;
}

// <summary>
//      open popup
// </summmary>
// <param name="name" type="string">url</param>
// <param name="url" type="string">url</param>
// <param name="param" type="string">queryString</param>
// <param name="features" type="string">features for window.open</param>
function openPopup(name, url, param, features) {
    var popupName = 'popup';
    var opt = 'toolbar=No,width=500,height=500,resizable=no,scrollbars=yes';

    if (name) {
        popupName = name;
    }

    if (param) {
        url = url + "?" + param;
    }

    if (features) {
        opt = features;
    }

    var popUp = window.open(url, popupName, opt);
    popUp.focus();
}

//my ext common
function ExtGetElementByProp(tagName, propertyName, propertyValue) {
    var result = null;

    if (!tagName) { tagName = "input"; }
    if (!propertyName) { propertyName = "clientId"; }

    //$("input[clientId='textbox_cif']");
    var result = Ext.select(tagName + "[" + propertyName + "=" + propertyValue + "]:first").first().dom.id;


    return result;
}

////My Class Move to ext file
//var MyNumber = function(numInput) {
//    this.className = "MyNumber";

//    this.prepareArithmetic = function(numValue) {
//        return Math.round(numValue * (Math.pow(10, _precisionDigit)));
//    };
//    this.afterArithmetic = function(numValue) {
//        return numValue / (Math.pow(10, _precisionDigit));
//    };

//    this.toNumber = function(input) {
//        if (typeof (input) == "number") {
//            result = input;
//        } else if ((typeof (input) == "object") && (input.className == this.className)) {
//            result = input.getValue();
//        } else {
//            result = new Number(input.replace(/[^0123456789.-]/g, ""));
//        }

//        return result;
//    };

//    //properties
//    var _src = numInput;
//    this.getSrc = function() {
//        return _src;
//    };

//    var _value = this.toNumber(numInput);
//    this.getValue = function() {
//        return _value;
//    };

//    var _precisionDigit = 2;
//    this.getPrecisionDigit = function() {
//        return _value;
//    };
//    this.setPrecisionDigit = function(value) {
//        _precisionDigit = value;
//    };

//};

//MyNumber.prototype = {
//    addition: function(myNumberObj) {
//        var operand1 = this.getValue();
//        var operand2 = this.toNumber(myNumberObj);

//        return new MyNumber(this.afterArithmetic(this.prepareArithmetic(operand1) + this.prepareArithmetic(operand2)));
//    },
//    subtraction: function(myNumberObj) {
//        var operand1 = this.getValue();
//        var operand2 = this.toNumber(myNumberObj);

//        return new MyNumber(this.afterArithmetic(this.prepareArithmetic(operand1) - this.prepareArithmetic(operand2)));
//    },
//    multiplication: function(myNumberObj) {
//        var operand1 = this.getValue();
//        var operand2 = this.toNumber(myNumberObj);

//        return new MyNumber(operand1 * operand2);
//    },
//    division: function(myNumberObj) {
//        var operand1 = this.getValue();
//        var operand2 = this.toNumber(myNumberObj);

//        return new MyNumber(operand1 / operand2);
//    },
//    modulus: function(myNumberObj) {
//        var operand1 = this.getValue();
//        var operand2 = this.toNumber(myNumberObj);

//        return new MyNumber(operand1 % operand2);
//    },
//    toCurrency: function(precision) {
//        var result;
//        var leftDot = "0";
//        var rightDot = "";

//        if (precision) {
//            if (typeof (precision) == "number") {
//                for (var i = 0; i < precision; i++) {
//                    rightDot = rightDot + "0";
//                }
//            } else {
//                rightDot = "00";
//            }
//        }

//        var inputStr = this.getValue().toFixed(precision);
//        if (inputStr.search(/[.]/) == -1) {
//            inputStr = inputStr + "." + rightDot;
//        }

//        var strArray = inputStr.split(".", 2);

//        leftDot = strArray[0];
//        rightDot = strArray[1];

//        if (leftDot.length < 1) {
//            leftDot = "0";
//        }
//        for (var i = rightDot.length; i < precision; i++) {
//            rightDot = rightDot + "0";
//        }

//        var newLeftDot = "";
//        var splitCount = 0;
//        var isMinus = (Number(leftDot) < 0) ? true : false;
//        var absoluteValue = leftDot.replace("-", "");

//        for (var i = (absoluteValue.length - 1); i >= 0; i--) {
//            if (splitCount == 3) {
//                newLeftDot = "," + newLeftDot
//                splitCount = 0;
//                i++;
//                continue;
//            }

//            newLeftDot = absoluteValue.charAt(i) + newLeftDot;
//            splitCount++;
//        }

//        if (isMinus) {
//            newLeftDot = "-" + newLeftDot;
//        }

//        if (rightDot.length > 0) {
//            result = newLeftDot + "." + rightDot;
//        } else {
//            result = newLeftDot;
//        }

//        if (this.getSrc().length == 0) {
//            result = this.getSrc();
//        }

//        return result;
//    }
//}