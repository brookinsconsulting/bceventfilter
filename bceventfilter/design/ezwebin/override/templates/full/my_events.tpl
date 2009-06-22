{* Event Calendar - Full Calendar view *}

<div class="border-box">
<div class="border-tl"><div class="border-tr"><div class="border-tc"></div></div></div>
<div class="border-ml"><div class="border-mr"><div class="border-mc float-break">

<div class="content-view-full">
 <div class="class-event-calendar event-calendar-calendarview">

{* Fetch Results *}
{def $current_user=fetch('user','current_user')

     $user_group_id=$current_user.contentobject.main_parent_node_id
     $current_user_id=$current_user.contentobject_id
     $current_user_contentobject_id=$current_user.contentobject_id
     $current_user_email=$current_user.email
}

{* Test for current user *}
{if $current_user.is_logged_in}
<h2>{"My Events"|i18n("design/ezwebin/line/event")}</h2>
{def $with_children=true()
     $is_standalone=true()
     $page_limit=10
     $events_node_id=166
     $list_count=and($with_children,
                 fetch('content','list_count',
                 hash( parent_node_id, $events_node_id,
                 'limit', $page_limit,
                 'offset', $view_parameters.offset,
                 'sort_by', array( array( 'modified', true() ) ),
                 'class_filter_type', 'include',
                 'class_filter_array', array( 'production_event' ),
                 attribute_filter,array( array( 'owner', '=', $current_user_contentobject_id ) ))  ) )
     $item_count=$list_count
     $current_user_events=fetch( content, list, hash( parent_node_id, $events_node_id,
                 'limit', $page_limit,
                 'offset', $view_parameters.offset,
                 'sort_by',array(array('modified',true())),
                 'class_filter_type', 'include',
                 'class_filter_array', array( 'production_event' ),
                 attribute_filter,array( array( 'owner', '=', $current_user.contentobject_id ) ) ) )
} 
           {include name=navigator
                     uri='design:navigator/google.tpl'
                     page_uri=$node.url_alias
                     item_count=$item_count
                     view_parameters=$view_parameters
                     item_limit=$page_limit}

<div id=0 class=0 align="right">Total Events: {$item_count}<br /></div>

{* LOOP: For each child of the node... *}
{section name=Child loop=$current_user_events}
{* Display the content of the child using a line-view template. *}
{node_view_gui view=line content_node=$Child:item}<br />
{/section}{* End of loop. *}

           {include name=navigator
                     uri='design:navigator/google.tpl'
                     page_uri=$node.url_alias
                     item_count=$item_count
                     view_parameters=$view_parameters
                     item_limit=$page_limit}
{else}
<h1>Please login</h1>
           {include name=navigator
                    uri='design:user/login.tpl'}

{/if}

{undef}
</div>
</div>

</div></div></div>
<div class="border-bl"><div class="border-br"><div class="border-bc"></div></div></div>
</div>
