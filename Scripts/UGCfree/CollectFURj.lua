local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v24,v25) local v26={};for v42=1, #v24 do v6(v26,v0(v4(v1(v2(v24,v42,v42 + 1 )),v1(v2(v25,1 + (v42% #v25) ,1 + (v42% #v25) + 1 )))%256 ));end return v5(v26);end local v8=tonumber;local v9=string.byte;local v10=string.char;local v11=string.sub;local v12=string.gsub;local v13=string.rep;local v14=table.concat;local v15=table.insert;local v16=math.ldexp;local v17=getfenv or function() return _ENV;end ;local v18=setmetatable;local v19=pcall;local v20=select;local v21=unpack or table.unpack ;local v22=tonumber;local function v23(v27,v28,...) local v29=0;local v30;local v31;local v32;local v33;local v34;local v35;local v36;local v37;local v38;local v39;local v40;local v41;while true do if (v29==0) then v30=2 -1 ;v31=nil;v27=v12(v11(v27,5),v7("\108\169","\130\66\135\60\27\17\89"),function(v43) if (v9(v43,2)==79) then local v79=0;while true do if (v79==0) then v31=v8(v11(v43,1,1));return "";end end else local v80=0;local v81;while true do if (v80==0) then v81=v10(v8(v43,16));if v31 then local v121=0;local v122;while true do if (0==v121) then v122=v13(v81,v31);v31=nil;v121=1;end if (v121==1) then return v122;end end else return v81;end break;end end end end);v29=1;end if (v29==5) then v38=v35;v39=nil;function v39(...) return {...},v20("#",...);end v29=6;end if (v29==1) then v32=nil;function v32(v44,v45,v46) if v46 then local v82=0;local v83;while true do if (v82==0) then v83=(v44/(2^(v45-1)))%(2^(((v46-1) -(v45-1)) + 1)) ;return v83-(v83%(2 -1)) ;end end else local v84=0;local v85;while true do if (v84==0) then v85=2^(v45-1) ;return (((v44%(v85 + v85))>=v85) and (1 -0)) or 0 ;end end end end v33=nil;v29=2;end if (v29==6) then v40=nil;function v40() local v47=0;local v48;local v49;local v50;local v51;local v52;local v53;while true do if (1==v47) then v52=v35();v53={};for v90=1,v52 do local v91=v33();local v92;if (v91==1) then v92=v33()~=0 ;elseif (v91==2) then v92=v36();elseif (v91==3) then v92=v37();end v53[v90]=v92;end v51[3]=v33();v47=2;end if (v47==2) then for v94=1,v35() do local v95=v33();if (v32(v95,1,1)==0) then local v117=0;local v118;local v119;local v120;while true do if (v117==2) then if (v32(v119,1,1)==1) then v120[2]=v53[v120[1272 -(226 + 1044) ]];end if (v32(v119,2,2)==(4 -3)) then v120[3]=v53[v120[3]];end v117=3;end if (1==v117) then v120={v34(),v34(),nil,nil};if (v118==(0 + 0)) then local v134=0;while true do if (0==v134) then v120[3]=v34();v120[5 -1 ]=v34();break;end end elseif (v118==1) then v120[3]=v35();elseif (v118==2) then v120[3]=v35() -(2^16) ;elseif (v118==3) then local v141=0;while true do if (0==v141) then v120[1068 -(68 + 997) ]=v35() -(2^16) ;v120[4]=v34();break;end end end v117=2;end if (v117==3) then if (v32(v119,3,3)==1) then v120[4]=v53[v120[4]];end v48[v94]=v120;break;end if (v117==0) then v118=v32(v95,1 + 1 ,3);v119=v32(v95,4,883 -(282 + 595) );v117=1;end end end end for v96=118 -(32 + 85) ,v35() do v49[v96-1 ]=v40();end return v51;end if (0==v47) then v48={};v49={};v50={};v51={v48,v49,nil,v50};v47=1;end end end v41=nil;v29=7;end if (v29==3) then v35=nil;function v35() local v54=0;local v55;local v56;local v57;local v58;while true do if (v54==0) then v55,v56,v57,v58=v9(v27,v30,v30 + 3 );v30=v30 + 4 ;v54=1;end if (v54==1) then return (v58 * 16777216) + (v57 * 65536) + (v56 * 256) + v55 ;end end end v36=nil;v29=4;end if (v29==7) then function v41(v59,v60,v61) local v62=0;local v63;local v64;local v65;while true do if (v62==0) then v63=v59[1];v64=v59[2];v62=1;end if (v62==1) then v65=v59[3];return function(...) local v98=v63;local v99=v64;local v100=v65;local v101=v39;local v102=1;local v103= -1;local v104={};local v105={...};local v106=v20("#",...) -(1 + 0) ;local v107={};local v108={};for v115=0,v106 do if (v115>=v100) then v104[v115-v100 ]=v105[v115 + 1 ];else v108[v115]=v105[v115 + 1 ];end end local v109=(v106-v100) + 1 ;local v110;local v111;while true do local v116=0;while true do if (v116==1) then if (v111<=18) then if (v111<=8) then if (v111<=3) then if (v111<=1) then if (v111==0) then local v142=0;local v143;while true do if (v142==0) then v143=v110[2];do return v21(v108,v143,v103);end break;end end else do return;end end elseif (v111==2) then v108[v110[2]]=v110[3];else local v146=0;local v147;while true do if (v146==0) then v147=v110[2];v108[v147]=v108[v147](v21(v108,v147 + 1 ,v110[3]));break;end end end elseif (v111<=5) then if (v111==4) then local v148=0;local v149;local v150;local v151;local v152;local v153;while true do if (v148==3) then v110=v98[v102];v108[v110[2]]=v60[v110[3]];v102=v102 + 1 ;v110=v98[v102];v108[v110[2]]=v108[v110[3]];v148=4;end if (v148==4) then v102=v102 + 1 ;v110=v98[v102];for v311=v110[2],v110[3] do v108[v311]=nil;end v102=v102 + 1 ;v110=v98[v102];v148=5;end if (v148==1) then v102=v102 + 1 ;v110=v98[v102];v108[v110[2]]=v60[v110[3]];v102=v102 + 1 ;v110=v98[v102];v148=2;end if (v148==2) then v108[v110[1 + 1 ]]=v60[v110[3]];v102=v102 + 1 ;v110=v98[v102];v108[v110[2]]={};v102=v102 + 1 ;v148=3;end if (0==v148) then v149=nil;v150=nil;v151,v152=nil;v153=nil;v108[v110[2]]=v60[v110[3]];v148=1;end if (v148==6) then v102=v102 + 1 ;v110=v98[v102];v153=v110[959 -(892 + 65) ];v149=v108[v153];for v313=v153 + 1 ,v103 do v15(v149,v108[v313]);end break;end if (5==v148) then v153=v110[2];v151,v152=v101(v108[v153](v21(v108,v153 + 1 ,v110[3])));v103=(v152 + v153) -1 ;v150=0;for v314=v153,v103 do local v315=0;while true do if (v315==0) then v150=v150 + 1 ;v108[v314]=v151[v150];break;end end end v148=6;end end else local v154=0;local v155;local v156;local v157;while true do if (v154==0) then v155=v110[2];v156=v108[v155];v154=1;end if (v154==1) then v157=v108[v155 + 2 ];if (v157>0) then if (v156>v108[v155 + 1 ]) then v102=v110[3];else v108[v155 + (7 -4) ]=v156;end elseif (v156<v108[v155 + 1 ]) then v102=v110[3];else v108[v155 + 3 ]=v156;end break;end end end elseif (v111<=(10 -4)) then v108[v110[3 -1 ]]=v61[v110[3]];v102=v102 + 1 ;v110=v98[v102];v108[v110[352 -(87 + 263) ]]=v108[v110[3]][v110[4]];v102=v102 + 1 ;v110=v98[v102];v108[v110[2]]=v61[v110[3]];v102=v102 + 1 ;v110=v98[v102];v108[v110[2]]=v108[v110[3]][v110[4]];v102=v102 + 1 ;v110=v98[v102];v108[v110[2]]=v61[v110[3]];v102=v102 + 1 ;v110=v98[v102];v108[v110[2]]=v108[v110[3]][v110[4]];v102=v102 + 1 ;v110=v98[v102];v108[v110[2]]=v61[v110[3]];v102=v102 + 1 ;v110=v98[v102];if  not v108[v110[2]] then v102=v102 + 1 ;else v102=v110[3];end elseif (v111>7) then local v233=0;local v234;local v235;local v236;local v237;while true do if (v233==7) then v108[v237]=v108[v237](v21(v108,v237 + 1 ,v103));v102=v102 + 1 ;v110=v98[v102];v233=8;end if (v233==4) then v110=v98[v102];v237=v110[2];v235,v236=v101(v108[v237](v21(v108,v237 + 1 ,v110[3])));v233=5;end if (v233==3) then v110=v98[v102];v108[v110[2]]=v110[3];v102=v102 + 1 ;v233=4;end if (v233==6) then v102=v102 + 1 ;v110=v98[v102];v237=v110[2];v233=7;end if (v233==2) then v237=v110[2];v108[v237]=v108[v237](v21(v108,v237 + 1 ,v110[3]));v102=v102 + 1 ;v233=3;end if (v233==1) then v108[v110[2]]=v110[3];v102=v102 + 1 ;v110=v98[v102];v233=2;end if (0==v233) then v234=nil;v235,v236=nil;v237=nil;v233=1;end if (5==v233) then v103=(v236 + v237) -1 ;v234=0;for v381=v237,v103 do local v382=0;while true do if (v382==0) then v234=v234 + 1 ;v108[v381]=v235[v234];break;end end end v233=6;end if (8==v233) then if (v108[v110[182 -(67 + 113) ]]==v110[3 + 1 ]) then v102=v102 + 1 ;else v102=v110[3];end break;end end else v108[v110[2]]={};end elseif (v111<=13) then if (v111<=10) then if (v111>9) then v108[v110[2]]=v108[v110[3]];else v108[v110[2]]=v108[v110[7 -4 ]] + v110[4] ;end elseif (v111<=11) then local v167=0;local v168;local v169;while true do if (v167==0) then v168=v110[2];v169=v108[v168];v167=1;end if (v167==1) then for v316=v168 + 1 ,v103 do v15(v169,v108[v316]);end break;end end elseif (v111==12) then v108[v110[2 + 0 ]]=v110[3] + v108[v110[4]] ;else v108[v110[2]]= #v108[v110[11 -8 ]];end elseif (v111<=15) then if (v111>14) then if  not v108[v110[954 -(802 + 150) ]] then v102=v102 + 1 ;else v102=v110[3];end else local v170=0;local v171;local v172;while true do if (v170==1) then v108[v171 + 1 ]=v172;v108[v171]=v172[v110[4]];break;end if (v170==0) then v171=v110[2];v172=v108[v110[3]];v170=1;end end end elseif (v111<=(42 -26)) then v108[v110[2]]=v108[v110[3]][v110[4]];elseif (v111>17) then local v242=v110[2];local v243,v244=v101(v108[v242](v21(v108,v242 + 1 ,v103)));v103=(v244 + v242) -1 ;local v245=0;for v300=v242,v103 do local v301=0;while true do if (0==v301) then v245=v245 + 1 ;v108[v300]=v243[v245];break;end end end else local v246=0;local v247;local v248;local v249;local v250;while true do if (v246==1) then v103=(v249 + v247) -1 ;v250=0;v246=2;end if (v246==0) then v247=v110[2];v248,v249=v101(v108[v247](v21(v108,v247 + 1 ,v110[3])));v246=1;end if (v246==2) then for v385=v247,v103 do v250=v250 + 1 ;v108[v385]=v248[v250];end break;end end end elseif (v111<=27) then if (v111<=(39 -17)) then if (v111<=(15 + 5)) then if (v111==19) then local v175;local v176,v177;local v178;v108[v110[2]]=v108[v110[3]];v102=v102 + (998 -(915 + 82)) ;v110=v98[v102];v108[v110[2]]=v60[v110[3]];v102=v102 + 1 ;v110=v98[v102];v108[v110[2]]=v60[v110[3]];v102=v102 + 1 ;v110=v98[v102];v108[v110[2]]=v60[v110[3]];v102=v102 + 1 ;v110=v98[v102];v108[v110[2]]=v60[v110[8 -5 ]];v102=v102 + 1 ;v110=v98[v102];v108[v110[2]]=v108[v110[3]];v102=v102 + 1 ;v110=v98[v102];v108[v110[2]]=v108[v110[3]];v102=v102 + 1 ;v110=v98[v102];v108[v110[2]]=v108[v110[3]] + v110[3 + 1 ] ;v102=v102 + 1 ;v110=v98[v102];v178=v110[2 -0 ];v176,v177=v101(v108[v178](v21(v108,v178 + 1 ,v110[3])));v103=(v177 + v178) -1 ;v175=0;for v209=v178,v103 do local v210=0;while true do if (v210==0) then v175=v175 + 1 ;v108[v209]=v176[v175];break;end end end v102=v102 + (1188 -(1069 + 118)) ;v110=v98[v102];v178=v110[2];v108[v178]=v108[v178](v21(v108,v178 + (2 -1) ,v103));v102=v102 + 1 ;v110=v98[v102];v108[v110[2]]=v60[v110[3]];v102=v102 + (1 -0) ;v110=v98[v102];v108[v110[2]]=v60[v110[3]];v102=v102 + 1 ;v110=v98[v102];v108[v110[2]]=v108[v110[3]];v102=v102 + 1 ;v110=v98[v102];v108[v110[2]]= #v108[v110[3]];v102=v102 + 1 ;v110=v98[v102];v108[v110[2]]=v108[v110[1 + 2 ]]%v108[v110[4]] ;v102=v102 + 1 ;v110=v98[v102];v108[v110[2]]=v110[3] + v108[v110[4]] ;v102=v102 + (1 -0) ;v110=v98[v102];v108[v110[2]]= #v108[v110[3]];v102=v102 + 1 ;v110=v98[v102];v108[v110[2 + 0 ]]=v108[v110[3]]%v108[v110[4]] ;v102=v102 + 1 ;v110=v98[v102];v108[v110[2]]=v110[3] + v108[v110[4]] ;v102=v102 + 1 ;v110=v98[v102];v108[v110[2]]=v108[v110[3]] + v110[4] ;v102=v102 + 1 ;v110=v98[v102];v178=v110[2];v176,v177=v101(v108[v178](v21(v108,v178 + 1 ,v110[794 -(368 + 423) ])));v103=(v177 + v178) -1 ;v175=0;for v211=v178,v103 do local v212=0;while true do if (v212==0) then v175=v175 + 1 ;v108[v211]=v176[v175];break;end end end v102=v102 + 1 ;v110=v98[v102];v178=v110[2];v176,v177=v101(v108[v178](v21(v108,v178 + 1 ,v103)));v103=(v177 + v178) -(3 -2) ;v175=0;for v213=v178,v103 do local v214=0;while true do if (v214==0) then v175=v175 + 1 ;v108[v213]=v176[v175];break;end end end v102=v102 + 1 ;v110=v98[v102];v178=v110[2];v108[v178]=v108[v178](v21(v108,v178 + (19 -(10 + 8)) ,v103));v102=v102 + 1 ;v110=v98[v102];v108[v110[7 -5 ]]=v108[v110[3]]%v110[4] ;v102=v102 + 1 ;v110=v98[v102];v178=v110[2];v176,v177=v101(v108[v178](v108[v178 + 1 ]));v103=(v177 + v178) -1 ;v175=0;for v215=v178,v103 do v175=v175 + 1 ;v108[v215]=v176[v175];end v102=v102 + 1 ;v110=v98[v102];v178=v110[2];v108[v178](v21(v108,v178 + 1 ,v103));else local v189=0;local v190;local v191;local v192;local v193;while true do if (v189==0) then v190=v110[2];v191,v192=v101(v108[v190](v108[v190 + 1 ]));v189=1;end if (1==v189) then v103=(v192 + v190) -1 ;v193=442 -(416 + 26) ;v189=2;end if (v189==2) then for v323=v190,v103 do v193=v193 + 1 ;v108[v323]=v191[v193];end break;end end end elseif (v111==21) then v108[v110[2]]=v108[v110[3]]%v108[v110[4]] ;else local v195=0;local v196;while true do if (v195==0) then v196=v110[2];v108[v196](v21(v108,v196 + 1 ,v103));break;end end end elseif (v111<=24) then if (v111>23) then local v197=0;local v198;while true do if (v197==0) then v198=v110[2];v108[v198]=v108[v198](v21(v108,v198 + 1 ,v103));break;end end else local v199=v99[v110[3]];local v200;local v201={};v200=v18({},{[v7("\117\241\124\116\64\79\214","\36\42\174\21\26")]=function(v218,v219) local v220=0;local v221;while true do if (v220==0) then v221=v201[v219];return v221[1][v221[2]];end end end,[v7("\47\8\175\75\7\62\175\74\21\47","\46\112\87\193")]=function(v222,v223,v224) local v225=v201[v223];v225[1][v225[2]]=v224;end});for v227=1,v110[4] do v102=v102 + 1 ;local v228=v98[v102];if (v228[1]==10) then v201[v227-1 ]={v108,v228[9 -6 ]};else v201[v227-1 ]={v60,v228[3]};end v107[ #v107 + 1 + 0 ]=v201;end v108[v110[2]]=v41(v199,v200,v61);end elseif (v111<=25) then v108[v110[2]]=v61[v110[3]];elseif (v111>26) then v108[v110[2]]=v60[v110[3]];else local v253=0;local v254;local v255;local v256;while true do if (v253==1) then v102=v102 + (1 -0) ;v110=v98[v102];v108[v110[440 -(145 + 293) ]]=v110[3];v102=v102 + 1 ;v253=2;end if (v253==4) then v255=v108[v256];v254=v108[v256 + 2 ];if (v254>0) then if (v255>v108[v256 + 1 ]) then v102=v110[3];else v108[v256 + 3 ]=v255;end elseif (v255<v108[v256 + 1 ]) then v102=v110[3];else v108[v256 + 3 ]=v255;end break;end if (v253==3) then v108[v110[2]]=v110[433 -(44 + 386) ];v102=v102 + 1 ;v110=v98[v102];v256=v110[2];v253=4;end if (v253==2) then v110=v98[v102];v108[v110[2]]= #v108[v110[3]];v102=v102 + 1 ;v110=v98[v102];v253=3;end if (v253==0) then v254=nil;v255=nil;v256=nil;v108[v110[2]]={};v253=1;end end end elseif (v111<=32) then if (v111<=29) then if (v111>28) then if v108[v110[2]] then v102=v102 + 1 ;else v102=v110[3];end elseif (v108[v110[2]]==v110[4]) then v102=v102 + 1 ;else v102=v110[3];end elseif (v111<=30) then v108[v110[1488 -(998 + 488) ]]=v108[v110[3]]%v110[4] ;elseif (v111>31) then local v259=0;local v260;local v261;local v262;while true do if (v259==0) then v260=v110[2];v261=v108[v260 + 2 ];v259=1;end if (v259==1) then v262=v108[v260] + v261 ;v108[v260]=v262;v259=2;end if (v259==2) then if (v261>0) then if (v262<=v108[v260 + 1 ]) then local v406=0;while true do if (v406==0) then v102=v110[3];v108[v260 + 1 + 2 ]=v262;break;end end end elseif (v262>=v108[v260 + 1 ]) then local v407=0;while true do if (v407==0) then v102=v110[3 + 0 ];v108[v260 + 3 ]=v262;break;end end end break;end end else for v308=v110[2],v110[3] do v108[v308]=nil;end end elseif (v111<=(806 -(201 + 571))) then if (v111>33) then v108[v110[2]]();else v102=v110[3];end elseif (v111<=35) then local v207=0;local v208;while true do if (v207==0) then v208=v110[1140 -(116 + 1022) ];do return v108[v208](v21(v108,v208 + 1 ,v110[3]));end break;end end elseif (v111>36) then local v263=0;local v264;local v265;local v266;local v267;local v268;while true do if (v263==6) then v103=(v266 + v268) -1 ;v264=0;for v388=v268,v103 do v264=v264 + 1 ;v108[v388]=v265[v264];end v102=v102 + 1 ;v263=7;end if (v263==2) then v267=v108[v110[3]];v108[v268 + 1 ]=v267;v108[v268]=v267[v110[4]];v102=v102 + 1 ;v263=3;end if (5==v263) then v102=v102 + 1 ;v110=v98[v102];v268=v110[2 + 0 ];v265,v266=v101(v108[v268](v21(v108,v268 + (3 -2) ,v110[3])));v263=6;end if (v263==8) then v264=0;for v391=v268,v103 do local v392=0;while true do if (v392==0) then v264=v264 + (3 -2) ;v108[v391]=v265[v264];break;end end end v102=v102 + 1 ;v110=v98[v102];v263=9;end if (0==v263) then v264=nil;v265,v266=nil;v267=nil;v268=nil;v263=1;end if (v263==4) then v108[v110[2]]=v110[3];v102=v102 + 1 ;v110=v98[v102];v108[v110[2]]=v110[3];v263=5;end if (v263==1) then v108[v110[2]]=v61[v110[3]];v102=v102 + 1 ;v110=v98[v102];v268=v110[2];v263=2;end if (v263==9) then v268=v110[861 -(814 + 45) ];v108[v268]=v108[v268](v21(v108,v268 + 1 ,v103));v102=v102 + 1 ;v110=v98[v102];v263=10;end if (v263==10) then v108[v110[2]]();v102=v102 + 1 ;v110=v98[v102];v102=v110[3];break;end if (v263==7) then v110=v98[v102];v268=v110[2];v265,v266=v101(v108[v268](v21(v108,v268 + 1 ,v103)));v103=(v266 + v268) -1 ;v263=8;end if (v263==3) then v110=v98[v102];v108[v110[2]]=v60[v110[3]];v102=v102 + (4 -3) ;v110=v98[v102];v263=4;end end else do return v108[v110[2]]();end end v102=v102 + 1 ;break;end if (0==v116) then v110=v98[v102];v111=v110[1];v116=1;end end end end;end end end return v41(v40(),{},v28)(...);end if (4==v29) then function v36() local v66=v35();local v67=v35();local v68=1;local v69=(v32(v67,1,20) * (2^32)) + v66 ;local v70=v32(v67,21,79 -48 );local v71=((v32(v67,32)==1) and  -(620 -(555 + 64))) or 1 ;if (v70==(931 -(857 + 74))) then if (v69==(568 -(367 + 201))) then return v71 * 0 ;else local v112=0;while true do if (0==v112) then v70=1;v68=0;break;end end end elseif (v70==2047) then return ((v69==0) and (v71 * (1/(927 -(214 + 713))))) or (v71 * NaN) ;end return v16(v71,v70-1023 ) * (v68 + (v69/(2^52))) ;end v37=nil;function v37(v72) local v73=0;local v74;local v75;while true do if (v73==2) then v75={};for v113=1, #v74 do v75[v113]=v10(v9(v11(v74,v113,v113)));end v73=3;end if (v73==3) then return v14(v75);end if (1==v73) then v74=v11(v27,v30,(v30 + v72) -1 );v30=v30 + v72 ;v73=2;end if (v73==0) then v74=nil;if  not v72 then v72=v35();if (v72==0) then return "";end end v73=1;end end end v29=5;end if (v29==2) then function v33() local v76=v9(v27,v30,v30);v30=v30 + 1 ;return v76;end v34=nil;function v34() local v77,v78=v9(v27,v30,v30 + 2 );v30=v30 + 2 ;return (v78 * 256) + v77 ;end v29=3;end end end return v23("LOL!0D3O0003063O00737472696E6703043O006368617203043O00627974652O033O0073756203053O0062697433322O033O0062697403043O0062786F7203053O007461626C6503063O00636F6E63617403063O00696E7365727403053O006D6174636803083O00746F6E756D62657203053O007063612O6C00243O0012063O00013O00206O000200122O000100013O00202O00010001000300122O000200013O00202O00020002000400122O000300053O00062O0003000A000100010004213O000A0001001219000300063O002010000400030007001219000500083O002010000500050009001219000600083O00201000060006000A00061700073O000100062O000A3O00064O000A8O000A3O00044O000A3O00014O000A3O00024O000A3O00053O001219000800013O00201000080008000B0012190009000C3O001219000A000D3O000617000B0001000100052O000A3O00074O000A3O00094O000A3O00084O000A3O000A4O000A3O000B4O000A000C000B4O0024000C00016O000C6O00013O00013O00023O00023O00026O00F03F026O00704002264O001A00025O00122O000300016O00045O00122O000500013O00042O0003002100012O001B00076O0013000800026O000900016O000A00026O000B00036O000C00046O000D8O000E00063O00202O000F000600014O000C000F6O000B3O00024O000C00036O000D00046O000E00016O000F00016O000F0006000F00102O000F0001000F4O001000016O00100006001000102O00100001001000202O0010001000014O000D00106O000C8O000A3O000200202O000A000A00024O0009000A6O00073O00010004200003000500012O001B000300054O000A000400024O0023000300046O00036O00013O00017O00043O00027O004003053O003A25642B3A2O033O0025642B026O00F03F001C3O0006175O000100012O001B8O0004000100016O000200026O000300026O00048O000500036O00068O000700076O000500076O00043O0001002010000400040001001208000500026O00030005000200122O000400036O000200046O00013O000200262O00010018000100040004213O001800012O000A00016O000700026O0023000100026O00015O0004213O001B00012O001B000100044O0024000100016O00016O00013O00013O00013O00063O00030A3O006C6F6164737472696E6703043O0067616D6503073O00482O747047657403673O00D9D7CF35F5E18851C3C2CC6BE1B2D316C4C1CE36E3A9C411DFD7DE2BF2F5C411DC8CF42BE398D51BD0D7D437DEF4E810D4E0C920E7AFC80CE98CD624EFB5882DD2D1D235F2A8882BF6E0DD37E3BE8830D8CDDC6AC5B4CB12D4C0CF03D389C214DECAD56BEAAEC603083O007EB1A3BB4586DBA7026O00F03F010F3O00061D3O000D00013O0004213O000D0001001219000100013O001225000200023O00202O0002000200034O00045O00122O000500043O00122O000600056O000400066O00028O00013O00024O00010001000100044O000E000100201000013O00062O00013O00017O00",v17(),...);
-- âš ï¸ WARNING: integrity protected!
--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.5) ~  Much Love, Ferib 

]]--
