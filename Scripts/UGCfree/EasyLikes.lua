local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v24,v25)local v26={};for v41=1, #v24 do v6(v26,v0(v4(v1(v2(v24,v41,v41 + 1 )),v1(v2(v25,1 + (v41% #v25) ,1 + (v41% #v25) + 1 )))%256 ));end return v5(v26);end local v8=tonumber;local v9=string.byte;local v10=string.char;local v11=string.sub;local v12=string.gsub;local v13=string.rep;local v14=table.concat;local v15=table.insert;local v16=math.ldexp;local v17=getfenv or function()return _ENV;end ;local v18=setmetatable;local v19=pcall;local v20=select;local v21=unpack or table.unpack ;local v22=tonumber;local function v23(v27,v28,...)local v29=1;local v30;v27=v12(v11(v27,5),v7("\5\137","\203\43\167\55\126"),function(v42)if (v9(v42,2)==79) then local v88=0;while true do if (v88==0) then v30=v8(v11(v42,1,1));return "";end end else local v89=0;local v90;while true do if (v89==0) then v90=v10(v8(v42,16));if v30 then local v118=v13(v90,v30);v30=nil;return v118;else return v90;end break;end end end end);local function v31(v43,v44,v45)if v45 then local v91=(v43/(2^(v44-1)))%(2^(((v45-1) -(v44-1)) + 1)) ;return v91-(v91%1) ;else local v92=2^(v44-(2 -1)) ;return (((v43%(v92 + v92))>=v92) and 1) or 0 ;end end local function v32()local v46=v9(v27,v29,v29);v29=v29 + 1 ;return v46;end local function v33()local v47,v48=v9(v27,v29,v29 + 2 );v29=v29 + 2 ;return (v48 * 256) + v47 ;end local function v34()local v49=0;local v50;local v51;local v52;local v53;while true do if (v49==0) then v50,v51,v52,v53=v9(v27,v29,v29 + 3 );v29=v29 + 4 ;v49=1;end if (v49==1) then return (v53 * 16777216) + (v52 * 65536) + (v51 * 256) + v50 ;end end end local function v35()local v54=v34();local v55=v34();local v56=1;local v57=(v31(v55,1,20) * (2^32)) + v54 ;local v58=v31(v55,21,31);local v59=((v31(v55,32)==1) and  -1) or 1 ;if (v58==0) then if (v57==0) then return v59 * 0 ;else v58=1;v56=0;end elseif (v58==2047) then return ((v57==(0 -0)) and (v59 * (1/0))) or (v59 * NaN) ;end return v16(v59,v58-1023 ) * (v56 + (v57/(2^52))) ;end local function v36(v60)local v61;if  not v60 then local v93=0;while true do if (0==v93) then v60=v34();if (v60==0) then return "";end break;end end end v61=v11(v27,v29,(v29 + v60) -1 );v29=v29 + v60 ;local v62={};for v77=1, #v61 do v62[v77]=v10(v9(v11(v61,v77,v77)));end return v14(v62);end local v37=v34;local function v38(...)return {...},v20("#",...);end local function v39()local v63={};local v64={};local v65={};local v66={v63,v64,nil,v65};local v67=v34();local v68={};for v79=1,v67 do local v80=0;local v81;local v82;while true do if (v80==0) then v81=v32();v82=nil;v80=1;end if (v80==1) then if (v81==1) then v82=v32()~=0 ;elseif (v81==2) then v82=v35();elseif (v81==(5 -2)) then v82=v36();end v68[v79]=v82;break;end end end v66[3]=v32();for v83=1,v34() do local v84=0;local v85;while true do if (0==v84) then v85=v32();if (v31(v85,1,1)==0) then local v114=0;local v115;local v116;local v117;while true do if (v114==1) then v117={v33(),v33(),nil,nil};if (v115==0) then v117[3]=v33();v117[4]=v33();elseif (v115==1) then v117[3]=v34();elseif (v115==2) then v117[3]=v34() -(2^(635 -(555 + 64))) ;elseif (v115==(934 -(857 + 74))) then local v136=0;while true do if (v136==0) then v117[3]=v34() -(2^16) ;v117[4]=v33();break;end end end v114=2;end if (v114==2) then if (v31(v116,1,1)==1) then v117[2]=v68[v117[570 -(367 + 201) ]];end if (v31(v116,2,2)==1) then v117[3]=v68[v117[3]];end v114=3;end if (0==v114) then v115=v31(v85,2,7 -4 );v116=v31(v85,4,6);v114=1;end if (v114==3) then if (v31(v116,3,930 -(214 + 713) )==1) then v117[4]=v68[v117[4]];end v63[v83]=v117;break;end end end break;end end end for v86=1 + 0 ,v34() do v64[v86-(1 + 0) ]=v39();end return v66;end local function v40(v70,v71,v72)local v73=0;local v74;local v75;local v76;while true do if (v73==1) then v76=v70[3];return function(...)local v98=v74;local v99=v75;local v100=v76;local v101=v38;local v102=1;local v103= -1;local v104={};local v105={...};local v106=v20("#",...) -1 ;local v107={};local v108={};for v112=0,v106 do if (v112>=v100) then v104[v112-v100 ]=v105[v112 + 1 ];else v108[v112]=v105[v112 + (878 -(282 + 595)) ];end end local v109=(v106-v100) + 1 ;local v110;local v111;while true do local v113=0;while true do if (v113==0) then v110=v98[v102];v111=v110[1];v113=1;end if (v113==1) then if (v111<=(1681 -(1523 + 114))) then if (v111<=21) then if (v111<=10) then if (v111<=4) then if (v111<=1) then if (v111==0) then local v139=v110[2];do return v21(v108,v139,v103);end else local v140=0;local v141;local v142;local v143;while true do if (v140==1) then v143=0 + 0 ;for v351=v141,v110[4] do local v352=0;while true do if (v352==0) then v143=v143 + 1 ;v108[v351]=v142[v143];break;end end end break;end if (v140==0) then v141=v110[2];v142={v108[v141](v21(v108,v141 + 1 ,v103))};v140=1;end end end elseif (v111<=2) then v108[v110[2]]=v110[3];elseif (v111==3) then local v227=0;local v228;local v229;local v230;while true do if (v227==1) then v230=0;for v413=v228,v110[4] do v230=v230 + (1066 -(68 + 997)) ;v108[v413]=v229[v230];end break;end if (v227==0) then v228=v110[2];v229={v108[v228](v21(v108,v228 + (1 -0) ,v103))};v227=1;end end else local v231=0;local v232;while true do if (v231==0) then v232=v110[2];v108[v232](v108[v232 + 1 ]);break;end end end elseif (v111<=7) then if (v111<=5) then if (v108[v110[2]]==v110[4]) then v102=v102 + 1 ;else v102=v110[3];end elseif (v111==6) then if  not v108[v110[2]] then v102=v102 + 1 ;else v102=v110[3];end else v102=v110[3];end elseif (v111<=8) then local v146=0;local v147;while true do if (v146==0) then v147=v110[2];v108[v147](v21(v108,v147 + 1 ,v103));break;end end elseif (v111>9) then if (v108[v110[2]]<=v108[v110[1274 -(226 + 1044) ]]) then v102=v102 + 1 ;else v102=v110[3];end else v108[v110[2]]=v71[v110[3]];end elseif (v111<=15) then if (v111<=12) then if (v111>11) then v108[v110[2]]=v108[v110[3]];else local v150=v110[2];local v151,v152=v101(v108[v150](v21(v108,v150 + 1 ,v103)));v103=(v152 + v150) -1 ;local v153=0;for v203=v150,v103 do v153=v153 + 1 ;v108[v203]=v151[v153];end end elseif (v111<=13) then do return;end elseif (v111>14) then local v237=0;local v238;local v239;while true do if (v237==0) then v238=v110[2];v239={};v237=1;end if (v237==1) then for v416=1, #v107 do local v417=0;local v418;while true do if (v417==0) then v418=v107[v416];for v463=0, #v418 do local v464=0;local v465;local v466;local v467;while true do if (0==v464) then v465=v418[v463];v466=v465[1];v464=1;end if (v464==1) then v467=v465[2];if ((v466==v108) and (v467>=v238)) then local v477=0;while true do if (v477==0) then v239[v467]=v466[v467];v465[1]=v239;break;end end end break;end end end break;end end end break;end end else v108[v110[2]]=v110[12 -9 ] + v108[v110[4]] ;end elseif (v111<=18) then if (v111<=16) then if (v108[v110[2]]==v110[4]) then v102=v102 + 1 ;else v102=v110[3];end elseif (v111>(134 -(32 + 85))) then local v242=v110[2];local v243=v108[v242 + 2 ];local v244=v108[v242] + v243 ;v108[v242]=v244;if (v243>0) then if (v244<=v108[v242 + 1 ]) then local v419=0;while true do if (v419==0) then v102=v110[3];v108[v242 + 3 ]=v244;break;end end end elseif (v244>=v108[v242 + 1 + 0 ]) then v102=v110[3];v108[v242 + 3 ]=v244;end elseif (v108[v110[2]]<=v108[v110[4]]) then v102=v102 + 1 ;else v102=v110[3];end elseif (v111<=19) then local v154=v110[1 + 1 ];local v155=v110[961 -(892 + 65) ];local v156=v154 + 2 ;local v157={v108[v154](v108[v154 + 1 ],v108[v156])};for v206=2 -1 ,v155 do v108[v156 + v206 ]=v157[v206];end local v158=v157[1];if v158 then local v246=0;while true do if (v246==0) then v108[v156]=v158;v102=v110[3];break;end end else v102=v102 + 1 ;end elseif (v111==20) then local v247=v110[2];v108[v247]=v108[v247](v21(v108,v247 + 1 ,v103));else local v249=0;local v250;local v251;local v252;local v253;while true do if (v249==2) then for v422=v250,v103 do v253=v253 + 1 ;v108[v422]=v251[v253];end break;end if (v249==1) then v103=(v252 + v250) -1 ;v253=0;v249=2;end if (v249==0) then v250=v110[2];v251,v252=v101(v108[v250](v21(v108,v250 + 1 ,v103)));v249=1;end end end elseif (v111<=32) then if (v111<=26) then if (v111<=23) then if (v111==22) then local v159=v110[2];local v160=v108[v110[3]];v108[v159 + 1 ]=v160;v108[v159]=v160[v110[4]];else local v164=0;local v165;while true do if (v164==0) then v165=v110[2];do return v21(v108,v165,v103);end break;end end end elseif (v111<=24) then v108[v110[2]][v110[3]]=v110[4];elseif (v111>25) then do return v108[v110[2]];end else local v254=0;local v255;while true do if (0==v254) then v255=v110[2];v108[v255]=v108[v255](v21(v108,v255 + 1 ,v103));break;end end end elseif (v111<=29) then if (v111<=27) then v108[v110[2]]=v108[v110[3]] -v108[v110[4]] ;elseif (v111==28) then local v256=v110[2];local v257,v258=v101(v108[v256](v21(v108,v256 + 1 ,v110[3])));v103=(v258 + v256) -(1 -0) ;local v259=0 -0 ;for v339=v256,v103 do v259=v259 + 1 ;v108[v339]=v257[v259];end else v108[v110[2]][v110[3]]=v110[4];end elseif (v111<=30) then v72[v110[3]]=v108[v110[352 -(87 + 263) ]];elseif (v111>31) then local v262=0;local v263;local v264;local v265;local v266;while true do if (v262==1) then v103=(v265 + v263) -1 ;v266=0;v262=2;end if (2==v262) then for v425=v263,v103 do local v426=0;while true do if (0==v426) then v266=v266 + 1 ;v108[v425]=v264[v266];break;end end end break;end if (v262==0) then v263=v110[2];v264,v265=v101(v108[v263](v108[v263 + 1 ]));v262=1;end end elseif v108[v110[2]] then v102=v102 + 1 ;else v102=v110[3];end elseif (v111<=38) then if (v111<=35) then if (v111<=(213 -(67 + 113))) then for v209=v110[2],v110[3] do v108[v209]=nil;end elseif (v111>34) then v108[v110[2]]=v108[v110[3]]%v110[4] ;else v108[v110[2 + 0 ]]={};end elseif (v111<=36) then if ((v110[3]==v7("\154\143\13\40","\49\197\202\67\126\115\100\167")) or (v110[3]==v7("\48\94\203\47\133\88\72","\62\87\59\191\73\224\54"))) then v108[v110[2]]=v72;else v108[v110[2]]=v72[v110[3]];end elseif (v111>37) then local v272=0;local v273;local v274;while true do if (v272==0) then v273=v110[2];v274=v108[v273];v272=1;end if (v272==1) then for v427=v273 + (2 -1) ,v103 do v15(v274,v108[v427]);end break;end end else do return v108[v110[2]]();end end elseif (v111<=41) then if (v111<=(29 + 10)) then local v171=0;local v172;while true do if (v171==0) then v172=v110[2];v108[v172]=v108[v172](v108[v172 + 1 ]);break;end end elseif (v111==40) then v108[v110[7 -5 ]]=v108[v110[3]];else v108[v110[2]]=v108[v110[3]] + v110[4] ;end elseif (v111<=42) then v108[v110[2]][v110[3]]=v108[v110[4]];elseif (v111>43) then local v278=0;local v279;while true do if (v278==0) then v279=v110[954 -(802 + 150) ];v108[v279](v21(v108,v279 + 1 ,v110[3]));break;end end else v108[v110[2]][v110[3]]=v108[v110[4]];end elseif (v111<=(180 -113)) then if (v111<=55) then if (v111<=49) then if (v111<=46) then if (v111==45) then local v175=v110[2];local v176=v108[v175];local v177=v108[v175 + 2 ];if (v177>(0 -0)) then if (v176>v108[v175 + 1 ]) then v102=v110[3];else v108[v175 + 3 ]=v176;end elseif (v176<v108[v175 + 1 ]) then v102=v110[3];else v108[v175 + 3 + 0 ]=v176;end else local v178=v110[999 -(915 + 82) ];do return v108[v178](v21(v108,v178 + 1 ,v110[3]));end end elseif (v111<=47) then if  not v108[v110[2]] then v102=v102 + (2 -1) ;else v102=v110[3];end elseif (v111==(28 + 20)) then v108[v110[2]]= #v108[v110[3]];elseif (v110[2]==v108[v110[4]]) then v102=v102 + 1 ;else v102=v110[3];end elseif (v111<=52) then if (v111<=50) then for v211=v110[2],v110[3] do v108[v211]=nil;end elseif (v111==(66 -15)) then v108[v110[2]]=v108[v110[3]]%v108[v110[4]] ;else local v285=0;local v286;local v287;while true do if (v285==0) then v286=v110[1189 -(1069 + 118) ];v287=v108[v286];v285=1;end if (v285==1) then for v428=v286 + 1 ,v103 do v15(v287,v108[v428]);end break;end end end elseif (v111<=53) then local v179=0;local v180;local v181;local v182;while true do if (v179==1) then v182={};v181=v18({},{[v7("\216\61\243\199\227\7\226","\169\135\98\154")]=function(v362,v363)local v364=v182[v363];return v364[1][v364[4 -2 ]];end,[v7("\244\72\42\81\234\58\198\207\114\60","\168\171\23\68\52\157\83")]=function(v365,v366,v367)local v368=v182[v366];v368[1][v368[2]]=v367;end});v179=2;end if (v179==2) then for v370=1 -0 ,v110[4] do local v371=0;local v372;while true do if (v371==1) then if (v372[1]==40) then v182[v370-1 ]={v108,v372[3]};else v182[v370-1 ]={v71,v372[1 + 2 ]};end v107[ #v107 + 1 ]=v182;break;end if (v371==0) then v102=v102 + 1 ;v372=v98[v102];v371=1;end end end v108[v110[3 -1 ]]=v40(v180,v181,v72);break;end if (v179==0) then v180=v99[v110[3]];v181=nil;v179=1;end end elseif (v111>(54 + 0)) then local v288=0;local v289;while true do if (v288==0) then v289=v110[2];v108[v289]=v108[v289](v108[v289 + 1 ]);break;end end else local v290=0;local v291;while true do if (v290==0) then v291=v110[2];v108[v291]=v108[v291](v21(v108,v291 + 1 ,v110[3]));break;end end end elseif (v111<=(852 -(368 + 423))) then if (v111<=58) then if (v111<=56) then do return;end elseif (v111>57) then do return v108[v110[6 -4 ]];end else v102=v110[21 -(10 + 8) ];end elseif (v111<=59) then local v183=v99[v110[11 -8 ]];local v184;local v185={};v184=v18({},{[v7("\203\78\252\163\33\40\159","\231\148\17\149\205\69\77")]=function(v213,v214)local v215=v185[v214];return v215[1][v215[2]];end,[v7("\191\152\201\254\64\246\142\163\194\227","\159\224\199\167\155\55")]=function(v216,v217,v218)local v219=v185[v217];v219[1][v219[2]]=v218;end});for v221=1,v110[4] do local v222=0;local v223;while true do if (1==v222) then if (v223[1]==(482 -(416 + 26))) then v185[v221-1 ]={v108,v223[2 + 1 ]};else v185[v221-1 ]={v71,v223[4 -1 ]};end v107[ #v107 + (439 -(145 + 293)) ]=v185;break;end if (0==v222) then v102=v102 + 1 ;v223=v98[v102];v222=1;end end end v108[v110[2]]=v40(v183,v184,v72);elseif (v111==60) then v108[v110[2]]=v108[v110[3]]%v110[4] ;elseif v108[v110[2]] then v102=v102 + 1 ;else v102=v110[3];end elseif (v111<=(494 -(44 + 386))) then if (v111<=62) then v108[v110[1488 -(998 + 488) ]]=v108[v110[3]] -v108[v110[4]] ;elseif (v111>63) then local v294=0;local v295;local v296;while true do if (v294==0) then v295=v110[1 + 1 ];v296=v108[v110[3]];v294=1;end if (v294==1) then v108[v295 + 1 ]=v296;v108[v295]=v296[v110[4]];break;end end else v108[v110[2]]=v108[v110[3]]%v108[v110[4]] ;end elseif (v111<=65) then local v188=v110[2];local v189=v110[4];local v190=v188 + 2 ;local v191={v108[v188](v108[v188 + 1 ],v108[v190])};for v224=1,v189 do v108[v190 + v224 ]=v191[v224];end local v192=v191[1];if v192 then v108[v190]=v192;v102=v110[3];else v102=v102 + 1 ;end elseif (v111==66) then local v300=v110[2 + 0 ];local v301,v302=v101(v108[v300](v108[v300 + 1 ]));v103=(v302 + v300) -1 ;local v303=0;for v346=v300,v103 do local v347=0;while true do if (v347==0) then v303=v303 + 1 ;v108[v346]=v301[v303];break;end end end else local v304=0;local v305;while true do if (v304==0) then v305=v110[2];do return v21(v108,v305,v305 + v110[3] );end break;end end end elseif (v111<=78) then if (v111<=72) then if (v111<=69) then if (v111>68) then v108[v110[2]]=v108[v110[3]][v110[4]];elseif (v110[774 -(201 + 571) ]==v108[v110[1142 -(116 + 1022) ]]) then v102=v102 + 1 ;else v102=v110[12 -9 ];end elseif (v111<=70) then local v195=0;local v196;while true do if (v195==0) then v196=v110[2];v108[v196]=v108[v196](v21(v108,v196 + 1 ,v110[3]));break;end end elseif (v111>71) then v108[v110[2]]=v110[3];else v108[v110[2 + 0 ]]= #v108[v110[3]];end elseif (v111<=75) then if (v111<=73) then if (v110[2]<v108[v110[4]]) then v102=v102 + 1 ;else v102=v110[3];end elseif (v111==74) then local v311=0;local v312;local v313;local v314;while true do if (1==v311) then v314=v108[v312] + v313 ;v108[v312]=v314;v311=2;end if (v311==0) then v312=v110[2];v313=v108[v312 + 2 ];v311=1;end if (2==v311) then if (v313>0) then if (v314<=v108[v312 + 1 ]) then v102=v110[3];v108[v312 + 3 ]=v314;end elseif (v314>=v108[v312 + 1 ]) then v102=v110[3];v108[v312 + 3 ]=v314;end break;end end else local v315=0;local v316;local v317;while true do if (1==v315) then for v433=1, #v107 do local v434=v107[v433];for v441=0, #v434 do local v442=0;local v443;local v444;local v445;while true do if (v442==0) then v443=v434[v441];v444=v443[1];v442=1;end if (1==v442) then v445=v443[2];if ((v444==v108) and (v445>=v316)) then v317[v445]=v444[v445];v443[1]=v317;end break;end end end end break;end if (v315==0) then v316=v110[2];v317={};v315=1;end end end elseif (v111<=76) then local v197=v110[2];v108[v197](v108[v197 + 1 ]);elseif (v111>77) then local v318=0;local v319;while true do if (0==v318) then v319=v110[2];v108[v319](v21(v108,v319 + (3 -2) ,v103));break;end end else local v320=0;local v321;local v322;local v323;local v324;while true do if (v320==0) then v321=v110[2];v322,v323=v101(v108[v321](v21(v108,v321 + 1 ,v110[3])));v320=1;end if (2==v320) then for v435=v321,v103 do local v436=0;while true do if (0==v436) then v324=v324 + 1 ;v108[v435]=v322[v324];break;end end end break;end if (v320==1) then v103=(v323 + v321) -1 ;v324=0;v320=2;end end end elseif (v111<=(298 -214)) then if (v111<=81) then if (v111<=(938 -(814 + 45))) then do return v108[v110[2]]();end elseif (v111==80) then local v325=0;local v326;local v327;local v328;while true do if (v325==1) then v328=v108[v326 + 2 ];if (v328>0) then if (v327>v108[v326 + 1 ]) then v102=v110[3];else v108[v326 + 3 ]=v327;end elseif (v327<v108[v326 + (2 -1) ]) then v102=v110[3];else v108[v326 + 1 + 2 ]=v327;end break;end if (v325==0) then v326=v110[2];v327=v108[v326];v325=1;end end elseif ((v110[3]==v7("\200\214\18\228","\178\151\147\92")) or (v110[3]==v7("\139\248\88\52\23\66\108","\26\236\157\44\82\114\44"))) then v108[v110[2]]=v72;else v108[v110[2]]=v72[v110[2 + 1 ]];end elseif (v111<=(967 -(261 + 624))) then v72[v110[3]]=v108[v110[2]];elseif (v111==83) then local v329=v110[2];do return v108[v329](v21(v108,v329 + (1 -0) ,v110[3]));end else v108[v110[2]]=v108[v110[1083 -(1020 + 60) ]][v110[4]];end elseif (v111<=(1510 -(630 + 793))) then if (v111<=85) then v108[v110[2]]=v110[3] + v108[v110[4]] ;elseif (v111==86) then v108[v110[6 -4 ]]=v71[v110[3]];elseif (v110[2]<v108[v110[4]]) then v102=v102 + 1 ;else v102=v110[3];end elseif (v111<=88) then local v201=0;local v202;while true do if (v201==0) then v202=v110[2];v108[v202](v21(v108,v202 + (4 -3) ,v110[2 + 1 ]));break;end end elseif (v111==89) then v108[v110[2]]=v108[v110[3]] + v110[4] ;else v108[v110[2]]={};end v102=v102 + 1 ;break;end end end end;end if (v73==0) then v74=v70[1];v75=v70[2];v73=1;end end end return v40(v39(),{},v28)(...);end v23("LOL!0D3O0003063O00737472696E6703043O006368617203043O00627974652O033O0073756203053O0062697433322O033O0062697403043O0062786F7203053O007461626C6503063O00636F6E63617403063O00696E7365727403053O006D6174636803083O00746F6E756D62657203053O007063612O6C00243O0012243O00013O0020455O0002001224000100013O002045000100010003001224000200013O002045000200020004001224000300053O002O060003000A000100010004393O000A0001001224000300063O002045000400030007001224000500083O002045000500050009001224000600083O00204500060006000A00063500073O000100062O00283O00064O00288O00283O00044O00283O00014O00283O00024O00283O00053O001224000800013O00204500080008000B0012240009000C3O001224000A000D3O000635000B0001000100052O00283O00074O00283O00094O00283O00084O00283O000A4O00283O000B4O000C000C000B4O0025000C00014O0017000C6O00383O00013O00023O00023O00026O00F03F026O00704002264O002200025O001248000300014O004700045O001248000500013O00042D0003002100012O005600076O000C000800024O0056000900014O0056000A00024O0056000B00034O0056000C00044O000C000D6O000C000E00063O002029000F000600012O001C000C000F4O0014000B3O00022O0056000C00034O0056000D00044O000C000E00014O0047000F00014O003F000F0006000F001055000F0001000F2O0047001000014O003F0010000600100010550010000100100020290010001000012O001C000D00104O0015000C6O0014000A3O000200203C000A000A00022O00420009000A4O000800073O00010004120003000500012O0056000300054O000C000400024O0053000300044O001700036O00383O00017O00043O00027O004003053O003A25642B3A2O033O0025642B026O00F03F001C3O0006355O000100012O00098O0056000100014O0056000200024O0056000300024O002200046O0056000500034O000C00066O0032000700074O001C000500074O002600043O0001002045000400040001001248000500024O0046000300050002001248000400034O001C000200044O001400013O000200260500010018000100040004393O001800012O000C00016O002200026O0053000100024O001700015O0004393O001B00012O0056000100044O0025000100014O001700016O00383O00013O00013O002D3O0003083O00496E7374616E63652O033O006E657703093O00B2C2A953CCAE1D398803083O004CE1A1DB36A9C05A030C3O0052657365744F6E537061776E010003063O00506172656E7403043O0067616D6503073O00506C6179657273030B3O004C6F63616C506C61796572030C3O0057616974466F724368696C6403093O006529482950376E255C03043O005035452903093O00C72EA414DF2ABE05FF03043O0060934BDC03043O0053697A6503053O005544696D32028O00026O006940026O00494003083O00506F736974696F6E026O00E03F026O0059C003163O004261636B67726F756E645472616E73706172656E6379026O00F03F030A3O0054657874436F6C6F723303063O00436F6C6F723303043O0054657874030B3O00250C2FFA10BFD61E0D38E103073O00B76A624AB962DA03043O00466F6E7403043O00456E756D030E3O00536F7572636553616E73426F6C6403083O005465787453697A65026O00344003093O002DAFD3280BE7DC321503083O005779CAAB5C4786BE030E3O0008D4388724C038812A810A8127C503043O00E849A14C03093O00576F726B7370616365030D3O00415F706C616365686F6C64657203053O00737061776E03043O007761726E03473O004E6F20736520656E636F6E7472C3B320756E20496D6167654C6162656C20656E747265206C6F732064657363656E6469656E74657320646520415F706C616365686F6C6465722E03103O0077616974556E74696C412O726976616C01823O00061F3O008000013O0004393O00800001001224000100013O0020450001000100022O005600025O001248000300033O001248000400044O001C000200044O001400013O000200301D000100050006001224000200083O00204500020002000900204500020002000A00201600020002000B2O005600045O0012480005000C3O0012480006000D4O001C000400064O001400023O000200102A000100070002001224000200013O0020450002000200022O005600035O0012480004000E3O0012480005000F4O001C000300054O001400023O000200102A000200070001001224000300113O002045000300030002001248000400123O001248000500133O001248000600123O001248000700144O004600030007000200102A000200100003001224000300113O002045000300030002001248000400163O001248000500173O001248000600123O001248000700124O004600030007000200102A00020015000300301D0002001800190012240003001B3O002045000300030002001248000400193O001248000500193O001248000600194O004600030006000200102A0002001A00032O005600035O0012480004001D3O0012480005001E4O004600030005000200102A0002001C0003001224000300203O00204500030003001F00204500030003002100102A0002001F000300301D000200220023001224000300013O0020450003000300022O005600045O001248000500243O001248000600254O001C000400064O001400033O000200102A000300070001001224000400113O002045000400040002001248000500123O001248000600133O001248000700123O001248000800144O004600040008000200102A000300100004001224000400113O002045000400040002001248000500163O001248000600173O001248000700123O001248000800144O004600040008000200102A00030015000400301D0003001800190012240004001B3O002045000400040002001248000500193O001248000600193O001248000700194O004600040007000200102A0003001A00042O005600045O001248000500263O001248000600274O004600040006000200102A0003001C0004001224000400203O00204500040004001F00204500040004002100102A0003001F000400301D000300220023001224000400083O00204500040004002800204500040004002900063500053O000100012O00098O000C000600054O000C000700044O003700060002000200061F0006007800013O0004393O007800010012240007002A3O00063500080001000100022O00098O00283O00064O004C0007000200010004393O007B00010012240007002B3O0012480008002C4O004C00070002000100063500070002000100012O00097O0012520007002D4O000F00015O0004393O0081000100204500013O00192O00383O00013O00033O00053O0003053O007061697273030E3O0047657444657363656E64616E74732O033O00497341030A3O0092D4435A1B97D840581203053O007EDBB9223D01113O001224000100013O00201600023O00022O0042000200034O000100013O00030004393O000E00010020160006000500032O005600085O001248000900043O001248000A00054O001C0008000A4O001400063O000200061F0006000E00013O0004393O000E00012O001A000500023O00061300010005000100020004393O000500012O00383O00017O003A3O00028O00026O00F03F027O004003043O0067616D65030A3O004765745365727669636503113O003ECB4E7E7774F2F309CA6D667165F2E00903083O00876CAE3E121E1793030C3O0057616974466F724368696C6403133O009BDA18CE08A23AC4B7FD2FCF2BBA3CD5B7EE2F03083O00A7D6894AAB78CE5303053O00AFE2374EEB03063O00C7EB90523D98030A3O004669726553657276657203063O00756E7061636B03043O007761697403113O003513A9270E15B83F02128A3F0804B82C0203043O004B6776D903073O00F5724101BC0DD303063O007EA7341074D9030C3O00496E766F6B6553657276657203083O00746F6E756D626572026O00084003103O0077616974556E74696C412O726976616C03073O00566563746F72332O033O006E6577025O00C06DC0025O00804440025O00C07EC003113O00FA2B308CBD1AFDDC2B24B3A016EEC9292503073O009CA84E40E0D47903143O0021CCE8FC02FEA9C704EFB1CB03DDB1C115EFA2CB03043O00AE678EC503073O00642D5237315BEB03073O009836483F58453E03093O00E6E1C15EC0F6E14CD503043O003CB4A48E03113O006A5B15252EEE134C5B011A33E2002O590003073O0072383E6549478D03143O009ECB96F6BDF9D7CDBBE8CFC1BCDACFCBAAE8DCC103043O00A4D889BB03073O00E0E33CBDB2FB1803073O006BB28651D2C69E030F3O000A0B91C3BE3D0F90E7B9280B81D2A503053O00CA586EE2A6030B3O0057616C6B546F506F696E7403083O00746F737472696E6703073O00506C6179657273030B3O004C6F63616C506C6179657203093O0043686172616374657203083O00EB1A8FF6C4CC068603053O00AAA36FE297026O004340025O00907CC003053O00496D61676503063O00737472696E6703053O006D6174636803083O001834EF700B33625803073O00497150D2582E5700E73O0012483O00014O0032000100023O0026053O00D6000100020004393O00D6000100061F000200D200013O0004393O00D20001001248000300014O0032000400073O0026050003000C000100020004393O000C00012O0032000600073O001248000300033O002605000300CC000100030004393O00CC00010026050004004C000100020004393O004C0001001248000800013O0026050008002F000100020004393O002F0001001224000900043O0020160009000900052O0056000B5O001248000C00063O001248000D00074O001C000B000D4O001400093O00020020160009000900082O0056000B5O001248000C00093O001248000D000A4O001C000B000D4O001400093O00020020160009000900082O0056000B5O001248000C000B3O001248000D000C4O001C000B000D4O001400093O000200201600090009000D001224000B000E4O000C000C00074O0042000B000C4O000800093O00010012240009000F3O001248000A00024O004C000900020001001248000800033O00260500080047000100010004393O00470001001224000900043O0020160009000900052O0056000B5O001248000C00103O001248000D00114O001C000B000D4O001400093O00020020160009000900082O0056000B5O001248000C00123O001248000D00134O001C000B000D4O001400093O0002002016000900090014001224000B00154O000C000C00054O0042000B000C4O000800093O00012O002200093O000100102A0009000200052O000C000700093O001248000800023O00260500080011000100030004393O00110001001248000400033O0004393O004C00010004393O0011000100260500040059000100160004393O00590001001224000800174O000C000900063O001224000A00183O002045000A000A0019001248000B001A3O001248000C001B3O001248000D001C4O0046000A000D0002001248000B00164O00580008000B00010004393O00D20001002605000400A7000100030004393O00A70001001248000800013O000E310001007D000100080004393O007D0001001224000900043O0020160009000900052O0056000B5O001248000C001D3O001248000D001E4O001C000B000D4O001400093O00020020160009000900082O0056000B5O001248000C001F3O001248000D00204O001C000B000D4O001400093O00020020160009000900082O0056000B5O001248000C00213O001248000D00224O001C000B000D4O001400093O00020020160009000900082O0056000B5O001248000C00233O001248000D00244O001C000B000D4O001400093O00020020160009000900142O004C0009000200010012240009000F3O001248000A00024O004C000900020001001248000800023O002605000800A2000100020004393O00A20001001224000900043O0020160009000900052O0056000B5O001248000C00253O001248000D00264O001C000B000D4O001400093O00020020160009000900082O0056000B5O001248000C00273O001248000D00284O001C000B000D4O001400093O00020020160009000900082O0056000B5O001248000C00293O001248000D002A4O001C000B000D4O001400093O00020020160009000900082O0056000B5O001248000C002B3O001248000D002C4O001C000B000D4O001400093O000200201600090009000D2O004C000900020001001224000900183O002045000900090019001248000A001A3O001248000B001B3O001248000C001C4O00460009000C000200102A0006002D0009001248000800033O0026050008005C000100030004393O005C0001001248000400163O0004393O00A700010004393O005C00010026050004000E000100010004393O000E00010012240008002E4O000C000900024O00370008000200022O000C000500083O001224000800043O00204500080008002F0020450008000800300020450008000800310020160008000800082O0056000A5O001248000B00323O001248000C00334O001C000A000C4O001400083O00022O000C000600083O001224000800183O0020450008000800190012480009001A3O001248000A00343O001248000B00354O00460008000B000200102A0006002D0008001224000800174O000C000900063O001224000A00183O002045000A000A0019001248000B001A3O001248000C00343O001248000D00354O0046000A000D0002001248000B00164O00580008000B0001001248000400023O0004393O000E00010004393O00D2000100260500030008000100010004393O00080001001248000400014O0032000500053O001248000300023O0004393O000800010012240003000F3O001248000400024O004C0003000200010004395O0001000E310001000200013O0004393O000200012O0056000300013O002045000100030036001224000300373O0020450003000300382O000C000400014O005600055O001248000600393O0012480007003A4O001C000500074O001400033O00022O000C000200033O0012483O00023O0004393O000200010004395O00012O00383O00017O000B3O0003063O00506172656E7403063O004865616C7468028O00030E3O0046696E6446697273744368696C6403103O00A939C013E98E25C920E88E38FD13F59503053O0087E14CAD7203103O0048756D616E6F6964522O6F745061727403083O00506F736974696F6E03093O004D61676E697475646503043O0077616974029A5O99A93F031C3O00204500033O000100061F0003001B00013O0004393O001B000100204500033O0002000E490003001B000100030004393O001B000100204500033O00010020160003000300042O005600055O001248000600053O001248000700064O001C000500074O001400033O000200061F0003001B00013O0004393O001B000100204500033O00010020450003000300070020450003000300082O003E00040003000100204500040004000900061100040017000100020004393O001700010004393O001B00010012240005000A3O0012480006000B4O004C0005000200010004395O00012O00383O00017O00",v17(),...);
-- âš ï¸ WARNING: integrity protected!
--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.9.20) ~  Much Love, Ferib 

]]--
           
