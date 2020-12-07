workingDir = "/home/javier/Documentos/amaia-abide/";
load(strcat(workingDir, "data/cors_combat_both.mat"));
% subset 
CC_combat = CC_combat(1011:end,:,:);
dist_type = 'pearson';
kind = 2:1:20;
nshuff=1000;
gamma=1;
seed=0;

res_cluster_pearson = cluster_consensus(CC_combat, 'pearson', kind, nshuff, gamma, seed);
res_cluster_spearman = cluster_consensus(CC_combat, 'spearman', kind, nshuff, gamma, seed);
res_cluster_euclidean = cluster_consensus(CC_combat, 'euclidean', kind, nshuff, gamma, seed);
res_cluster_cosine = cluster_consensus(CC_combat, 'cosine', kind, nshuff, gamma, seed);

save('../data/results_clustering_both.mat',...
    'res_cluster_pearson',...
    'res_cluster_spearman',...
    'res_cluster_euclidean',...
    'res_cluster_cosine')
