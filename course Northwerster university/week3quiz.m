I = imread('https://d396qusza40orc.cloudfront.net/digital%2Fimages%2Fweek3_quizzes%2Foriginal_quiz.jpg');
O = double(I);

lpf = (1/9)*[[1 1 1] ; [1 1 1] ; [1 1 1]];

O = imfilter(O , lpf , 'replicate');
O = uint8(O);
O = O(1:2:359 ,1:2:479);

Oprime = zeros(359,479);

for i=1:359
    for j=1:479
        if mod(i,2)== 1 && mod(j,2)==1
        Oprime(i,j) = O((i+1)/2 , (j+1)/2);
        end
    end    
end
filter = [0.25 0.5 0.25; 0.5 1 0.5 ; 0.25 0.5 0.25];
Oprime = imfilter(Oprime , filter);
Oprime = uint8(Oprime);

MSE = sum(sum((Oprime - (I)).^2))/(size(I,1)*size(I,2))

PSNR = 10*log10(255*255 / MSE)


imshow(Oprime);
