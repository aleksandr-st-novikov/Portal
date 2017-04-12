Admin = function () {
}

Admin.prototype =
{
    ManageUsersPopup: function (s, e) {
        ASPxPopupControlRoles.Show();
    }
}

window.admin = new Admin();

ManageTransport = function () {
}

ManageTransport.prototype =
{
    RefreshGridData: function (s, e) {
        setInterval(ASPxClientCallbackRefreshData.PerformCallback(),1000);
    }
}

window.admin = new ManageTransport();

window.onload = function () {
    setInterval(ASPxClientCallbackRefreshData.PerformCallback(), 1000);
};