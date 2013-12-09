<?php
	session_start();
?>

<html>
<body>

<?php
	$_SESSION['username'] = $_GET['username'];
	echo $_SESSION['username'];
?>

<script>
	if (parent)
		parent.document.location.reload();
</script>

</body>
</html>