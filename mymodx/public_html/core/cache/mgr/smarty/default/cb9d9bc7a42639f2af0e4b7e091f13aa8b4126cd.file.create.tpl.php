<?php /* Smarty version Smarty-3.0.4, created on 2016-03-26 02:05:59
         compiled from "C:/OpenServer/domains/mymodx/public_html/manager/templates/default/resource/staticresource/create.tpl" */ ?>
<?php /*%%SmartyHeaderCode:3259056f5b647969301-48875125%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'cb9d9bc7a42639f2af0e4b7e091f13aa8b4126cd' => 
    array (
      0 => 'C:/OpenServer/domains/mymodx/public_html/manager/templates/default/resource/staticresource/create.tpl',
      1 => 1458600137,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '3259056f5b647969301-48875125',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
<div id="modx-panel-static-div"></div>
<div id="modx-resource-tvs-div" class="modx-resource-tab x-form-label-left x-panel"><?php echo $_smarty_tpl->getVariable('tvOutput')->value;?>
</div>

<?php echo $_smarty_tpl->getVariable('onDocFormPrerender')->value;?>

<?php if ($_smarty_tpl->getVariable('resource')->value->richtext&&(isset($_smarty_tpl->getVariable('_config')->value['use_editor']) ? $_smarty_tpl->getVariable('_config')->value['use_editor'] : null)){?>
    <?php echo $_smarty_tpl->getVariable('onRichTextEditorInit')->value;?>

<?php }?>
