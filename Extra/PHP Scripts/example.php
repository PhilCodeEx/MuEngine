<?php
/*-------------------------------------------------------------------------------------
Syntax
mue(host,port,protocol)
host - eJS IP
port - eJS Port
protocols:
A1 (global message)
A3 (disconnect account)
A4 (ban and disconnect account)
A5 (send ingame email to character)
A6 (send serial blacklist reload command to all subs)
A7 (check if password match, it support MD5 encrpted password)
A8 (change the password, it support MD5 encryption)
A9 (check if user is online,  no sql query needed)
AA (check the total users online, no sql query needed)
AB (check the total users per sub server, no sql query needed)
--------------------------------------------------------------------------------------*/

include("Inc/muelib.php");
define("EJS_HOST","127.0.0.1");	
define("EJS_PORT","8081");		
define("PROTO_GLOBAL_MESSAGE","A1");		
define("PROTO_DISCONNECT","A3");		
define("PROTO_BAN_DISCONNECT","A4");
define("PROTO_EMAIL_SEND","A5");		
define("PROTO_BLSN_RELOAD","A6");		
define("PROTO_PASSWORD_CHECK","A7"); // MD5 is supported
define("PROTO_PASSWORD_CHANGE","A8"); // MD5 is supported		
define("PROTO_USER_ONLINE","A9");
define("PROTO_TOTAL_ONLINE","AA");
define("PROTO_ONLINE_PERSUB","AB");

	
// send global message
$me_msg = new mue(EJS_HOST,EJS_PORT,PROTO_GLOBAL_MESSAGE);
$me_msg->data("this is test message this is test message this is test"); // max 54


// ban player test and disconnect
$me_ban = new mue(EJS_HOST,EJS_PORT,PROTO_BAN_DISCONNECT);
$me_ban->data("test");


// disconnect player test
$me_dc = new mue(EJS_HOST,EJS_PORT,PROTO_DISCONNECT);
if($me_dc->data("test") == 1)
{
	echo "Player test successfully disconnected.";
}

// send ingame email to player test
$me_mail = new mue(EJS_HOST,EJS_PORT,PROTO_EMAIL_SEND);
$character = "test";
$subject = "test subject"; // max of 19 characters
$body = "test body content"; // max of 99 characters
if($me_mail->data($character,$subject,$body) == 1)
{
	echo "Email sent to player test successfully.";
}

// reload serial blacklist list
$me_blacklist = new mue(EJS_HOST,EJS_PORT,PROTO_BLSN_RELOAD);
if($me_blacklist->data('1'))
{
	echo "Serial blacklist reloaded successfully.";
}

// check password (login page etc...)
$me_passwordcheck = new mue(EJS_HOST,EJS_PORT,PROTO_PASSWORD_CHECK);
$user = "test";
$pass = "1234";
if($me_passwordcheck->data($user,$pass)==1)
{
	echo "Password matched for user test.";
}

// change password (change password / lost password / registration page etc...)
$me_passwordchange = new mue(EJS_HOST,EJS_PORT,PROTO_PASSWORD_CHANGE);
$user = "test";
$pass = "1234";
if($me_passwordchange->data($user,$pass)==1)
{
	echo "User test's password changed to 1234 .";
}

// Check if test user is online
$me_useronline = new mue(EJS_HOST,EJS_PORT,PROTO_USER_ONLINE);
$user = "test";
if($me_useronline->data($user) != 2) // better be strict with offline check 
{
	echo "User test is ONLINE.";
}


// Get the total online in server
$me_totalonline = new mue(EJS_HOST,EJS_PORT,PROTO_TOTAL_ONLINE);
$totaluser = $me_totalonline->data();
echo "Total online users are ".$totaluser;

// Get total online players in server code 12
$me_onlinepersub = new mue(EJS_HOST,EJS_PORT,PROTO_ONLINE_PERSUB);
$totaluser = $me_onlinepersub->data(12);
echo "Total online users in server 12 are ".$totaluser;

?>