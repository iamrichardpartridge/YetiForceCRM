<?php

/**
 * Lock saving events after exceeding the limit
 * @package YetiForce.DataAccess
 * @license licenses/License.html
 * @author Mariusz Krzaczkowski <m.krzaczkowski@yetiforce.com>
 */
class DataAccess_check_day_tasks
{

	var $config = true;

	public function process($moduleName, $ID, $recordData, $config)
	{
		if (!in_array($moduleName, ['Calendar', 'Events'])) {
			return ['save_record' => true];
		}
		$userRecordModel = Users_Record_Model::getCurrentUserModel();
		$db = PearDatabase::getInstance();
		$typeInfo = 'info';
		$saveRecord = true;

		$result = $db->pquery('SELECT count(*) as count FROM vtiger_activity 
			INNER JOIN vtiger_crmentity ON vtiger_crmentity.crmid = vtiger_activity.activityid 
			WHERE vtiger_crmentity.deleted = ? AND vtiger_activity.date_start = ? AND vtiger_activity.smownerid = ?', [0, $recordData['date_start'], $userRecordModel->getId()]);

		if ($config['lockSave'] == 1) {
			$typeInfo = 'error';
			$saveRecord = false;
		}
		$count = $db->getSingleValue($result);
		if ($count >= $config['maxActivites'])
			return [
				'save_record' => $saveRecord,
				'type' => 0,
				'info' => [
					'text' => vtranslate($config['message'], 'DataAccess'),
					'ntype' => $typeInfo
				]
			];
		else
			return ['save_record' => true];
	}

	public function getConfig($id, $module, $baseModule)
	{
		return [];
	}
}
