{*<!-- {[The file is published on the basis of YetiForce Public License 3.0 that can be found in the following directory: licenses/LicenseEN.txt or yetiforce.com]} -->*}
{strip}
	<div class="form-group">
		<label class="col-md-4 col-form-label">{\App\Language::translate('LBL_LABEL_NAME', $QUALIFIED_MODULE)}:</label>
		<div class="col-md-7">
			{assign var='LABEL' value=$FIELD_INSTANCE->getDefaultLabel()}
			{if $FIELD_INSTANCE->get('label') }
				{assign var='LABEL' value=$FIELD_INSTANCE->get('label')}
			{/if}
			<input name="label" class="form-control" type="text" value="{$LABEL}" data-validation-engine="validate[required]" />
		</div>
	</div>
	<div class="form-group">
		<label class="col-md-4 col-form-label">{\App\Language::translate('LBL_DISPLAY_TYPE', $QUALIFIED_MODULE)}:</label>
		<div class="col-md-7">
			<select class='form-control select2' name="displayType" data-validation-engine="validate[required]">
				{foreach from=$FIELD_INSTANCE->displayTypeBase() item=ITEM key=KEY}
					<option value="{$ITEM}" {if $ITEM eq $FIELD_INSTANCE->get('displaytype')} selected {/if}>{\App\Language::translate($KEY, $QUALIFIED_MODULE)}</option>
				{/foreach}
			</select>
		</div>
	</div>
	<div class="form-group">
		<label class="col-md-4 col-form-label">{\App\Language::translate('LBL_COLSPAN', $QUALIFIED_MODULE)}:</label>
		<div class="col-md-7">
			<input name="colSpan" class="form-control" type="text" value="{$FIELD_INSTANCE->getColSpan()}" data-validation-engine="validate[required]" />
		</div>
	</div>
	<div class="form-group paramsJson">
		<input id="params" class="" type="hidden" value='["values"]'>
		<label class="col-md-4 col-form-label">{\App\Language::translate('LBL_PICKLIST_VALUES', $QUALIFIED_MODULE)}:</label>
		<div class="col-md-7">
			<select class="form-control select2" data-select="tags" name="values" multiple data-validation-engine="validate[required]">
				{foreach from=$FIELD_INSTANCE->getPicklistValues() item=VALUE}
					<option value="{$VALUE}" selected>{$VALUE}</option>
				{/foreach}
			</select>
		</div>
	</div>
{/strip}
