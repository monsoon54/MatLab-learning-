clc,clear,close all
%求邻接矩阵a中1到6的最短路径，即为五年内的费用最小的计划
a=zeros(6);
a(1,[2:6])=[15 20 27 37 54];
a(2,[3:6])=[15 20 27 37];
a(3,[4:6])=[16 21 28];
a(4,[5:6])=[16 21];
a(5,6)=[17];
s=cellstr(strcat('v',int2str([1:6]')));
G=digraph(a,s);
p=plot(G);
[path,disth]=shortestpath(G,1,6,'method','positive')
highlight(p,path,'edgecolor','r','linewidth',2)