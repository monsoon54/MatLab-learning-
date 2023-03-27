clc
clear 
close all
W=[0 0 10 60;
    0 0 5 20;
    10 5 0 1;
    60 20 1 0];%赋权图邻接矩阵
W(W==0)=inf;%见矩阵中的0元素更换为无穷大
W=triu(W);%U = triu(A) 返回矩阵 A 的上三角部分。tril求下三角
n=length(W);%确定迭代次数
for i=1:n
    W(i,i)=0;
end
W=W+W';
%a(1:n+1:end) = 0;矩阵对角线置为0的另一种方法
for i=1:n
    for j=1:n
        for k=1:n
            if W(i,j) > W(i,k)+W(k,j)
                W(i,j) = W(i,k)+W(k,j);
            end
        end
    end
end
W

%%dijkstra算法实现
G = graph(W,'upper') ;%使用邻接矩阵W中的上三角构造图
dist = distances(G,'Method','positive') %所有节点对组的最短路径距离，positive为dijkstra算法
