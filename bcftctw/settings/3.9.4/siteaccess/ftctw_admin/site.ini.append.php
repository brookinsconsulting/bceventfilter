<?php /* #?ini charset="utf-8"?

[ExtensionSettings]
# ActiveExtensions[]
ActiveAccessExtensions[]
ActiveAccessExtensions[]=ezwebin
ActiveAccessExtensions[]=ezdhtml
ActiveAccessExtensions[]=ezodf
# ActiveAccessExtensions[]=ftctw


[DatabaseSettings]
DatabaseImplementation=ezmysql
Server=localhost
User=bc_vs
Password=publish
Database=bc_vs
Charset=
Socket=disabled

[InformationCollectionSettings]
EmailReceiver=info@brookinsconsulting.com

[SiteSettings]
SiteName=Administration
# Website Interface
SiteURL=vs.int.brookinsconsulting.com
LoginPage=custom

[UserSettings]
RegistrationEmail=info@brookinsconsulting.com
# Redirect users upon logout to calendar
LogoutRedirect=/events
# Set to enabled if self registered user accounts
# should be verified by e-mail
VerifyUserEmail=disabled

[SiteAccessSettings]
RequireUserLogin=true
# RelatedSiteAccessList[]=eng
# RelatedSiteAccessList[]=ezwebin_site_user
# RelatedSiteAccessList[]=ezwebin_site_admin
RelatedSiteAccessList[]=ftctw_user
RelatedSiteAccessList[]=ftctw_admin
ShowHiddenNodes=true

[DesignSettings]
SiteDesign=ftctw_admin
# SiteDesign=ezwebin_site_admin
AdditionalSiteDesignList[]=admin

[RegionalSettings]
Locale=eng-US
ContentObjectLocale=eng-US
ShowUntranslatedObjects=enabled
SiteLanguageList[]=eng-US
# TextTranslation=enabled
TextTranslation=disabled

[FileSettings]
VarDir=var/ezwebin_site

[ContentSettings]
CachedViewPreferences[full]=admin_navigation_content=0;admin_navigation_details=0;admin_navigation_languages=0;admin_navigation_locations=0;admin_navigation_relations=0;admin_navigation_roles=0;admin_navigation_policies=0;admin_navigation_content=0;admin_navigation_translations=0;admin_children_viewmode=list;admin_list_limit=1;admin_edit_show_locations=0;admin_leftmenu_width=10;admin_url_list_limit=10;admin_url_view_limit=10;admin_section_list_limit=1;admin_orderlist_sortfield=user_name;admin_orderlist_sortorder=desc;admin_search_stats_limit=1;admin_treemenu=1;admin_bookmarkmenu=1;admin_left_menu_width=13
TranslationList=

[MailSettings]
AdminEmail=info@brookinsconsulting.com
EmailSender=info@brookinsconsulting.com

*/ ?>