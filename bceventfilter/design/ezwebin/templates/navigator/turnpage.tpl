{def $clean_view_parameters=array()}
{foreach $view_parameters as $key => $value}
  {switch match=$key}
   {case in=array('day', 'month', 'year', 'namefilter')} 
   {/case}
   {case}
    {set $clean_view_parameters=$clean_view_parameters|merge(hash($key,$value))}
   {/case}
  {/switch}
{/foreach}

{*
{set $view_parameters_offset=$clean_view_parameters.offset}
{set $offset=$view_parameters_offset}
{set $view_parameters=$clean_view_parameters}

<h3>{$offset} - {$item_limit}</h3>
<h1>{$view_parameters.offset}</h1>
<h1>{$:view_parameter_text}</h1>
<h1>{$ViewParameter:view_parameter_text}</h1>
*}
{*
{$view_parameters|attribute(show,1)}

{$clean_view_parameters|attribute(show,1)}
*}

{set $view_parameters=$clean_view_parameters|reverse()}

{* 
{$view_parameters|attribute(show,1)}
*}

{* <h3>{$view_parameters.offset} - {$item_limit}</h3> *}

{default name=ViewParameter
         left_max=10
         right_max=9}

{* $view_parameters.offset} - {$item_limit *}
{let item_previous=sub( $view_parameters.offset,
                         $item_limit )
      item_next=sum( $view_parameters.offset,
                     $item_limit )
      page_count=int( ceil( div( $item_count,$item_limit ) ) )
      current_page=int( ceil( div( $view_parameters.offset,
                                   $item_limit ) ) )

      left_length=min($ViewParameter:current_page,$:left_max)
      right_length=min(sub($ViewParameter:page_count,$ViewParameter:current_page,1),$:right_max)
      view_parameter_text=""}

{* Create view parameter text with the exception of offset *}
{section loop=$view_parameters}
 {section-exclude match=eq($:key,offset)}
 {set view_parameter_text=concat($:view_parameter_text,'/(',$:key,')/',$:item)}
{/section}

{* <h1>{$:page_count}</h1> *}

{section show=$:page_count|gt(1)}

<div class="selectbar">
<table width="1%" border="0" align="center" cellpadding="0" cellspacing="7" class="selectbar">
<tr>
     {switch match=$:item_previous|lt(0) }
       {case match=0}
     <td class="selectbar">
      <a class="selectbar" href={concat($page_uri,$:item_previous|gt(0)|choose('',concat('/(offset)/',$:item_previous)),$:view_parameter_text)|ezurl}><<&nbsp;{"previous"|i18n("design/standard/navigator")}</a>
     </td>
       {/case}
       {case match=1}
       {/case}
     {/switch}

    <td>
<div align="center">
<table width="1%" cellpadding="0" cellspacing="2" border="0" align="center">
<tr align="center">

{section show=$:current_page|gt($:left_max)}
<td>
 <a href={concat($page_uri,$:view_parameter_text)|ezurl}>1</a>
</td>
{section show=sub($:current_page,$:left_length)|gt(1)}
<td>...
</td>
{/section}
{/section}

    {section name=Quick loop=$:left_length}
<td>
        {let page_offset=sum(sub($ViewParameter:current_page,$ViewParameter:left_length),$:index)}
          <a href={concat($page_uri,$:page_offset|gt(0)|choose('',concat('/(offset)/',mul($:page_offset,$item_limit))),$ViewParameter:view_parameter_text)|ezurl}>{$:page_offset|inc}</a>
        {/let}
</td>
    {/section}

<td>
        <b>{$:current_page|inc}</b>
</td>

    {section name=Quick loop=$:right_length}
<td>
        {let page_offset=sum($ViewParameter:current_page,1,$:index)}
          <a href={concat($page_uri,$:page_offset|gt(0)|choose('',concat('/(offset)/',mul($:page_offset,$item_limit))),$ViewParameter:view_parameter_text)|ezurl}>{$:page_offset|inc}</a>
        {/let}
</td>
    {/section}

{section show=$:page_count|gt(sum($:current_page,$:right_max,1))}
{section show=sum($:current_page,$:right_max,2)|lt($:page_count)}
<td>
...
</td>
{/section}
<td>
 <a href={concat($page_uri,$:page_count|dec|gt(0)|choose('',concat('/(offset)/',mul($:page_count|dec,$item_limit))),$:view_parameter_text)|ezurl}>{$:page_count}</a>
</td>
{/section}

</tr>
</table>
</div>
    </td>

    {switch match=$:item_next|lt($item_count)}
      {case match=1}
        <td class="selectbar" width="1%">
        <a class="selectbar" href={concat($page_uri,'/(offset)/',$:item_next,$:view_parameter_text)|ezurl}>{"next"|i18n("design/standard/navigator")}&nbsp;>></a>
        </td>
      {/case}
      {case}
      {/case}
    {/switch}
</tr>
</table>
</div>

{/section}

 {/let}
{/default}
