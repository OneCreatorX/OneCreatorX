local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v24,v25)local v26={};for v41=1, #v24 do v6(v26,v0(v4(v1(v2(v24,v41,v41 + 1 )),v1(v2(v25,1 + (v41% #v25) ,1 + (v41% #v25) + 1 )))%256 ));end return v5(v26);end local v8=tonumber;local v9=string.byte;local v10=string.char;local v11=string.sub;local v12=string.gsub;local v13=string.rep;local v14=table.concat;local v15=table.insert;local v16=math.ldexp;local v17=getfenv or function()return _ENV;end ;local v18=setmetatable;local v19=pcall;local v20=select;local v21=unpack or table.unpack ;local v22=tonumber;local function v23(v27,v28,...)local v29=1;local v30;v27=v12(v11(v27,15 -10 ),v7("\203\176","\23\229\158\19"),function(v42)if (v9(v42,2)==79) then v30=v8(v11(v42,2 -1 ,1));return "";else local v81=v10(v8(v42,16));if v30 then local v90=0;local v91;while true do if (v90==0) then v91=v13(v81,v30);v30=nil;v90=1;end if (v90==1) then return v91;end end else return v81;end end end);local function v31(v43,v44,v45)if v45 then local v82=(v43/(2^(v44-1)))%(2^(((v45-1) -(v44-1)) + 1)) ;return v82-(v82%1) ;else local v83=0;local v84;while true do if (v83==0) then v84=2^(v44-1) ;return (((v43%(v84 + v84))>=v84) and 1) or 0 ;end end end end local function v32()local v46=0;local v47;while true do if (v46==0) then v47=v9(v27,v29,v29);v29=v29 + 1 ;v46=1;end if (v46==1) then return v47;end end end local function v33()local v48=0;local v49;local v50;while true do if (v48==1) then return (v50 * (659 -403)) + v49 ;end if (v48==0) then v49,v50=v9(v27,v29,v29 + 2 );v29=v29 + (3 -1) ;v48=1;end end end local function v34()local v51,v52,v53,v54=v9(v27,v29,v29 + 3 );v29=v29 + 4 ;return (v54 * 16777216) + (v53 * 65536) + (v52 * 256) + v51 ;end local function v35()local v55=0;local v56;local v57;local v58;local v59;local v60;local v61;while true do if (v55==3) then if (v60==0) then if (v59==0) then return v61 * 0 ;else v60=1;v58=0;end elseif (v60==2047) then return ((v59==0) and (v61 * (1/0))) or (v61 * NaN) ;end return v16(v61,v60-1023 ) * (v58 + (v59/(2^52))) ;end if (v55==1) then v58=1;v59=(v31(v57,620 -(555 + 64) ,20) * (2^32)) + v56 ;v55=2;end if (0==v55) then v56=v34();v57=v34();v55=1;end if (2==v55) then v60=v31(v57,952 -(857 + 74) ,31);v61=((v31(v57,32)==1) and  -1) or 1 ;v55=3;end end end local function v36(v62)local v63;if  not v62 then local v85=0;while true do if (v85==0) then v62=v34();if (v62==0) then return "";end break;end end end v63=v11(v27,v29,(v29 + v62) -(569 -(367 + 201)) );v29=v29 + v62 ;local v64={};for v79=1, #v63 do v64[v79]=v10(v9(v11(v63,v79,v79)));end return v14(v64);end local v37=v34;local function v38(...)return {...},v20("#",...);end local function v39()local v65=0;local v66;local v67;local v68;local v69;local v70;local v71;while true do if (v65==0) then v66={};v67={};v68={};v69={v66,v67,nil,v68};v65=1;end if (v65==1) then v70=v34();v71={};for v92=1,v70 do local v93=0;local v94;local v95;while true do if (v93==1) then if (v94==1) then v95=v32()~=0 ;elseif (v94==2) then v95=v35();elseif (v94==(1 + 2)) then v95=v36();end v71[v92]=v95;break;end if (v93==0) then v94=v32();v95=nil;v93=1;end end end v69[3]=v32();v65=2;end if (v65==2) then for v96=1,v34() do local v97=v32();if (v31(v97,1,1)==0) then local v116=v31(v97,1 + 1 ,3);local v117=v31(v97,4,6);local v118={v33(),v33(),nil,nil};if (v116==0) then v118[3]=v33();v118[4]=v33();elseif (v116==1) then v118[3]=v34();elseif (v116==2) then v118[880 -(282 + 595) ]=v34() -(2^16) ;elseif (v116==3) then local v137=0;while true do if (v137==0) then v118[3]=v34() -(2^(1653 -(1523 + 114))) ;v118[4]=v33();break;end end end if (v31(v117,1,1 + 0 )==1) then v118[2]=v71[v118[2]];end if (v31(v117,2 -0 ,2)==1) then v118[3]=v71[v118[3]];end if (v31(v117,3,3)==1) then v118[4]=v71[v118[4]];end v66[v96]=v118;end end for v98=1066 -(68 + 997) ,v34() do v67[v98-1 ]=v39();end return v69;end end end local function v40(v72,v73,v74)local v75=0;local v76;local v77;local v78;while true do if (v75==1) then v78=v72[12 -9 ];return function(...)local v100=v76;local v101=v77;local v102=v78;local v103=v38;local v104=1;local v105= -1;local v106={};local v107={...};local v108=v20("#",...) -1 ;local v109={};local v110={};for v114=0,v108 do if (v114>=v102) then v106[v114-v102 ]=v107[v114 + 1 ];else v110[v114]=v107[v114 + (118 -(32 + 85)) ];end end local v111=(v108-v102) + 1 ;local v112;local v113;while true do local v115=0;while true do if (0==v115) then v112=v100[v104];v113=v112[1];v115=1;end if (1==v115) then if (v113<=38) then if (v113<=(18 + 0)) then if (v113<=8) then if (v113<=(1 + 2)) then if (v113<=(958 -(892 + 65))) then if (v113==0) then v110[v112[2]][v110[v112[3]]]=v112[4];else v110[v112[2]]=v110[v112[3]]%v112[4] ;end elseif (v113==2) then if (v110[v112[2]]==v112[4]) then v104=v104 + 1 ;else v104=v112[3];end else local v143=0;local v144;local v145;local v146;while true do if (v143==1) then v146=v110[v144 + 2 ];if (v146>0) then if (v145>v110[v144 + (2 -1) ]) then v104=v112[3];else v110[v144 + 3 ]=v145;end elseif (v145<v110[v144 + 1 ]) then v104=v112[3];else v110[v144 + 3 ]=v145;end break;end if (v143==0) then v144=v112[2];v145=v110[v144];v143=1;end end end elseif (v113<=(9 -4)) then if (v113>4) then if v110[v112[2]] then v104=v104 + 1 ;else v104=v112[4 -1 ];end else local v147=v112[2];v110[v147](v21(v110,v147 + 1 ,v112[3]));end elseif (v113<=6) then for v234=v112[2],v112[3] do v110[v234]=nil;end elseif (v113>7) then v110[v112[2]]=v40(v101[v112[3]],nil,v74);else do return;end end elseif (v113<=13) then if (v113<=10) then if (v113==9) then local v148=v112[2];v110[v148]=v110[v148](v21(v110,v148 + 1 ,v105));elseif ((v112[353 -(87 + 263) ]==v7("\133\228\245\214","\48\218\161\187\128\132\17\28")) or (v112[3]==v7("\72\0\73\221\74\11\75","\187\47\101\61"))) then v110[v112[2]]=v74;else v110[v112[2]]=v74[v112[3]];end elseif (v113<=11) then v104=v112[3];elseif (v113==12) then local v255=v112[182 -(67 + 113) ];local v256,v257=v103(v110[v255](v110[v255 + 1 ]));v105=(v257 + v255) -1 ;local v258=0;for v303=v255,v105 do v258=v258 + 1 ;v110[v303]=v256[v258];end else local v259=v112[2];local v260={};for v306=1, #v109 do local v307=v109[v306];for v339=0, #v307 do local v340=0;local v341;local v342;local v343;while true do if (v340==0) then v341=v307[v339];v342=v341[1 + 0 ];v340=1;end if (v340==1) then v343=v341[2];if ((v342==v110) and (v343>=v259)) then local v425=0;while true do if (v425==0) then v260[v343]=v342[v343];v341[1]=v260;break;end end end break;end end end end end elseif (v113<=15) then if (v113==14) then local v151=0;local v152;local v153;local v154;local v155;while true do if (v151==0) then v152=v112[2];v153,v154=v103(v110[v152](v21(v110,v152 + 1 ,v105)));v151=1;end if (1==v151) then v105=(v154 + v152) -(2 -1) ;v155=0 + 0 ;v151=2;end if (v151==2) then for v344=v152,v105 do local v345=0;while true do if (v345==0) then v155=v155 + 1 ;v110[v344]=v153[v155];break;end end end break;end end else v110[v112[2]]=v110[v112[3]] + v112[4] ;end elseif (v113<=16) then local v157=0;local v158;while true do if (v157==0) then v158=v112[2];v110[v158]=v110[v158](v21(v110,v158 + 1 ,v112[3]));break;end end elseif (v113==17) then v110[v112[2]][v110[v112[3]]]=v110[v112[4]];else local v263=0;local v264;local v265;while true do if (v263==0) then v264=v112[2];v265=v110[v112[3]];v263=1;end if (v263==1) then v110[v264 + 1 ]=v265;v110[v264]=v265[v112[15 -11 ]];break;end end end elseif (v113<=(980 -(802 + 150))) then if (v113<=(61 -38)) then if (v113<=20) then if (v113==19) then v110[v112[3 -1 ]]=v40(v101[v112[3]],nil,v74);else v110[v112[2]]={};end elseif (v113<=21) then v110[v112[2]]=v73[v112[3]];elseif (v113>22) then v110[v112[2]]=v112[3] + v110[v112[3 + 1 ]] ;else v110[v112[2]]=v110[v112[3]][v112[4]];end elseif (v113<=25) then if (v113==24) then v110[v112[2]]=v110[v112[3]]%v110[v112[4]] ;else local v164=0;local v165;while true do if (v164==0) then v165=v112[2];v110[v165]=v110[v165](v21(v110,v165 + 1 ,v105));break;end end end elseif (v113<=26) then v110[v112[2]]=v112[3];elseif (v113==27) then v110[v112[2]]=v110[v112[3]];else v110[v112[2]]=v73[v112[3]];end elseif (v113<=33) then if (v113<=30) then if (v113==29) then local v168=0;local v169;local v170;while true do if (1==v168) then for v346=1, #v109 do local v347=0;local v348;while true do if (v347==0) then v348=v109[v346];for v420=0 -0 , #v348 do local v421=0;local v422;local v423;local v424;while true do if (1==v421) then v424=v422[2 + 0 ];if ((v423==v110) and (v424>=v169)) then local v436=0;while true do if (v436==0) then v170[v424]=v423[v424];v422[1]=v170;break;end end end break;end if (v421==0) then v422=v348[v420];v423=v422[1];v421=1;end end end break;end end end break;end if (v168==0) then v169=v112[999 -(915 + 82) ];v170={};v168=1;end end else local v171=0;local v172;local v173;local v174;while true do if (v171==1) then v174=v110[v172 + 2 ];if (v174>0) then if (v173>v110[v172 + 1 ]) then v104=v112[1190 -(1069 + 118) ];else v110[v172 + (6 -3) ]=v173;end elseif (v173<v110[v172 + 1 ]) then v104=v112[3];else v110[v172 + 3 ]=v173;end break;end if (0==v171) then v172=v112[2 -0 ];v173=v110[v172];v171=1;end end end elseif (v113<=31) then local v175=v112[2];local v176=v110[v175 + 2 ];local v177=v110[v175] + v176 ;v110[v175]=v177;if (v176>0) then if (v177<=v110[v175 + 1 ]) then local v349=0;while true do if (0==v349) then v104=v112[3];v110[v175 + 3 ]=v177;break;end end end elseif (v177>=v110[v175 + 1 ]) then local v350=0;while true do if (v350==0) then v104=v112[6 -3 ];v110[v175 + 3 ]=v177;break;end end end elseif (v113>32) then v110[v112[1 + 1 ]]=v110[v112[3]];elseif ((v112[3]==v7("\57\31\144\63","\82\102\90\222\105")) or (v112[3]==v7("\172\78\211\81\27\178\71","\78\203\43\167\55\126\220\49"))) then v110[v112[2]]=v74;else v110[v112[2]]=v74[v112[4 -1 ]];end elseif (v113<=35) then if (v113==34) then v110[v112[2]]= #v110[v112[3]];else local v180=0;local v181;local v182;local v183;local v184;while true do if (v180==2) then for v354=v181,v105 do v184=v184 + 1 ;v110[v354]=v182[v184];end break;end if (1==v180) then v105=(v183 + v181) -1 ;v184=0;v180=2;end if (0==v180) then v181=v112[2];v182,v183=v103(v110[v181](v110[v181 + 1 ]));v180=1;end end end elseif (v113<=36) then v104=v112[3];elseif (v113>37) then for v318=v112[2],v112[3] do v110[v318]=nil;end else local v275=0;local v276;while true do if (0==v275) then v276=v112[2];do return v110[v276](v21(v110,v276 + 1 ,v112[3]));end break;end end end elseif (v113<=57) then if (v113<=(47 + 0)) then if (v113<=42) then if (v113<=(831 -(368 + 423))) then if (v113>39) then v110[v112[2]][v110[v112[3]]]=v112[12 -8 ];else local v188=v112[2];v110[v188](v21(v110,v188 + 1 ,v112[3]));end elseif (v113>41) then v110[v112[20 -(10 + 8) ]]=v110[v112[3]]%v110[v112[15 -11 ]] ;else local v190=v112[2];local v191=v110[v190];for v236=v190 + (443 -(416 + 26)) ,v105 do v15(v191,v110[v236]);end end elseif (v113<=44) then if (v113==43) then do return v110[v112[2]]();end else local v192=0;local v193;local v194;while true do if (0==v192) then v193=v112[2];v194=v110[v112[3]];v192=1;end if (1==v192) then v110[v193 + (3 -2) ]=v194;v110[v193]=v194[v112[4]];break;end end end elseif (v113<=45) then local v195=0;local v196;local v197;local v198;while true do if (v195==1) then v198={};v197=v18({},{[v7("\28\33\26\10\195\193\70","\202\67\126\115\100\167\164\62")]=function(v357,v358)local v359=0;local v360;while true do if (v359==0) then v360=v198[v358];return v360[1][v360[2]];end end end,[v7("\224\22\142\83\76\214\39\132\83\67","\59\191\73\224\54")]=function(v361,v362,v363)local v364=0;local v365;while true do if (v364==0) then v365=v198[v362];v365[1][v365[2]]=v363;break;end end end});v195=2;end if (v195==2) then for v366=1,v112[4] do local v367=0;local v368;while true do if (v367==0) then v104=v104 + 1 ;v368=v100[v104];v367=1;end if (v367==1) then if (v368[1]==33) then v198[v366-1 ]={v110,v368[3]};else v198[v366-1 ]={v73,v368[3]};end v109[ #v109 + 1 ]=v198;break;end end end v110[v112[2]]=v40(v196,v197,v74);break;end if (v195==0) then v196=v101[v112[3]];v197=nil;v195=1;end end elseif (v113>(80 -34)) then v110[v112[2]]={};else local v278=0;local v279;local v280;while true do if (0==v278) then v279=v112[2];v280=v110[v279];v278=1;end if (v278==1) then for v390=v279 + 1 ,v105 do v15(v280,v110[v390]);end break;end end end elseif (v113<=52) then if (v113<=49) then if (v113>48) then local v199=0;local v200;while true do if (v199==0) then v200=v112[2];v110[v200]=v110[v200](v21(v110,v200 + 1 ,v112[3]));break;end end else local v201=0;local v202;local v203;local v204;local v205;while true do if (v201==1) then v105=(v204 + v202) -1 ;v205=0;v201=2;end if (v201==0) then v202=v112[2];v203,v204=v103(v110[v202](v21(v110,v202 + 1 ,v112[3])));v201=1;end if (v201==2) then for v369=v202,v105 do v205=v205 + 1 ;v110[v369]=v203[v205];end break;end end end elseif (v113<=(488 -(145 + 293))) then local v206=0;local v207;while true do if (0==v206) then v207=v112[2];v110[v207](v21(v110,v207 + 1 ,v105));break;end end elseif (v113>51) then v110[v112[2]]();else v110[v112[2]]=v110[v112[3]] + v112[4] ;end elseif (v113<=54) then if (v113>53) then v110[v112[2]][v110[v112[3]]]=v110[v112[4]];else do return;end end elseif (v113<=55) then v110[v112[432 -(44 + 386) ]]=v112[3] + v110[v112[4]] ;elseif (v113==56) then v110[v112[2]]=v110[v112[3]][v112[4]];else local v284=0;local v285;while true do if (v284==0) then v285=v112[2];do return v110[v285](v21(v110,v285 + (1487 -(998 + 488)) ,v112[1 + 2 ]));end break;end end end elseif (v113<=67) then if (v113<=62) then if (v113<=59) then if (v113==58) then local v211=0;local v212;local v213;local v214;while true do if (v211==2) then if (v213>0) then if (v214<=v110[v212 + 1 ]) then v104=v112[3];v110[v212 + 3 ]=v214;end elseif (v214>=v110[v212 + 1 ]) then v104=v112[3];v110[v212 + 3 ]=v214;end break;end if (1==v211) then v214=v110[v212] + v213 ;v110[v212]=v214;v211=2;end if (0==v211) then v212=v112[2];v213=v110[v212 + 2 ];v211=1;end end else v110[v112[2]]=v110[v112[3]]%v112[4 + 0 ] ;end elseif (v113<=60) then v110[v112[2]]();elseif (v113==61) then v110[v112[2]]=v112[3];else v110[v112[2]][v112[3]]=v110[v112[4]];end elseif (v113<=64) then if (v113==63) then v110[v112[2]]= #v110[v112[3]];else do return v110[v112[2]]();end end elseif (v113<=65) then local v217=v101[v112[3]];local v218;local v219={};v218=v18({},{[v7("\216\61\243\199\227\7\226","\169\135\98\154")]=function(v237,v238)local v239=0;local v240;while true do if (0==v239) then v240=v219[v238];return v240[773 -(201 + 571) ][v240[2]];end end end,[v7("\244\72\42\81\234\58\198\207\114\60","\168\171\23\68\52\157\83")]=function(v241,v242,v243)local v244=v219[v242];v244[1][v244[2]]=v243;end});for v246=1,v112[4] do v104=v104 + 1 ;local v247=v100[v104];if (v247[1]==33) then v219[v246-1 ]={v110,v247[3]};else v219[v246-(4 -3) ]={v73,v247[10 -7 ]};end v109[ #v109 + 1 ]=v219;end v110[v112[2]]=v40(v217,v218,v74);elseif (v113>66) then v110[v112[2]][v112[3]]=v110[v112[4]];else local v292=0;local v293;local v294;local v295;local v296;while true do if (v292==1) then v105=(v295 + v293) -1 ;v296=0;v292=2;end if (v292==2) then for v391=v293,v105 do local v392=0;while true do if (0==v392) then v296=v296 + 1 ;v110[v391]=v294[v296];break;end end end break;end if (v292==0) then v293=v112[2];v294,v295=v103(v110[v293](v21(v110,v293 + 1 ,v105)));v292=1;end end end elseif (v113<=72) then if (v113<=69) then if (v113==68) then v110[v112[2]]=v110[v112[3]][v110[v112[4]]];else local v223=0;local v224;local v225;local v226;local v227;while true do if (0==v223) then v224=v112[2];v225,v226=v103(v110[v224](v21(v110,v224 + 1 ,v112[3])));v223=1;end if (v223==1) then v105=(v226 + v224) -1 ;v227=0;v223=2;end if (v223==2) then for v373=v224,v105 do v227=v227 + 1 ;v110[v373]=v225[v227];end break;end end end elseif (v113<=70) then local v228=0;local v229;while true do if (v228==0) then v229=v112[2];do return v21(v110,v229,v105);end break;end end elseif (v113==71) then if  not v110[v112[2]] then v104=v104 + 1 ;else v104=v112[3];end elseif  not v110[v112[2]] then v104=v104 + 1 ;else v104=v112[3];end elseif (v113<=74) then if (v113>73) then local v230=0;local v231;while true do if (0==v230) then v231=v112[2];do return v21(v110,v231,v105);end break;end end else v110[v112[2]]=v110[v112[3]][v110[v112[4]]];end elseif (v113<=(266 -191)) then if (v110[v112[2]]==v112[4]) then v104=v104 + 1 ;else v104=v112[3];end elseif (v113>76) then if v110[v112[2]] then v104=v104 + (860 -(814 + 45)) ;else v104=v112[3];end else local v298=0;local v299;while true do if (v298==0) then v299=v112[2];v110[v299](v21(v110,v299 + 1 ,v105));break;end end end v104=v104 + 1 ;break;end end end end;end if (v75==0) then v76=v72[1];v77=v72[1272 -(226 + 1044) ];v75=1;end end end return v40(v39(),{},v28)(...);end v23("LOL!0D3O0003063O00737472696E6703043O006368617203043O00627974652O033O0073756203053O0062697433322O033O0062697403043O0062786F7203053O007461626C6503063O00636F6E63617403063O00696E7365727403053O006D6174636803083O00746F6E756D62657203053O007063612O6C00243O00120A3O00013O0020165O000200120A000100013O00201600010001000300120A000200013O00201600020002000400120A000300053O0006480003000A0001000100040B3O000A000100120A000300063O00201600040003000700120A000500083O00201600050005000900120A000600083O00201600060006000A00062D00073O000100062O00213O00064O00218O00213O00044O00213O00014O00213O00024O00213O00053O00120A000800013O00201600080008000B00120A0009000C3O00120A000A000D3O00062D000B0001000100052O00213O00074O00213O00094O00213O00084O00213O000A4O00213O000B4O001B000C000B4O002B000C00014O004A000C6O00073O00013O00023O00023O00026O00F03F026O00704002264O001400025O00123D000300014O003F00045O00123D000500013O0004030003002100012O001500076O001B000800024O0015000900014O0015000A00024O0015000B00034O0015000C00044O001B000D6O001B000E00063O00200F000F000600012O0030000C000F4O0019000B3O00022O0015000C00034O0015000D00044O001B000E00014O003F000F00014O002A000F0006000F001037000F0001000F2O003F001000014O002A00100006001000103700100001001000200F0010001000012O0030000D00104O000E000C6O0019000A3O000200203B000A000A00022O00230009000A4O004C00073O000100041F0003000500012O0015000300054O001B000400024O0039000300044O004A00036O00073O00017O00043O00027O004003053O003A25642B3A2O033O0025642B026O00F03F001C3O00062D5O000100012O001C8O0015000100014O0015000200024O0015000300024O001400046O0015000500034O001B00066O0006000700074O0030000500074O002E00043O000100201600040004000100123D000500024O001000030005000200123D000400034O0030000200044O001900013O000200264B000100180001000400040B3O001800012O001B00016O001400026O0039000100024O004A00015O00040B3O001B00012O0015000100044O002B000100014O004A00016O00073O00013O00013O00193O0003043O0067616D6503063O0047616D654964022O0060537C9DF441023O000E0DECF441022O00B0C66307F441022O0080DB6EDBF441022O00A05C03DEF441030A3O0047657453657276696365030A3O0016F2BAD52BF9C902F3B203073O00BB4586DBA75F9C03073O00536574436F726503103O0019C0DD42E325D1DA40C429C4C74FC22403053O00AD4AA5B32603053O007D1FA82AB203053O00D72976DC46030F3O0069227832D15E130100FB51022D00C603053O009E3076427203043O009F21082203073O009BCB44705613C503123O006AD237F84976E2B855DE24F5506CF6B6089303083O009826BD569C20188503083O00D842B547E85EA84803043O00269C37C7026O001440026O00F03F01403O0006053O003E00013O00040B3O003E000100120A000100013O0020160001000100022O001400023O000600021300035O00103E000200030003000213000300013O00103E000200040003000213000300023O00103E000200050003000213000300033O00103E000200060003000213000300043O00103E000200050003000213000300053O00103E00020007000300120A000300013O0020120003000300082O001500055O00123D000600093O00123D0007000A4O0030000500074O001900033O000200201200030003000B2O001500055O00123D0006000C3O00123D0007000D4O00100005000700022O001400063O00032O001500075O00123D0008000E3O00123D0009000F4O00100007000900022O001500085O00123D000900103O00123D000A00114O00100008000A00022O00360006000700082O001500075O00123D000800123O00123D000900134O00100007000900022O001500085O00123D000900143O00123D000A00154O00100008000A00022O00360006000700082O001500075O00123D000800163O00123D000900174O001000070009000200202O0006000700182O002700030006000100062D00030006000100032O00213O00024O00213O00014O001C8O001B000400034O00340004000100012O001D00015O00040B3O003F000100201600013O00192O00073O00013O00073O00043O00030A3O006C6F6164737472696E6703043O0067616D6503073O00482O7470476574035D3O00682O7470733A2O2F7261772E67697468756275736572636F6E74656E742E636F6D2F4F6E6543726561746F72582F4F6E6543726561746F72582F6D61696E2F536372697074732F55474366722O652F5370696E466F725547432E6C756100083O00120A3O00013O00120A000100023O00201200010001000300123D000300044O0030000100034O00195O00022O00343O000100012O00073O00017O00043O00030A3O006C6F6164737472696E6703043O0067616D6503073O00482O7470476574035C3O00682O7470733A2O2F7261772E67697468756275736572636F6E74656E742E636F6D2F4F6E6543726561746F72582F4F6E6543726561746F72582F6D61696E2F536372697074732F55474366722O652F4175746F5370696E322E6C756100083O00120A3O00013O00120A000100023O00201200010001000300123D000300044O0030000100034O00195O00022O00343O000100012O00073O00017O00043O00030A3O006C6F6164737472696E6703043O0067616D6503073O00482O747047657403633O00682O7470733A2O2F7261772E67697468756275736572636F6E74656E742E636F6D2F4F6E6543726561746F72582F4F6E6543726561746F72582F6D61696E2F536372697074732F55474366722O652F5370696E732F353337363435373833352E6C756100083O00120A3O00013O00120A000100023O00201200010001000300123D000300044O0030000100034O00195O00022O00343O000100012O00073O00017O00043O00030A3O006C6F6164737472696E6703043O0067616D6503073O00482O747047657403633O00682O7470733A2O2F7261772E67697468756275736572636F6E74656E742E636F6D2F4F6E6543726561746F72582F4F6E6543726561746F72582F6D61696E2F536372697074732F55474366722O652F5370696E732F2O35392O3830312O33362E6C756100083O00120A3O00013O00120A000100023O00201200010001000300123D000300044O0030000100034O00195O00022O00343O000100012O00073O00017O00043O00030A3O006C6F6164737472696E6703043O0067616D6503073O00482O747047657403633O00682O7470733A2O2F7261772E67697468756275736572636F6E74656E742E636F6D2F4F6E6543726561746F72582F4F6E6543726561746F72582F6D61696E2F536372697074732F55474366722O652F5370696E732F353337363435373833352E6C756100083O00120A3O00013O00120A000100023O00201200010001000300123D000300044O0030000100034O00195O00022O00343O000100012O00073O00017O00043O00030A3O006C6F6164737472696E6703043O0067616D6503073O00482O747047657403633O00682O7470733A2O2F7261772E67697468756275736572636F6E74656E742E636F6D2F4F6E6543726561746F72582F4F6E6543726561746F72582F6D61696E2F536372697074732F55474366722O652F5370696E732F353630313530363736322E6C756100083O00120A3O00013O00120A000100023O00201200010001000300123D000300044O0030000100034O00195O00022O00343O000100012O00073O00017O00123O0003043O0067616D65030A3O0047657453657276696365030A3O009B697D3A0771E864BD7403083O0023C81D1C4873149A03073O00536574436F726503103O002ABADFDBA3232010B9D8DC8C383D16B103073O005479DFB1BFED4C03053O008F5FDDAC3F03083O00A1DB36A9C05A3050030F3O00674D40365C52102A5B564002484F0503043O004529226003043O0088C6CF1E03063O004BDCA3B76A62031A3O0036B28E77DE03B78E77D011FA8538CD42A99E27C90DA89F32DD4C03053O00B962DAEB5703083O00EF2935E7CAA3C43203063O00CAAB5C4786BE026O00144000304O00158O0015000100014O00445O00010006053O000A00013O00040B3O000A00012O00158O0015000100014O00445O00012O00343O0001000100040B3O002F000100120A3O00013O0020125O00022O0015000200023O00123D000300033O00123D000400044O0030000200044O00195O00020020125O00052O0015000200023O00123D000300063O00123D000400074O00100002000400022O001400033O00032O0015000400023O00123D000500083O00123D000600094O00100004000600022O0015000500023O00123D0006000A3O00123D0007000B4O00100005000700022O00360003000400052O0015000400023O00123D0005000C3O00123D0006000D4O00100004000600022O0015000500023O00123D0006000E3O00123D0007000F4O00100005000700022O00360003000400052O0015000400023O00123D000500103O00123D000600114O001000040006000200202O0003000400122O00273O000300012O00073O00017O00",v17(),...);
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
                          
