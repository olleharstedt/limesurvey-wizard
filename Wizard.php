<?php

use LimeSurvey\PluginManager\PluginBase;

/**
 */
class Wizard extends PluginBase
{
    protected $storage = 'DbStorage';
    protected static $description = 'Wizard widget to easily create simple surveys';
    protected static $name = 'Wizard';

    public function init()
    {
        $this->subscribe('beforeControllerAction');
    }

    public function beforeControllerAction()
    {
        $srcUrl = Yii::app()->assetManager->publish(__DIR__ . '/dist');
        Yii::app()->assetManager->forceCopy = true;
        //Yii::app()->assetManager->clearCache();
        App()->getClientScript()->registerScriptFile($srcUrl . '/bundle.js', CClientScript::POS_END);
        echo "<div id='root'></div>";
    }
}
