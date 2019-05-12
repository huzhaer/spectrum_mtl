function signal = generator(type, time, samplerate, freq, ampt, noise, noisecons)
rate = 1/samplerate;
npts = length(time);
signal = zeros(1,npts);


switch(type)
    case 'Sine'
       for i = 1: length(freq)
         if (noise)
             AM = ampt(i)* interp1(1:noisecons,randn(noisecons,1),linspace(1,noisecons,npts),'pchip');
        else
             AM = ampt(i);
        end
            signal = signal + AM .* sin(2 * pi * freq(i) * time);
        end
    case 'Square'
        for i = 1: length(freq)
            AM = ampt(i);
            
            if noise
                calc = square(2*pi*freq(i)*time,AM)+randn(size(time))*(noisecons/30)/10;              
            else
                calc = square(2*pi*freq(i)*time,AM);
            end
            
            signal = signal + calc;
        end 
     case 'Triangle'
         for i = 1: length(freq)
       
            if (noise)
             AM = ampt(i)* interp1(1:noisecons,randn(noisecons,1),linspace(1,noisecons,npts),'pchip');
            else
             AM = ampt(i);
            end 
            
            signal = signal + sawtooth(2 * pi * freq(i) * time, 1/2).*AM;
         end 
    case 'Saw'
        for i = 1: length(freq)
       
            if (noise)
             AM = ampt(i)* interp1(1:noisecons,randn(noisecons,1),linspace(1,noisecons,npts),'pchip');
            else
             AM = ampt(i);
            end 
            
            signal = signal + sawtooth(2 * pi * freq(i) * time).*AM;
         end 
    otherwise
       warning('Unexpected plot type. No plot created.')
end



  
end