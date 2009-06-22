<?php
//
// Definition of BcMultipleAttributeExtendedFilter class
//
// Created on: <10-Feb-2008 14:41:50 gb>
//
// Copyright (C) 2001-2008 Brookins Consulting. All rights reserved.
//
// This file may be distributed and/or modified under the terms of the
// "GNU General Public License" version 2 as published by the Free
// Software Foundation and appearing in the file LICENSE included in
// the packaging of this file.
//
// This file is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING
// THE WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR
// PURPOSE.
//
// The "GNU General Public License" (GPL) is available at
// http://www.gnu.org/copyleft/gpl.html.
//
// Contact licence@brookinsconsulting.com
// if any conditions of this licencing isn't clear to you.
//

/*! \file bcmultipleattributeextendedfilter.php
*/

/*!
  \class BcMultipleAttributeExtendedFilter bcmultipleattributeextendedfilter.php
  \brief The class BcMultipleAttributeExtendedFilter does

*/

class BcMultipleAttributeExtendedFilter
{
    /*!
     Constructor
    */
    function BcMultipleAttributeExtendedFilter()
    {
    }

    /*!
     Create SQL parts
    */
    function createSqlParts( $params )
    {
        $db = eZDB::instance();

        $sqlCondArray = array();
        $sqlTables = ' ';
        $sqlJoins = ' ';

        // $known_param_names=array('city','state','country','production','coordinator');
        // $known_param_ids=array('333','334','336','329','338');
        $attributes=array( array( 'city', 333 ), array( 'state', 334 ), array( 'country', 336 ), array( 'production', 329 ), array( 'coordinator', 338) );

        foreach( $attributes as $attribute )
        {
          $_name = $attribute[0];
          if ( isset( $params[$_name] ) )
          {
              $_id = $db->escapeString( $attribute[1] );
              $_value = $db->escapeString( $params[$_name] );
              if ( $_value != "all" )
              {
                  $sqlCondArray[] = "l ezmyfiltertable.contentclassattribute_id = '$_id' AND ezmyfiltertable.data_text = '$_value'";
                  // $sqlCondArray[] = "( ezmyfiltertable.contentclassattribute_id = '$_id' AND ezmyfiltertable.data_text = '$_value' )";
              }
          }
        }

        if( !empty( $sqlCondArray ) )
        {
            $sqlTables= ', ezcontentobject_attribute as ezmyfiltertable ';
            $sqlJoins = ' ezcontentobject_tree.contentobject_id = ezmyfiltertable.contentobject_id AND ezcontentobject_tree.contentobject_version = ezmyfiltertable.version AND ezmyfiltertable.data_type_string = "ezstring" AND ';

            // $sqlCond = implode( ' or ', $sqlCondArray );
            $sqlCond = implode( ' and ', $sqlCondArray );
            // $sqlCond = ' ( ' . $sqlCond . ' ) AND ' . $sqlJoins . ' ';
            $sqlCond = ' ' . $sqlCond . ' AND ' . $sqlJoins . ' ';

            $sqlJoins = $sqlCond;

            /* print_r( $sqlCondArray );
                print_r( "<hr />");
            */

            print_r( $sqlCond );
            print_r( "<hr />");
        }
        //        $sqlJoins = " ezcontentobject_tree.contentobject_id = ezmyfiltertable.contentobject_id AND ezcontentobject_tree.contentobject_version = ezmyfiltertable.version AND ezmyfiltertable.data_type_string = 'ezstring' AND ezmyfiltertable.contentclassattribute_id IN ('333','334','336','329','338') AND ezmyfiltertable.data_text IN ('Anchorage','Alaska', 'USA') AND ";
        //        $sqlJoins = " ezcontentobject_tree.contentobject_id = ezmyfiltertable.contentobject_id AND ezcontentobject_tree.contentobject_version = ezmyfiltertable.version AND ezmyfiltertable.data_type_string = 'ezstring' AND ezmyfiltertable.contentclassattribute_id IN ('333','334','336') AND ezmyfiltertable.data_text IN ('Anchorage','Alaska', 'USA') AND ";

        $sqlJoins = " ezcontentobject_tree.contentobject_id = ezmyfiltertable.contentobject_id AND ezcontentobject_tree.contentobject_version = ezmyfiltertable.version AND ezmyfiltertable.data_type_string = 'ezstring' AND ezmyfiltertable.contentclassattribute_id IN ('333','334','336') AND ezmyfiltertable.data_text IN ('Anchorage','Alaska', 'USA') AND ";

        return array( 'tables' => $sqlTables,
                      'joins'  => $sqlJoins );
    }
}



?>
