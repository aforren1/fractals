names = dir(fullfile('out/*.png'));

for ii = 1:length(names)
    img{ii} = imread(['out/', names(ii).name]);
end

% pairwise comparisons
combos = nchoosek(1:length(names), 2);

for ii = 1:size(combos, 1)
    combos(ii, 3) = ssim(img{combos(ii, 1)}, img{combos(ii, 2)});
    disp(combos(ii,3));
end