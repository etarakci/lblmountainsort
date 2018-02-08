function ms_compress_graph(names,transformed,data)
    addpath('/Users/erendiztarakci/documents/MountainLab/LBL/');
%     [names, transformed] = ms_nested_compress(data);
%     i = 1;
    diff = cell(length(transformed));
%     tallUnqOg = tall(unique(data,'stable').');
%     while i <= length(names)
%         diff{i} = tall(unique(data-double(transformed{i}),'stable').');
%     end
    diff{1} = tall(unique(data-double(transformed{1}),'stable').'); %f = 32 b = 16 c = 0
    diff{2} = tall(unique(data-double(transformed{2}),'stable').'); %f = 32 b = 14 c = 0
    diff{3} = tall(unique(data-double(transformed{3}),'stable').'); %f = 30 b = 16 c = 0
    diff{4} = tall(unique(data-double(transformed{4}),'stable').'); %f = 30 b = 14 c = 0
    diff{5} = tall(unique(data-double(transformed{5}),'stable').'); %f = 32 b = 16 c = .1
    diff{6} = tall(unique(data-double(transformed{6}),'stable').'); %f = 32 b = 14 c = .1
    diff{7} = tall(unique(data-double(transformed{7}),'stable').'); %f = 30 b = 16 c = .1
    diff{8} = tall(unique(data-double(transformed{8}),'stable').'); %f = 30 b = 14 c = .1
%     tallUnqDiff9 = tall(unique(data-transformed{1},'stable').');
%     tallUnqDiff10 = tall(unique(data-transformed{1},'stable').');
    sz = 4;
    figure
    hold on
    scatter(tallUnqOg,diff{1},sz, 'MarkerFaceColor',[.88 .88 .88], 'MarkerEdgeColor',[.88 .88 .88])
    scatter(tallUnqOg,diff{2},sz, 'MarkerFaceColor',[.78 .78 .78], 'MarkerEdgeColor',[.78 .78 .78])
    scatter(tallUnqOg,diff{3},sz, 'MarkerFaceColor',[.68 .68 .68], 'MarkerEdgeColor',[.68 .68 .68])
%   scatter(tallUnqOg,tallUnqDiff4,sz, 'MarkerFaceColor',[.58 .58 .58], 'MarkerEdgeColor',[.58 .58 .58])
    scatter(tallUnqOg,diff{4},sz, 'MarkerFaceColor',[.49 .49 .49], 'MarkerEdgeColor',[.49 .49 .49])
    scatter(tallUnqOg,diff{5},sz, 'MarkerFaceColor',[.39 .39 .39], 'MarkerEdgeColor',[.39 .39 .39])
    scatter(tallUnqOg,diff{6},sz, 'MarkerFaceColor',[.29 .29 .29], 'MarkerEdgeColor',[.29 .29 .29])
%   scatter(tallUnqOg,tallUnqDiff8,sz, 'MarkerFaceColor',[.19 .19 .19], 'MarkerEdgeColor',[.19 .19 .19])
    scatter(tallUnqOg,diff{7},sz, 'MarkerFaceColor',[.09 .09 .09], 'MarkerEdgeColor',[.09 .09 .09])
    scatter(tallUnqOg,diff{8},sz, 'MarkerFaceColor',[0 0 0], 'MarkerEdgeColor',[0 0 0])

    title('Graph of Signal Linearity: input-(sign(input)).*c.*input.^2')
    xlabel('Raw Signal Values (Unique)')
    ylabel('Difference Between Raw Signal & Compressed Signal')
    legend(names{1}, names{2},names{3},names{4},names{5},names{6},names{7},names{8},'Location','northwest')
    hold off
end

