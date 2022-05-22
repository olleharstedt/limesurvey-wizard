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
        echo 'mooo';
        //App()->getClientScript()->registerScriptFile('https://unpkg.com/react@18/umd/react.development.js');
    }
}
