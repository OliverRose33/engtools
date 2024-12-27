function import()

fprintf("Importing engtools library...\n")

importList = ["geometry.shapes.*"];
importCount = length(importList);

for i = 1:importCount
    fprintf("Importing engtools.%s... (%i/%i)\n", importList(i), i, importCount)
    import("engtools." + importList(i))
end

fprintf("Finished importing engtools library.\n")