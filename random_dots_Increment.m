clear all; close all; clc;

% ask users how many images they want
prompt = 'How many base images?';
images = input(prompt);

for i = 1:images;

    % ask user the number of dots on screen
    prompt = 'How many dots? ';
    numPoints = input(prompt)
    sum = numPoints;
    
    % make the figure full screen
    FigH = figure('Position', get(0, 'Screensize'),'visible','off'); %remove 'visible','off'if you would like to display the figure
    
    % generate dots
    x = rand(1, numPoints);
    y = rand(1, numPoints);
    sz =25; %MarkerSize
    % plot white dots
    plot(x, y, 'w.','MarkerSize',sz);
    pbaspect([1 1 1]) % control the ratio of the axis, it is square here
    
    % ask users how many images they want
    prompt = 'How many increments?';
    increments = input(prompt)
    for i = 1:increments;
        % plot additional dots
        hold on 
        prompt = 'How many more dots? ';
        add = input(prompt);
        x = rand(1, add);
        y = rand(1, add);
        plot(x, y, 'w.','MarkerSize',sz);
        sum = sum + add;

        % make plot background black
        set(gca,'Color','k')
        % remove axis in plot
        set(gca,'XColor','none','YColor','none','TickDir','out') 
        % make background black
        set(gcf,'color','k')

        % save images
            % name of the file
            word1 = num2str(sum);
            word2 = 'RandomDotsRamp';
            word3 = '.jpg';
            str = strcat(word1, word2, word3);
            % specify the directory to save images
            imagepath = '/home/yusuke/Desktop/Neural Basis of Consciousness/Yusuke-Summer-Project---Spatial-Experience'; % <path to store image>
            baseFileName = sprintf(str);
            fullFileName = fullfile(imagepath, baseFileName);  
        F = getframe(FigH);
        imwrite(F.cdata,  fullFileName)
    end;
end;