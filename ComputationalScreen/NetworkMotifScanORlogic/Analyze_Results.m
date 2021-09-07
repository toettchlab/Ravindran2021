close all
load('ScreenDataOR.mat');
%%
for i = 1:length(Screen)
    P = extractfield(Screen(i).results, 'PulseVOFF');
    RobustOFF(i) = sum(P > 1) / length(P);
	P = extractfield(Screen(i).results, 'PulseVON');
    RobustON(i) = sum(P > 1) / length(P);
    C(i,:) = [rand(1) rand(1) rand(1)];
end

figure (2)
scatter(RobustOFF,RobustON,200,C,'filled')
ylabel('RobustON (frac Pulse greater than ON)')
xlabel('RobustOFF (frac Pulse greater than OFF)')

for i = 1:length(Screen)
    names = num2str(i);
    text(RobustOFF(i),RobustON(i), names)
end

%% more quanitative graph
screen_index = [1 2 3 4 5 6 7 8];

C = [[226,26,28],
    [55,126,184],
    [77,175,74],
    [152,78,163],
    [255,127,0],
    [255,255,51],
    [247,129,191],
    [166,86,40]];

C= C/260;

close all
figure (2)
hold on
for i = 1:length(Screen)
    ON = extractfield(Screen(screen_index(i)).results,'PulseVON');
    OFF = extractfield(Screen(screen_index(i)).results,'PulseVOFF');
    
    Color = C(screen_index(i),:);

    scatter(ON,OFF,15,Color,'filled')
    set(gca,'XScale','log')
    set(gca,'YScale','log')
end

hold off
%legend({'Circuit1','Circuit2','Circuit3','Circuit4','Circuit5','Circuit6','Circuit7','Circuit8'},'Location','northwest')



