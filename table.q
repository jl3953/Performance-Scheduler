\d .conversion

lowerDatatypes: "bxhijefcspmdznuvt";
upperDatatypes: upper lowerDatatypes;
allDatatypes: lowerDatatypes,upperDatatypes,"*";
casts: ("B"$;"X"$;"H"$;"I"$;"J"$;"E"$;"F"$;"C"$;"S"$;"P"$;"M"$;"D"$;"Z"$;"N"$;"U"$;"V"$;"T"$);
symbolDatatypes:`boolean`byte`short`int`long`real`float`char`symbol`timestamp`month`date`datetime`timespan`minute`second`time;
stringSchema: "`",/:(string each symbolDatatypes),\:"$()";
allCasts: casts, casts, enlist("*"$);
mapCast: allDatatypes!allCasts;
schemaCasts: (`$ 'allDatatypes)!stringSchema,stringSchema,enlist("`$()");

\d .

metatable: 1!("SS";enlist",") 0: hsym `$"./schema.csv";
emptyLists: .conversion.schemaCasts@(value metatable) `DATATYPE;
columns: upper each string each (key metatable) `COLUMN;
schemaList: (columns,\:": "),'emptyLists;
schemaList: -2_raze schemaList,\:"; ";

table: eval parse "schema: ([] ",schemaList,")";






