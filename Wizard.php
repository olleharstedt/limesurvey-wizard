<?php

use LimeSurvey\PluginManager\PluginBase;
use \LimeSurvey\Menu\MenuItem;

/**
 */
class Wizard extends PluginBase
{
    protected $storage = 'DbStorage';
    protected static $description = 'Wizard widget to easily create simple surveys';
    protected static $name = 'Wizard';

    public function init()
    {
        $this->subscribe('beforeToolsMenuRender');
        $this->subscribe('newDirectRequest');
    }

    public function beforeToolsMenuRender()
    {
        $event = $this->getEvent();
        $surveyId = $event->get('surveyId');

        $href = Yii::app()->createUrl(
            'admin/pluginhelper',
            [
                'sa' => 'sidebody',
                'plugin' => 'Wizard',
                'method' => 'actionIndex',
                'surveyId' => $surveyId
            ]
        );

        $menuItem = new MenuItem(
            [
                'label' => gT('Wizard'),
                'iconClass' => 'fa fa-table',
                'href' => $href
            ]
        );

        $event->append('menuItems', array($menuItem));
    }

    public function actionIndex($surveyId)
    {
        $srcUrl = Yii::app()->assetManager->publish(__DIR__ . '/dist/bundle.js');
        App()->getClientScript()->registerScriptFile($srcUrl, CClientScript::POS_END);
        return "<div id='root'></div>";
    }
}
