{* Event - Line view *}

<div class="content-view-line">
{if gt(currentdate() , $node.object.data_map.to_time.content.timestamp)}
    <div class="class-event ezagenda_event_old">
{else}
    <div class="class-event">
{/if}
    <h2>
        <a href={$node.url_alias|ezurl}>{$node.name|wash()}</a>
    </h2>

    <span class="ezagenda_date">
    {"Date"|i18n("design/ezwebin/line/event")}:

    {$node.object.data_map.from_time.content.timestamp|datetime(custom,"%j %M %H:%i")}
    {if $node.object.data_map.to_time.has_content}
          - {$node.object.data_map.to_time.content.timestamp|datetime(custom,"%j %M %H:%i")}
    {/if}
    </span>

    <div class="attribute-byline">
    <p>
    {* if $node.object.data_map.category.has_content *}
    <span class="ezagenda_keyword">

    {* "Category"|i18n("design/ezwebin/line/event")}:
    {$node.data_map.category.class_content.options[$node.data_map.category.value[0]].name|wash()}<br /><br />
    {$node.data_map.category|attribute(show,1) *}

    {"Production"|i18n("design/ezwebin/line/event")}: {attribute_view_gui attribute=$node.data_map.production_film}<br />

    {* "Date"|i18n("design/ezwebin/line/event")}: {attribute_view_gui attribute=$node.data_map.from_time}<br />
    {"Time"|i18n("design/ezwebin/line/event")}: {attribute_view_gui attribute=$node.data_map.from_time}<br /> *}

    {"City"|i18n("design/ezwebin/line/event")}: {attribute_view_gui attribute=$node.data_map.event_mailling_city}<br />
    {"State"|i18n("design/ezwebin/line/event")}: {attribute_view_gui attribute=$node.data_map.event_mailling_state}<br />
    {"Country"|i18n("design/ezwebin/line/event")}: {attribute_view_gui attribute=$node.data_map.event_mailling_country}<br />

{*
    <form method="post" action={concat('/content/action','')|ezurl}>
        <div class="block">
            <div class="object-right">
                <input class="button" name="ActionAddToNotification" value="Track changes" type="submit">
            </div>
            <input name="ContentNodeID" value="{$node.node_id}" type="hidden">
            <input name="ContentObjectID" value="{$node.contentobject_id}" type="hidden">
            <input name="NodeID" value="{$node.node_id}" type="hidden">
            <input name="ClassIdentifier" value="{$node.class_identifier}" type="hidden">
            <input name="ContentLanguageCode" value="{$node.object.default_language}" type="hidden">
        </div>
        <div class="float-break"></div>
    </form>
*}
{* 
<hr />
<hr />
{$node.data_map.event_private|attribute(show,1)}
<hr />
*}

{if eq( $node.data_map.event_private.content, 1 )}
<br />
    {"Host"|i18n("design/ezwebin/line/event")}: {attribute_view_gui attribute=$node.data_map.event_coordinator_name}<br />
    {"Phone"|i18n("design/ezwebin/line/event")}: {attribute_view_gui attribute=$node.data_map.event_coordinator_phone}<br />
    {"Email"|i18n("design/ezwebin/line/event")}: {attribute_view_gui attribute=$node.data_map.event_coordinator_email}<br />
    {"Address"|i18n("design/ezwebin/line/event")}: {attribute_view_gui attribute=$node.data_map.event_mailling_address}
{/if}
    </span>
    {*
* Event Details Button<br />
* Edit Event Button (If permission allows)<br />
*}

    </p>
    </div>
  </div>
</div>
