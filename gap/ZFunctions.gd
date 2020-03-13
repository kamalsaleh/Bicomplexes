

#! @Chapter Z-functions

#! @Section Gap categories for Z functions

#! @Description
#!  Gap-categories of $\mathbb{Z}$-functions
DeclareCategory( "IsZFunction", IsObject );

#! @Description
#!  Gap-categories of inductive $\mathbb{Z}$-functions
DeclareCategory( "IsZFunctionWithInductiveSides", IsZFunction );

#! @Section Creating Z-functions

#! @Description
#! The global function has no arguments and the output is an empty $\mathbb{Z}$-function. That means, it can not be evaluated yet.
#! @Arguments func
#! @Returns an integer
DeclareGlobalFunction( "VoidZFunction" );

#! @Description
#! The argument is a function <A>func</A> that can be applied on integers.
#! The output is a $\mathbb{Z}$-function <C>z_func</C>. We call <A>func</A> the <C>UnderlyingFunction</C> function of <C>z_func</C>.
#! @Arguments func
#! @Returns a $\mathbb{Z}$-function
DeclareAttribute( "AsZFunction", IsFunction );

#! @Description
#! The argument is a <A>z_func</A>. The output is its <C>UnderlyingFunction</C> function. I.e., the function that will be applied on index <C>i</C>
#! whenever we call <A>z_func</A>[<C>i</C>].
#! @Arguments func
#! @Returns a $\mathbb{Z}$-function
DeclareAttribute( "UnderlyingFunction", IsZFunction );

#! @Description
#! The argument is a $\mathbb{Z}$-function <A>z_func</A> and an integer <A>i</A>. The output is
#! <A>z_func</A>[<C>i</C>].
#! @Arguments z_func, i
#! @Returns a Gap object
KeyDependentOperation( "ZFunctionValue", IsZFunction, IsInt, ReturnTrue );

#! @Description
#! The method delegates to <C>ZFunctionValue</C>.
#! @Arguments z_func, i
#! @Returns a Gap object
DeclareOperation( "\[\]", [ IsZFunction, IsInt ] );


#! @Description
#! The arguments are an integer <A>n</A>, a Gap object <A>val_n</A>, a function <A>neg_part_func</A>, a function <A>pos_part_func</A> and a function <A>compare_func</A>.
#! The output is the $\mathbb{Z}$-function <C>z_func</C> defined as follows:
#! @BeginLatexOnly
#!     $$\begin{cases}
#!        \mathtt{neg\_part\_func( z\_func[ i + 1 ] )} & \quad \text{if}\quad i<n, \\
#!        \mathtt{val\_n} & \quad \text{if}\quad i=n,\\
#!        \mathtt{pos\_part\_func( z\_func[ i - 1 ] )} & \quad \text{if}\quad i>n. \\
#!     \end{cases}$$
#! @EndLatexOnly
#! At each call, the method compares the computed value to the previous or next value and in the affermative case, the method sets a positive or negative stable value.
#! @Arguments n, val_n, neg_part_func, pos_part_func, compare_func
#! @Returns a $\mathbb{Z}$-function with inductive sides
DeclareOperation( "ZFunctionWithInductiveSides",
      [ IsInt, IsObject, IsFunction, IsFunction, IsFunction ] );

#! @BeginGroup 9228
#! @Description
#! They are the attributes that define a $\mathbb{Z}$-function with inductive sides.
#! @Arguments z_func
#! @Returns a function
DeclareAttribute( "PosFunction", IsZFunctionWithInductiveSides );
#! @Arguments z_func
#! @Returns a function
DeclareAttribute( "NegFunction", IsZFunctionWithInductiveSides );
#! @Arguments z_func
#! @Returns an integer
DeclareAttribute( "FirstIndex", IsZFunctionWithInductiveSides );
#! @Arguments z_func
#! @Returns a Gap object
DeclareAttribute( "FirstValue", IsZFunctionWithInductiveSides );
#! @EndGroup
#! @Group 9228
#! @Arguments z_func
#! @Returns a function
DeclareAttribute( "CompareFunction", IsZFunctionWithInductiveSides );

#! @Description
#! The argument is a $\mathbb{Z}$-function <A>z_func</A>. We say that <A>z_func</A> has a stable positive value <C>pos_val</C>,
#! if there is an index <C>pos_N</C> such that <A>z_func</A>[<C>i</C>] is equal to <C>pos_val</C> for all indices <C>i</C> greater or equal to <C>pos_N</C>.
#! In that case, the output is the value <C>pos_val</C>.
#! @Arguments func
#! @Returns a Gap object
DeclareAttribute( "StablePosValue", IsZFunction );

#! @Description
#! The argument is a $\mathbb{Z}$-function <A>z_func</A> with a stable positive value <C>pos_val</C>. The output is some index where <A>z_func</A> starts to take
#! values equal to <C>pos_val</C>.
#! @Arguments func
#! @Returns an integer
DeclareAttribute( "IndexOfStablePosValue", IsZFunction );

#! @Description
#! The argument is a $\mathbb{Z}$-function <A>z_func</A>. We say that <A>z_func</A> has a stable negative value <C>neg_val</C>,
#! if there is an index <C>neg_N</C> such that <A>z_func</A>[<C>i</C>] is equal to <C>neg_val</C> for all indices <C>i</C> less or equal to <C>neg_N</C>.
#! In that case, the output is the value <C>neg_val</C>.
#! @Arguments func
#! @Returns a Gap object
DeclareAttribute( "StableNegValue", IsZFunction );

#! @Description
#! The argument is a $\mathbb{Z}$-function <A>z_func</A> with a stable negative value <C>neg_val</C>. The output is some index where <A>z_func</A> starts to take
#! values equal to <C>neg_val</C>.
#! @Arguments func
#! @Returns an integer
DeclareAttribute( "IndexOfStableNegValue", IsZFunction );

#! @Description
#! The argument is a $\mathbb{Z}$-function <A>z_func</A>. The output is another
#! $\mathbb{Z}$-function <C>ref_z_func</C> such that <C>ref_z_func[i]</C> is equal
#! to <A>z_func</A>[<C>-i</C>] for all <C>i</C> in $\mathbb{Z}$.
#! @Arguments z_func
#! @Returns a $\mathbb{Z}$-function 
DeclareAttribute( "Reflection", IsZFunction );

#! @Description
#! The argument is a $\mathbb{Z}$-function <A>z_func</A> and an integer <A>n</A>. The output is
#! another $\mathbb{Z}$-function <C>m</C> such that <C>m[i]</C> is equal to <A>z_func</A><C>[n+i]</C>.
#! @Arguments z_func, n
#! @Returns a $\mathbb{Z}$-function
KeyDependentOperation( "ApplyShift", IsZFunction, IsInt, ReturnTrue );


#! @Description
#! The arguments are a $\mathbb{Z}$-function <A>z_func</A> and a function <A>F</A>.
#! The output is another $\mathbb{Z}$-function <C>m</C> such that
#! <C>m[i]</C> is equal to <A>F</A>(<A>z_func</A>[<C>i</C>]).
#! @Arguments z_func, F
#! @Returns a $\mathbb{Z}$-function
DeclareOperation( "ApplyMap", [ IsZFunction, IsFunction ] );

#! @Description
#! The arguments are a list $\mathbb{Z}$-functions
#! <A>L=[z_func_1,...,z_func_n]</A> and a function <A>F</A> with 
#! <C>Size(L)</C> arguments.
#! The output is another $\mathbb{Z}$-function <C>m</C> such that
#! <C>m[i]</C> is equal to <A>F</A>(<A>z_func_1</A><C>[i]</C>,...,
#! <A>z_func_n</A><C>[i]</C>). We call the list <A>L</A> the <C>BaseZFunctions</C>
#! of <C>m</C> and 
#! @Arguments L, F
#! @Returns a $\mathbb{Z}$-function
DeclareOperation( "ApplyMap", [ IsDenseList, IsFunction ] );

#! @Description
#! The argument is a $\mathbb{Z}$-function <A>z_func</A> that has been defined by applying a map <C>F</C>
#! on a list <C>L</C> of $\mathbb{Z}$-functions. The output is the list <C>L</C>.
#! @Arguments z_func
#! @Returns a list of $\mathbb{Z}$-functions
DeclareAttribute( "BaseZFunctions", IsZFunction );

#! @Description
#! The argument is a $\mathbb{Z}$-function <A>z_func</A> that has been defined by applying a map <C>F</C>
#! on a list <C>L</C> of $\mathbb{Z}$-functions. The output is the function <C>L</C>.
#! @Arguments z_func
#! @Returns a function
DeclareAttribute( "AppliedMap", IsZFunction );

#! @Description
#! The argument is a dense list <A>L</A> of $\mathbb{Z}$-functions.
#! The output is another $\mathbb{Z}$-function <C>m</C> such that
#! <C>m[i]</C> is equal to [ <A>L[1]</A><C>[i]</C>,...,
#! <A>L[Size(L)]</A><C>[i]</C>] for all <C>i</C> in $\mathbb{Z}$.
#! @Arguments L
#! @Returns ?
DeclareOperation( "CombineZFunctions", [ IsDenseList ] );

########################################

if IsPackageMarkedForLoading( "InfiniteLists", ">= 2017.08.01" ) then
  
  DeclareAttribute( "AsZFunction", IsZList );
  
  InstallMethod( AsZFunction, [ IsZList ], z -> AsZFunction( i -> z[ i ] ) );
  
  DeclareAttribute( "AsZList", IsZFunction );
  
  InstallMethod( AsZList, [ IsZFunction ], z -> MapLazy( IntegersList, i -> z[ i ], 1 ) );
  
fi;
