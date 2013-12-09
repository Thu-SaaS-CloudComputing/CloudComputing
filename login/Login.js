// JS: Login

var cover, popwindow;

function login_show()
{
	login_resize();
	cover.stop().show().animate({"opacity": "0.6"});
	popwindow.stop().show().animate({"opacity": "1"});
}

function login_closeWindow()
{
	cover.stop().animate({"opacity": "0"});
	popwindow.stop().animate({"opacity": "0"}, function(){popwindow.hide();});
}

$(window).resize(function(){
	login_resize();
});

$(window).ready(function(){
	cover=$('#login_cover');
	popwindow=$('#login_window');
	cover.css("opacity", "0");
	popwindow.css("opacity", "0");
	login_resize();
});

function login_resize() {
	cover.width(window.innerWidth + "px");
	cover.height(window.innerHeight + "px");
	popwindow.css("top", (window.innerHeight - popwindow.height()) / 2 + "px");
	popwindow.css("left", (window.innerWidth - popwindow.width()) / 2 + "px");
}

