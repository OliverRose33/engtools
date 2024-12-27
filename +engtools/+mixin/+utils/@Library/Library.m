classdef (Abstract) Library

    methods (Static)

        function libraryName = libraryName(library)
            libraryName = string(class(library));
        end

        function libraryType = libraryType(library)
            members = library.listMembers(library);
            libraryType = string(class(library.(members(1))));
        end

        function members = listMembers(library)
            members = string(properties(library));
        end

        function arr = array(library)
            members = library.listMembers(library);
            for i = 1:length(members)
                arr(i) = library.(members(i));
            end
        end

        function count = memberCount(library)
            count = length(library.listMembers(library));
        end

        function member = fromString(library, memberName)
            cleanMemberName = memberName.erase(whitespacePattern);
            assert(ismember(cleanMemberName, library.listMembers(library)), ...
                "engtools:mixin:utils:Library:MemberNotFound", ...
                "'%s' is not a member of '%s'", ...
                memberName, library.libraryName(library))
            member = library.(cleanMemberName);
        end

        function memberIndex = memberIndex(library, member)
            % memberIndex = zeros(library.memberCount(library), 1);
            members = library.listMembers(library);
            memberIndex = zeros(size(members));
            for i = members
                disp(i)
                memberIndex(i) = (i == member);
            end
        end

    end

end