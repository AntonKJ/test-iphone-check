<?php
namespace ViewSource;

require_once 'DB.php';
use Database\DB;

/**
 * Class CView
 * @package ViewSource
 */
class CView
{
    /**
     * CView constructor.
     * @param $s
     */
    public function __construct ($s)
    {
        $dbClass = new DB();
        $db = $dbClass->getDb();

        // CREATE VIEW FOR SUM
        $query = "CREATE OR REPLACE VIEW base_user_sum AS SELECT us.id as id, us.name as name,
                  (SELECT SUM(summ) FROM turnover tr1 Where tr1.user_id = us.id) as summ
                                                FROM users us WHERE 1=1
                                                ";
        $db->beginTransaction();
        $db->exec($query);
        $result = $db->commit();
        $status_view = '';
        if ($result) {
            //echo json_encode("Create view OK!\n");
            $status_view = true;
        } else {
            //echo json_encode("Create view FALSE\n");
            $status_view = false;
            $db->rollBack();
        }

        return $status_view;
    }
}

if ($create = 'ok') {
    new CView(true);
}

