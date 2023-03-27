clc,clear,close all
a=zeros(6);
a(1,[2 5])=[20 15];
a(2,[3 5])=[20 25];
a(3,[4 5])=[30 18];
a(5,6)=[15];
s=cellstr(strcat('v',int2str([1:6]')));
G=graph(a,s,'upper');
d=distances(G);%d为各顶点间的最小值
p=plot(G,'EdgeLabel',G.Edges.Weight,'Layout','force');
dmax=max(d,[],2)%M = max(A,[],dim) 返回维度 dim 上的最大元素。例如，如果 A 为矩阵，则 max(A,[],2) 是包含每一行的最大值的列向量。
[dmin,index]=min(dmax)%[M,I] = min(___) 在上述语法基础上返回 A 中最小值在运算维度上的索引。也即求最小值及对应的地址
%k = find(X) 返回一个包含数组 X 中每个非零元素的线性索引的向量。
k=find(d(index,:)==dmax)%min已返回索引为3，即第三行，然后查找第三行中dmin对应的地址。也即求取值为dmin的地址
highlight(p,k(1,1),'nodecolor','r','Markersize',8)