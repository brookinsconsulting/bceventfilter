{set-block scope=root variable=cache_ttl}600{/set-block}
{* Event - Full view *}

<div class="border-box">
<div class="border-tl"><div class="border-tr"><div class="border-tc"></div></div></div>
<div class="border-ml"><div class="border-mr"><div class="border-mc float-break">

<div class="content-view-full">
    <div class="class-event">
    
    <div class="attribute-header">
    {if $node.data_map.title.has_content}
        <h1>{$node.data_map.title.content|wash()}</h1>
    {else}
        <h1>{$node.name|wash()}</h1>
    {/if}
    </div>
    
    <div class="attribute-byline">
    <p>
    {if $node.object.data_map.category.has_content}
    <span class="ezagenda_keyword">
    {"Category"|i18n("design/ezwebin/full/event")}:
    {attribute_view_gui attribute=$node.object.data_map.category}
    </span>
    {/if}
    
    <span class="ezagenda_date">{$node.object.data_map.from_time.content.timestamp|datetime(custom,"%j %M %H:%i")}
    {if $node.object.data_map.to_time.has_content}
          - {$node.object.data_map.to_time.content.timestamp|datetime(custom,"%j %M %H:%i")}
    {/if}
    </span>
    </p>
    </div>

    <hr />
    <div class="attribute-short">Contact Event Coordinator: <a href={concat( "/authorcontact/form/", $node.object.owner.id, "/", $node.node_id )|ezurl}>{$node.object.owner.name}</a></div>

    {* <div class="attribute-short"><a href="/feedback/(coordinator)/{$node.creator.owner_id}">Contact Event Coordinator</a></div> 
        $node.creator|attribute(show,1) *}
    {* $node.object|attribute(show,1) *}

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
    <hr />

    {* if $node.object.data_map.image.content}
         <div class="attribute-image">
             {attribute_view_gui attribute=$node.object.data_map.image align=center image_class=imagelarge}
        </div>
    {/if *}

    {if $node.object.data_map.text.has_content}
        <div class="attribute-short">{attribute_view_gui attribute=$node.object.data_map.text}</div>
    {/if}



    {* $node.object.data_map.production_film *}
    {if $node.object.data_map.production_film.has_content}
Production / Film:        <div class="attribute-short">{attribute_view_gui attribute=$node.object.data_map.production_film}</div>
    {/if}

    {if $node.object.data_map.event_name.has_content}
Event Name:        <div class="attribute-short">{attribute_view_gui attribute=$node.object.data_map.event_name}</div>
    {/if}

    {if $node.object.data_map.event_information.has_content}
Event Information:        <div class="attribute-short">{attribute_view_gui attribute=$node.object.data_map.event_information}</div>
    {/if}

{* if private event, block from all ... unless
 1.current user is owner or ...
*}
 {* $node.object.data_map.event_private|attribute(show,1) *}
 {if eq( $node.object.data_map.event_private.value, 0 )}
<hr />
Event Mailling Address:
    {if $node.object.data_map.event_mailling_address.has_content}
        <div class="attribute-short">{attribute_view_gui attribute=$node.object.data_map.event_mailling_address}</div>
    {/if}

    {if $node.object.data_map.event_mailling_city.has_content}
        <div class="attribute-short">{attribute_view_gui attribute=$node.object.data_map.event_mailling_city}</div>
    {/if}

    {if $node.object.data_map.event_mailling_zip.has_content}
        <div class="attribute-short">{attribute_view_gui attribute=$node.object.data_map.event_mailling_zip}</div>
    {/if}

    {if $node.object.data_map.event_mailling_country.has_content}
        <div class="attribute-short">{attribute_view_gui attribute=$node.object.data_map.event_mailling_country}</div>
    {/if}


<hr />
    {if $node.object.data_map.event_coordinator_name.has_content}
Event Coordinator Name:        <div class="attribute-short">{attribute_view_gui attribute=$node.object.data_map.event_coordinator_name}</div>
    {/if}

    {if $node.object.data_map.event_coordinator_phone.has_content}
Event Coordinator Phone:        <div class="attribute-short">{attribute_view_gui attribute=$node.object.data_map.event_coordinator_phone}</div>
    {/if}

    {if $node.object.data_map.event_coordinator_email.has_content}
Event Coordinator Email:        <div class="attribute-short">{attribute_view_gui attribute=$node.object.data_map.event_coordinator_email}</div>
    {/if}

    {* if $node.object.data_map.event_private.has_content}
Private Event:        <div class="attribute-short">{attribute_view_gui attribute=$node.object.data_map.event_private}</div>
    {/if *}

    <br />

  {/if}

  <div class="float-break"></div>
  <div class="float-break"></div>
  <div>
{def
     $current_user_obj=fetch('user','current_user')
     $current_user_main_node_id=$current_user_obj.contentobject.main_parent_node_id
     $current_user_obj_id=$current_user_obj.contentobject_id
     $current_user_obj_contentobject_id=$current_user_obj.contentobject_id
     $current_node_owner_id=$node.object.owner.id
}
{fetch( authorconnect, form, hash( user_id, $current_user_obj_id, node_id, $node.node_id ) )}</div>

    {* if $node.object.data_map.url.has_content}
        <p style="text-align:center;">
        <a href={$node.object.data_map.url.content|ezurl}>{$node.object.data_map.url.data_text|wash()}</a>
        </p>
        <div>{fetch( authorcontact, form, hash( user_id, $node.object.owner.id, node_id, $node.node_id ) )}</div>
    {/if *}
  </div>
</div>

</div></div></div>
<div class="border-bl"><div class="border-br"><div class="border-bc"></div></div></div>
</div>
