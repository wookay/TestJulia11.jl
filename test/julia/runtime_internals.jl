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
@If VERSION >= v"1.11" begin
    Base.ispublic
end
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
@If VERSION >= v"1.12.0-DEV.1405" begin
    Base.isfieldatomic
end
Base.@locals
Base.datatype_alignment
Base.datatype_haspadding
@If VERSION >= v"1.12.0-DEV.1405" begin
    Base.datatype_isbitsegal
end
Base.datatype_nfields
@If VERSION >= v"1.12.0-DEV.1405" begin
    Base.datatype_npointers
end
Base.datatype_pointerfree
Base.datatype_fielddesc_type
@If VERSION >= v"1.12.0-DEV.1405" begin
    Base.datatype_arrayelem
end
ismutable
@If  VERSION >= v"1.7" begin
    ismutabletype
end
isstructtype
isprimitivetype
isbitstype
isbits
objectid
isdispatchtuple
@If VERSION >= v"1.12.0-DEV.1405" begin
    Base.ismutationfree
    Base.isidentityfree
end
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
@If VERSION >= v"1.12.0-DEV.1405" begin
    Base.tls_world_age
end
propertynames
hasproperty
Base.delete_method
methods
@If VERSION >= v"1.11" begin
    Base.generating_output
end
Base.may_invoke_generator
@If VERSION >= v"1.13.0-DEV.9" begin
    Base.specializations
end

end # module test_julia_runtime_internals
