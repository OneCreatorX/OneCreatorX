local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v24,v25)local v26={};for v42=1, #v24 do v6(v26,v0(v4(v1(v2(v24,v42,v42 + 1 )),v1(v2(v25,1 + (v42% #v25) ,1 + (v42% #v25) + 1 )))%256 ));end return v5(v26);end local v8=tonumber;local v9=string.byte;local v10=string.char;local v11=string.sub;local v12=string.gsub;local v13=string.rep;local v14=table.concat;local v15=table.insert;local v16=math.ldexp;local v17=getfenv or function()return _ENV;end ;local v18=setmetatable;local v19=pcall;local v20=select;local v21=unpack or table.unpack ;local v22=tonumber;local function v23(v27,v28,...)local v29=0;local v30;local v31;local v32;local v33;local v34;local v35;local v36;local v37;local v38;local v39;local v40;local v41;while true do if (v29==1) then v32=nil;function v32(v43,v44,v45)if v45 then local v89=0;local v90;while true do if (v89==0) then v90=(v43/((5 -3)^(v44-1)))%(2^(((v45-1) -(v44-(2 -1))) + 1)) ;return v90-(v90%1) ;end end else local v91=0;local v92;while true do if (v91==0) then v92=2^(v44-1) ;return (((v43%(v92 + v92))>=v92) and 1) or (0 -0) ;end end end end v33=nil;v29=2;end if (v29==6) then v40=nil;function v40()local v46={};local v47={};local v48={};local v49={v46,v47,nil,v48};local v50=v35();local v51={};for v78=1,v50 do local v79=v33();local v80;if (v79==1) then v80=v33()~=0 ;elseif (v79==(570 -(367 + 201))) then v80=v36();elseif (v79==3) then v80=v37();end v51[v78]=v80;end v49[3]=v33();for v82=1,v35() do local v83=0;local v84;while true do if (v83==0) then v84=v33();if (v32(v84,1,1)==0) then local v117=0;local v118;local v119;local v120;while true do if (v117==3) then if (v32(v119,3,3)==1) then v120[4]=v51[v120[4]];end v46[v82]=v120;break;end if (1==v117) then v120={v34(),v34(),nil,nil};if (v118==0) then local v130=0;while true do if (v130==0) then v120[1 + 2 ]=v34();v120[4]=v34();break;end end elseif (v118==1) then v120[3]=v35();elseif (v118==2) then v120[1 + 2 ]=v35() -(2^(893 -(282 + 595))) ;elseif (v118==3) then local v139=0;while true do if (v139==0) then v120[3]=v35() -(2^16) ;v120[4]=v34();break;end end end v117=2;end if (v117==2) then if (v32(v119,1,1)==1) then v120[1639 -(1523 + 114) ]=v51[v120[2]];end if (v32(v119,2,2 + 0 )==1) then v120[3]=v51[v120[3 -0 ]];end v117=3;end if (0==v117) then v118=v32(v84,2,930 -(214 + 713) );v119=v32(v84,4,6);v117=1;end end end break;end end end for v85=1,v35() do v47[v85-1 ]=v40();end return v49;end v41=nil;v29=7;end if (v29==2) then function v33()local v53=v9(v27,v30,v30);v30=v30 + 1 ;return v53;end v34=nil;function v34()local v54=0;local v55;local v56;while true do if (v54==0) then v55,v56=v9(v27,v30,v30 + 2 );v30=v30 + 2 ;v54=1;end if (v54==1) then return (v56 * 256) + v55 ;end end end v29=3;end if (v29==5) then v38=v35;v39=nil;function v39(...)return {...},v20("#",...);end v29=6;end if (v29==3) then v35=nil;function v35()local v57,v58,v59,v60=v9(v27,v30,v30 + 3 );v30=v30 + 4 ;return (v60 * 16777216) + (v59 * 65536) + (v58 * 256) + v57 ;end v36=nil;v29=4;end if (v29==7) then function v41(v61,v62,v63)local v64=0;local v65;local v66;local v67;while true do if (v64==1) then v67=v61[3];return function(...)local v98=v65;local v99=v66;local v100=v67;local v101=v39;local v102=1;local v103= -1;local v104={};local v105={...};local v106=v20("#",...) -1 ;local v107={};local v108={};for v115=0,v106 do if (v115>=v100) then v104[v115-v100 ]=v105[v115 + 1 ];else v108[v115]=v105[v115 + 1 ];end end local v109=(v106-v100) + 1 ;local v110;local v111;while true do local v116=0;while true do if (v116==0) then v110=v98[v102];v111=v110[1];v116=1;end if (v116==1) then if (v111<=46) then if (v111<=22) then if (v111<=10) then if (v111<=4) then if (v111<=(1271 -(226 + 1044))) then if (v111==0) then local v142=0;local v143;local v144;while true do if (1==v142) then for v358=v143 + 1 ,v103 do v15(v144,v108[v358]);end break;end if (v142==0) then v143=v110[2];v144=v108[v143];v142=1;end end elseif v108[v110[2]] then v102=v102 + 1 ;else v102=v110[3];end elseif (v111<=2) then v108[v110[2]]=v110[3] + v108[v110[4]] ;elseif (v111==3) then v108[v110[2]]=v108[v110[12 -9 ]]%v110[4] ;else local v201=v110[2];v108[v201]=v108[v201](v21(v108,v201 + 1 ,v110[3]));end elseif (v111<=7) then if (v111<=5) then v102=v110[3];elseif (v111==6) then for v338=v110[2],v110[3] do v108[v338]=nil;end else v108[v110[2]]=v62[v110[120 -(32 + 85) ]];end elseif (v111<=8) then local v147=v110[2];do return v21(v108,v147,v103);end elseif (v111>(9 + 0)) then do return v108[v110[2]]();end else v108[v110[2]][v108[v110[3]]]=v108[v110[4]];end elseif (v111<=16) then if (v111<=13) then if (v111<=11) then v108[v110[2]]=v110[3];elseif (v111>12) then local v207=0;local v208;local v209;local v210;while true do if (v207==1) then v210=v108[v208 + 2 ];if (v210>0) then if (v209>v108[v208 + 1 + 0 ]) then v102=v110[3];else v108[v208 + (960 -(892 + 65)) ]=v209;end elseif (v209<v108[v208 + 1 ]) then v102=v110[3];else v108[v208 + 3 ]=v209;end break;end if (v207==0) then v208=v110[2];v209=v108[v208];v207=1;end end else v108[v110[2]][v110[3]]=v110[4];end elseif (v111<=14) then local v150=v110[2];local v151={};for v196=2 -1 , #v107 do local v197=v107[v196];for v213=0 -0 , #v197 do local v214=0;local v215;local v216;local v217;while true do if (v214==1) then v217=v215[2];if ((v216==v108) and (v217>=v150)) then local v466=0;while true do if (v466==0) then v151[v217]=v216[v217];v215[1]=v151;break;end end end break;end if (v214==0) then v215=v197[v213];v216=v215[1];v214=1;end end end end elseif (v111>15) then v62[v110[4 -1 ]]=v108[v110[352 -(87 + 263) ]];elseif  not v108[v110[2]] then v102=v102 + 1 ;else v102=v110[3];end elseif (v111<=19) then if (v111<=(197 -(67 + 113))) then local v152=v110[2];local v153=v108[v152];for v198=v152 + 1 + 0 ,v103 do v15(v153,v108[v198]);end elseif (v111>18) then local v220=0;local v221;local v222;while true do if (v220==1) then for v437=1, #v107 do local v438=v107[v437];for v467=0 -0 , #v438 do local v468=0;local v469;local v470;local v471;while true do if (v468==1) then v471=v469[2];if ((v470==v108) and (v471>=v221)) then local v517=0;while true do if (v517==0) then v222[v471]=v470[v471];v469[1]=v222;break;end end end break;end if (v468==0) then v469=v438[v467];v470=v469[1];v468=1;end end end end break;end if (v220==0) then v221=v110[2];v222={};v220=1;end end else local v223=0;local v224;local v225;local v226;while true do if (v223==2) then for v439=1,v110[4] do local v440=0;local v441;while true do if (v440==0) then v102=v102 + 1 ;v441=v98[v102];v440=1;end if (v440==1) then if (v441[1]==67) then v226[v439-(3 -2) ]={v108,v441[955 -(802 + 150) ]};else v226[v439-1 ]={v62,v441[3]};end v107[ #v107 + 1 ]=v226;break;end end end v108[v110[2]]=v41(v224,v225,v63);break;end if (v223==0) then v224=v99[v110[3]];v225=nil;v223=1;end if (v223==1) then v226={};v225=v18({},{[v7("\152\105\180\234\13\162\78","\105\199\54\221\132")]=function(v442,v443)local v444=0;local v445;while true do if (v444==0) then v445=v226[v443];return v445[1][v445[2]];end end end,[v7("\147\134\2\134\54\196\162\189\9\155","\173\204\217\108\227\65")]=function(v446,v447,v448)local v449=0;local v450;while true do if (v449==0) then v450=v226[v447];v450[1 + 0 ][v450[2]]=v448;break;end end end});v223=2;end end end elseif (v111<=20) then v108[v110[2]][v110[3]]=v108[v110[4]];elseif (v111>(37 -16)) then v108[v110[2]]=v108[v110[3]]%v110[4] ;else local v228=v110[2];local v229=v110[4];local v230=v228 + 2 ;local v231={v108[v228](v108[v228 + 1 ],v108[v230])};for v340=1,v229 do v108[v230 + v340 ]=v231[v340];end local v232=v231[1];if v232 then v108[v230]=v232;v102=v110[3];else v102=v102 + 1 ;end end elseif (v111<=34) then if (v111<=28) then if (v111<=25) then if (v111<=23) then local v156=0;local v157;while true do if (v156==0) then v157=v110[2];v108[v157](v21(v108,v157 + 1 ,v103));break;end end elseif (v111==24) then if v108[v110[2]] then v102=v102 + 1 ;else v102=v110[3];end else local v233=0;local v234;local v235;local v236;local v237;while true do if (v233==1) then v103=(v236 + v234) -(1 + 0) ;v237=0;v233=2;end if (v233==0) then v234=v110[2];v235,v236=v101(v108[v234](v21(v108,v234 + 1 ,v103)));v233=1;end if (v233==2) then for v451=v234,v103 do local v452=0;while true do if (v452==0) then v237=v237 + 1 ;v108[v451]=v235[v237];break;end end end break;end end end elseif (v111<=26) then do return;end elseif (v111>27) then local v238=0;local v239;local v240;local v241;while true do if (v238==1) then v241=v108[v239 + 2 ];if (v241>0) then if (v240>v108[v239 + 1 ]) then v102=v110[3];else v108[v239 + 3 ]=v240;end elseif (v240<v108[v239 + 1 ]) then v102=v110[3];else v108[v239 + 3 ]=v240;end break;end if (v238==0) then v239=v110[2];v240=v108[v239];v238=1;end end else do return v108[v110[2]]();end end elseif (v111<=(1028 -(915 + 82))) then if (v111<=29) then v102=v110[3];elseif (v111==30) then v108[v110[2]]=v110[3]~=0 ;else v108[v110[2]]=v108[v110[3]][v110[4]];end elseif (v111<=32) then v108[v110[2]]=v108[v110[3]] + v110[4] ;elseif (v111==33) then local v245=0;local v246;while true do if (0==v245) then v246=v110[2];v108[v246]=v108[v246](v108[v246 + (2 -1) ]);break;end end else v62[v110[3]]=v108[v110[2]];end elseif (v111<=40) then if (v111<=(22 + 15)) then if (v111<=35) then local v160=0;local v161;local v162;local v163;while true do if (v160==0) then v161=v99[v110[3]];v162=nil;v160=1;end if (v160==1) then v163={};v162=v18({},{[v7("\210\255\87\205\49\232\216","\85\141\160\62\163")]=function(v363,v364)local v365=v163[v364];return v365[1][v365[2]];end,[v7("\19\1\205\211\183\236\34\58\198\206","\133\76\94\163\182\192")]=function(v366,v367,v368)local v369=0;local v370;while true do if (v369==0) then v370=v163[v367];v370[1][v370[2]]=v368;break;end end end});v160=2;end if (v160==2) then for v371=1 -0 ,v110[4] do local v372=0;local v373;while true do if (v372==1) then if (v373[1188 -(1069 + 118) ]==67) then v163[v371-(2 -1) ]={v108,v373[3]};else v163[v371-1 ]={v62,v373[3]};end v107[ #v107 + (1 -0) ]=v163;break;end if (v372==0) then v102=v102 + 1 ;v373=v98[v102];v372=1;end end end v108[v110[2]]=v41(v161,v162,v63);break;end end elseif (v111>36) then local v249=0;local v250;while true do if (v249==0) then v250=v110[2];v108[v250](v21(v108,v250 + 1 ,v110[3]));break;end end else local v251=0;local v252;local v253;while true do if (0==v251) then v252=v110[2];v253=v108[v110[1 + 2 ]];v251=1;end if (v251==1) then v108[v252 + 1 ]=v253;v108[v252]=v253[v110[4]];break;end end end elseif (v111<=38) then v108[v110[2]]=v108[v110[3]][v108[v110[6 -2 ]]];elseif (v111>39) then local v254=0;local v255;local v256;local v257;while true do if (v254==2) then if (v256>0) then if (v257<=v108[v255 + 1 ]) then local v497=0;while true do if (v497==0) then v102=v110[3];v108[v255 + 3 ]=v257;break;end end end elseif (v257>=v108[v255 + 1 + 0 ]) then local v498=0;while true do if (v498==0) then v102=v110[3];v108[v255 + 3 ]=v257;break;end end end break;end if (v254==0) then v255=v110[2];v256=v108[v255 + 2 ];v254=1;end if (v254==1) then v257=v108[v255] + v256 ;v108[v255]=v257;v254=2;end end else local v258=v110[2];v108[v258](v108[v258 + 1 ]);end elseif (v111<=(834 -(368 + 423))) then if (v111<=41) then local v166=0;local v167;local v168;local v169;while true do if (0==v166) then v167=v110[2];v168={v108[v167](v108[v167 + 1 ])};v166=1;end if (v166==1) then v169=0;for v374=v167,v110[4] do local v375=0;while true do if (v375==0) then v169=v169 + 1 ;v108[v374]=v168[v169];break;end end end break;end end elseif (v111>42) then if ((v110[3]==v7("\25\208\26\16","\79\70\149\84\70\96")) or (v110[3]==v7("\234\61\18\11\190\207\76","\58\141\88\102\109\219\161"))) then v108[v110[6 -4 ]]=v63;else v108[v110[2]]=v63[v110[3]];end else v108[v110[2]]=v110[3];end elseif (v111<=(62 -(10 + 8))) then if (v108[v110[2]]==v110[4]) then v102=v102 + 1 ;else v102=v110[3];end elseif (v111>45) then local v262=0;local v263;local v264;local v265;while true do if (v262==1) then v265=0 -0 ;for v453=v263,v110[4] do local v454=0;while true do if (v454==0) then v265=v265 + (443 -(416 + 26)) ;v108[v453]=v264[v265];break;end end end break;end if (0==v262) then v263=v110[2];v264={v108[v263](v108[v263 + 1 ])};v262=1;end end else local v266=0;local v267;while true do if (v266==0) then v267=v110[2];do return v108[v267](v21(v108,v267 + (3 -2) ,v110[3]));end break;end end end elseif (v111<=69) then if (v111<=57) then if (v111<=51) then if (v111<=48) then if (v111>47) then v108[v110[1 + 1 ]][v110[4 -1 ]]=v108[v110[442 -(145 + 293) ]];else v108[v110[2]]=v110[3]~=0 ;end elseif (v111<=49) then v108[v110[432 -(44 + 386) ]]=v62[v110[3]];elseif (v111>50) then local v268=0;local v269;while true do if (0==v268) then v269=v110[2];v108[v269](v21(v108,v269 + 1 ,v103));break;end end else local v270=0;local v271;while true do if (v270==0) then v271=v110[2];v108[v271]=v108[v271](v21(v108,v271 + 1 ,v103));break;end end end elseif (v111<=54) then if (v111<=(1538 -(998 + 488))) then local v175=0;local v176;local v177;local v178;local v179;while true do if (v175==0) then v176=v110[2];v177,v178=v101(v108[v176](v108[v176 + 1 ]));v175=1;end if (v175==2) then for v379=v176,v103 do local v380=0;while true do if (0==v380) then v179=v179 + 1 ;v108[v379]=v177[v179];break;end end end break;end if (v175==1) then v103=(v178 + v176) -(1 + 0) ;v179=0;v175=2;end end elseif (v111==53) then local v272=0;local v273;while true do if (v272==0) then v273=v110[2];do return v21(v108,v273,v103);end break;end end else local v274=0;local v275;local v276;local v277;local v278;while true do if (0==v274) then v275=v110[2];v276,v277=v101(v108[v275]());v274=1;end if (v274==1) then v103=(v277 + v275) -(1 + 0) ;v278=772 -(201 + 571) ;v274=2;end if (v274==2) then for v455=v275,v103 do local v456=0;while true do if (v456==0) then v278=v278 + 1 ;v108[v455]=v276[v278];break;end end end break;end end end elseif (v111<=55) then if (v110[2]==v108[v110[1142 -(116 + 1022) ]]) then v102=v102 + 1 ;else v102=v110[3];end elseif (v111==56) then v108[v110[8 -6 ]]=v108[v110[3]];else v108[v110[2]]= #v108[v110[3]];end elseif (v111<=63) then if (v111<=60) then if (v111<=58) then v108[v110[2]]();elseif (v111==(35 + 24)) then local v283=0;local v284;while true do if (0==v283) then v284=v110[2];v108[v284](v21(v108,v284 + 1 ,v110[3]));break;end end else local v285=v110[2];local v286=v110[4];local v287=v285 + 2 ;local v288={v108[v285](v108[v285 + (3 -2) ],v108[v287])};for v348=1,v286 do v108[v287 + v348 ]=v288[v348];end local v289=v288[3 -2 ];if v289 then v108[v287]=v289;v102=v110[3];else v102=v102 + 1 ;end end elseif (v111<=61) then do return;end elseif (v111>62) then for v351=v110[2],v110[3] do v108[v351]=nil;end else local v290=0;local v291;while true do if (v290==0) then v291=v110[2];v108[v291]=v108[v291](v108[v291 + 1 ]);break;end end end elseif (v111<=66) then if (v111<=(923 -(814 + 45))) then v108[v110[4 -2 ]][v108[v110[3]]]=v110[4];elseif (v111>65) then local v292=v110[2];v108[v292](v108[v292 + 1 ]);else local v293=0;local v294;local v295;local v296;local v297;while true do if (v293==0) then v294=v110[2];v295,v296=v101(v108[v294](v108[v294 + 1 ]));v293=1;end if (v293==1) then v103=(v296 + v294) -1 ;v297=0 + 0 ;v293=2;end if (v293==2) then for v457=v294,v103 do v297=v297 + 1 ;v108[v457]=v295[v297];end break;end end end elseif (v111<=67) then v108[v110[1 + 1 ]]=v108[v110[3]];elseif (v111>68) then local v298=v110[2];do return v108[v298](v21(v108,v298 + 1 ,v110[3]));end else local v299=0;local v300;local v301;local v302;while true do if (v299==0) then v300=v110[2];v301=v108[v300 + 2 ];v299=1;end if (1==v299) then v302=v108[v300] + v301 ;v108[v300]=v302;v299=2;end if (v299==2) then if (v301>0) then if (v302<=v108[v300 + 1 ]) then local v503=0;while true do if (v503==0) then v102=v110[3];v108[v300 + 3 ]=v302;break;end end end elseif (v302>=v108[v300 + 1 ]) then local v504=0;while true do if (0==v504) then v102=v110[3];v108[v300 + 3 ]=v302;break;end end end break;end end end elseif (v111<=81) then if (v111<=75) then if (v111<=72) then if (v111<=70) then v108[v110[2]]=v108[v110[3]] + v110[4] ;elseif (v111==71) then v108[v110[2]]=v108[v110[3]]%v108[v110[4]] ;else v108[v110[2]]=v108[v110[3]][v108[v110[4]]];end elseif (v111<=73) then if (v110[2]==v108[v110[4]]) then v102=v102 + 1 ;else v102=v110[3];end elseif (v111>74) then local v307=v110[2];local v308,v309=v101(v108[v307]());v103=(v309 + v307) -(886 -(261 + 624)) ;local v310=0;for v353=v307,v103 do local v354=0;while true do if (v354==0) then v310=v310 + 1 ;v108[v353]=v308[v310];break;end end end else v108[v110[2]][v110[3]]=v110[4];end elseif (v111<=78) then if (v111<=76) then if (v108[v110[2]]==v110[4]) then v102=v102 + 1 ;else v102=v110[3];end elseif (v111>77) then if ((v110[3]==v7("\245\85\52\11","\51\170\16\122\93\53\41\72")) or (v110[3]==v7("\181\7\39\64\127\90\184","\206\210\98\83\38\26\52"))) then v108[v110[2]]=v63;else v108[v110[2]]=v63[v110[3]];end else v108[v110[3 -1 ]][v108[v110[3]]]=v110[4];end elseif (v111<=79) then local v185=0;local v186;while true do if (v185==0) then v186=v110[1082 -(1020 + 60) ];v108[v186]=v108[v186](v21(v108,v186 + 1 ,v103));break;end end elseif (v111>80) then v108[v110[2]]();else v108[v110[2]]={};end elseif (v111<=87) then if (v111<=(1507 -(630 + 793))) then if (v111<=82) then v108[v110[2]]=v110[3] + v108[v110[4]] ;elseif (v111==83) then local v317=0;local v318;while true do if (v317==0) then v318=v110[2];v108[v318]=v108[v318](v21(v108,v318 + 1 ,v110[3]));break;end end else local v319=0;local v320;local v321;local v322;local v323;while true do if (v319==1) then v103=(v322 + v320) -1 ;v323=0 + 0 ;v319=2;end if (v319==0) then v320=v110[6 -4 ];v321,v322=v101(v108[v320](v21(v108,v320 + (4 -3) ,v103)));v319=1;end if (v319==2) then for v462=v320,v103 do local v463=0;while true do if (v463==0) then v323=v323 + 1 ;v108[v462]=v321[v323];break;end end end break;end end end elseif (v111<=85) then v108[v110[2]]=v108[v110[3]]%v108[v110[4]] ;elseif (v111>86) then v108[v110[2]]={};else v108[v110[6 -4 ]]= #v108[v110[3]];end elseif (v111<=90) then if (v111<=88) then v108[v110[2]][v108[v110[3]]]=v108[v110[4]];elseif (v111>89) then local v326=0;local v327;local v328;local v329;local v330;while true do if (v326==1) then v103=(v329 + v327) -(1748 -(760 + 987)) ;v330=0;v326=2;end if (v326==2) then for v464=v327,v103 do local v465=0;while true do if (v465==0) then v330=v330 + 1 ;v108[v464]=v328[v330];break;end end end break;end if (v326==0) then v327=v110[2];v328,v329=v101(v108[v327](v21(v108,v327 + 1 ,v110[3])));v326=1;end end else local v331=0;local v332;local v333;while true do if (v331==0) then v332=v110[2];v333=v108[v110[3]];v331=1;end if (v331==1) then v108[v332 + 1 ]=v333;v108[v332]=v333[v110[4]];break;end end end elseif (v111<=91) then local v191=0;local v192;local v193;local v194;local v195;while true do if (v191==2) then for v386=v192,v103 do v195=v195 + 1 ;v108[v386]=v193[v195];end break;end if (v191==0) then v192=v110[2];v193,v194=v101(v108[v192](v21(v108,v192 + 1 ,v110[3])));v191=1;end if (1==v191) then v103=(v194 + v192) -1 ;v195=0;v191=2;end end elseif (v111==92) then if  not v108[v110[1915 -(1789 + 124) ]] then v102=v102 + 1 ;else v102=v110[3];end else v108[v110[2]]=v108[v110[3]][v110[4]];end v102=v102 + 1 ;break;end end end end;end if (0==v64) then v65=v61[1];v66=v61[1067 -(68 + 997) ];v64=1;end end end return v41(v40(),{},v28)(...);end if (v29==0) then v30=1;v31=nil;v27=v12(v11(v27,5),v7("\8\22","\44\38\56\119\71\148"),function(v68)if (v9(v68,2)==79) then v31=v8(v11(v68,1,1));return "";else local v93=v10(v8(v68,16));if v31 then local v112=0;local v113;while true do if (v112==0) then v113=v13(v93,v31);v31=nil;v112=1;end if (v112==1) then return v113;end end else return v93;end end end);v29=1;end if (4==v29) then function v36()local v69=v35();local v70=v35();local v71=1;local v72=(v32(v70,1,20) * (2^32)) + v69 ;local v73=v32(v70,21,31);local v74=((v32(v70,32)==1) and  -1) or (2 -1) ;if (v73==0) then if (v72==0) then return v74 * 0 ;else local v114=0;while true do if (0==v114) then v73=620 -(555 + 64) ;v71=931 -(857 + 74) ;break;end end end elseif (v73==2047) then return ((v72==0) and (v74 * (1/0))) or (v74 * NaN) ;end return v16(v74,v73-1023 ) * (v71 + (v72/(2^52))) ;end v37=nil;function v37(v75)local v76;if  not v75 then local v94=0;while true do if (v94==0) then v75=v35();if (v75==0) then return "";end break;end end end v76=v11(v27,v30,(v30 + v75) -1 );v30=v30 + v75 ;local v77={};for v87=1, #v76 do v77[v87]=v10(v9(v11(v76,v87,v87)));end return v14(v77);end v29=5;end end end v23("LOL!0D3O0003063O00737472696E6703043O006368617203043O00627974652O033O0073756203053O0062697433322O033O0062697403043O0062786F7203053O007461626C6503063O00636F6E63617403063O00696E7365727403053O006D6174636803083O00746F6E756D62657203053O007063612O6C00243O00122B3O00013O00201F5O000200122B000100013O00201F00010001000300122B000200013O00201F00020002000400122B000300053O00060F0003000A000100010004053O000A000100122B000300063O00201F00040003000700122B000500083O00201F00050005000900122B000600083O00201F00060006000A00061200073O000100062O00433O00064O00438O00433O00044O00433O00014O00433O00024O00433O00053O00122B000800013O00201F00080008000B00122B0009000C3O00122B000A000D3O000612000B0001000100052O00433O00074O00433O00094O00433O00084O00433O000A4O00433O000B4O0038000C000B4O001B000C00014O0008000C6O001A3O00013O00023O00023O00026O00F03F026O00704002264O005700025O00122A000300014O003900045O00122A000500013O00040D0003002100012O000700076O0038000800024O0007000900014O0007000A00024O0007000B00034O0007000C00044O0038000D6O0038000E00063O002046000F000600012O005B000C000F4O0032000B3O00022O0007000C00034O0007000D00044O0038000E00014O0039000F00014O0055000F0006000F001052000F0001000F2O0039001000014O00550010000600100010520010000100100020460010001000012O005B000D00104O0054000C6O0032000A3O0002002003000A000A00022O00340009000A4O003300073O00010004440003000500012O0007000300054O0038000400024O002D000300044O000800036O001A3O00017O00043O00027O004003053O003A25642B3A2O033O0025642B026O00F03F001C3O0006125O000100012O00318O0007000100014O0007000200024O0007000300024O005700046O0007000500034O003800066O003F000700074O005B000500076O00043O000100201F00040004000100122A000500024O000400030005000200122A000400034O005B000200044O003200013O000200262C00010018000100040004053O001800012O003800016O005700026O002D000100024O000800015O0004053O001B00012O0007000100044O001B000100014O000800016O001A3O00013O00013O003E3O0003043O0067616D65030A3O0047657453657276696365030A3O00CF43A654E852B561E95E03043O00269C37C703073O00536574436F726503103O009B78722C3D7BEE4AAE747F29077DF54D03083O0023C81D1C4873149A03053O002DB6C5D38803073O005479DFB1BFED4C030F3O00826293E0155E35E2A953C8B435420803083O00A1DB36A9C05A305003043O007D47183103043O004529226003293O008FD6D5190139B5C1D24A1624FCD7DF0F4228B4C2D9040727FCC5D8184226B3D1D24A0124B2D7D2041603063O004BDCA3B76A6203083O0026AF9936CD0BB58503053O00B962DAEB57025O0094C14003073O00506C6179657273030B3O004C6F63616C506C6179657203083O00496E7374616E63652O033O006E657703093O003FCD4C777B79D4F20503083O00876CAE3E121E179303063O00506172656E7403093O00506C61796572477569030A3O0082EC32DF3ABB27D3B9E703083O00A7D6894AAB78CE5303043O005465787403093O00B8E43D4DB8949BF93C03063O00C7EB90523D9803083O00506F736974696F6E03053O005544696D32026O66D63F028O0002CD5OCCEC3F03043O0053697A65025O00406540026O00494003103O004261636B67726F756E64436F6C6F723303063O00436F6C6F723303073O0066726F6D524742025O00E06F40030A3O0054657874436F6C6F723303043O00466F6E7403043O00456E756D030A3O00536F7572636553616E7303083O005465787453697A65026O00314003113O004D6F75736542752O746F6E31436C69636B03073O00436F2O6E656374026O00F03F025O00C0524003093O00636F726F7574696E6503063O0063726561746503063O00726573756D65030A3O003503B7180204AF22041303043O004B6776D903073O005374652O70656403073O00F758710DBC0CD403063O007EA7341074D903053O0049646C656401AC3O0006013O00AA00013O0004053O00AA000100122B000100013O0020240001000100022O000700035O00122A000400033O00122A000500044O005B000300054O003200013O00020020240001000100052O000700035O00122A000400063O00122A000500074O00040003000500022O005700043O00032O000700055O00122A000600083O00122A000700094O00040005000700022O000700065O00122A0007000A3O00122A0008000B4O00040006000800022O00580004000500062O000700055O00122A0006000C3O00122A0007000D4O00040005000700022O000700065O00122A0007000E3O00122A0008000F4O00040006000800022O00580004000500062O000700055O00122A000600103O00122A000700114O000400050007000200204D0004000500122O002500010004000100122B000100013O00201F00010001001300201F0001000100142O005700026O001E000300013O00061200043O000100022O00433O00034O00317O00061200050001000100012O00433O00033O00061200060002000100022O00433O00024O00317O00122B000700153O00201F0007000700162O000700085O00122A000900173O00122A000A00184O005B0008000A4O003200073O000200201F00080001001A00103000070019000800122B000800153O00201F0008000800162O000700095O00122A000A001B3O00122A000B001C4O005B0009000B4O003200083O00022O000700095O00122A000A001E3O00122A000B001F4O00040009000B00020010300008001D000900103000080019000700122B000900213O00201F00090009001600122A000A00223O00122A000B00233O00122A000C00243O00122A000D00234O00040009000D000200103000080020000900122B000900213O00201F00090009001600122A000A00233O00122A000B00263O00122A000C00233O00122A000D00274O00040009000D000200103000080025000900122B000900293O00201F00090009002A00122A000A002B3O00122A000B00233O00122A000C00234O00040009000C000200103000080028000900122B000900293O00201F00090009002A00122A000A002B3O00122A000B002B3O00122A000C002B4O00040009000C00020010300008002C000900122B0009002E3O00201F00090009002D00201F00090009002F0010300008002D000900300C00080030003100201F000900080032002024000900090033000612000B0003000100022O00433O00054O00433O00064O00250009000B000100122A000900343O00122A000A00353O00122A000B00343O00040D0009008F000100122A000D00234O003F000E000E3O00262C000D0079000100230004053O0079000100122A000E00233O000E370023007C0001000E0004053O007C000100122B000F00363O00201F000F000F003700061200100004000100022O00433O00044O00433O000C4O003E000F000200022O00580002000C000F00122B000F00363O00201F000F000F00382O002600100002000C2O0027000F000200010004053O008D00010004053O007C00010004053O008D00010004053O007900012O000E000C5O00044400090077000100122B000900013O0020240009000900022O0007000B5O00122A000C00393O00122A000D003A4O005B000B000D4O003200093O000200201F00090009003B002024000900090033000612000B0005000100012O00433O00024O00250009000B000100122B000900013O0020240009000900022O0007000B5O00122A000C003C3O00122A000D003D4O005B000B000D4O003200093O000200201F00090009001400201F00090009003E002024000900090033000612000B0006000100012O00318O00250009000B00012O000E00015O0004053O00AB000100201F00013O00342O001A3O00013O00073O000D3O00028O00026O00F03F03043O007761697403043O0067616D65030A3O004765745365727669636503113O00F93937EAD7A9CA2822E2EDBEC42E26E1DB03063O00CAAB5C4786BE03063O004576656E747303043O005370696E030A3O004669726553657276657203113O001BC43C8420C22D9C2CC51F9C26D32D8F2C03043O00E849A14C030B3O00436C61696D52657761726401254O000700015O0006010001002400013O0004053O0024000100122A000100013O00262C00010009000100020004053O0009000100122B000200034O003A0002000100010004055O0001000E3700010004000100010004053O0004000100122B000200043O0020240002000200052O0007000400013O00122A000500063O00122A000600074O005B000400064O003200023O000200201F00020002000800201F00020002000900202400020002000A2O002700020002000100122B000200043O0020240002000200052O0007000400013O00122A0005000B3O00122A0006000C4O005B000400064O003200023O000200201F00020002000800201F00020002000D00202400020002000A2O002700020002000100122A000100023O0004053O000400010004055O00012O001A3O00019O003O00034O001E8O00228O001A3O00017O00033O0003053O00706169727303093O00636F726F7574696E6503043O0077726170000F3O00122B3O00014O000700016O00293O000200020004053O000C000100122B000500023O00201F00050005000300061200063O000100022O00433O00044O00313O00014O003E0005000200022O003A0005000100012O000E00035O0006153O0004000100020004053O000400012O001A3O00013O00013O00043O0003093O00636F726F7574696E6503053O007969656C6403043O00A8CD2O4D03053O007EDBB9223D00093O00122B3O00013O00201F5O00022O000700016O0007000200013O00122A000300033O00122A000400044O005B000200044O00335O00012O001A3O00017O00013O00029O000A3O00122A3O00013O00262C3O0001000100010004053O000100012O000700016O003A0001000100012O0007000100014O003A0001000100010004053O000900010004053O000100012O001A3O00019O003O00044O00078O0007000100014O00273O000200012O001A3O00017O00043O00026O00F03F026O00F0BF03093O00636F726F7574696E6503063O00726573756D65000C4O00078O00397O00122A000100013O00122A000200023O00040D3O000B000100122B000400033O00201F0004000400042O000700056O00260005000500032O00270004000200010004443O000500012O001A3O00017O000B3O00028O0003043O0067616D65030A3O0047657453657276696365030B3O00FE273294A118F0FD3D259203073O009CA84E40E0D47903113O0043617074757265436F6E74726F2O6C6572030B3O0031E7B7DA12EFA9FB14EBB703043O00AE678EC5030C3O00436C69636B42752O746F6E3203073O00566563746F72322O033O006E657700213O00122A3O00014O003F000100013O000E370001000200013O0004053O0002000100122A000100013O00262C00010005000100010004053O0005000100122B000200023O0020240002000200032O000700045O00122A000500043O00122A000600054O005B000400064O003200023O00020020240002000200062O002700020002000100122B000200023O0020240002000200032O000700045O00122A000500073O00122A000600084O005B000400064O003200023O000200202400020002000900122B0004000A3O00201F00040004000B2O004B000400014O003300023O00010004053O002000010004053O000500010004053O002000010004053O000200012O001A3O00017O00",v17(),...);
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
                   
