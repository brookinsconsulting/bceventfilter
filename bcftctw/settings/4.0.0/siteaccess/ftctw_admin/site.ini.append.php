\<?php /* #?ini charset="utf-8"?

[ExtensionSettings]
# ActiveExtensions[]
ActiveAccessExtensions[]
ActiveAccessExtensions[]=ezwebin
ActiveAccessExtensions[]=ezdhtml
ActiveAccessExtensions[]=ezodf
ActiveAccessExtensions[]=bceventnotifications
# ActiveAccessExtensions[]=sckcreatesubtreenotificationruleevent
# ActiveAccessExtensions[]=eznotificationworkflow
# ActiveAccessExtensions[]=bcftctw


[DatabaseSettings]
DatabaseImplementation=ezmysql
Server=localhost
Port=
User=root
Password=publish
Database=vs_beta
Charset=
Socket=disabled

[InformationCollectionSettings]
EmailReceiver=info@brookinsconsulting.com

[SiteSettings]
SiteName=Website Interface
SiteURL=ftctw.vs.int.brookinsconsulting.com/index.php
LoginPage=custom

[UserSettings]
RegistrationEmail=info@brookinsconsulting.com

[SiteAccessSettings]
RequireUserLogin=true
RelatedSiteAccessList[]=ftctw_user
RelatedSiteAccessList[]=ftctw_admin
RelatedSiteAccessList[]=ezwebin_site_user
# RelatedSiteAccessList[]=eng
# RelatedSiteAccessList[]=ezwebin_site_admin
ShowHiddenNodes=true

[DesignSettings]
SiteDesign=ezwebin_site_admin
AdditionalSiteDesignList[]=admin

[RegionalSettings]
Locale=eng-US
ContentObjectLocale=eng-US
ShowUntranslatedObjects=enabled
SiteLanguageList[]=eng-US
TextTranslation=enabled

[FileSettings]
VarDir=var/ezwebin_site

[ContentSettings]
CachedViewPreferences[full]=admin_navigation_content=0;admin_navigation_details=0;admin_navigation_languages=0;admin_navigation_locations=0;admin_navigation_relations=0;admin_navigation_roles=0;admin_navigation_policies=0;admin_navigation_content=0;admin_navigation_translations=0;admin_children_viewmode=list;admin_list_limit=1;admin_edit_show_locations=0;admin_leftmenu_width=10;admin_url_list_limit=10;admin_url_view_limit=10;admin_section_list_limit=1;admin_orderlist_sortfield=user_name;admin_orderlist_sortorder=desc;admin_search_stats_limit=1;admin_treemenu=1;admin_bookmarkmenu=1;admin_left_menu_width=13
TranslationList=

[MailSettings]
AdminEmail=info@brookinsconsulting.com
EmailSender=

[DebugSettings]
# Master switch for debug, if disabled no debug will be shown                                                                                                                                                                                                                                                                               
# If enabled it's up to the DebugIP and DebugIPList to decide what to do.                                                                                                                                                                                                                                                                   
# Use either enabled or disabled                                                                                                                                                                                                                                                                                                            
# DebugOutput=disabled                                                                                                                                                                                                                                                                                                                      
DebugOutput=enabled
# Controls which debug types to always log.                                                                                                                                                                                                                                                                                                 
# This ensures logging even if debug output is off                                                                                                                                                                                                                                                                                          
#                                                                                                                                                                                                                                                                                                                                           
# Available debug types are:                                                                                                                                                                                                                                                                                                                
# error - For major errors, very important to log                                                                                                                                                                                                                                                                                           
# warning - Smaller errors, important for development but not for live site                                                                                                                                                                                                                                                                 
# debug - Temporary debug, usually only important to see in the web browser                                                                                                                                                                                                                                                                 
# notice - General notices, enabling this can fill up the log files quickly                                                                                                                                                                                                                                                                 
AlwaysLog[]
AlwaysLog[]=error
# Debug switch for scripts, will only take place if DebugOutput is set to enabled                                                                                                                                                                                                                                                           
# By default it is off to not give debug for scripts.                                                                                                                                                                                                                                                                                       
# Use either enabled or disabled                                                                                                                                                                                                                                                                                                            
ScriptDebugOutput=disabled
# Whether debug is set per IP address. If set to enabled it will user                                                                                                                                                                                                                                                                       
# DebugIPList for valid ips otherwise all ips get debug.                                                                                                                                                                                                                                                                                    
# Use either enabled or disabled                                                                                                                                                                                                                                                                                                            
DebugByIP=disabled
# A array with IP addresses or networks which will get debug information                                                                                                                                                                                                                                                                    
DebugIPList[]
# Examples                                                                                                                                                                                                                                                                                                                                                                                                                
# You can use any enabled/disabled setting                                                                                                                                                                                                                                                                                                  
QuickSettingsList[]

[TemplateSettings]
TemplateCache=disabled
TemplateCompile=disabled
DevelopmentMode=enabled
CacheThreshold=0
# ShowUsedTemplates=enabled                                                                                                                                                                                                                                                                                                                 
# TemplateOptimization=enabled                                                                                                                                                                                                                                                                                                              
 # Debug=enabled                                                                                                                                              



*/ ?>