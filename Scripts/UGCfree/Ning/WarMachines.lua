local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v24,v25) local v26={};for v42=1, #v24 do v6(v26,v0(v4(v1(v2(v24,v42,v42 + 1 )),v1(v2(v25,1 + (v42% #v25) ,1 + (v42% #v25) + 1 )))%256 ));end return v5(v26);end local v8=tonumber;local v9=string.byte;local v10=string.char;local v11=string.sub;local v12=string.gsub;local v13=string.rep;local v14=table.concat;local v15=table.insert;local v16=math.ldexp;local v17=getfenv or function() return _ENV;end ;local v18=setmetatable;local v19=pcall;local v20=select;local v21=unpack or table.unpack ;local v22=tonumber;local function v23(v27,v28,...) local v29=0;local v30;local v31;local v32;local v33;local v34;local v35;local v36;local v37;local v38;local v39;local v40;local v41;while true do if (v29==2) then function v33() local v43=0;local v44;while true do if (v43==1) then return v44;end if (v43==0) then v44=v9(v27,v30,v30);v30=v30 + 1 ;v43=1;end end end v34=nil;function v34() local v45=0;local v46;local v47;while true do if (v45==1) then return (v47 * 256) + v46 ;end if (v45==0) then v46,v47=v9(v27,v30,v30 + 2 );v30=v30 + 2 ;v45=1;end end end v29=3;end if (v29==5) then v38=v35;v39=nil;function v39(...) return {...},v20("#",...);end v29=6;end if (v29==4) then function v36() local v48=0;local v49;local v50;local v51;local v52;local v53;local v54;while true do if (v48==0) then v49=v35();v50=v35();v48=1;end if (v48==1) then v51=1;v52=(v32(v50,1,20) * (2^32)) + v49 ;v48=2;end if (v48==3) then if (v53==0) then if (v52==0) then return v54 * 0 ;else v53=1;v51=619 -(555 + 64) ;end elseif (v53==2047) then return ((v52==0) and (v54 * ((932 -(857 + 74))/0))) or (v54 * NaN) ;end return v16(v54,v53-1023 ) * (v51 + (v52/((570 -(367 + 201))^52))) ;end if (v48==2) then v53=v32(v50,53 -32 ,31);v54=((v32(v50,32)==1) and  -1) or 1 ;v48=3;end end end v37=nil;function v37(v55) local v56=0;local v57;local v58;while true do if (v56==1) then v57=v11(v27,v30,(v30 + v55) -1 );v30=v30 + v55 ;v56=2;end if (v56==2) then v58={};for v112=1, #v57 do v58[v112]=v10(v9(v11(v57,v112,v112)));end v56=3;end if (v56==0) then v57=nil;if  not v55 then local v118=0;while true do if (v118==0) then v55=v35();if (v55==0) then return "";end break;end end end v56=1;end if (v56==3) then return v14(v58);end end end v29=5;end if (v29==0) then v30=1;v31=nil;v27=v12(v11(v27,5),v7("\165\96","\214\139\78\100"),function(v59) if (v9(v59,2)==79) then v31=v8(v11(v59,2 -1 ,1));return "";else local v104=0;local v105;while true do if (0==v104) then v105=v10(v8(v59,16));if v31 then local v123=0;local v124;while true do if (v123==0) then v124=v13(v105,v31);v31=nil;v123=1;end if (v123==1) then return v124;end end else return v105;end break;end end end end);v29=1;end if (1==v29) then v32=nil;function v32(v60,v61,v62) if v62 then local v106=0;local v107;while true do if (v106==0) then v107=(v60/(2^(v61-1)))%(2^(((v62-1) -(v61-(2 -1))) + 1)) ;return v107-(v107%1) ;end end else local v108=2^(v61-1) ;return (((v60%(v108 + v108))>=v108) and 1) or 0 ;end end v33=nil;v29=2;end if (v29==3) then v35=nil;function v35() local v63=0;local v64;local v65;local v66;local v67;while true do if (v63==0) then v64,v65,v66,v67=v9(v27,v30,v30 + 3 );v30=v30 + (7 -3) ;v63=1;end if (v63==1) then return (v67 * 16777216) + (v66 * 65536) + (v65 * 256) + v64 ;end end end v36=nil;v29=4;end if (v29==7) then function v41(v68,v69,v70) local v71=v68[1];local v72=v68[2];local v73=v68[930 -(214 + 713) ];return function(...) local v81=v71;local v82=v72;local v83=v73;local v84=v39;local v85=1;local v86= -1;local v87={};local v88={...};local v89=v20("#",...) -1 ;local v90={};local v91={};for v109=0,v89 do if (v109>=v83) then v87[v109-v83 ]=v88[v109 + 1 ];else v91[v109]=v88[v109 + 1 + 0 ];end end local v92=(v89-v83) + 1 ;local v93;local v94;while true do v93=v81[v85];v94=v93[1 + 0 ];if (v94<=11) then if (v94<=5) then if (v94<=2) then if (v94<=(877 -(282 + 595))) then v91[v93[2]]=v70[v93[3]];elseif (v94==1) then for v218=v93[2],v93[3] do v91[v218]=nil;end else do return;end end elseif (v94<=3) then v85=v93[3];elseif (v94>4) then v91[v93[2]]=v93[3];else v91[v93[2]]=v91[v93[3]];end elseif (v94<=8) then if (v94<=6) then local v129=0;local v130;local v131;while true do if (v129==0) then v130=v93[2];v131=v91[v93[3]];v129=1;end if (1==v129) then v91[v130 + 1 ]=v131;v91[v130]=v131[v93[4]];break;end end elseif (v94==7) then v91[v93[2]]={};else local v162=0;local v163;while true do if (v162==0) then v163=v93[2];v91[v163]=v91[v163](v21(v91,v163 + 1 ,v86));break;end end end elseif (v94<=(1646 -(1523 + 114))) then if (v91[v93[2]]==v93[4]) then v85=v85 + 1 ;else v85=v93[3];end elseif (v94==10) then local v165;local v166,v167;local v168;local v169;v91[v93[2]]=v70[v93[3]];v85=v85 + 1 ;v93=v81[v85];v169=v93[2];v168=v91[v93[3]];v91[v169 + 1 + 0 ]=v168;v91[v169]=v168[v93[4]];v85=v85 + (1 -0) ;v93=v81[v85];v91[v93[2]]=v93[1068 -(68 + 997) ];v85=v85 + 1 ;v93=v81[v85];v169=v93[2];v166,v167=v84(v91[v169](v21(v91,v169 + (1271 -(226 + 1044)) ,v93[3])));v86=(v167 + v169) -(4 -3) ;v165=0;for v225=v169,v86 do v165=v165 + 1 ;v91[v225]=v166[v165];end v85=v85 + 1 ;v93=v81[v85];v169=v93[2];v91[v169]=v91[v169](v21(v91,v169 + 1 ,v86));v85=v85 + 1 ;v93=v81[v85];v91[v93[119 -(32 + 85) ]]();v85=v85 + 1 ;v93=v81[v85];v85=v93[3 + 0 ];else local v180=0;local v181;while true do if (v180==0) then v181=v93[1 + 1 ];do return v91[v181](v21(v91,v181 + 1 ,v93[3]));end break;end end end elseif (v94<=(974 -(892 + 65))) then if (v94<=14) then if (v94<=12) then local v132=v82[v93[3]];local v133;local v134={};v133=v18({},{[v7("\10\227\60\194\49\217\45","\172\85\188\85")]=function(v137,v138) local v139=0;local v140;while true do if (v139==0) then v140=v134[v138];return v140[2 -1 ][v140[2]];end end end,[v7("\71\134\142\73\186\113\183\132\73\181","\205\24\217\224\44")]=function(v141,v142,v143) local v144=v134[v142];v144[1][v144[2]]=v143;end});for v146=1,v93[4] do v85=v85 + 1 ;local v147=v81[v85];if (v147[1 -0 ]==4) then v134[v146-1 ]={v91,v147[3]};else v134[v146-(1 -0) ]={v69,v147[3]};end v90[ #v90 + 1 ]=v134;end v91[v93[2]]=v41(v132,v133,v70);elseif (v94>13) then local v182;local v183;local v184,v185;local v186;v91[v93[2]]=v69[v93[3]];v85=v85 + 1 ;v93=v81[v85];v91[v93[2]]=v69[v93[3]];v85=v85 + 1 ;v93=v81[v85];v91[v93[2]]=v69[v93[3]];v85=v85 + 1 ;v93=v81[v85];v91[v93[2]]={};v85=v85 + 1 ;v93=v81[v85];v91[v93[352 -(87 + 263) ]]=v69[v93[3]];v85=v85 + 1 ;v93=v81[v85];v91[v93[2]]=v91[v93[3]];v85=v85 + 1 ;v93=v81[v85];for v230=v93[182 -(67 + 113) ],v93[3] do v91[v230]=nil;end v85=v85 + 1 ;v93=v81[v85];v186=v93[2];v184,v185=v84(v91[v186](v21(v91,v186 + 1 ,v93[3])));v86=(v185 + v186) -1 ;v183=0 + 0 ;for v232=v186,v86 do local v233=0;while true do if (v233==0) then v183=v183 + 1 ;v91[v232]=v184[v183];break;end end end v85=v85 + 1 ;v93=v81[v85];v186=v93[4 -2 ];v182=v91[v186];for v234=v186 + 1 ,v86 do v15(v182,v91[v234]);end else do return v91[v93[2]]();end end elseif (v94<=(12 + 3)) then v91[v93[2]]=v41(v82[v93[3]],nil,v70);elseif (v94==16) then v91[v93[2]]=v69[v93[3]];else local v197=0;local v198;local v199;local v200;local v201;while true do if (v197==1) then v86=(v200 + v198) -1 ;v201=0;v197=2;end if (v197==0) then v198=v93[2];v199,v200=v84(v91[v198](v21(v91,v198 + (3 -2) ,v93[3])));v197=1;end if (v197==2) then for v251=v198,v86 do local v252=0;while true do if (v252==0) then v201=v201 + 1 ;v91[v251]=v199[v201];break;end end end break;end end end elseif (v94<=20) then if (v94<=18) then v91[v93[2]]();elseif (v94>19) then v91[v93[2]]=v91[v93[3]][v93[4]];elseif v91[v93[2]] then v85=v85 + 1 ;else v85=v93[955 -(802 + 150) ];end elseif (v94<=22) then if (v94==21) then local v204=v93[2];local v205=v91[v204];for v235=v204 + 1 ,v86 do v15(v205,v91[v235]);end else local v206=0;local v207;while true do if (0==v206) then v207=v93[5 -3 ];v91[v207]=v91[v207](v21(v91,v207 + (1 -0) ,v93[3]));break;end end end elseif (v94==23) then local v208;local v209,v210;local v211;v91[v93[2]]=v93[3];v85=v85 + 1 ;v93=v81[v85];v211=v93[2];v91[v211]=v91[v211](v21(v91,v211 + 1 ,v93[3]));v85=v85 + 1 ;v93=v81[v85];v91[v93[2]]=v93[3];v85=v85 + 1 ;v93=v81[v85];v211=v93[2];v209,v210=v84(v91[v211](v21(v91,v211 + 1 ,v93[3])));v86=(v210 + v211) -(1 + 0) ;v208=0;for v236=v211,v86 do local v237=0;while true do if (0==v237) then v208=v208 + 1 ;v91[v236]=v209[v208];break;end end end v85=v85 + (998 -(915 + 82)) ;v93=v81[v85];v211=v93[2];v91[v211]=v91[v211](v21(v91,v211 + 1 ,v86));v85=v85 + 1 ;v93=v81[v85];if (v91[v93[2]]==v93[4]) then v85=v85 + 1 ;else v85=v93[3];end else local v217=v93[2];do return v21(v91,v217,v86);end end v85=v85 + 1 ;end end;end return v41(v40(),{},v28)(...);end if (6==v29) then v40=nil;function v40() local v74={};local v75={};local v76={};local v77={v74,v75,nil,v76};local v78=v35();local v79={};for v95=1,v78 do local v96=v33();local v97;if (v96==1) then v97=v33()~=0 ;elseif (v96==2) then v97=v36();elseif (v96==3) then v97=v37();end v79[v95]=v97;end v77[3]=v33();for v99=1,v35() do local v100=0;local v101;while true do if (v100==0) then v101=v33();if (v32(v101,1,1)==0) then local v119=0;local v120;local v121;local v122;while true do if (v119==2) then if (v32(v121,1,1)==1) then v122[2]=v79[v122[2]];end if (v32(v121,2,2)==1) then v122[3]=v79[v122[3]];end v119=3;end if (v119==1) then v122={v34(),v34(),nil,nil};if (v120==0) then v122[3]=v34();v122[4]=v34();elseif (v120==1) then v122[3]=v35();elseif (v120==2) then v122[3]=v35() -(2^16) ;elseif (v120==3) then v122[3]=v35() -(2^16) ;v122[4]=v34();end v119=2;end if (v119==0) then v120=v32(v101,2,3);v121=v32(v101,4,6);v119=1;end if (v119==3) then if (v32(v121,3,3)==1) then v122[4]=v79[v122[4]];end v74[v99]=v122;break;end end end break;end end end for v102=1,v35() do v75[v102-1 ]=v40();end return v77;end v41=nil;v29=7;end end end v23(v7("\233\226\141\63\182\145\158\142\46\182\149\158\241\40\181\234\157\241\41\181\146\153\246\44\176\156\155\132\40\177\149\158\241\43\181\234\157\241\40\194\147\156\246\42\176\150\155\249\46\181\149\149\242\81\182\149\154\245\40\192\147\232\246\43\176\225\155\243\40\179\146\159\241\45\182\144\158\142\46\182\146\157\247\45\176\148\159\142\40\197\149\157\241\90\181\234\157\241\47\180\145\226\241\46\182\148\158\142\46\182\151\157\240\42\179\234\157\241\46\180\149\157\240\44\180\234\157\241\46\183\149\157\241\45\181\234\157\241\47\180\151\226\241\46\182\151\157\241\46\178\150\226\241\46\182\147\157\130\46\182\149\158\242\81\182\149\157\240\46\182\149\153\243\81\182\149\157\245\45\201\149\157\241\47\178\234\157\241\46\178\157\226\241\46\182\145\158\142\46\182\149\159\245\81\182\149\157\245\45\201\149\157\241\45\178\234\157\241\46\178\149\157\241\42\182\149\157\242\42\201\149\157\241\90\182\149\157\245\46\182\149\156\245\81\182\149\156\249\46\182\149\153\247\81\182\149\157\243\45\201\149\157\241\47\181\234\157\241\46\183\150\226\241\46\182\145\158\142\46\182\149\159\246\81\182\149\153\241\46\181\149\152\242\81\182\149\158\128\44\179\147\153\243\92\181\228\159\142\46\181\150\226\241\46\180\144\155\245\44\196\149\159\247\81\182\149\235\241\45\192\149\157\240\92\181\234\157\241\46\180\149\235\249\81\182\149\157\132\46\182\149\156\249\81\182\149\157\243\46\182\149\156\247\81\182\149\157\242\46\182\149\156\247\81\182\149\157\245\38\201\149\157\241\43\182\149\157\243\40\201\149\157\241\40\190\234\157\241\46\177\149\157\241\41\176\234\157\241\46\179\149\157\241\41\176\234\157\241\46\178\150\226\241\46\182\148\157\241\44\182\148\153\241\46\182\145\157\241\46\178\149\157\241\47\182\149\156\243\47\177\149\157\241\43\182\149\157\243\40\201\149\157\241\45\182\149\157\244\46\182\149\159\241\46\183\151\159\142\46\182\149\153\241\46\182\150\155\142\46\182\149\159\241\46\182\145\155\142\46\182\149\156\242\81\182\149\157\243\46\182\151\155\243\81\182\149\157\240\46\182\148\154\241\46\182\148\157\241\46\178\149\157\241\42\182\150\158\142\46\182\148\154\241\46\182\148\159\142\46\182\149\153\241\46\182\148\155\142\46\182\149\154\241\46\182\151\155\142\46\182\149\239\241\46\182\148\157\241\46\180\145\226\241\46\183\157\157\241\46\183\144\226\241\46\182\145\157\242\45\201\149\157\240\95\182\149\157\240\44\201\149\157\240\46\182\149\157\240\46\182\149\158\245\81\182\149\157\133\46\182\149\156\241\46\182\148\153\142\46\182\148\149\241\46\182\148\155\142\46\182\149\159\242\81\182\149\157\240\45\201\149\157\241\47\181\234\157\241\46\179\150\226\241\46\182\150\157\128\45\201\149\157\247\93\176\227\155\240\40\178\146\158\246\42\177\151\155\248\40\195\147\154\241\45\182\145\158\142\46\182\147\154\247\47\176\225\155\244\46\181\149\154\242\81\182\149\153\249\44\201\146\153\246\46\178\146\155\244\41\178\149\158\244\91\181\234\157\241\40\190\151\226\246\42\177\149\154\242\45\199\151\226\243\88\177\151\155\240\41\177\151\232\247\41\176\156\154\245\40\190\146\152\247\44\177\144\154\242\40\179\146\159\247\45\176\227\155\132\41\178\147\152\247\91\177\145\159\132\40\181\147\235\247\90\180\227\153\135\40\195\147\152\245\45\177\151\155\244\40\183\146\153\247\88\177\151\152\249\44\192\145\235\247\91\176\144\153\242\41\180\147\152\247\47\177\145\155\135\41\180\144\149\243\88\176\225\155\240\40\191\147\232\243\88\179\150\155\242\41\180\147\148\246\46\177\145\154\242\44\192\144\152\245\41\178\150\155\247\41\180\151\226\247\43\180\227\152\246\40\183\146\159\245\90\176\148\155\242\40\190\147\148\247\91\176\144\154\242\44\195\147\238\246\43\176\148\157\243\40\201\149\157\135\46\181\227\157\240\46\197\150\226\241\46\182\147\156\242\45\201\149\157\241\95\182\149\157\240\45\201\149\157\241\42\182\150\158\142\46\182\149\236\241\46\182\148\157\241\47\180\151\226\241\46\182\148\157\241\46\183\150\226\241\46\183\151\157\128\46\182\149\159\241\46\182\151\158\142\46\182\151\157\243\81\182\149\157\243\46\182\149\159\241\46\182\150\157\241\47\180\151\226\241\46\182\145\157\241\46\178\147\226\241\46\182\151\157\241\46\178\147\226\241\46\182\148\158\142\46\182\149\159\245\81\182\149\157\240\46\182\149\156\241\46\182\148\157\241\46\178\145\226\241\46\182\231\157\241\46\183\149\157\243\46\183\145\157\241\46\183\150\226\241\46\182\144\159\142\46\182\149\159\242\81\182\149\157\240\41\201\149\157","\134\165\173\193\30"),v17(),...);
-- âš ï¸ WARNING: integrity protected!
--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.3) ~  Much Love, Ferib 

]]--
