/**
 * Created with JetBrains RubyMine.
 * User: xiaoxiao
 * Date: 10/3/12
 * Time: 11:05 AM
 * To change this template use File | Settings | File Templates.
 */
var PET = PET || {};

PET.activeTab = function(tabId) {
    document.getElementById(tabId).setAttribute("class", "active");
}