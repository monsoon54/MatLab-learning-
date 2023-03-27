clc,clear,close all
a=zeros(11);
a(1,2)=2;a(1,3)=8;a(1,4)=1;
a(2,3)=6;a(2,5)=1;
a(3,4)=7;a(3,5)=5;a(3,6)=1;a(3,7)=2;
a(4,7)=9;
a(5,6)=3;a(5,8)=2;a(5,9)=9;
a(6,7)=4;a(6,9)=6;
a(7,9)=3;a(7,10)=1;
a(8,9)=7;a(8,11)=9;
a(9,10)=1;a(9,11)=2;
a(10,11)=4;
%无向图，使用graph
G = graph(a,'upper') ;%使用邻接矩阵a中的上三角构造图
[path,dist] = shortestpath(G,1,11,'Method','positive') %从节点1出发到节点11，positive为dijkstra算法
p=plot(G,'EdgeLabel', G.Edges.Weight);
highlight(p,path,'Edgecolor','r','linewidth',2)%最短路径上的边，以边索引向量形式返回。对于多重图，此输出指示两个节点之间的哪条边位于该路径上。