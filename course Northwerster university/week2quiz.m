I = imread('https://d396qusza40orc.cloudfront.net/digital%2Fimages%2Fweek2_quizzes%2Flena.gif');
I = double(I);

lpf = (1/9)*[[1 1 1] ; [1 1 1] ; [1 1 1]];

O = imfilter(I , lpf , 'replicate');

MSE = sum(sum((O - I).^2))/(256^2)

PSNR = 10*log10(255*255 / MSE)
