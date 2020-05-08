
          
          Vp=find(Interction()==1);
        Vn=find(Interction()==0);
         MatPredict=zeros(495,383);
       Ip=crossvalind('Kfold',numel(Vp),5);
        In=crossvalind('Kfold',numel(Vn),5);
         for I=1:5
           vp=Ip==I;
           vn=In==I;
              matDT=Interction;
             matDT(Vp(vp))=0;
             recMatrix=CN_bi(matDT);
             % recMatrix=Jaccard(matDT);
            V=[Vn(vn);Vp(vp)];
             MatPredict(V)=recMatrix(V);
           end
     [AUC,AUPR,Acc,Sen,Spe,Pre]=ROCcompute(MatPredict(),Interction(),1);  

        
       
       
  