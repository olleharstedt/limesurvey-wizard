<?php

use LimeSurvey\PluginManager\PluginBase;
use LimeSurvey\Menu\MenuItem;
use LimeSurvey\Menu\Menu;

/**
 */
class Wizard extends PluginBase
{
    protected $storage = 'DbStorage';
    protected static $description = 'Wizard widget to easily create simple surveys';
    protected static $name = 'Wizard';

    public function init()
    {
        $this->subscribe('beforeAdminMenuRender');
    }

    public function beforeAdminMenuRender()
    {
        $event = $this->getEvent();
        $url = $this->api->createUrl(
            'admin/pluginhelper',
            array(
                'sa'     => 'fullpagewrapper',
                'plugin' => $this->getName(),
                'method' => 'actionIndex'
            )
        );

        $menu = new Menu(
            [
                'isDropDown' => false,
                'label' => gT('Wizard'),
                'href' => $url,
                'iconClass' => 'fa fa-magic',
            ]
        );
        $event->append('extraMenus', [$menu]);
    }

    public function actionIndex()
    {
        $vendor = Yii::app()->assetManager->publish(__DIR__ . '/dist/vendor.js');
        $main = Yii::app()->assetManager->publish(__DIR__ . '/dist/main.js');

        $exitUrl = Yii::app()->createUrl('admin', []);

        $cssUrl = Yii::app()->assetManager->publish(dirname(__FILE__) . '/assets/css/wizard.css');
        App()->getClientScript()->registerCssFile($cssUrl);

        App()->getClientScript()->registerScriptFile($vendor, CClientScript::POS_END);
        App()->getClientScript()->registerScriptFile($main, CClientScript::POS_END);
        App()->getClientScript()->registerScript(
            "WizardGlobalData",
            <<<JAVASCRIPT
var wizardGlobalData = {
    exitUrl:        "$exitUrl",
};
JAVASCRIPT
,
            CClientScript::POS_BEGIN
        );
        return "<div id='root'></div>";
    }
}
