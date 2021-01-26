clear all; close all; clc;

% ask users how many images they want
prompt = 'How many trials?';
trials = input(prompt)

for i = 1:trials;

% ask user the number of dots on screen
prompt = 'How many dots? ';
numPoints = input(prompt)

% generate dots
hFig = figure;
x = rand(1, numPoints);
y = rand(1, numPoints);
plot(x, y, 'k.');

% remove axis in plot?
color = get(hFig,'Color');
set(gca,'XColor',color,'YColor',color,'TickDir','out') % image does not have right number of dots
% save image
word1 = 'plot_test';
word2 = num2str(i);
word3 = '.jpg';
str = strcat(word1, word2, word3);
saveas(gca,fullfile('/home/yusuke/Desktop/Neural Basis of Consciousness/images',str) ,'jpeg')

end;