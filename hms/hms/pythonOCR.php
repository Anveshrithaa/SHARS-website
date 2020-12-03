<?php
    echo "This is a PHP script\n";
    #$item = array("testing-2.jpeg","crocin 5%", "digene 200");
	$item = array("Pres_9_9.jpeg");
	array_push($item, "crocin");
	$presid=9;
	$cmd='C:\Users\Raj\AppData\Local\Programs\Python\Python38-32\python C:\Xampp\htdocs\tarp\hospital\hms\test_pres.py '.json_encode($item).' '.$presid;
	pclose(popen("start /B ". $cmd, "r")); 
	exec($cmd . " > /dev/null &");
    #$tmp=exec('C:\Users\savik\AppData\Local\Programs\Python\Python37\python C:\Users\savik\wamp\www\test_pres.py '.(json_encode($item)));
	#echo $tmp;
	#$tmp=exec('C:\Users\Raj\AppData\Local\Programs\Python\Python38-32\python C:\Xampp\htdocs\tarp\hospital\hms\test_pres.py '.(json_encode($item)).' '.$presid);
	#echo $tmp;
	header('Location: form.php');
?>