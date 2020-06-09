anno_files = './Annotations_Part/%s.mat';
% anno_seg = './Annotations_Part/%s.mat';
% imgs_path = './examples';
% imgs = dir('./examples/*.jpg');
imgs_path = './JPEGImages';
imgs = dir('./Annotations_Part/*.mat');
out_path = 'labels';
disp(length(imgs))
cmap = VOClabelcolormap();
pimap = part2ind();     % part index mapping

for ii = 1:numel(imgs)
    imname = imgs(ii).name(1:end-4);
    disp(imname)
    img = imread([imgs_path, '/', imname,'.jpg']);
    % load annotation -- anno
    load(sprintf(anno_files, imname));
    [cls_mask, inst_mask, part_mask, human_img] = mat2map(anno, img, pimap);
    
    
%    
    % display annotation
%     subplot(2,2,1); imshow(img); title('Image');
%     subplot(2,2,2); imshow(cls_mask, cmap); title('Class Mask');
    
    if human_img == 1
        subplot(2,2,3); imshow(part_mask, cmap); title('Part Mask');
        pause;
        
%         imwrite(part_mask, fullfile(out_path, [imname, '.png']));
%         fprintf('write image %d\n', imname)

    end
end
