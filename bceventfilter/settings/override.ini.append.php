<?php /* #?ini charset="utf-8"?

#
# x

# x

[menu_flat_top]
Source=menu/flat_top.tpl
MatchFile=menu/flat_top.tpl
Subdir=templates

# User Registration / Login

[user_register]
Source=user/register.tpl
MatchFile=user/register.tpl
Subdir=templates

[user_login]
Source=user/login.tpl
MatchFile=user/login.tpl
Subdir=templates


# Example / Header Navigation My Events Button Addition

[suggested_calendar_pagelayout]
Source=pagelayout.tpl
MatchFile=suggested_calendar_pagelayout.tpl
Subdir=templates


# Customized Toolbar

[website_toolbar_trim]
Source=parts/website_toolbar.tpl
MatchFile=website_toolbar_trim.tpl
Subdir=templates

[ezwebin_toolbar_edit_custom]
Source=parts/website_toolbar_edit.tpl
MatchFile=parts/website_toolbar_edit_custom.tpl
Subdir=templates

# [my_webite_toolbar]
# Source=parts/website_toolbar.tpl
# MatchFile=parts/website_toolbar.tpl
# Subdir=templates
# Match[object]=179

## [my_webite_toolbar]
## Source=parts/website_toolbar.tpl
## MatchFile=parts/website_toolbar.tpl
## Subdir=templates
# Match[class_identifier]=folder
# Match[class_identifier]=event_calendar
# Match[object]=170
# Match[object]=178
# Match[object]=158
# Match[object]=164
## Match[object]=179


# Event Filter, My Events

[my_events]
Source=node/view/full.tpl
MatchFile=full/my_events.tpl
Subdir=templates
Match[class_identifier]=folder
# Match[class_identifier]=event_calendar
# Match[object]=170
# Match[object]=178
# Match[object]=158
# Match[object]=164
Match[object]=179


# Event Filter, Filter Events

[full_filter_event_calendar]
Source=node/view/full.tpl
MatchFile=full/filter_event_calendar.tpl
# MatchFile=full/my_events.tpl
Subdir=templates
Match[class_identifier]=event_calendar
# Match[object]=170
# Match[object]=178
# Match[object]=158
Match[object]=164


# [full_filter_event_calendarTesting]
# Source=node/view/full.tpl
# MatchFile=full/filter_event_calendar.tpl
# Subdir=templates
# Match[class_identifier]=event_calendar
# Match[object]=178


# Class Templates, 'production_event'

[full_production_event]
Source=node/view/full.tpl
MatchFile=full/production_event.tpl
Subdir=templates
Match[class_identifier]=production_event

[line_production_event]
Source=node/view/line.tpl
MatchFile=line/production_event.tpl
Subdir=templates
Match[class_identifier]=production_event



# Additional customized templates (known usage ...)

[full_event_calendar]
Source=node/view/full.tpl
MatchFile=full/event_calendar.tpl
Subdir=templates
Match[class_identifier]=event_calendar

[full_event]
Source=node/view/full.tpl
MatchFile=full/event.tpl
Subdir=templates
Match[class_identifier]=event

[full_feedback_form]
Source=node/view/full.tpl
MatchFile=full/feedback_form.tpl
Subdir=templates
Match[class_identifier]=feedback_form


[line_event_calendar]
Source=node/view/line.tpl
MatchFile=line/event_calendar.tpl
Subdir=templates
Match[class_identifier]=event_calendar

[line_event]
Source=node/view/line.tpl
MatchFile=line/event.tpl
Subdir=templates
Match[class_identifier]=event

[line_feedback_form]
Source=node/view/line.tpl
MatchFile=line/feedback_form.tpl
Subdir=templates
Match[class_identifier]=feedback_form


#
# [full_event_calendar]
# Source=node/view/full.tpl
# MatchFile=full/event_calendar.tpl
# Subdir=templates
# Match[class_identifier]=event_calendar
#

*/ ?>