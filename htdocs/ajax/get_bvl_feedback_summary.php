<?php

header("content-type:application/json");
ini_set('default_charset', 'utf-8');

set_include_path(
    __DIR__ . "/../../project/libraries:" .
    __DIR__ . "/../../php/libraries:" .
    "/usr/share/pear:"
);

require_once __DIR__ . "/../../vendor/autoload.php";
require_once "NDB_Client.class.inc";

$client = new NDB_Client;
$client->initialize();

$user =& User::singleton();
$username = $user->getUsername();

if (isset($_POST['candID']) && !(isset($_POST['sessionID']))) {
    $feedbackThread =& NDB_BVL_Feedback::Singleton($username, $_POST['candID']);
}
elseif (isset($_POST['candID']) && isset($_POST['sessionID']) && !(isset($_POST['commentID']))) {
    $feedbackThread =& NDB_BVL_Feedback::Singleton($username, $_POST['candID'], $_POST['sessionID']);
}

elseif (isset($_POST['candID']) && isset($_POST['sessionID']) && isset($_POST['commentID'])){
    $feedbackThread =& NDB_BVL_Feedback::Singleton($username, $_POST['candID'], $_POST['sessionID'], $_POST['commentID']);
}

$feedbackThreadSummary = $feedbackThread->getSummaryOfThreads();
echo json_encode($feedbackThreadSummary);

exit();