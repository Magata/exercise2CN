clear all
close all

nModules = 8; % number of modules
nExcitNeurons = 100; % number of excitatory neurons of each module
nExcitEdges = 1000; % number of excitatory-excitatory edges within each module
nInhibNeurons = 200; % number of inhibitory neurons

simTime=60000; % in milliseconds
nTrials=20; % number of trials
discardYN = 1; % choose 1 to discard 1st second of data and 0 not to

% run with probability zero
[neuralComplexityNod] = runSimulation(nModules,nExcitNeurons,nExcitEdges,nInhibNeurons,0,simTime,discardYN);

for i=1:nTrials
     % choose random rewiring probability p between 0.1 and 0.5
     p(i) = rand;
     while p(i)>0.5 || p(i)<0.1
         p(i) = rand;
     end
     
     [neuralComplexity(i)] = runSimulation(nModules,nExcitNeurons,nExcitEdges,nInhibNeurons,p(i),simTime,discardYN);
 end
 
 save('Run.mat')