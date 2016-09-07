names = dir(fullfile('out/*.png'));

for ii = 1:length(names)
    img{ii} = imread(['out/', names(ii).name]);
end

% pairwise comparisons
combos = nchoosek(1:length(names), 2);
ssims2 = zeros(1,size(combos, 1));
parfor ii = 1:size(combos, 1)
    combo_row = combos(ii,:);
    %ssims(ii) = ssim(img{combo_row(1)}, img{combo_row(2)});
    ssims2(ii) = sum(sum(sum(img{combo_row(1)} - img{combo_row(2)})));
    disp([ii, ssims2(ii)]);
end