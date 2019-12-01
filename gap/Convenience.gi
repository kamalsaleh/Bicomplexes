

if not IsBound( Time ) then
  
  DeclareGlobalFunction( "Time" );
  
  ##
  InstallGlobalFunction( Time,
    function( command, arguments )
      local t0, t1;
      
      t0 := NanosecondsSinceEpoch( );
      
      CallFuncList( command, arguments );
      
      t1 := NanosecondsSinceEpoch( );
      
      return Float( ( t1 - t0 ) / 10^9 );
      
  end );
  
fi;

DeclareOperation( "\/", [ IsCapCategoryCell, IsCapFullSubcategory ] );
##
InstallMethod( \/, [ IsCapCategoryCell, IsCapFullSubcategory ], {cell, cat} -> AsFullSubcategoryCell( cat, cell ) );
