local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v24,v25)local v26={};for v41=1, #v24 do v6(v26,v0(v4(v1(v2(v24,v41,v41 + 1 )),v1(v2(v25,1 + (v41% #v25) ,1 + (v41% #v25) + 1 )))%256 ));end return v5(v26);end local v8=tonumber;local v9=string.byte;local v10=string.char;local v11=string.sub;local v12=string.gsub;local v13=string.rep;local v14=table.concat;local v15=table.insert;local v16=math.ldexp;local v17=getfenv or function()return _ENV;end ;local v18=setmetatable;local v19=pcall;local v20=select;local v21=unpack or table.unpack ;local v22=tonumber;local function v23(v27,v28,...)local v29=2 -1 ;local v30;v27=v12(v11(v27,5),v7("\228\109","\197\202\67\126"),function(v42)if (v9(v42,2)==79) then v30=v8(v11(v42,1,1));return "";else local v78=0;local v79;while true do if (v78==0) then v79=v10(v8(v42,16));if v30 then local v119=0;local v120;while true do if (v119==0) then v120=v13(v79,v30);v30=nil;v119=1;end if (v119==1) then return v120;end end else return v79;end break;end end end end);local function v31(v43,v44,v45)if v45 then local v80=0;local v81;while true do if (0==v80) then v81=(v43/(2^(v44-1)))%(2^(((v45-1) -(v44-1)) + (2 -1))) ;return v81-(v81%1) ;end end else local v82=0;local v83;while true do if (v82==0) then v83=2^(v44-1) ;return (((v43%(v83 + v83))>=v83) and 1) or 0 ;end end end end local function v32()local v46=v9(v27,v29,v29);v29=v29 + 1 ;return v46;end local function v33()local v47,v48=v9(v27,v29,v29 + 2 );v29=v29 + 2 ;return (v48 * 256) + v47 ;end local function v34()local v49=0;local v50;local v51;local v52;local v53;while true do if (0==v49) then v50,v51,v52,v53=v9(v27,v29,v29 + 3 );v29=v29 + 4 ;v49=1;end if (v49==1) then return (v53 * 16777216) + (v52 * 65536) + (v51 * 256) + v50 ;end end end local function v35()local v54=v34();local v55=v34();local v56=1;local v57=(v31(v55,1,20) * ((3 -1)^32)) + v54 ;local v58=v31(v55,21,31);local v59=((v31(v55,32)==1) and  -1) or 1 ;if (v58==0) then if (v57==0) then return v59 * (0 -0) ;else local v88=0;while true do if (0==v88) then v58=1;v56=619 -(555 + 64) ;break;end end end elseif (v58==(2978 -(857 + 74))) then return ((v57==0) and (v59 * ((569 -(367 + 201))/0))) or (v59 * NaN) ;end return v16(v59,v58-1023 ) * (v56 + (v57/(2^(979 -(214 + 713))))) ;end local function v36(v60)local v61=0;local v62;local v63;while true do if (3==v61) then return v14(v63);end if (v61==1) then v62=v11(v27,v29,(v29 + v60) -(1 + 0) );v29=v29 + v60 ;v61=2;end if (v61==2) then v63={};for v89=1, #v62 do v63[v89]=v10(v9(v11(v62,v89,v89)));end v61=3;end if (v61==0) then v62=nil;if  not v60 then v60=v34();if (v60==0) then return "";end end v61=1;end end end local v37=v34;local function v38(...)return {...},v20("#",...);end local function v39()local v64=0;local v65;local v66;local v67;local v68;local v69;local v70;while true do if (v64==0) then v65={};v66={};v67={};v68={v65,v66,nil,v67};v64=1;end if (v64==2) then for v91=1,v34() do local v92=v32();if (v31(v92,878 -(282 + 595) ,1)==0) then local v115=0;local v116;local v117;local v118;while true do if (v115==1) then v118={v33(),v33(),nil,nil};if (v116==0) then v118[3]=v33();v118[4]=v33();elseif (v116==1) then v118[3]=v34();elseif (v116==(1639 -(1523 + 114))) then v118[3]=v34() -(2^16) ;elseif (v116==3) then v118[3]=v34() -(2^16) ;v118[4]=v33();end v115=2;end if (2==v115) then if (v31(v117,1,1)==1) then v118[2]=v70[v118[2]];end if (v31(v117,2,2 + 0 )==1) then v118[3 -0 ]=v70[v118[3]];end v115=3;end if (3==v115) then if (v31(v117,1068 -(68 + 997) ,3)==1) then v118[4]=v70[v118[1274 -(226 + 1044) ]];end v65[v91]=v118;break;end if (v115==0) then v116=v31(v92,2,3);v117=v31(v92,4,6);v115=1;end end end end for v93=1,v34() do v66[v93-1 ]=v39();end return v68;end if (1==v64) then v69=v34();v70={};for v95=1,v69 do local v96=v32();local v97;if (v96==1) then v97=v32()~=(0 + 0) ;elseif (v96==2) then v97=v35();elseif (v96==3) then v97=v36();end v70[v95]=v97;end v68[3]=v32();v64=2;end end end local function v40(v71,v72,v73)local v74=0;local v75;local v76;local v77;while true do if (v74==0) then v75=v71[1];v76=v71[2];v74=1;end if (v74==1) then v77=v71[3];return function(...)local v99=v75;local v100=v76;local v101=v77;local v102=v38;local v103=4 -3 ;local v104= -1;local v105={};local v106={...};local v107=v20("#",...) -1 ;local v108={};local v109={};for v113=0,v107 do if (v113>=v101) then v105[v113-v101 ]=v106[v113 + 1 ];else v109[v113]=v106[v113 + 1 ];end end local v110=(v107-v101) + (118 -(32 + 85)) ;local v111;local v112;while true do local v114=0;while true do if (v114==0) then v111=v99[v103];v112=v111[1];v114=1;end if (1==v114) then if (v112<=(42 + 0)) then if (v112<=20) then if (v112<=9) then if (v112<=4) then if (v112<=1) then if (v112>(0 + 0)) then local v140=v111[2];local v141=v109[v140 + 2 ];local v142=v109[v140] + v141 ;v109[v140]=v142;if (v141>0) then if (v142<=v109[v140 + 1 ]) then local v387=0;while true do if (v387==0) then v103=v111[3];v109[v140 + 3 ]=v142;break;end end end elseif (v142>=v109[v140 + 1 ]) then v103=v111[3];v109[v140 + 3 ]=v142;end else v109[v111[959 -(892 + 65) ]]=v109[v111[3]]%v111[4] ;end elseif (v112<=2) then local v145=0;local v146;while true do if (0==v145) then v146=v111[2];v109[v146]=v109[v146](v21(v109,v146 + 1 ,v111[3]));break;end end elseif (v112>3) then local v263=v111[2];local v264,v265=v102(v109[v263](v21(v109,v263 + (2 -1) ,v111[3])));v104=(v265 + v263) -1 ;local v266=0;for v355=v263,v104 do local v356=0;while true do if (v356==0) then v266=v266 + 1 ;v109[v355]=v264[v266];break;end end end else v109[v111[3 -1 ]]=v109[v111[3]]%v109[v111[4]] ;end elseif (v112<=(10 -4)) then if (v112>5) then v109[v111[352 -(87 + 263) ]][v111[3]]=v109[v111[4]];else local v149=0;local v150;while true do if (v149==0) then v150=v111[2];v109[v150]=v109[v150](v21(v109,v150 + 1 ,v111[3]));break;end end end elseif (v112<=7) then v109[v111[2]]=v109[v111[3]];elseif (v112==8) then v103=v111[3];else do return v109[v111[2]]();end end elseif (v112<=14) then if (v112<=11) then if (v112==10) then local v153=0;local v154;while true do if (v153==0) then v154=v111[2];do return v21(v109,v154,v104);end break;end end else v73[v111[3]]=v109[v111[2]];end elseif (v112<=12) then v109[v111[2]]={};elseif (v112>13) then v109[v111[2]]={};else local v270=v111[2];local v271,v272=v102(v109[v270](v21(v109,v270 + 1 ,v104)));v104=(v272 + v270) -1 ;local v273=0;for v360=v270,v104 do v273=v273 + 1 ;v109[v360]=v271[v273];end end elseif (v112<=17) then if (v112<=15) then v73[v111[3]]=v109[v111[2]];elseif (v112>16) then local v274=0;local v275;while true do if (v274==0) then v275=v111[2];v109[v275](v109[v275 + 1 ]);break;end end else v109[v111[2]]=v109[v111[3]]%v109[v111[4]] ;end elseif (v112<=18) then v109[v111[182 -(67 + 113) ]]=v72[v111[3]];elseif (v112==19) then do return;end else v109[v111[2 + 0 ]]();end elseif (v112<=(75 -44)) then if (v112<=25) then if (v112<=22) then if (v112==21) then if  not v109[v111[2]] then v103=v103 + 1 ;else v103=v111[3];end else local v162=0;local v163;local v164;local v165;while true do if (v162==1) then v165=v111[3 + 0 ];for v390=3 -2 ,v165 do v164[v390]=v109[v163 + v390 ];end break;end if (v162==0) then v163=v111[2];v164=v109[v163];v162=1;end end end elseif (v112<=23) then local v166=v100[v111[3]];local v167;local v168={};v167=v18({},{[v7("\248\251\87\57\95\1\223","\100\167\164\62\87\59")]=function(v229,v230)local v231=v168[v230];return v231[1][v231[954 -(802 + 150) ]];end,[v7("\191\105\78\204\240\11\39\132\83\88","\73\224\54\32\169\135\98")]=function(v232,v233,v234)local v235=0;local v236;while true do if (v235==0) then v236=v168[v233];v236[1][v236[2]]=v234;break;end end end});for v237=1,v111[10 -6 ] do local v238=0;local v239;while true do if (v238==1) then if (v239[1]==7) then v168[v237-1 ]={v109,v239[3]};else v168[v237-1 ]={v72,v239[3]};end v108[ #v108 + 1 ]=v168;break;end if (v238==0) then v103=v103 + 1 ;v239=v99[v103];v238=1;end end end v109[v111[2]]=v40(v166,v167,v73);elseif (v112>(18 + 6)) then do return;end else local v278=v111[2];local v279=v109[v278 + 2 ];local v280=v109[v278] + v279 ;v109[v278]=v280;if (v279>0) then if (v280<=v109[v278 + 1 ]) then local v439=0;while true do if (0==v439) then v103=v111[3];v109[v278 + 3 ]=v280;break;end end end elseif (v280>=v109[v278 + 1 ]) then v103=v111[3];v109[v278 + 3 ]=v280;end end elseif (v112<=28) then if (v112<=(1023 -(915 + 82))) then v109[v111[5 -3 ]][v111[3]]=v109[v111[4]];elseif (v112>27) then v109[v111[2]][v109[v111[3]]]=v111[4];else local v284=0;local v285;while true do if (v284==0) then v285=v111[2];v109[v285](v21(v109,v285 + 1 ,v111[3]));break;end end end elseif (v112<=29) then local v172=v111[2];local v173=v109[v172];for v240=v172 + 1 + 0 ,v104 do v15(v173,v109[v240]);end elseif (v112==30) then v109[v111[2]]();else v109[v111[2]]=v111[3];end elseif (v112<=36) then if (v112<=33) then if (v112==32) then v109[v111[2]]=v111[3];else local v176=v111[2];local v177=v109[v176];local v178=v109[v176 + 2 ];if (v178>0) then if (v177>v109[v176 + 1 ]) then v103=v111[3];else v109[v176 + 3 ]=v177;end elseif (v177<v109[v176 + 1 ]) then v103=v111[3];else v109[v176 + 3 ]=v177;end end elseif (v112<=34) then local v179=v100[v111[3]];local v180;local v181={};v180=v18({},{[v7("\247\244\126\42\80\248\213","\173\168\171\23\68\52\157")]=function(v241,v242)local v243=0;local v244;while true do if (0==v243) then v244=v181[v242];return v244[1][v244[2]];end end end,[v7("\184\203\127\240\200\142\250\117\240\199","\191\231\148\17\149")]=function(v245,v246,v247)local v248=v181[v246];v248[1 -0 ][v248[2]]=v247;end});for v250=1,v111[4] do local v251=0;local v252;while true do if (v251==0) then v103=v103 + 1 ;v252=v99[v103];v251=1;end if (1==v251) then if (v252[1]==7) then v181[v250-1 ]={v109,v252[3]};else v181[v250-1 ]={v72,v252[3]};end v108[ #v108 + 1 ]=v181;break;end end end v109[v111[2]]=v40(v179,v180,v73);elseif (v112==35) then local v288=v111[2];local v289=v111[4];local v290=v288 + 2 ;local v291={v109[v288](v109[v288 + 1 ],v109[v290])};for v366=1,v289 do v109[v290 + v366 ]=v291[v366];end local v292=v291[1];if v292 then local v404=0;while true do if (v404==0) then v109[v290]=v292;v103=v111[3];break;end end else v103=v103 + 1 ;end elseif ((v111[3]==v7("\18\205\209\182","\69\77\136\159\224\199\167\155")) or (v111[3]==v7("\213\242\231\116\215\249\229","\18\178\151\147"))) then v109[v111[2]]=v73;else v109[v111[2]]=v73[v111[6 -3 ]];end elseif (v112<=39) then if (v112<=37) then local v183=v111[2];local v184=v109[v183];for v253=v183 + 1 ,v111[3] do v15(v184,v109[v253]);end elseif (v112>38) then local v293=v111[2];local v294=v109[v111[3]];v109[v293 + 1 ]=v294;v109[v293]=v294[v111[8 -4 ]];else v109[v111[2]]=v109[v111[3]]%v111[4] ;end elseif (v112<=40) then for v254=v111[1 + 1 ],v111[3] do v109[v254]=nil;end elseif (v112==(72 -31)) then if v109[v111[2]] then v103=v103 + 1 ;else v103=v111[3];end else local v299=0;local v300;local v301;local v302;while true do if (v299==1) then v302=0;for v444=v300,v111[4] do v302=v302 + 1 ;v109[v444]=v301[v302];end break;end if (v299==0) then v300=v111[2 + 0 ];v301={v109[v300](v21(v109,v300 + 1 ,v104))};v299=1;end end end elseif (v112<=64) then if (v112<=53) then if (v112<=47) then if (v112<=44) then if (v112>43) then local v185=0;local v186;local v187;local v188;local v189;while true do if (v185==0) then v186=v111[2];v187,v188=v102(v109[v186]());v185=1;end if (v185==2) then for v409=v186,v104 do local v410=0;while true do if (v410==0) then v189=v189 + 1 ;v109[v409]=v187[v189];break;end end end break;end if (v185==1) then v104=(v188 + v186) -(792 -(368 + 423)) ;v189=0;v185=2;end end elseif v109[v111[2]] then v103=v103 + 1 ;else v103=v111[3];end elseif (v112<=45) then local v190=v111[2];local v191={v109[v190](v21(v109,v190 + 1 ,v104))};local v192=0;for v256=v190,v111[22 -(10 + 8) ] do local v257=0;while true do if (v257==0) then v192=v192 + 1 ;v109[v256]=v191[v192];break;end end end elseif (v112>46) then local v304=0;local v305;local v306;while true do if (v304==0) then v305=v111[2];v306=v109[v305];v304=1;end if (v304==1) then for v447=v305 + 1 ,v104 do v15(v306,v109[v447]);end break;end end else v109[v111[2]]=v109[v111[3]] + v111[4] ;end elseif (v112<=50) then if (v112<=48) then local v193=0;local v194;local v195;while true do if (0==v193) then v194=v111[2];v195=v109[v111[3]];v193=1;end if (v193==1) then v109[v194 + 1 ]=v195;v109[v194]=v195[v111[4]];break;end end elseif (v112>(188 -139)) then v109[v111[2]][v111[3]]=v111[4];else local v310=v111[2];v109[v310](v109[v310 + (443 -(416 + 26)) ]);end elseif (v112<=51) then if  not v109[v111[6 -4 ]] then v103=v103 + 1 ;else v103=v111[3];end elseif (v112==52) then v109[v111[2]]=v109[v111[3]];else local v314=0;local v315;while true do if (v314==0) then v315=v111[2];do return v109[v315](v21(v109,v315 + 1 ,v111[3]));end break;end end end elseif (v112<=(25 + 33)) then if (v112<=55) then if (v112==54) then v109[v111[2]][v109[v111[3]]]=v109[v111[4]];else local v198=v111[2];do return v21(v109,v198,v104);end end elseif (v112<=56) then if (v109[v111[2]]==v111[4]) then v103=v103 + 1 ;else v103=v111[3];end elseif (v112==57) then if ((v111[3]==v7("\69\169\211\122","\164\26\236\157\44")) or (v111[3]==v7("\75\74\79\44\23\66\89","\114\44\47\59\74"))) then v109[v111[2]]=v73;else v109[v111[3 -1 ]]=v73[v111[3]];end else v109[v111[2]]=v109[v111[3]][v111[4]];end elseif (v112<=61) then if (v112<=59) then local v199=0;local v200;while true do if (v199==0) then v200=v111[2];v109[v200]=v109[v200](v21(v109,v200 + 1 ,v104));break;end end elseif (v112>60) then local v319=v111[2];local v320=v109[v319];local v321=v111[3];for v377=1,v321 do v320[v377]=v109[v319 + v377 ];end elseif (v109[v111[2]]==v111[4]) then v103=v103 + 1 ;else v103=v111[3];end elseif (v112<=62) then local v201=v111[2];do return v109[v201](v21(v109,v201 + 1 ,v111[3]));end elseif (v112==(501 -(145 + 293))) then v109[v111[2]]= #v109[v111[433 -(44 + 386) ]];else local v323=v111[1488 -(998 + 488) ];v109[v323](v21(v109,v323 + 1 ,v104));end elseif (v112<=75) then if (v112<=69) then if (v112<=66) then if (v112>(21 + 44)) then v109[v111[2]]=v111[3] + v109[v111[4]] ;else local v203=0;local v204;local v205;local v206;while true do if (v203==1) then v206=v109[v204 + 2 ];if (v206>0) then if (v205>v109[v204 + 1 ]) then v103=v111[3];else v109[v204 + 3 ]=v205;end elseif (v205<v109[v204 + 1 ]) then v103=v111[3];else v109[v204 + 3 ]=v205;end break;end if (v203==0) then v204=v111[2];v205=v109[v204];v203=1;end end end elseif (v112<=67) then v109[v111[2]][v111[3]]=v111[4];elseif (v112>68) then v109[v111[2]][v109[v111[3]]]=v111[4 + 0 ];else v103=v111[3];end elseif (v112<=(844 -(201 + 571))) then if (v112<=70) then v109[v111[2]]=v72[v111[1141 -(116 + 1022) ]];elseif (v112==(295 -224)) then v109[v111[2 + 0 ]]= #v109[v111[10 -7 ]];else do return v109[v111[2]]();end end elseif (v112<=73) then for v258=v111[2],v111[10 -7 ] do v109[v258]=nil;end elseif (v112>74) then local v328=0;local v329;local v330;local v331;local v332;while true do if (0==v328) then v329=v111[861 -(814 + 45) ];v330,v331=v102(v109[v329](v21(v109,v329 + 1 ,v104)));v328=1;end if (v328==1) then v104=(v331 + v329) -(2 -1) ;v332=0;v328=2;end if (v328==2) then for v448=v329,v104 do v332=v332 + 1 ;v109[v448]=v330[v332];end break;end end else v109[v111[2]][v109[v111[3]]]=v109[v111[1 + 3 ]];end elseif (v112<=(29 + 51)) then if (v112<=77) then if (v112==76) then v109[v111[2]]=v111[3] + v109[v111[889 -(261 + 624) ]] ;else local v212=0;local v213;local v214;local v215;local v216;while true do if (v212==1) then v104=(v215 + v213) -1 ;v216=0;v212=2;end if (v212==0) then v213=v111[2];v214,v215=v102(v109[v213]());v212=1;end if (v212==2) then for v417=v213,v104 do local v418=0;while true do if (v418==0) then v216=v216 + 1 ;v109[v417]=v214[v216];break;end end end break;end end end elseif (v112<=(138 -60)) then local v217=v111[2];local v218=v111[4];local v219=v217 + (1082 -(1020 + 60)) ;local v220={v109[v217](v109[v217 + 1 ],v109[v219])};for v260=1,v218 do v109[v219 + v260 ]=v220[v260];end local v221=v220[1];if v221 then local v335=0;while true do if (v335==0) then v109[v219]=v221;v103=v111[3];break;end end else v103=v103 + 1 ;end elseif (v112>79) then local v336=0;local v337;local v338;local v339;local v340;while true do if (v336==0) then v337=v111[1425 -(630 + 793) ];v338,v339=v102(v109[v337](v21(v109,v337 + 1 ,v111[3])));v336=1;end if (v336==1) then v104=(v339 + v337) -(3 -2) ;v340=0;v336=2;end if (v336==2) then for v451=v337,v104 do local v452=0;while true do if (0==v452) then v340=v340 + 1 ;v109[v451]=v338[v340];break;end end end break;end end else local v341=0;local v342;local v343;local v344;local v345;while true do if (v341==0) then v342=v111[2];v343,v344=v102(v109[v342](v109[v342 + 1 ]));v341=1;end if (2==v341) then for v453=v342,v104 do v345=v345 + 1 ;v109[v453]=v343[v345];end break;end if (v341==1) then v104=(v344 + v342) -1 ;v345=0;v341=2;end end end elseif (v112<=83) then if (v112<=81) then local v222=0;local v223;while true do if (0==v222) then v223=v111[2];v109[v223]=v109[v223](v21(v109,v223 + 1 ,v104));break;end end elseif (v112>82) then v109[v111[2]]=v109[v111[3]][v111[18 -14 ]];else local v348=0;local v349;while true do if (v348==0) then v349=v111[1 + 1 ];v109[v349](v21(v109,v349 + 1 ,v111[3]));break;end end end elseif (v112<=84) then local v224=0;local v225;local v226;local v227;local v228;while true do if (2==v224) then for v419=v225,v104 do v228=v228 + 1 ;v109[v419]=v226[v228];end break;end if (v224==1) then v104=(v227 + v225) -(3 -2) ;v228=0;v224=2;end if (v224==0) then v225=v111[2];v226,v227=v102(v109[v225](v109[v225 + 1 ]));v224=1;end end elseif (v112==85) then v109[v111[2]]=v109[v111[3]] + v111[4] ;else local v351=0;local v352;while true do if (v351==0) then v352=v111[2];v109[v352](v21(v109,v352 + 1 ,v104));break;end end end v103=v103 + 1 ;break;end end end end;end end end return v40(v39(),{},v28)(...);end v23("LOL!0D3O0003063O00737472696E6703043O006368617203043O00627974652O033O0073756203053O0062697433322O033O0062697403043O0062786F7203053O007461626C6503063O00636F6E63617403063O00696E7365727403053O006D6174636803083O00746F6E756D62657203053O007063612O6C00243O0012243O00013O00203A5O0002001224000100013O00203A000100010003001224000200013O00203A000200020004001224000300053O0006150003000A000100010004443O000A0001001224000300063O00203A000400030007001224000500083O00203A000500050009001224000600083O00203A00060006000A00062200073O000100062O00073O00064O00078O00073O00044O00073O00014O00073O00024O00073O00053O001224000800013O00203A00080008000B0012240009000C3O001224000A000D3O000622000B0001000100052O00073O00074O00073O00094O00073O00084O00073O000A4O00073O000B4O0034000C000B4O0009000C00014O0037000C6O00193O00013O00023O00023O00026O00F03F026O00704002264O000C00025O001220000300014O004700045O001220000500013O0004410003002100012O001200076O0034000800024O0012000900014O0012000A00024O0012000B00034O0012000C00044O0034000D6O0034000E00063O002055000F000600012O0050000C000F4O0051000B3O00022O0012000C00034O0012000D00044O0034000E00014O0047000F00014O0010000F0006000F00104C000F0001000F2O0047001000014O001000100006001000104C0010000100100020550010001000012O0050000D00104O000D000C6O0051000A3O0002002026000A000A00022O004F0009000A4O004000073O00010004010003000500012O0012000300054O0034000400024O0035000300044O003700036O00193O00017O00043O00027O004003053O003A25642B3A2O033O0025642B026O00F03F001C3O0006225O000100012O00468O0012000100014O0012000200024O0012000300024O000C00046O0012000500034O003400066O0028000700074O0050000500074O002F00043O000100203A000400040001001220000500024O0002000300050002001220000400034O0050000200044O005100013O000200263800010018000100040004443O001800012O003400016O000C00026O0035000100024O003700015O0004443O001B00012O0012000100044O0009000100014O003700016O00193O00013O00013O00443O0003043O0067616D65030A3O0047657453657276696365030A3O00253613C4EFAE4231371B03073O0030764272B69BCB03073O00536574436F726503103O000576ABBA3E3967ACB8193572B1B71F3803053O00705613C5DE03053O00E93FE84C7D03073O0026BD569C201885030F3O00C563FD06D359A265EE52A652F3459F03043O00269C37C703043O009C78643C03083O0023C81D1C4873149A03293O002AAAD3CC8E3E3D1BBA91CB826C2011BA91DC852D3A17BADD9F8B232659B2DECD886C3716B1C5DA833803073O005479DFB1BFED4C03083O009F43DBA12E593FCF03083O00A1DB36A9C05A3050025O00208C4003013O007003073O00506C6179657273030B3O004C6F63616C506C6179657203013O006103093O00776F726B737061636503063O004172656E617303013O007203093O0043686172616374657203053O004C6173657203073O0052656D6F7465732O033O00686974026O00F03F03093O006C41142A594E01364403043O0045292260027O0040025O006A084103113O008EC6C7060B28BDD7D20E313FB3D1D60D0703063O004BDCA3B76A62030C3O0057616974466F724368696C64030C3O0025BB8632E903B98036DE07A903053O00B962DAEB5703043O00E0322EF203063O00CAAB5C4786BE03083O001AC43E9E20C2299B03043O00E849A14C030B3O0097D64D492DBECB2O541DBE03053O007EDBB9223D03023O003EE803083O00876CAE3E121E179303133O0086E52BD21DBC10C8BAE52FC80CAB37EBB9E63E03083O00A7D6894AAB78CE53030C3O00496E766F6B6553657276657203063O00756E7061636B028O0003043O007461736B03043O007761697403053O007061697273030E3O0047657444657363656E64616E74732O033O0049734103083O00A3E53F5CF6A882F403063O00C7EB90523D980100026O00084003043O004865616403083O00506F736974696F6E030A3O004669726553657276657203073O00371AB8320204AA03043O004B6776D903053O0049646C656403073O00436F2O6E65637401B73O0006293O00B500013O0004443O00B50001001224000100013O0020300001000100022O001200035O001220000400033O001220000500044O0050000300054O005100013O00020020300001000100052O001200035O001220000400063O001220000500074O00020003000500022O000C00043O00032O001200055O001220000600083O001220000700094O00020005000700022O001200065O0012200007000A3O0012200008000B4O00020006000800022O004A0004000500062O001200055O0012200006000C3O0012200007000D4O00020005000700022O001200065O0012200007000E3O0012200008000F4O00020006000800022O004A0004000500062O001200055O001220000600103O001220000700114O00020005000700020020450004000500122O0052000100040001001224000100013O00203A00010001001400203A00010001001500120B000100133O001224000100173O00203A00010001001800120B000100163O001224000100133O00203A00010001001A00203A00010001001B00203A00010001001C00203A00010001001D00120B000100194O000C00013O00022O001200025O0012200003001F3O001220000400204O00020002000400020010060001001E0002003043000100210022001224000200013O0020300002000200022O001200045O001220000500233O001220000600244O0050000400064O005100023O00020020300002000200252O001200045O001220000500263O001220000600274O0050000400064O005100023O00020020300002000200252O001200045O001220000500283O001220000600294O0050000400064O005100023O00020020300002000200252O001200045O0012200005002A3O0012200006002B4O0050000400064O005100023O00020020300002000200252O001200045O0012200005002C3O0012200006002D4O0050000400064O005100023O00020020300002000200252O001200045O0012200005002E3O0012200006002F4O0050000400064O005100023O00020020300002000200252O001200045O001220000500303O001220000600314O0050000400064O005100023O0002002030000200020032001224000400334O0034000500014O004F000400054O004000023O0001001220000200344O0028000300033O0026380002006D000100340004443O006D0001001220000300343O00263800030070000100340004443O00700001001224000400353O00203A0004000400362O0014000400010001001224000400373O001224000500163O0020300005000500382O004F000500064O002A00043O00060004443O00A000010020300009000800392O0012000B5O001220000C003A3O001220000D003B4O0050000B000D4O005100093O0002000629000900A000013O0004443O00A00001001220000900344O0028000A000A3O00263800090085000100340004443O00850001001220000A00343O002638000A0088000100340004443O008800012O000C000B3O00032O000C000C00014O0034000D00084O0016000C00010001001006000B001E000C003043000B0021003C001224000C00133O00203A000C000C001A00203A000C000C003E00203A000C000C003F001006000B003D000C2O00340001000B3O001224000B00193O002030000B000B0040001224000D00334O0034000E00014O004F000D000E4O0040000B3O00010004443O00A000010004443O008800010004443O00A000010004443O008500010006230004007B000100020004443O007B00010004443O006B00010004443O007000010004443O006B00010004443O006D00010004443O006B0001001224000200013O0020300002000200022O001200045O001220000500413O001220000600424O0050000400064O005100023O000200203A00020002001500203A00020002004300203000020002004400062200043O000100012O00468O00520002000400010004443O00B6000100203A00013O001E2O00193O00013O00013O000B3O00028O0003043O0067616D65030A3O0047657453657276696365030B3O00F15D6200AC1FCB616311AB03063O007EA7341074D903113O0043617074757265436F6E74726F2O6C6572030B3O00FE273294A118F0FD3D259203073O009CA84E40E0D479030C3O00436C69636B42752O746F6E3203073O00566563746F72322O033O006E6577001B3O0012203O00013O0026383O0001000100010004443O00010001001224000100023O0020300001000100032O001200035O001220000400043O001220000500054O0050000300054O005100013O00020020300001000100062O0031000100020001001224000100023O0020300001000100032O001200035O001220000400073O001220000500084O0050000300054O005100013O00020020300001000100090012240003000A3O00203A00030003000B2O004D000300014O004000013O00010004443O001A00010004443O000100012O00193O00017O00",v17(),...);
-- âš ï¸ WARNING: integrity protected!
--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.9.21) ~  Much Love, Ferib 

]]--
           
