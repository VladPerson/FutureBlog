<?php /* Smarty version Smarty-3.0.4, created on 2016-03-26 02:06:39
         compiled from "C:/OpenServer/domains/mymodx/public_html/manager/templates/default/resource/weblink/create.tpl" */ ?>
<?php /*%%SmartyHeaderCode:3092756f5b66f1f7f46-50314213%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'f64128d960006c2c973506ff75739570a77c3bf3' => 
    array (
      0 => 'C:/OpenServer/domains/mymodx/public_html/manager/templates/default/resource/weblink/create.tpl',
      1 => 1458600137,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '3092756f5b66f1f7f46-50314213',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
<div id="modx-panel-weblink-div"></div>
<div id="modx-resource-tvs-div" class="modx-resource-tab x-form-label-left x-panel"><?php echo $_smarty_tpl->getVariable('tvOutput')->value;?>
</div>

<?php echo $_smarty_tpl->getVariable('onDocFormPrerender')->value;?>

<?php if ($_smarty_tpl->getVariable('resource')->value->richtext&&(isset($_smarty_tpl->getVariable('_config')->value['use_editor']) ? $_smarty_tpl->getVariable('_config')->value['use_editor'] : null)){?>
    <?php echo $_smarty_tpl->getVariable('onRichTextEditorInit')->value;?>

<?php }?>
