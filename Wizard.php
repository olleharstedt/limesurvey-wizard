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
        App()->getClientScript()->registerScriptFile($srcUrl . '/bundle.1ef2e02c141ce1c94c51.js');
    }
}
