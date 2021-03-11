<?php

$IPHONS = 307;

$query = $db->prepare("SELECT * FROM `base_user_sum` ");
$query->execute();

//print_r($query->fetchAll());
$total_phones = '';
foreach ($query->fetchAll() as $res){
    echo 'Имя: '.$res['name'];
    $iphones = $res['summ']/10000;
    if ($iphones > 1) {
        echo 'Выполнил задание раз: ' . $iphones;
        $total_phones = $IPHONS - $iphones;
    } else {
        echo 'Впроцессе выполнения: ' . $iphones;
    }
    echo '
    -------------
    ';
}

echo 'Общее количество IPhones: '.$total_phones;
