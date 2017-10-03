% am132
% Akash Mitra

%In this directory, you will find some example data, which is a 300x8
%array stored in a .mat file. Image these are measurements for 300 genes are 8 different time
%points

%1. Use matlab to perform pca on this data, getting the transformation
%matrix, the transformed data, and the eigenvalues.

load('example_dat.mat');
[coeff, sc, eig] = pca(dat);
% coeff = transformation matrix
% sc = transformed data
% eig = eigen values

%2. Look at the eigenvalues - how many dimensions are necessary to explain
%the data? 

length(eig)
% 8 Dimensions

%3. Using kmeans clustering to cluster the data into 3 clusters. 
% Make a plot of the first coordinate of the raw data vs the second color coded
% by which cluster it is in. Make the same plot but use the first two
% principle components instead. 

ids = kmeans(dat, 3);

% k means version using only first two columns and assigning all 3 clusters

figure;
plot(dat(ids==1,1), dat(ids==1,2), 'r.','MarkerSize',12);
hold on;
plot(dat(ids==2,1), dat(ids==2,2), 'b.','MarkerSize',12);
hold on;
plot(dat(ids==3,1), dat(ids==3,2) , 'g.','MarkerSize',12);
legend('Cluster 1','Cluster 2', 'Cluster 3', 'Location','NW');
title 'Cluster Assignments';
hold off;

% PCA Version of first two Principal Components

colors = {'r','b'};
figure;
hold on;
plot(sc(:, 1),sc(:, 2), 'r.','MarkerSize',12);
hold on;
plot(sc(1 ,:), sc( 2,:) ,'b.','MarkerSize',12);
legend('PCA 1','PCA 2','Location','NW');
title 'PCA Assignments';
hold off;


%4. Repeat part 3 but use 7 clusters. Which is a more appropriate number of
%clusters for the data?

ids_new = kmeans(dat, 7);

figure;
plot(dat(ids_new==1,1), dat(ids_new==1,2), 'r.','MarkerSize',12);
hold on;
plot(dat(ids_new==2,1), dat(ids_new==2,2), 'b.','MarkerSize',12);
hold on;
plot(dat(ids_new==3,1), dat(ids_new==3,2) , 'g.','MarkerSize',12);
hold on;
plot(dat(ids_new==4,1), dat(ids_new==4,2), 'c.','MarkerSize',12);
hold on;
plot(dat(ids_new==5,1), dat(ids_new==5,2), 'm.','MarkerSize',12);
hold on;
plot(dat(ids_new==6,1), dat(ids_new==6,2) , 'k.','MarkerSize',12);
hold on;
plot(dat(ids_new==7,1), dat(ids_new==7,2) , 'y.','MarkerSize',12);
legend('Cluster 1','Cluster 2', 'Cluster 3', 'Cluster 4' , 'Cluster 5' , 'Cluster 6' , ' Cluster 7' , 'Location','NW');
title 'Cluster Assignments';
hold off;

% Excessive cluster assignments. The Kmeans of 3 was better than a kmeans
% of 7. An ideal number of clusters can be ascertained from the eigen
% values and how the 1st two prinicipal components clustered. A more
% appropriate number of clusters would be 2.