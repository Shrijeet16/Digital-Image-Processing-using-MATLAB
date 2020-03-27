
I1 = imread('https://d396qusza40orc.cloudfront.net/digital%2Fimages%2Fweek4_quizzes%2Fframe_1.jpg');
I2 = imread('https://d396qusza40orc.cloudfront.net/digital%2Fimages%2Fweek4_quizzes%2Fframe_2.jpg');

I1 = double(I1);    %previous frame
I2 = double(I2);    %current frame

Btarget = I2(65:96 , 81:112);
min = 255*32*32; %max arbitary number available
for i=1:288-31
    for j=1:352-31
    %disp([i j]);
    block = I1(i:i+31, j:j+31);
    mae = sum(sum(abs(Btarget-block)));
    mae = mae/(32*32) ;
        if mae <=min
            min = mae;
            x = [i j];
        end
    end
end
% figure(1)
% imshow(uint8(Btarget));
% figure(2)
% imshow(I2);
