/** layuiAdmin.std-v1.0.0-beta9 LPPL License By http://www.layui.com/admin/ */
;
layui.define(function(e) {
    var i = (layui.$, layui.layer, layui.laytpl, layui.setter, layui.view, layui.admin);
    i.events.logout = function() {
        i.req({
            url: domain + "api/user/logout",
            type: "PUT",
            data: {},
            done: function(e) {
                i.exit(function() {
                    location.href = "/layuiAdmin/views/login.html"
                })
            }
        })
    },
    e("common", {})
});