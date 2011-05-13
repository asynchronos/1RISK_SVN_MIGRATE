Ext.namespace("Ext.DotNetControl");

var DotNetElement = function (extElement) {
    this.element = extElement;
};

DotNetElement.prototype = {
    disabled: function (bool) {
        if (this.element) {
            this.element.dom.disabled = bool;
        }
    }
};

Ext.DotNetControl.CheckBox = Ext.extend(DotNetElement, {
});

Ext.DotNetControl.ComboBox = Ext.extend(DotNetElement, {
    disabled: function (bool) {
        if (this.element) {
            this.element.TextBox.dom.disabled = bool;
            this.element.DropList.dom.disabled = bool;
        }
    }
});

Ext.DotNetControl.CheckBox.getDotNetSimpleElement = function (myAttributeName, myAttributeValue) {
    return new DotNetElement(Ext.select("input[" + myAttributeName + "=" + myAttributeValue + "]").first());
};

Ext.DotNetControl.CheckBox.getDotNetCheckBox = function (myAttributeName, myAttributeValue) {
    var dotNetCheckBox = Ext.select("span[" + myAttributeName + "=" + myAttributeValue + "] > input[type=checkbox]").first();

    if (dotNetCheckBox) {
        //find element success
    } else {
        alert("Can not find element has " + myAttributeName + "=" + myAttributeValue)
        return null;
    }

    return new Ext.DotNetControl.CheckBox(dotNetCheckBox);
};

Ext.DotNetControl.CheckBox.getDotNetComboBox = function (myAttributeName, myAttributeValue) {
    var tableOfComboBox = Ext.select("div[" + myAttributeName + "=" + myAttributeValue + "] > table").first();

    if (tableOfComboBox) {
        //find element success
    } else {
        alert("Can not find element has " + myAttributeName + "=" + myAttributeValue);
        return null;
    }

    var textBoxOfComboBox = tableOfComboBox.select("input[type=text]").first();
    var dropListOfComboBox = tableOfComboBox.select("button[type=button]").first();

    if (!textBoxOfComboBox) {
        alert("Can not find textbox in combobox " + myAttributeName + "=" + myAttributeValue);
        return null;
    }

    if (!dropListOfComboBox) {
        alert("Can not find droplist in combobox " + myAttributeName + "=" + myAttributeValue);
        return null;
    }

    return new Ext.DotNetControl.ComboBox({ "TextBox": textBoxOfComboBox, "DropList": dropListOfComboBox });
};
