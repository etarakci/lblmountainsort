function stats = lenmax(names)
    stats = containers.Map(names);
    for name = names
        load(stringcat(name, '.mat'),output);
        stats(name) = [size(output),max(output)];
        clear output
    end
end
        