clear all; close all; clc;


% ask users how many images they want
prompt = 'How many images?';
images = input(prompt)

for i = 1:images;

    % make the figure full screen
    FigH = figure('Position', get(0, 'Screensize'),'visible','off'); %remove 'visible','off'if you would like to display the figure
    
    % generate curves
    
    % curve
    curve_points = 40;
    x = linspace(0,1,curve_points); 
    y = x.^(1/2.5);
    %y = (x - 0.5).^2 + 0.3;
    
    % line
    %curve_points = 20;
    %x = linspace(0.1,0.5,curve_points); 
    %y = x;
    %x=linspace(0.6,1,curve_points); 
    %y = -x + 1.3;
    
    plot(x, y,'.w','LineWidth', 3,'MarkerSize', 20);  %plot fitted y
    hold on 
    
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