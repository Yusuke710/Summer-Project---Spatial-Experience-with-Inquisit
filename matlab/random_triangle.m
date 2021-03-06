clear all; close all; clc;


% ask users how many images they want
prompt = 'How many images?';
images = input(prompt)

for i = 1:images;

    % make the figure full screen
    FigH = figure('Position', get(0, 'Screensize'),'visible','off'); %remove 'visible','off'if you would like to display the figure
    
   % generate triangle 
    L = 0.2;
    x1= 0.2; %defines coordinates
    y1= x1;
    x2= x1 + L/2;
    y2= x1 + sqrt(3)*L/2;
    x3= x1 + L;
    y3= x1;
    
    tri = [x1 x2 x3 x1; y1 y2 y3 y1]; %// first vertex is repeated to "close" the plot
    plot(tri(1,:), tri(2,:), 'w', 'linewidth', 3)
    hold on
    %plot(tri(1,:), tri(2,:),'.w','MarkerSize', 25)
    
    
    % ask user the number of dots on screen
    prompt = 'How many dots? ';
    numPoints = input(prompt)

    
    
    % generate dots
    x = rand(1, numPoints);
    y = rand(1, numPoints);
    sz =25; %MarkerSize
    % plot white dots
    plot(x, y, 'w.','MarkerSize',sz);
    pbaspect([1 1 1]) % control the ratio of the axis, it is square here
    
    % make plot background black
    set(gca,'Color','k')
    % remove axis in plot
    set(gca,'XColor','none','YColor','none','TickDir','out') 
    % make background black
    set(gcf,'color','k')

    % save images
        % name of the file
        word1 = num2str(numPoints);
        word2 = 'RandomDots+Line';
        word3 = '.jpg';
        str = strcat(word1, word2, word3);
        % specify the directory to save images
        imagepath = '/home/yusuke/Desktop/Neural Basis of Consciousness/Yusuke-Summer-Project---Spatial-Experience'; % <path to store image>
        baseFileName = sprintf(str);
        fullFileName = fullfile(imagepath, baseFileName);  
    F = getframe(FigH);
    imwrite(F.cdata,  fullFileName)
    
end;