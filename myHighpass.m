function [fft0, fft1] = myHighpass (image)
             RGB = imread(image);
            grayImg = rgb2gray(RGB);
            
            J=imnoise(grayImg,'gaussian',0,0.005); %noise
            FFT=fft2(J); %shift
            IFFT_0=uint8(ifft2(FFT));
            
            fft0 = IFFT_0;
            
            [a,b]=size(FFT);
            a0=round(a/2);
            b0=round(b/2);
            X=1:1:a;
            Y=1:1:b;

            h=zeros(a,b);
          
            n1=10;
            disnoise_1=fftshift(FFT);
                for i=1:a
                     for j=1:b
                        distance=sqrt((i-a0)^2+(j-b0)^2);
                            if distance <= n1
                                 h(i,j) = 0; 
                            else
                                 h(i,j)=1;
                            end;
                              disnoise_1(i,j)=h(i,j)*disnoise_1(i,j);
                       end;
                end;
            fft1=uint8((ifft2(ifftshift(disnoise_1))));
end