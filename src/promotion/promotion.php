<?php

include 'DB.php';

use Database\DB;

$dbClass = new DB();
$db = $dbClass->getDb();

global $PROC;

$request = $_POST;

$timestamp = date('Y-m-d H:i:s');

if (strip_tags($request['promotion'])){

    $PROC = 'promotion';
    $user_id = '';
    try {
        $name = (string) strip_tags($request['name']) ?? '';
        $inviter_user_id = (int) strip_tags($request['inviter_user_id']) ?? '';
        $phone = (string) strip_tags($request['phone']) ?? '';

        $query = $db->prepare("SELECT id, name FROM `users` WHERE `name` LIKE '%".$name."%'");
        $query->execute();

        $res = $query->fetchAll();

        if ($query->rowCount() == 0) {
            $query = "INSERT INTO users (name, inviter_user_id, phone, timestamp) 
                VALUES ( :name, :inviter_user_id, :phone, :timestamp)";

            $to_db = $db->prepare($query);

            $to_db->execute([
                'name' => $name,
                'inviter_user_id' => $inviter_user_id,
                'timestamp' => $timestamp,
                'phone' => $phone
            ]);
            $user_id = $db->lastInsertId();
        } else {
            $user_id = $res[0]['id'];
        }
    } catch (Exception $e) {
        echo 'Ошибка: ',  $e->getMessage(), "\n";
    }

    if (strip_tags($request['product'])) {

        try {
            $user_id  = (int) $user_id ?? 0;

            $product = (string) strip_tags($request['product']) ?? '';
            $summ = (string) strip_tags($request['summ']) ?? '';
            $color = (string) strip_tags($request['color']) ?? '';


            $queryt = "INSERT INTO turnover (user_id, product, color, summ, timestamp) 
                VALUES (:user_id, :product, :color, :summ, :timestamp)";

            $to_dbt = $db->prepare($queryt);

            $to_dbt->execute([
                'user_id' => $user_id,
                'product' => $product,
                'color' => $color,
                'summ' => $summ,
                'timestamp' => $timestamp
            ]);

/*            print_r([
                'user_id ' => $user_id,
                'product' => $product,
                'color' => $color,
                'summ' => $summ,
                'timestamp' => $timestamp
            ]);*/

        } catch (Exception $e) {
            echo 'Ошибка: ',  $e->getMessage(), "\n";
        }
    }
    $PROC = 'create_view';
}

$status_view = '';

if ($PROC === 'create_view'){
    include 'view.php';
    $status_view = new ViewSource\CView( false );
}

include 'stat.php';

