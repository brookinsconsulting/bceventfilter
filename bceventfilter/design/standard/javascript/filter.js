function eventFilter( i )
{
   var filter=document.getElementById( 'EventFilter' );
   var filter_action=filter.action;

   var offset=document.getElementById( 'Offset' );
   var date=document.getElementById( 'Date' );
   var city=document.getElementById( 'City' );
   var state=document.getElementById( 'State' );
   var country=document.getElementById( 'Country' );
   var production=document.getElementById( 'Production' );
   var coordinator=document.getElementById( 'Coordinator' );

   if ( offset.value != '0' )
   {
   filter_action += '/(offset)/' + escape( offset.value ); 
   }
   if ( date.value != 'all' )
   {
   filter_action += '/(date)/' + escape( date.value ); 
   }
   if ( city.value != 'all' )
   {
   filter_action += '/(city)/' + escape( city.value ); 
   }
   if ( state.value != 'all' )
   {
   filter_action += '/(state)/' + escape( state.value ); 
   }
   if ( country.value != 'all' )
   {
   filter_action += '/(country)/' + escape( country.value ); 
   }
   if ( production.value != 'all' )
   {
   filter_action += '/(production)/' + escape( production.value ); 
   }
   if ( coordinator.value != 'all' )
   {
   filter_action += '/(coordinator)/' + escape( coordinator.value ); 
   }
   filter.action=filter_action;
}
