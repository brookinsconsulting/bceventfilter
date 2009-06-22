<?php /* #?ini charset="utf-8"?

[Session]
SessionNameHandler=custom

[SiteSettings]
DefaultAccess=ftctw_user
SiteList[]=ftctw_user
SiteList[]=ftctw_admin
RootNodeDepth=1
SiteName=Films That Change The World
MetaDataArray[author]=Films That Change The World
MetaDataArray[copyright]=eFilms That Change The World
MetaDataArray[description]=Films That Change The World
MetaDataArray[keywords]=Films That Change The World
SiteURL=ftctw.vs.int.brookinsconsulting.com/index.php

[UserSettings]
LogoutRedirect=/

[SiteAccessSettings]
CheckValidity=false
AvailableSiteAccessList[]=ftctw_user
AvailableSiteAccessList[]=ftctw_admin
MatchOrder=host
HostMatchMapItems[]=edit.ftctw.vs.int.brookinsconsulting.com;ftctw_admin
HostMatchMapItems[]=ftctw.vs.int.brookinsconsulting.com;ftctw_user

[FileSettings]
VarDir=var/ezwebin_site

[MailSettings]
Transport=sendmail
AdminEmail=info@brookinsconsulting.com
EmailSender=info@brookinsconsulting.com

[EmbedViewModeSettings]
AvailableViewModes[]=embed
AvailableViewModes[]=embed-inline
InlineViewModes[]=embed-inline


[SiteAccessRules]
Rules[]
# Set access policy to allowed
# Rules[]=access;enable
# Special syntax which means any module
# This means that for now all modules are enabled
# Rules[]=moduleall
# Set policy to denied
Rules[]=access;disable
# # If content/search module use current policy (denied)
Rules[]=module;package
Rules[]=module;class
Rules[]=module;setup
Rules[]=module;role
Rules[]=module;settings


*/ ?>