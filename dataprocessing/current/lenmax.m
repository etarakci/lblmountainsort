function lenmax(names)
    %length = zeros(size(names));
    %max_num = zeros(size(names));
    %i = 1;
    for name = names
        load(strcat(name, '.mat'));
        len = num2str(size(output));
        max_num = num2str(max(output));
        fprintf(strcat('\n',name,": len = ",len, ", max = ",max_num));
        clear output
        %i = i + 1;
    end
end
        