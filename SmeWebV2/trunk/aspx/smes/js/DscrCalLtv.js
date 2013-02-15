function DscrCalLTV() {  // financial statement

    // Private variable

    var DSCR;

    var CBD_CoreAsset;
    var CBD_NCoreAsset;
    var CBD_Land;
    var NCBD_CoreAsset;
    var NCBD_NCoreAsset;
    var NCBD_Land;

    var valCBD_CoreAsset = 1;
    var valCBD_NCoreAsset = 1;
    var valCBD_Land =1;
    var valNCBD_CoreAsset =1;
    var valNCBD_NCoreAsset = 1;
    var valNCBD_Land = 1 ;

    
    return {
        // Public methods
        setCBD_CoreAsset: function (newCBD_CoreAsset) {
            CBD_CoreAsset = newCBD_CoreAsset;
        },
        getCBD_CoreAsset: function () {
            return CBD_CoreAsset * valCBD_CoreAsset;
        },
        setCBD_NCoreAsset: function (newCBD_NCoreAsset) {
            CBD_NCoreAsset = newCBD_NCoreAsset;
        },
        getCBD_NCoreAsset: function () {
            return CBD_NCoreAsset * valCBD_NCoreAsset;
        },
        setCBD_Land: function (newCBD_Land) {
            CBD_Land = newCBD_Land;
        },
        getCBD_Land: function () {
            return CBD_Land * valCBD_Land;
        },
        setNCBD_CoreAsset: function (newNCBD_CoreAsset) {
            NCBD_CoreAsset = newNCBD_CoreAsset;
        },
        getNCBD_CoreAsset: function () {
            return NCBD_CoreAsset * valNCBD_CoreAsset;
        },
        setNCBD_NCoreAsset: function (newNCBD_NCoreAsset) {
            NCBD_NCoreAsset = newNCBD_NCoreAsset;
        },
        getNCBD_NCoreAsset: function () {
            return NCBD_NCoreAsset  * valNCBD_NCoreAsset;
        },
        setNCBD_Land: function (newNCBD_Land) {
            NCBD_Land = newNCBD_Land;
        },
        getNCBD_Land: function () {
            return NCBD_Land * valNCBD_Land;
        }
 
     };



}