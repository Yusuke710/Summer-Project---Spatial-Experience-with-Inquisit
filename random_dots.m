clear all; close all; clc;

% ask users how many images they want
prompt = 'How many trials?';
trials = input(prompt)

for i = 1:trials;

    % ask user the number of dots on screen
    prompt = 'How many dots? ';
    numPoints = input(prompt)

    % make the figure full screen
    FigH = figure('Position', get(0, 'Screensize'), 'visible','off'); %remove 'visible','off'if you would like to display the figure
    % generate dots
    x = rand(1, numPoints);
    y = rand(1, numPoints);
    plot(x, y, 'k.');
    
    % remove axis in plot
    set(gca,'XColor','none','YColor','none','TickDir','out') 

    % save images
        % name of the file
        word1 = 'plot_test';
        word2 = num2str(i);
        word3 = '.jpg';
        str = strcat(word1, word2, word3);
        % specify the directory to save images
        imagepath = '/home/yusuke/Desktop/Neural Basis of Consciousness/images';
        baseFileName = sprintf(str);
        fullFileName = fullfile(imagepath, baseFileName);  
    F = getframe(FigH);
    imwrite(F.cdata,  fullFileName)
    
end;