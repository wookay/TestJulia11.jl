module test_julia_runtime_internals

using Test
using Jive

parentmodule
Base.moduleroot
@__MODULE__
fullname
@If VERSION >= v"1.12.0-DEV.1405" begin
    Base.moduleloc
end
names
Base.isexported
Base.ispublic
Base.binding_module
@If VERSION >= v"1.12.0-DEV.1445" begin
    Base.delete_binding
end
fieldname
fieldnames
hasfield
nameof
parentmodule
isconst
Base.isfieldatomic
Base.@locals
Base.datatype_alignment
Base.datatype_haspadding
@If VERSION >= v"1.12.0-DEV.1405" begin
    Base.datatype_isbitsegal
end
Base.datatype_nfields
Base.datatype_npointers
Base.datatype_pointerfree
Base.datatype_fielddesc_type
Base.datatype_arrayelem
ismutable
ismutabletype
isstructtype
isprimitivetype
isbitstype
isbits
objectid
isdispatchtuple
Base.ismutationfree
Base.isidentityfree
isconcretetype
isabstracttype
Base.issingletontype
typeintersect
fieldoffset
fieldtype
Base.fieldindex
fieldcount
fieldtypes
instances
Base.has_bottom_parameter
Base.get_world_counter
Base.tls_world_age
propertynames
hasproperty
Base.delete_method
methods
Base.generating_output
Base.may_invoke_generator
Base.specializations

end # module test_julia_runtime_internals
