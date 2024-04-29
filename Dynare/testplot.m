clear; load DanWorkspace.mat


    xdates = (1985:0.25:2016+40/4);
    
    
    % Arrange p5 and p95 for credible set band
    XX = [xdates(1:125) fliplr(xdates(1:125)) ];
    YY = [ie_afe_ss + 400*ie_p5 fliplr(ie_afe_ss + 400*ie_p95)];
    YY_re = [re_afe_ss + 400*re_p5 fliplr(re_afe_ss + 400*re_p95)];
    %%
    figure(11); clf
    set(figure(11),'PaperType','usletter','PaperOrientation','Landscape','Paperposition',[0.25, 0.25, 10.5 8]);
    f1=fill(XX,YY,[0.99 0.88 0.82]); hold on
    f2=plot(xdates(1:125),ie_afe_ss + ie_afe*400,'r-','LineWidth',2); hold on
    f3=plot(xdates(125:1:165),ie_afe_ss + [ie_afe(end) fcast2016(13,2:end)]*400','r--','LineWidth',2); hold on
    f4=plot(xdates(121:1:165),ie_afe_ss + [ie_afe(end-4) fcast2015(13,2:end)]*400','b--','LineWidth',2); hold on
    xlim([2005 2025]);  set(f1,'EdgeColor','None');
    hline(0,'k--'); hline(ie_afe_ss,'m--')
    title([fnametitle ' - Efficient Nominal Interest Rate'])
    legend([f3 f4],{'June 2015','June 2016'},'location','N'); legend boxoff
    
    figure(12); clf
    set(figure(12),'PaperType','usletter','PaperOrientation','Landscape','Paperposition',[0.25, 0.25, 10.5 8]);
    f1=fill(XX,YY_re,[0.99 0.88 0.82]); hold on
    f2=plot(xdates(1:125),re_afe_ss + re_afe*400,'r-','LineWidth',2); hold on
    f3=plot(xdates(125:1:165),re_afe_ss + [re_afe(end) fcast2016(12,2:end)]*400','r--','LineWidth',2); hold on
    f4=plot(xdates(121:1:165),re_afe_ss + [re_afe(end-4) fcast2015(12,2:end)]*400','b--','LineWidth',2); hold on
    xlim([2005 2025]);  set(f1,'EdgeColor','None');
    hline(0,'k--'); hline(re_afe_ss,'m--')
    title([fnametitle ' - Efficient Real Interest Rate'])
    legend([f3 f4],{'June 2015','June 2016'},'location','N'); legend boxoff
    
       
%     ie_out = [xdates(1:125)', ie_afe_ss + ie_afe*400, ie_afe_ss + 400*ie_p5', ie_afe_ss + 400*ie_p95' ];    
%     fout2016 = [xdates(126:end)' ie_afe_ss+400*fcast2016(13,2:end)'];    
%     fout2015 = [xdates(122:end)' ie_afe_ss+400*fcast2015(13,2:end)'];
%         
%     open ie_out
%     open fout2016
%     open fout2015
    
    
    re_out = [xdates(1:125)', re_afe_ss + re_afe*400, re_afe_ss + 400*re_p5', re_afe_ss + 400*re_p95' ];
    fout2016 = [xdates(126:end)' re_afe_ss+400*fcast2016(12,2:end)'];
    fout2015 = [xdates(122:end)' re_afe_ss+400*fcast2015(12,2:end)'];

    open re_out
    open fout2016
    open fout2015
    %%

print(12,'-dpdf',['fig_irf_re_' fname '.pdf'])