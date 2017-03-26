Admin = function () {
}

Admin.prototype =
{
    ManageUsersPopup: function (s, e) {
        ASPxPopupControlRoles.Show();
    }
}

window.admin = new Admin();