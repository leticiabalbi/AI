%-------------Supondo cesto no canto2-----------------
%Vai da porta para o meio da sala
muda(estado(porta,canto2,chao(meioSala)), vaPara(porta,meioSala), estado(meioSala,canto2,chao(meioSala))).
%Junta o lixo do chão
muda(estado(meioSala,canto2,chao(meioSala)),junte,estado(meioSala,canto2,naMao)).
%Vai do meio da sala para o canto2
muda(estado(meioSala,canto2,naMao),vaPara(meioSala,canto2),estado(canto2,canto2,naMao)).
%Joga o lixo no cesto
muda(estado(canto2,canto2,naMao),jogue,estado(canto2,canto2,noCesto)).

%-------------Supondo cesto no canto1-----------------
%Vai da porta para o meio da sala
muda(estado(porta,canto1,chao(meioSala)),vaPara(porta,meioSala),estado(meioSala,canto1,chao(meioSala))).
%Junta o lixo do chão
muda(estado(meioSala,canto1,chao(meioSala)),junte,estado(meioSala,canto1,naMao)).
%Vai do meio da sala para o canto1
muda(estado(meioSala,canto1,naMao),vaPara(meioSala,canto1),estado(canto1,canto1,naMao)).
%Joga o lixo no cesto
muda(estado(canto1,canto1,naMao),jogue,estado(canto1,canto1,noCesto)).
%Pega o cesto
muda(estado(canto1,canto1,noCesto),pegueCesto,estado(canto1,naMao,noCesto)).
%Desvia do obstáculo indo de canto1 para o meio da sala 
muda(estado(canto1,naMao,noCesto),vaPara(canto1,meioSala),estado(meioSala,naMao,noCesto)).
%Vai do meio da sala para o canto2
muda(estado(meioSala,naMao,noCesto),vaPara(meioSala,canto2),estado(canto2,naMao,noCesto)).
%Coloca o cesto no canto2
muda(estado(canto2,naMao,noCesto),colocaCesto,estado(canto2,canto2,noCesto)).
     
goal(estado(_,canto2,noCesto)).

%naive dfs
plano(Estado,[]):-
    goal(Estado),
    write(Estado),nl.
plano(Estado,[Acao|Plano]):-
    write(Estado),nl,
    muda(Estado,Acao,Estado1),
    plano(Estado1,Plano).



    



     
     