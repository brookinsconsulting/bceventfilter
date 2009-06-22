{* Event Calendar - Full Calendar view *}

{* Test for current user *}
{def $current_user=fetch('user','current_user')
     $user_group_id=$current_user.contentobject.main_parent_node_id
     $current_user_id=$current_user.contentobject_id
     $current_user_contentobject_id=$current_user.contentobject_id
     $current_user_email=$current_user.email
     $vp_event_owner=$view_parameters.owner
}
{if and( ne( $vp_event_owner, false() ), ne( $vp_event_owner, 'all' ), eq( $vp_event_owner, 'self' ) )}
{if $current_user.is_logged_in}
<div class="border-box">
<div class="border-tl"><div class="border-tr"><div class="border-tc"></div></div></div>
<div class="border-ml"><div class="border-mr"><div class="border-mc float-break">

<div class="content-view-full">
 <div class="class-event-calendar event-calendar-calendarview">

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

{else}

{* ############################################################################ *}

{def
    $event_node    = $node
    $event_node_id = $event_node.node_id

    $curr_ts = currentdate()
    $curr_today = $curr_ts|datetime( custom, '%j')
    $curr_year = $curr_ts|datetime( custom, '%Y')
    $curr_month = $curr_ts|datetime( custom, '%n')

    $temp_ts = cond( and(ne($view_parameters.month, ''), ne($view_parameters.year, '')), makedate($view_parameters.month, cond(ne($view_parameters.day, ''),$view_parameters.day, eq($curr_month, $view_parameters.month), $curr_today, 1 ), $view_parameters.year), currentdate() )

    $temp_month = $temp_ts|datetime( custom, '%n')
    $temp_year = $temp_ts|datetime( custom, '%Y')
    $temp_today = $temp_ts|datetime( custom, '%j')

    $days = $temp_ts|datetime( custom, '%t')

    $first_ts = makedate($temp_month, 1, $temp_year)
    $dayone = $first_ts|datetime( custom, '%w' )

    $last_ts = makedate($temp_month, $days, $temp_year)
    $daylast = $last_ts|datetime( custom, '%w' )

    $span1 = $dayone
    $span2 = sub( 7, $daylast )

    $dayofweek = 0

    $day_array = " "
    $loop_dayone = 1
    $loop_daylast = 1
    $day_events = array()
    $loop_count = 0

    $vp_event_offset=$view_parameters.offset
    $vp_event_date=$view_parameters.date
    $vp_event_city=$view_parameters.city
    $vp_event_state=$view_parameters.state
    $vp_event_country=$view_parameters.country
    $vp_event_production=$view_parameters.production
    $vp_event_coordinator=$view_parameters.coordinator

    $attribute_filters=array()
 
    $with_children=true()
    $is_standalone=true()
    $page_limit=7

    $sort_method='production_event/from_time'

    $view_parameter_text=false()
    $form_action=false
    $action=false
}

{* Create view parameter text with the exception of offset *}
{section loop=$view_parameters}
 {section-exclude match=eq($:key,offset)}
 {section-exclude match=$:item|not}
 {set $view_parameter_text=concat($:view_parameter_text,'/(',$:key,')/',$:item)}
 {set $action=false}
{/section}

{set  $form_action=concat( $node.url_alias, $view_parameter_text )
      $action=concat( $node.url_alias, '' )
}

{if ne($temp_month, 12)}
    {set $last_ts=makedate($temp_month|sum( 1 ), 1, $temp_year)}
{else}
    {set $last_ts=makedate(1, 1, $temp_year|sum(1))}
{/if}
{def $url_reload=concat( $event_node.url_alias, "/(day)/", $temp_today, "/(month)/", $temp_month, "/(year)/", $temp_year, "/offset/2")
     $url_back=concat( $event_node.url_alias,  "/(month)/", sub($temp_month, 1), "/(year)/", $temp_year)
     $url_forward=concat( $event_node.url_alias, "/(month)/", sum($temp_month, 1), "/(year)/", $temp_year)
}
{if eq($temp_month, 1)}
    {set $url_back=concat( $event_node.url_alias,"/(month)/", "12", "/(year)/", sub($temp_year, 1))}
{elseif eq($temp_month, 12)}
    {set $url_forward=concat( $event_node.url_alias,"/(month)/", "1", "/(year)/", sum($temp_year, 1))}
{/if}

{* ############################################################################ *}
{* 
   Filter view parameters
*}

{if and( is_set( $vp_event_state ), ne( $vp_event_state, 'all' ) )}
{set $attribute_filters=$attribute_filters|append(array( 'production_event/event_mailling_state', '=', $vp_event_state ))}
{/if}

{if and( is_set( $vp_event_city ), ne( $vp_event_city, 'all' ) )}
{set $attribute_filters=$attribute_filters|append(array( 'production_event/event_mailling_city', '=', $vp_event_city ))}
{/if}

{if and( is_set( $vp_event_country ), ne( $vp_event_country, 'all' ) )}
{set $attribute_filters=$attribute_filters|append(array( 'production_event/event_mailling_country', '=', $vp_event_country ))}
{/if}

{if and( is_set( $vp_event_production ), ne( $vp_event_production, 'all' ) )}
{set $attribute_filters=$attribute_filters|append(array( 'production_event/production_film', '=', $vp_event_production ))}
{/if}

{if and( is_set( $vp_event_coordinator ), ne( $vp_event_coordinator, 'all' ) )}
{set $attribute_filters=$attribute_filters|append(array( 'production_event/event_coordinator_name', '=', $vp_event_coordinator ))}
{/if}

{if and( is_set( $vp_event_date ), ne( $vp_event_date, 'all' ) )}
{if and( is_set( $vp_event_date ), eq( $vp_event_date, 'thismonth' ) )}
{def $tm=$curr_month
     $tm_first_ts = makedate($tm, 1, $temp_year)
     $tm_last_ts = makedate($tm, $days, $temp_year)}
{set $attribute_filters=$attribute_filters|append(array( 'production_event/from_time', '>=', sum($tm_first_ts,1) ))}
{set $attribute_filters=$attribute_filters|append(array( 'production_event/from_time', '<=', sub($tm_last_ts,1) ))}
{elseif and( is_set( $vp_event_date ), eq( $vp_event_date, 'nextmonth' ) )}
{def $nm=sum($temp_month,1)
     $nm_first_ts = makedate($nm, 1, $temp_year)
     $nm_last_ts = makedate($nm, $days, $temp_year)}
{set $attribute_filters=$attribute_filters|append(array( 'production_event/from_time', '>=', sum($nm_first_ts,1) ))}
{set $attribute_filters=$attribute_filters|append(array( 'production_event/from_time', '<=', sub($nm_last_ts,1) ))}
{* set $attribute_filters=$attribute_filters|append(array( 'production_event/from_time', 'between', array( sum($nm_first_ts,1), sub($nm_last_ts,1) ) )) *}
{* set $attribute_filters=$attribute_filters|append(array( 'production_event/to_time', 'between', array( sum($nm_first_ts,1), sub($nm_last_ts,1) ) )) *}
{elseif and( is_set( $vp_event_date ), eq( $vp_event_date, 'upcoming' ) )}
{def $day = $curr_ts|datetime( custom, '%j')
     $temp_days_remain = sub( $days, $day )
     $uc_first_ts = makedate($temp_month, $day, $temp_year)
     $uc_last_ts = makedate($temp_month, $temp_days_remain, $temp_year)}
{set $attribute_filters=$attribute_filters|append(array( 'production_event/from_time', '>=', sum($uc_first_ts,1) ))}
{* set $attribute_filters=$attribute_filters|append(array( 'production_event/from_time', 'between', array( sum($uc_first_ts,1), sub($uc_last_ts,1) ) )) *}
{* set $attribute_filters=$attribute_filters|append(array( 'production_event/to_time', 'between', array( sum($uc_first_ts,1), sub($uc_last_ts,1) ) )) *}
{elseif and( is_set( $vp_event_date ), eq( $vp_event_date, 'month' ) )}
{set $attribute_filters=$attribute_filters|append(array( 'production_event/from_time', 'between', array( sum($first_ts,1), sub($last_ts,1) ) ))}
{set $attribute_filters=$attribute_filters|append(array( 'production_event/to_time', 'between', array( sum($first_ts,1), sub($last_ts,1) ) ))}
{/if}
{/if}

{if eq( $attribute_filters, array() )}
{set $attribute_filters=false()}
{/if}

{* ############################################################################ *}
{* 
  Set variable defaults
*}
{def $available_cities=fetch( content, list, hash( 
     'parent_node_id', $event_node_id,
     'sort_by', array( array( 'modified' , true() ) ),
     'class_filter_type', 'include',
     'class_filter_array', array( 'production_event' )
     ))

     $events=fetch( 'content', 'list', hash(
     'parent_node_id', $event_node_id,
     'offset', $vp_event_offset,
     'limit', $page_limit,
     'sort_by', array( 'attribute', true(), $sort_method ),
     'class_filter_type',  'include',
     'class_filter_array', array( 'production_event' ),
     'main_node_only', true(),
     'attribute_filter', $attribute_filters
     ))
     $events_count=fetch( 'content', 'list_count', hash(
     'parent_node_id', $event_node_id,
     'offset', $vp_event_offset,
     'limit', $page_limit,
     'sort_by', array( 'attribute', true(), $sort_method ),
     'class_filter_type', 'include',
     'class_filter_array', array( 'production_event' ),
     'main_node_only', true(),
     'attribute_filter', $attribute_filters
     ))
     $item_count=$events_count

     $city_name=false
     $state_name=false
     $country_name=false
     $production_name=false
     $coordinator_name=false

     $original_cities=array()
     $unique_cities=array()

     $original_states=array()
     $unique_states=array()

     $original_countries=array()
     $unique_countries=array()

     $original_productions=array()
     $unique_productions=array()

     $original_coordinators=array()
     $unique_coordinators=array()

     $is_selected=false
     $filters=false
}


{* ############################################################################ *}

{foreach $available_cities as $object}
{set $city_name=$object.object.data_map.event_mailling_city.value}
{set $original_cities=$original_cities|append( $city_name )}
{set $unique_cities=$original_cities|array_unique()|sort('string')}

{set $state_name=$object.object.data_map.event_mailling_state.value}
{set $original_states=$original_states|append( $state_name )}
{set $unique_states=$original_states|array_unique()|sort('string')}

{set $country_name=$object.object.data_map.event_mailling_country.value}
{set $original_countries=$original_countries|append( $country_name )}
{set $unique_countries=$original_countries|array_unique()|sort('string')}

{set $production_name=$object.object.data_map.production_film.value}
{set $original_productions=$original_productions|append( $production_name )}
{set $unique_productions=$original_productions|array_unique()|sort('string')}

{set $coordinator_name=$object.object.data_map.event_coordinator_name.value}
{set $original_coordinators=$original_coordinators|append( $coordinator_name )}
{set $unique_coordinators=$original_coordinators|array_unique()|sort('string')}
{/foreach}

{foreach $events as $event}
    {if eq($temp_month|int(), $event.data_map.from_time.content.month|int())}
        {set $loop_dayone = $event.data_map.from_time.content.day}
    {else}
        {set $loop_dayone = 1}
    {/if}
    {if $event.data_map.to_time.content.is_valid}
       {if eq($temp_month|int(), $event.data_map.to_time.content.month|int())}
            {set $loop_daylast = $event.data_map.to_time.content.day}
        {else}
            {set $loop_daylast = $days}
        {/if}
    {else}
         {set $loop_daylast = $loop_dayone}
    {/if}
    {for $loop_dayone|int() to $loop_daylast|int() as $counter}
        {set $day_array = concat($day_array, $counter, ', ')}
        {if eq($counter,$temp_today)}
            {set $day_events = $day_events|append($event)}
        {/if}
    {/for}
{/foreach}


{* ############################################################################ *}

<div class="border-box">
<div class="border-tl"><div class="border-tr"><div class="border-tc"></div></div></div>
<div class="border-ml"><div class="border-mr"><div class="border-mc float-break">

<div class="content-view-full">
 <div class="class-event-calendar event-calendar-calendarview">

<div class="attribute-header">
    <h1>{$event_node.name|wash()}</h1>
</div>

<form method="post" id="EventFilter" name="EventFilter" action={$node.url_alias|ezurl} onsubmit="eventFilter('')">

<input type="hidden" id="Offset" name="Offset" value="{$vp_event_offset}"/>

<label>City</label>
<select id="City" name="City">
  <option value="all"{cond( or( eq( $vp_event_city, false() ), eq( $vp_event_city, 'all' ) ), ' selected="selected"' )}>All</option>
{foreach $unique_cities as $city}
  {set $is_selected=cond( and( ne( $vp_event_city, false() ), eq( $vp_event_city, $city ) ), true() )}
  <option value="{$city}"{cond($is_selected, ' selected="selected"')}>{$city}</option>
{/foreach}
</select>

<label>State</label>
<select id="State" name="State">
  <option value="all"{cond( or( eq( $vp_event_state, false() ), eq( $vp_event_state, 'all' ) ), ' selected="selected"' )}>All</option>
{foreach $unique_states as $state}
  {set $is_selected=cond( and( ne( $vp_event_state, false() ), eq( $vp_event_state, $state ) ), true() )}
  <option value="{$state}"{cond($is_selected, ' selected="selected"')}>{$state}</option>
{/foreach}
</select>

<label>Country</label>
<select id="Country" name="Country">
  <option value="all"{cond( or( eq( $vp_event_country, false() ), eq( $vp_event_country, 'all' ) ), ' selected="selected"' )}>All</option>
{foreach $unique_countries as $country}
  {set $is_selected=cond( and( ne( $vp_event_country, false() ), eq( $vp_event_country, $country ) ), true() )}
  <option value="{$country}"{cond($is_selected, ' selected="selected"')}>{$country}</option>
{/foreach}
</select>

<label>Production</label>
<select id="Production" name="Production">
  <option value="all"{cond( eq( $vp_event_production, false() ), eq( $vp_event_production, 'all'), ' selected="selected"' )}>All</option>
{foreach $unique_productions as $production}
  {set $is_selected=cond( and( ne( $vp_event_production, false() ), eq( $vp_event_production, $production ) ), true() )}
  <option value="{$production}"{cond($is_selected, ' selected="selected"')}>{$production}</option>
{/foreach}
</select>

<label>Coordinator</label>
<select id="Coordinator" name="Coordinator">
  <option value="all"{cond( eq( $vp_event_coordinator, false() ), eq( $vp_event_coordinator, 'all'), ' selected="selected"' )}>All</option>
{foreach $unique_coordinators as $coordinator}
  {set $is_selected=cond( and( ne( $vp_event_coordinator, false() ), eq( $vp_event_coordinator, $coordinator ) ), true() )}
  <option value="{$coordinator}"{cond($is_selected, ' selected="selected"')}>{$coordinator}</option>
{/foreach}
</select>

<label>Date</label>
<select id="Date" name="Date">
  <option value="all"{cond( eq( $vp_event_date, 'all'), ' selected="selected"' )}>All</option>
  <option value="thismonth"{cond( eq( $vp_event_date, 'thismonth'), ' selected="selected"' )}>This Month</option>
  <option value="nextmonth"{cond( eq( $vp_event_date, 'nextmonth'), ' selected="selected"' )}>Next Month</option>
  <option value="upcoming"{cond( eq( $vp_event_date, 'upcoming'), ' selected="selected"' )}>Upcoming</option>
</select>{* Filter: Asc/Desc *}
{* if $vp_event_date}
Date: '{$vp_event_date}'.<br />
{/if *}

<div>
<input type="submit" class="defaultbutton" name="ActionFilterEvents" value="{"Filter events"|i18n("design/base")}"/>
</div>
</form>

{* ############################################################################ *}

<h2>Results</h2>

<div id="event_total" class="event_total" align="right">Total Events: {$item_count}<br /></div>

{include name=navigator
         uri='design:navigator/google.tpl'
         page_uri=$node.url_alias
         item_count=$item_count
         view_parameters=$view_parameters
         item_limit=$page_limit}

{foreach $events as $event}
{node_view_gui view=line content_node=$event}<br />
{/foreach}

{include name=navigator
         uri='design:navigator/google.tpl'
         page_uri=$node.url_alias
         item_count=$item_count
         view_parameters=$view_parameters
         item_limit=$page_limit}

{undef}
</div>
</div>


</div>
</div></div>
<div class="border-bl"><div class="border-br"><div class="border-bc"></div></div></div>
</div>

{/if}
