<?php
//
// Created on: <01-Aug-2002 09:58:09 bf>
//
// SOFTWARE NAME: eZ Publish
// SOFTWARE RELEASE: 4.0.0
// BUILD VERSION: 20988
// COPYRIGHT NOTICE: Copyright (C) 1999-2007 eZ Systems AS
// SOFTWARE LICENSE: GNU General Public License v2.0
// NOTICE: >
//   This program is free software; you can redistribute it and/or
//   modify it under the terms of version 2.0  of the GNU General
//   Public License as published by the Free Software Foundation.
//
//   This program is distributed in the hope that it will be useful,
//   but WITHOUT ANY WARRANTY; without even the implied warranty of
//   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//   GNU General Public License for more details.
//
//   You should have received a copy of version 2.0 of the GNU General
//   Public License along with this program; if not, write to the Free
//   Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
//   MA 02110-1301, USA.
//
//

////include_once( 'lib/ezutils/classes/ezhttptool.php' );
//include_once( 'kernel/classes/datatypes/ezuser/ezuser.php' );
//include_once( 'kernel/classes/ezcontentobject.php' );
//include_once( 'kernel/classes/datatypes/ezuser/ezusersetting.php' );
//include_once( 'kernel/classes/datatypes/ezuser/ezuseraccountkey.php' );

$Module = $Params['Module'];
//$http = eZHTTPTool::instance();
$hash = $Params['Hash'];
$mainNodeID = $Params['MainNodeID'];

// Check if key exists
$accountActivated = false;
$alreadyActive = false;
$accountKey = eZUserAccountKey::fetchByKey( $hash );

if ( $accountKey )
{
    $accountActivated = true;
    $userID = $accountKey->attribute( 'user_id' );

    // Enable user account
    $userSetting = eZUserSetting::fetch( $userID );
    $userSetting->setAttribute( 'is_enabled', 1 );
    $userSetting->store();

    // Log in user
    $user = eZUser::fetch( $userID );

    if ( $user === null )
        return $Module->handleError( eZError::KERNEL_NOT_FOUND, 'kernel' );

    $user->loginCurrent();

    // Remove key
    $accountKey->remove( $userID );
}
elseif( $mainNodeID )
{
    $userContentObject = eZContentObject::fetchByNodeID( $mainNodeID );
    $userSetting = eZUserSetting::fetch( $userContentObject->attribute( 'id' ) );

    if ( $userSetting !== null && $userSetting->attribute( 'is_enabled' ) )
    {
        $alreadyActive = true;
    }
}

// Template handling
require_once( 'kernel/common/template.php' );
$tpl = templateInit();

$tpl->setVariable( 'module', $Module );
$tpl->setVariable( 'account_activated', $accountActivated );
$tpl->setVariable( 'already_active', $alreadyActive );

// This line is deprecated, the correct name of the variable should
// be 'account_activated' as shown above.
// However it is kept for backwards compatability.
$tpl->setVariable( 'account_avtivated', $accountActivated );

$Result = array();
$Result['content'] = $tpl->fetch( 'design:user/activate.tpl' );
$Result['path'] = array( array( 'text' => ezi18n( 'kernel/user', 'User' ),
                                'url' => false ),
                         array( 'text' => ezi18n( 'kernel/user', 'Activate' ),
                                'url' => false ) );
$ini = eZINI::instance();
if ( $ini->variable( 'SiteSettings', 'LoginPage' ) == 'custom' )
    $Result['pagelayout'] = 'loginpagelayout.tpl';

?>
