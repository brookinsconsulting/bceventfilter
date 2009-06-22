<?php /* #?ini charset="utf-8"?

[ExtensionSettings]
ActiveAccessExtensions[]=ftctw
ActiveAccessExtensions[]=bccalendar
ActiveAccessExtensions[]=ezdhtml
ActiveAccessExtensions[]=ezodf
ActiveAccessExtensions[]=ezwebin
ActiveAccessExtensions[]=ezauthorcontact


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

[Session]
SessionNamePerSiteAccess=disabled

[SiteSettings]
SiteName=Films That Change The World
# Website Interface
SiteURL=vs.int.brookinsconsulting.com
LoginPage=embedded
AdditionalLoginFormActionURL=http://edit.vs.int.brookinsconsulting.com/user/login

[UserSettings]
RegistrationEmail=info@brookinsconsulting.com

# Redirect users upon logout to calendar
LogoutRedirect=/events

# Set to enabled if self registered user accounts
# should be verified by e-mail
VerifyUserEmail=disabled

[SiteAccessSettings]
RequireUserLogin=false
RelatedSiteAccessList[]
# RelatedSiteAccessList[]=ezwebin_site_user
# RelatedSiteAccessList[]=ezwebin_site_admin
RelatedSiteAccessList[]=ftctw_user
RelatedSiteAccessList[]=ftctw_admin
# RelatedSiteAccessList[]=eng
ShowHiddenNodes=false

[DesignSettings]
SiteDesign=ezwebin
AdditionalSiteDesignList[]
AdditionalSiteDesignList[]=base

[RegionalSettings]
Locale=eng-US
ContentObjectLocale=eng-US
ShowUntranslatedObjects=disabled
SiteLanguageList[]
SiteLanguageList[]=eng-US
# TextTranslation=enabled
TextTranslation=disabled

[FileSettings]
VarDir=var/ezwebin_site

[ContentSettings]
TranslationList=

[MailSettings]
AdminEmail=info@brookinsconsulting.com
EmailSender=info@brookinsconsulting.com

[DebugSettings]
# Master switch for debug, if disabled no debug will be shown
# If enabled it's up to the DebugIP and DebugIPList to decide what to do.
# Use either enabled or disabled
DebugOutput=disabled
# DebugOutput=enabled
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
#DebugIPList[]=1.2.3.4
#DebugIPList[]=192.0.0.42
#DebugIPList[]=192.0.0.0/27

# Developer toolbar with clear cache and quick settings features
DebugToolbar=disabled

# Quick settings list for the developer toolbar
# You can use any enabled/disabled setting
QuickSettingsList[]

[TemplateSettings]
# DEPRECATED: AutoloadPath is deprecated, use AutoloadPathList instead.
#             This setting may be removed in the future.
# Similar to AutoloadPathList but uses a ; (semicolon) separated
# list of directories instead of an array.
AutoloadPath=
# A list of directories to look for eztemplateautoload.php files
# These files will be used to automatically load in template functions and operators
# You can new ones if you create custom template code.
AutoloadPathList[]
AutoloadPathList[]=lib/eztemplate/classes/
AutoloadPathList[]=kernel/common/
AutoloadPathList[]=lib/ezpdf/classes/

# A list of extensions which have template autoloads.
# Only specify the extension name, not the path.
# The extension must contain a subdirectory called autoloads.
# ExtensionAutoloadPath[]

# Use either enabled to see which template files are loaded or disabled to supress debug
Debug=disabled
# If enabled will add code to display the template name in the browser
# If Debug is disabled then nothing happens
ShowXHTMLCode=enabled
# Whether to show debug of functions and operators when
# processing nodes.
# This only meant for kernel developers to check which
# operators and functions are called.
# Note: Will only work when template compiler is off
# ShowMethodDebug=disabled
# ShowMethodDebug=enabled
# If enabled will add a table with templates used to render a page.
# DebugOutput should be enabled too.
# ShowUsedTemplates=disabled
ShowUsedTemplates=enabled


*/ ?>