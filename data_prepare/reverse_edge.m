clear;
clc;
% imglist = dir('./labels/*.png');
% disp(length(imglist))
% disp('haha')
% fout = fopen('train_id.txt', 'wt');
% for i = 1: numel(imglist);
%     imname = imglist(i).name(1:end-4);
%     fprintf(fout,'%s\n', imname);
% end
% fclose(fout);

%
datadir = './labels/';
outputdir = './labels_rev/';
imglist = 'train_id.txt';
list = textread(imglist, '%s');
for i = 1:length(list);
    fprintf('img: %d\n', i);
    img_n = [datadir,list{i},'.png'];
    im = imread(img_n);
    [row, col] = size(im);
    rev_im = fliplr(im);
    for h = 1:row
        for w = 1:col
            if rev_im(h,w) == 4
                rev_im(h,w) = 5;
            elseif rev_im(h,w) == 5
                rev_im(h,w) = 4;
            elseif rev_im(h,w) == 6
                rev_im(h,w) = 7;
            elseif rev_im(h,w) == 7
                rev_im(h,w) = 6;
            end
        end
    end
    
    imwrite(rev_im, [outputdir,list{i},'.png']);
end