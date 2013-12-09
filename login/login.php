<link rel="stylesheet" type="text/css" href="login.css">

<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript" src="login.js"></script>
	
<?php
	session_start();
	
	if (isset($_SESSION['username']))
		echo $_SESSION['username'];
	else
		echo '>No User<...';
?>
	
	<div onclick="show();" style="background-color: #09F; width: 100px; ">login!</div>
	<br />

    <div id="login_cover" onclick="closeWindow()"></div>
    <div id="login_window">
        <div id="login_close" onclick="closeWindow()"> </div>
        <iframe id="login_frame" src="http://220.113.7.105/CloudComputing?return_addr=login"></iframe>
    </div>