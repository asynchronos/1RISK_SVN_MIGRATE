Ext.namespace("Ext.DotNetControl");

Ext.DotNetControl.Element = function (extElement) {
    this.element = extElement;
};

Ext.DotNetControl.Element.prototype = {
    disabled: function (bool) {
        if (this.element) {
            this.element.dom.disabled = bool;
        }
    }
};

Ext.DotNetControl.Element.mapElement = function (tagName, myAttributeName, myAttributeValue) {
    var dotNetElement = Ext.select(tagName + "[" + myAttributeName + "=" + myAttributeValue + "]").first();

    if (dotNetElement) {
        //find element success
    } else {
        //alert("Can not find element has " + tagName + ":" + myAttributeName + "=" + myAttributeValue);
        return null;
    }

    return new Ext.DotNetControl.Element(dotNetElement);
};

//checkbox
Ext.DotNetControl.CheckBox = Ext.extend(Ext.DotNetControl.Element, {
});
Ext.DotNetControl.CheckBox.mapElement = function (myAttributeName, myAttributeValue) {
    var dotNetCheckBox = Ext.select("span[" + myAttributeName + "=" + myAttributeValue + "] > input[type=checkbox]").first();
    
    if (dotNetCheckBox) {
        //find element success
    } else {
        //alert("Can not find element has " + myAttributeName + "=" + myAttributeValue)
        return null;
    }

    return new Ext.DotNetControl.CheckBox(dotNetCheckBox);
};

//combobox
Ext.DotNetControl.ComboBox = Ext.extend(Ext.DotNetControl.Element, {
    disabled: function (bool) {
        if (this.element) {
            this.element.TextBox.dom.disabled = bool;
            this.element.DropList.dom.disabled = bool;
        }
    }
});
Ext.DotNetControl.ComboBox.mapElement = function (myAttributeName, myAttributeValue) {
    var tableOfComboBox = Ext.select("div[" + myAttributeName + "=" + myAttributeValue + "] > table").first();

    if (tableOfComboBox) {
        //find element success
    } else {
        //alert("Can not find element has " + myAttributeName + "=" + myAttributeValue);
        return null;
    }

    var textBoxOfComboBox = tableOfComboBox.select("input[type=text]").first();
    var dropListOfComboBox = tableOfComboBox.select("button[type=button]").first();

    if (!textBoxOfComboBox) {
        //alert("Can not find textbox in combobox " + myAttributeName + "=" + myAttributeValue);
        return null;
    }

    if (!dropListOfComboBox) {
        //alert("Can not find droplist in combobox " + myAttributeName + "=" + myAttributeValue);
        return null;
    }

    return new Ext.DotNetControl.ComboBox({ "TextBox": textBoxOfComboBox, "DropList": dropListOfComboBox });
};
