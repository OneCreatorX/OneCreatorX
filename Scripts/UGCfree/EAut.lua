local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v24,v25)local v26={};for v42=1, #v24 do v6(v26,v0(v4(v1(v2(v24,v42,v42 + 1 )),v1(v2(v25,1 + (v42% #v25) ,1 + (v42% #v25) + 1 )))%256 ));end return v5(v26);end local v8=tonumber;local v9=string.byte;local v10=string.char;local v11=string.sub;local v12=string.gsub;local v13=string.rep;local v14=table.concat;local v15=table.insert;local v16=math.ldexp;local v17=getfenv or function()return _ENV;end ;local v18=setmetatable;local v19=pcall;local v20=select;local v21=unpack or table.unpack ;local v22=tonumber;local function v23(v27,v28,...)local v29=0;local v30;local v31;local v32;local v33;local v34;local v35;local v36;local v37;local v38;local v39;local v40;local v41;while true do if (0==v29) then v30=1;v31=nil;v27=v12(v11(v27,5),v7("\203\128","\98\229\174\30"),function(v43)if (v9(v43,2)==79) then v31=v8(v11(v43,1,1));return "";else local v81=0;local v82;while true do if (v81==0) then v82=v10(v8(v43,16));if v31 then local v120=v13(v82,v31);v31=nil;return v120;else return v82;end break;end end end end);v32=nil;v29=1;end if (v29==3) then function v36()local v44=v35();local v45=v35();local v46=1;local v47=(v32(v45,1,20) * (2^32)) + v44 ;local v48=v32(v45,21,31);local v49=((v32(v45,61 -29 )==1) and  -(2 -1)) or 1 ;if (v48==0) then if (v47==0) then return v49 * 0 ;else local v91=0;while true do if (v91==0) then v48=1;v46=0;break;end end end elseif (v48==2047) then return ((v47==0) and (v49 * (1/0))) or (v49 * NaN) ;end return v16(v49,v48-1023 ) * (v46 + (v47/((621 -(555 + 64))^52))) ;end v37=nil;function v37(v50)local v51=0;local v52;local v53;while true do if (v51==3) then return v14(v53);end if (2==v51) then v53={};for v92=1, #v52 do v53[v92]=v10(v9(v11(v52,v92,v92)));end v51=3;end if (v51==1) then v52=v11(v27,v30,(v30 + v50) -1 );v30=v30 + v50 ;v51=2;end if (v51==0) then v52=nil;if  not v50 then local v117=0;while true do if (0==v117) then v50=v35();if (v50==0) then return "";end break;end end end v51=1;end end end v38=v35;v29=4;end if (v29==5) then v41=nil;function v41(v54,v55,v56)local v57=0;local v58;local v59;local v60;while true do if (v57==1) then v60=v54[3 + 0 ];return function(...)local v94=v58;local v95=v59;local v96=v60;local v97=v39;local v98=1;local v99= -1;local v100={};local v101={...};local v102=v20("#",...) -1 ;local v103={};local v104={};for v118=0,v102 do if (v118>=v96) then v100[v118-v96 ]=v101[v118 + 1 ];else v104[v118]=v101[v118 + 1 ];end end local v105=(v102-v96) + 1 ;local v106;local v107;while true do local v119=0;while true do if (v119==0) then v106=v94[v98];v107=v106[1];v119=1;end if (v119==1) then if (v107<=39) then if (v107<=19) then if (v107<=9) then if (v107<=4) then if (v107<=1) then if (v107>0) then if v104[v106[2]] then v98=v98 + 1 ;else v98=v106[3];end else local v144=v106[2];local v145={};for v244=1 + 0 , #v103 do local v245=0;local v246;while true do if (v245==0) then v246=v103[v244];for v406=0, #v246 do local v407=0;local v408;local v409;local v410;while true do if (0==v407) then v408=v246[v406];v409=v408[1];v407=1;end if (v407==1) then v410=v408[2];if ((v409==v104) and (v410>=v144)) then local v488=0;while true do if (v488==0) then v145[v410]=v409[v410];v408[1]=v145;break;end end end break;end end end break;end end end end elseif (v107<=2) then local v146=0;local v147;while true do if (v146==0) then v147=v106[2];do return v21(v104,v147,v99);end break;end end elseif (v107>(960 -(892 + 65))) then if  not v104[v106[4 -2 ]] then v98=v98 + 1 ;else v98=v106[3];end elseif v104[v106[2]] then v98=v98 + 1 ;else v98=v106[3];end elseif (v107<=6) then if (v107==5) then local v148=v106[2];v104[v148](v104[v148 + 1 ]);else local v149=0;local v150;local v151;local v152;local v153;while true do if (2==v149) then for v367=v150,v99 do local v368=0;while true do if (v368==0) then v153=v153 + 1 ;v104[v367]=v151[v153];break;end end end break;end if (0==v149) then v150=v106[2];v151,v152=v97(v104[v150](v104[v150 + 1 ]));v149=1;end if (v149==1) then v99=(v152 + v150) -1 ;v153=0;v149=2;end end end elseif (v107<=7) then local v154=v106[2];v104[v154](v21(v104,v154 + 1 ,v106[3]));elseif (v107>8) then local v253=v106[2];local v254=v104[v253];for v323=v253 + 1 ,v99 do v15(v254,v104[v323]);end else v104[v106[2]]={};end elseif (v107<=14) then if (v107<=11) then if (v107>10) then local v155=0;local v156;while true do if (v155==0) then v156=v106[2];v104[v156](v104[v156 + 1 ]);break;end end else local v157=0;local v158;local v159;while true do if (v157==0) then v158=v106[2];v159=v104[v106[3]];v157=1;end if (v157==1) then v104[v158 + 1 ]=v159;v104[v158]=v159[v106[4]];break;end end end elseif (v107<=(21 -9)) then local v160=0;local v161;local v162;local v163;local v164;while true do if (v160==0) then v161=v106[2];v162,v163=v97(v104[v161](v21(v104,v161 + 1 ,v99)));v160=1;end if (2==v160) then for v369=v161,v99 do local v370=0;while true do if (v370==0) then v164=v164 + 1 ;v104[v369]=v162[v164];break;end end end break;end if (v160==1) then v99=(v163 + v161) -1 ;v164=0;v160=2;end end elseif (v107==13) then v104[v106[2]][v106[3]]=v106[4];else local v258=0;local v259;local v260;local v261;while true do if (v258==1) then v261=0;for v426=v259,v106[4] do local v427=0;while true do if (v427==0) then v261=v261 + (181 -(67 + 113)) ;v104[v426]=v260[v261];break;end end end break;end if (v258==0) then v259=v106[2];v260={v104[v259](v21(v104,v259 + (351 -(87 + 263)) ,v99))};v258=1;end end end elseif (v107<=16) then if (v107>15) then local v165=0;local v166;local v167;local v168;while true do if (0==v165) then v166=v95[v106[3]];v167=nil;v165=1;end if (v165==2) then for v371=1,v106[4] do v98=v98 + 1 ;local v372=v94[v98];if (v372[1]==76) then v168[v371-1 ]={v104,v372[3]};else v168[v371-1 ]={v55,v372[3]};end v103[ #v103 + (2 -1) ]=v168;end v104[v106[2]]=v41(v166,v167,v56);break;end if (v165==1) then v168={};v167=v18({},{[v7("\226\6\18\227\130\84\245","\99\189\89\123\141\230\49\141")]=function(v374,v375)local v376=0;local v377;while true do if (v376==0) then v377=v168[v375];return v377[1][v377[2 + 0 ]];end end end,[v7("\117\204\127\243\6\67\253\117\243\9","\113\42\147\17\150")]=function(v378,v379,v380)local v381=v168[v379];v381[1][v381[2]]=v380;end});v165=2;end end else v104[v106[2 + 0 ]]= #v104[v106[3]];end elseif (v107<=(67 -50)) then if (v104[v106[2]]==v106[4]) then v98=v98 + 1 ;else v98=v106[3];end elseif (v107==18) then local v263=0;local v264;local v265;while true do if (0==v263) then v264=v106[2];v265={};v263=1;end if (v263==1) then for v430=953 -(802 + 150) , #v103 do local v431=0;local v432;while true do if (v431==0) then v432=v103[v430];for v489=0 -0 , #v432 do local v490=0;local v491;local v492;local v493;while true do if (v490==1) then v493=v491[2];if ((v492==v104) and (v493>=v264)) then local v504=0;while true do if (v504==0) then v265[v493]=v492[v493];v491[1]=v265;break;end end end break;end if (v490==0) then v491=v432[v489];v492=v491[1];v490=1;end end end break;end end end break;end end else v104[v106[2]][v106[3]]=v106[4];end elseif (v107<=29) then if (v107<=24) then if (v107<=21) then if (v107==20) then if (v104[v106[2]]==v106[4]) then v98=v98 + 1 ;else v98=v106[3];end else local v170=0;local v171;while true do if (v170==0) then v171=v106[2];v104[v171]=v104[v171](v21(v104,v171 + 1 ,v99));break;end end end elseif (v107<=22) then for v247=v106[2],v106[3] do v104[v247]=nil;end elseif (v107==23) then if  not v104[v106[2]] then v98=v98 + 1 ;else v98=v106[5 -2 ];end else v104[v106[2]][v106[3]]=v104[v106[4]];end elseif (v107<=26) then if (v107==25) then v104[v106[2]]=v104[v106[3]][v106[3 + 1 ]];else do return;end end elseif (v107<=27) then local v174=v106[2];local v175=v104[v106[3]];v104[v174 + 1 ]=v175;v104[v174]=v175[v106[4]];elseif (v107>28) then v104[v106[999 -(915 + 82) ]]=v55[v106[3]];else local v273=v106[2];v104[v273]=v104[v273](v21(v104,v273 + (2 -1) ,v106[3]));end elseif (v107<=34) then if (v107<=31) then if (v107>30) then if ((v106[3]==v7("\208\205\33\144","\112\143\136\111\198\77")) or (v106[3]==v7("\128\172\22\225\130\167\20","\135\231\201\98"))) then v104[v106[2]]=v56;else v104[v106[2]]=v56[v106[3]];end else v98=v106[3];end elseif (v107<=32) then v104[v106[2]]={};elseif (v107==33) then v104[v106[2]]=v104[v106[3]]%v106[3 + 1 ] ;else v104[v106[2]]=v104[v106[3]];end elseif (v107<=36) then if (v107>35) then v104[v106[2 -0 ]]=v106[3] + v104[v106[4]] ;else local v182=0;local v183;while true do if (v182==0) then v183=v106[2];do return v104[v183](v21(v104,v183 + 1 ,v106[3]));end break;end end end elseif (v107<=37) then local v184=0;local v185;local v186;local v187;while true do if (v184==1) then v187=v104[v185] + v186 ;v104[v185]=v187;v184=2;end if (2==v184) then if (v186>0) then if (v187<=v104[v185 + (1188 -(1069 + 118)) ]) then v98=v106[3];v104[v185 + 3 ]=v187;end elseif (v187>=v104[v185 + (2 -1) ]) then local v451=0;while true do if (v451==0) then v98=v106[3];v104[v185 + 3 ]=v187;break;end end end break;end if (v184==0) then v185=v106[2];v186=v104[v185 + 2 ];v184=1;end end elseif (v107>38) then local v281=0;local v282;local v283;local v284;local v285;while true do if (v281==1) then v99=(v284 + v282) -1 ;v285=0;v281=2;end if (2==v281) then for v433=v282,v99 do local v434=0;while true do if (v434==0) then v285=v285 + 1 ;v104[v433]=v283[v285];break;end end end break;end if (v281==0) then v282=v106[2];v283,v284=v97(v104[v282](v21(v104,v282 + 1 ,v106[6 -3 ])));v281=1;end end else local v286=0;local v287;while true do if (0==v286) then v287=v106[1 + 1 ];v104[v287]=v104[v287](v21(v104,v287 + 1 ,v99));break;end end end elseif (v107<=59) then if (v107<=49) then if (v107<=(77 -33)) then if (v107<=41) then if (v107==40) then v104[v106[2 + 0 ]]=v104[v106[3]]%v104[v106[4]] ;else v104[v106[2]]=v104[v106[3]]%v106[4] ;end elseif (v107<=42) then local v190=0;local v191;local v192;local v193;while true do if (v190==1) then v193=v104[v191] + v192 ;v104[v191]=v193;v190=2;end if (v190==0) then v191=v106[793 -(368 + 423) ];v192=v104[v191 + 2 ];v190=1;end if (v190==2) then if (v192>0) then if (v193<=v104[v191 + 1 ]) then local v452=0;while true do if (v452==0) then v98=v106[9 -6 ];v104[v191 + 3 ]=v193;break;end end end elseif (v193>=v104[v191 + 1 ]) then v98=v106[3];v104[v191 + 3 ]=v193;end break;end end elseif (v107>43) then local v288=v106[2];v104[v288](v21(v104,v288 + 1 ,v99));else do return v104[v106[20 -(10 + 8) ]]();end end elseif (v107<=46) then if (v107>45) then local v194=0;local v195;local v196;local v197;local v198;while true do if (v194==1) then v99=(v197 + v195) -1 ;v198=0;v194=2;end if (v194==2) then for v384=v195,v99 do local v385=0;while true do if (v385==0) then v198=v198 + 1 ;v104[v384]=v196[v198];break;end end end break;end if (v194==0) then v195=v106[2];v196,v197=v97(v104[v195](v104[v195 + 1 ]));v194=1;end end else v104[v106[7 -5 ]]=v104[v106[3]] + v106[4] ;end elseif (v107<=47) then local v200=0;local v201;while true do if (v200==0) then v201=v106[2];do return v21(v104,v201,v99);end break;end end elseif (v107==48) then if ((v106[3]==v7("\105\152\202\33","\199\54\221\132\119\173")) or (v106[3]==v7("\11\134\53\4\48\227\214","\217\108\227\65\98\85\141\160"))) then v104[v106[2]]=v56;else v104[v106[2]]=v56[v106[3]];end else v98=v106[3];end elseif (v107<=54) then if (v107<=51) then if (v107>50) then local v202=0;local v203;local v204;local v205;while true do if (v202==0) then v203=v106[2];v204=v104[v203];v202=1;end if (v202==1) then v205=v104[v203 + 2 ];if (v205>0) then if (v204>v104[v203 + 1 ]) then v98=v106[3];else v104[v203 + 3 ]=v204;end elseif (v204<v104[v203 + 1 ]) then v98=v106[3];else v104[v203 + 3 ]=v204;end break;end end elseif (v106[2]==v104[v106[446 -(416 + 26) ]]) then v98=v98 + 1 ;else v98=v106[3];end elseif (v107<=52) then v104[v106[2]]=v106[3];elseif (v107>(169 -116)) then local v291=v106[2];local v292=v106[2 + 2 ];local v293=v291 + 2 ;local v294={v104[v291](v104[v291 + 1 ],v104[v293])};for v347=1,v292 do v104[v293 + v347 ]=v294[v347];end local v295=v294[1];if v295 then local v389=0;while true do if (v389==0) then v104[v293]=v295;v98=v106[3];break;end end else v98=v98 + 1 ;end elseif (v106[2]==v104[v106[6 -2 ]]) then v98=v98 + 1 ;else v98=v106[3];end elseif (v107<=56) then if (v107==55) then do return v104[v106[2]]();end else v104[v106[2]]=v104[v106[3]]%v104[v106[4]] ;end elseif (v107<=(495 -(145 + 293))) then local v209=0;local v210;while true do if (v209==0) then v210=v106[2];v104[v210](v21(v104,v210 + 1 ,v99));break;end end elseif (v107==(488 -(44 + 386))) then local v296=0;local v297;local v298;local v299;while true do if (v296==1) then v299=0;for v435=v297,v106[4] do local v436=0;while true do if (0==v436) then v299=v299 + 1 ;v104[v435]=v298[v299];break;end end end break;end if (v296==0) then v297=v106[2];v298={v104[v297](v104[v297 + 1 ])};v296=1;end end else local v300=0;local v301;local v302;local v303;while true do if (v300==0) then v301=v106[2];v302={v104[v301](v21(v104,v301 + 1 ,v99))};v300=1;end if (v300==1) then v303=0;for v437=v301,v106[4] do local v438=0;while true do if (v438==0) then v303=v303 + 1 ;v104[v437]=v302[v303];break;end end end break;end end end elseif (v107<=69) then if (v107<=(1550 -(998 + 488))) then if (v107<=61) then if (v107>60) then v104[v106[2]]=v55[v106[3]];else v104[v106[2]]=v104[v106[3]][v106[4]];end elseif (v107<=62) then v104[v106[1 + 1 ]]=v106[3] + v104[v106[4]] ;elseif (v107>63) then for v351=v106[2],v106[3] do v104[v351]=nil;end else do return;end end elseif (v107<=66) then if (v107==65) then local v216=0;local v217;local v218;local v219;while true do if (0==v216) then v217=v106[2];v218=v104[v217];v216=1;end if (1==v216) then v219=v104[v217 + 2 + 0 ];if (v219>0) then if (v218>v104[v217 + (773 -(201 + 571)) ]) then v98=v106[3];else v104[v217 + 3 ]=v218;end elseif (v218<v104[v217 + 1 ]) then v98=v106[1141 -(116 + 1022) ];else v104[v217 + 3 ]=v218;end break;end end else local v220=0;local v221;local v222;local v223;while true do if (v220==1) then v223={};v222=v18({},{[v7("\202\218\37\48\199\240\253","\163\149\133\76\94")]=function(v391,v392)local v393=0;local v394;while true do if (v393==0) then v394=v223[v392];return v394[1][v394[2]];end end end,[v7("\159\50\33\35\226\61\216\164\8\55","\182\192\109\79\70\149\84")]=function(v395,v396,v397)local v398=0;local v399;while true do if (0==v398) then v399=v223[v396];v399[1][v399[8 -6 ]]=v397;break;end end end});v220=2;end if (v220==0) then v221=v95[v106[3]];v222=nil;v220=1;end if (v220==2) then for v400=1,v106[3 + 1 ] do local v401=0;local v402;while true do if (1==v401) then if (v402[1]==76) then v223[v400-1 ]={v104,v402[10 -7 ]};else v223[v400-1 ]={v55,v402[862 -(814 + 45) ]};end v103[ #v103 + (2 -1) ]=v223;break;end if (v401==0) then v98=v98 + 1 ;v402=v94[v98];v401=1;end end end v104[v106[2]]=v41(v221,v222,v56);break;end end end elseif (v107<=(4 + 63)) then local v224=0;local v225;while true do if (v224==0) then v225=v106[2];do return v104[v225](v21(v104,v225 + 1 ,v106[3]));end break;end end elseif (v107>68) then local v304=0;local v305;while true do if (v304==0) then v305=v106[1 + 1 ];v104[v305](v21(v104,v305 + 1 ,v106[3]));break;end end else local v306=v106[2];local v307={v104[v306](v104[v306 + 1 ])};local v308=0;for v359=v306,v106[4] do local v360=0;while true do if (0==v360) then v308=v308 + 1 ;v104[v359]=v307[v308];break;end end end end elseif (v107<=74) then if (v107<=71) then if (v107==70) then local v226=v106[2];local v227=v106[4];local v228=v226 + 2 ;local v229={v104[v226](v104[v226 + 1 ],v104[v228])};for v249=1,v227 do v104[v228 + v249 ]=v229[v249];end local v230=v229[1];if v230 then local v309=0;while true do if (v309==0) then v104[v228]=v230;v98=v106[3];break;end end else v98=v98 + 1 ;end else v104[v106[2]][v106[3]]=v104[v106[4]];end elseif (v107<=72) then local v233=0;local v234;local v235;local v236;local v237;while true do if (0==v233) then v234=v106[2];v235,v236=v97(v104[v234](v21(v104,v234 + 1 ,v106[3])));v233=1;end if (v233==1) then v99=(v236 + v234) -1 ;v237=0;v233=2;end if (v233==2) then for v403=v234,v99 do v237=v237 + 1 ;v104[v403]=v235[v237];end break;end end elseif (v107==73) then local v310=0;local v311;local v312;local v313;local v314;while true do if (v310==2) then for v441=v311,v99 do local v442=0;while true do if (v442==0) then v314=v314 + 1 ;v104[v441]=v312[v314];break;end end end break;end if (v310==0) then v311=v106[2];v312,v313=v97(v104[v311](v21(v104,v311 + 1 ,v99)));v310=1;end if (v310==1) then v99=(v313 + v311) -1 ;v314=0;v310=2;end end else v104[v106[887 -(261 + 624) ]]= #v104[v106[3]];end elseif (v107<=76) then if (v107>75) then v104[v106[2]]=v104[v106[4 -1 ]];else v104[v106[1082 -(1020 + 60) ]]=v106[3];end elseif (v107<=77) then v104[v106[2]]=v104[v106[3]] + v106[1427 -(630 + 793) ] ;elseif (v107>(264 -186)) then local v316=0;local v317;while true do if (v316==0) then v317=v106[2];v104[v317]=v104[v317](v21(v104,v317 + 1 ,v106[3]));break;end end else local v318=0;local v319;local v320;while true do if (v318==0) then v319=v106[2];v320=v104[v319];v318=1;end if (v318==1) then for v443=v319 + 1 ,v99 do v15(v320,v104[v443]);end break;end end end v98=v98 + (4 -3) ;break;end end end end;end if (v57==0) then v58=v54[1];v59=v54[2];v57=1;end end end return v41(v40(),{},v28)(...);end if (v29==1) then function v32(v61,v62,v63)if v63 then local v83=0;local v84;while true do if (v83==0) then v84=(v61/(2^(v62-1)))%(2^(((v63-1) -(v62-1)) + 1)) ;return v84-(v84%1) ;end end else local v85=0;local v86;while true do if (v85==0) then v86=2^(v62-1) ;return (((v61%(v86 + v86))>=v86) and 1) or 0 ;end end end end v33=nil;function v33()local v64=0;local v65;while true do if (v64==1) then return v65;end if (0==v64) then v65=v9(v27,v30,v30);v30=v30 + 1 ;v64=1;end end end v34=nil;v29=2;end if (v29==2) then function v34()local v66=0;local v67;local v68;while true do if (v66==0) then v67,v68=v9(v27,v30,v30 + 2 );v30=v30 + 2 ;v66=1;end if (1==v66) then return (v68 * (800 -544)) + v67 ;end end end v35=nil;function v35()local v69=0;local v70;local v71;local v72;local v73;while true do if (v69==1) then return (v73 * 16777216) + (v72 * 65536) + (v71 * 256) + v70 ;end if (v69==0) then v70,v71,v72,v73=v9(v27,v30,v30 + (8 -5) );v30=v30 + 4 ;v69=1;end end end v36=nil;v29=3;end if (v29==4) then v39=nil;function v39(...)return {...},v20("#",...);end v40=nil;function v40()local v74=0;local v75;local v76;local v77;local v78;local v79;local v80;while true do if (v74==2) then for v108=1,v35() do local v109=0;local v110;while true do if (v109==0) then v110=v33();if (v32(v110,1,1)==(0 + 0)) then local v128=0;local v129;local v130;local v131;while true do if (v128==2) then if (v32(v130,1271 -(226 + 1044) ,1)==1) then v131[2]=v80[v131[2]];end if (v32(v130,2,2)==1) then v131[12 -9 ]=v80[v131[3]];end v128=3;end if (v128==1) then v131={v34(),v34(),nil,nil};if (v129==(0 + 0)) then local v137=0;while true do if (v137==0) then v131[880 -(282 + 595) ]=v34();v131[1641 -(1523 + 114) ]=v34();break;end end elseif (v129==1) then v131[3 + 0 ]=v35();elseif (v129==2) then v131[3]=v35() -(2^(22 -6)) ;elseif (v129==(1068 -(68 + 997))) then local v243=0;while true do if (v243==0) then v131[3]=v35() -(2^16) ;v131[4]=v34();break;end end end v128=2;end if (v128==3) then if (v32(v130,3,3)==(118 -(32 + 85))) then v131[4]=v80[v131[4]];end v75[v108]=v131;break;end if (v128==0) then v129=v32(v110,2,3);v130=v32(v110,4,6);v128=1;end end end break;end end end for v111=1,v35() do v76[v111-1 ]=v40();end return v78;end if (v74==0) then v75={};v76={};v77={};v78={v75,v76,nil,v77};v74=1;end if (1==v74) then v79=v35();v80={};for v113=569 -(367 + 201) ,v79 do local v114=0;local v115;local v116;while true do if (v114==0) then v115=v33();v116=nil;v114=1;end if (1==v114) then if (v115==1) then v116=v33()~=0 ;elseif (v115==2) then v116=v36();elseif (v115==(930 -(214 + 713))) then v116=v37();end v80[v113]=v116;break;end end end v78[3]=v33();v74=2;end end end v29=5;end end end v23("LOL!0D3O0003063O00737472696E6703043O006368617203043O00627974652O033O0073756203053O0062697433322O033O0062697403043O0062786F7203053O007461626C6503063O00636F6E63617403063O00696E7365727403053O006D6174636803083O00746F6E756D62657203053O007063612O6C00243O0012303O00013O0020195O0002001230000100013O002019000100010003001230000200013O002019000200020004001230000300053O0006170003000A000100010004313O000A0001001230000300063O002019000400030007001230000500083O002019000500050009001230000600083O00201900060006000A00061000073O000100062O004C3O00064O004C8O004C3O00044O004C3O00014O004C3O00024O004C3O00053O001230000800013O00201900080008000B0012300009000C3O001230000A000D3O000610000B0001000100052O004C3O00074O004C3O00094O004C3O00084O004C3O000A4O004C3O000B4O0022000C000B4O002B000C00014O002F000C6O003F3O00013O00023O00023O00026O00F03F026O00704002264O002000025O00124B000300014O000F00045O00124B000500013O0004410003002100012O001D00076O0022000800024O001D000900014O001D000A00024O001D000B00034O001D000C00044O0022000D6O0022000E00063O00204D000F000600012O0027000C000F4O0026000B3O00022O001D000C00034O001D000D00044O0022000E00014O000F000F00014O0038000F0006000F00103E000F0001000F2O000F001000014O003800100006001000103E00100001001000204D0010001000012O0027000D00104O0049000C6O0026000A3O0002002029000A000A00022O002E0009000A4O003900073O00010004250003000500012O001D000300054O0022000400024O0023000300044O002F00036O003F3O00017O00043O00027O004003053O003A25642B3A2O033O0025642B026O00F03F001C3O0006105O000100012O003D8O001D000100014O001D000200024O001D000300024O002000046O001D000500034O002200066O0040000700074O0027000500074O000900043O000100201900040004000100124B000500024O001C00030005000200124B000400034O0027000200044O002600013O000200261100010018000100040004313O001800012O002200016O002000026O0023000100024O002F00015O0004313O001B00012O001D000100044O002B000100014O002F00016O003F3O00013O00013O004C3O0003083O00496E7374616E63652O033O006E657703093O002077E82D167ADD3D1A03043O004873149A03063O00506172656E7403043O0067616D6503073O00506C6179657273030B3O004C6F63616C506C6179657203093O00506C61796572477569030C3O0052657365744F6E537061776E0100030A3O004765745365727669636503113O002BBAC1D3842F350DBAD5EC99232618B8D403073O005479DFB1BFED4C030C3O0057616974466F724368696C6403083O008B57CAAB3B5735D203083O00A1DB36A9C05A305003063O00766B0E214C5A03043O004529226003143O00AFCFD2031625B5C0DC350925B5D7F75B4C7FF29403063O004BDCA3B76A6203043O0009B4822303053O00B962DAEB5703083O00F83935F0D7A9CE2F03063O00CAAB5C4786BE030D3O0008D72D9C28D31F8D3BD7258B2C03043O00E849A14C03023O0089FF03053O007EDBB9223D03143O0038DC475D705AF2E902CB4F677779DCF218C8576603083O00876CAE3E121E179303053O0090FB2BC61D03083O00A7D6894AAB78CE5303043O0053697A6503053O005544696D32028O00026O006940026O005E4003083O00506F736974696F6E026O00E03F026O0059C0026O004EC003103O004261636B67726F756E64436F6C6F723303063O00436F6C6F723303073O0066726F6D524742025O00804B40030F3O00426F7264657253697A65506978656C029A5O99D93F03063O004163746976652O0103093O004472612O6761626C6503093O00BFF52A49D4A689F53E03063O00C7EB90523D9803043O0054657874030F3O003E22E36B2818BC081513B83F08048103043O004B6776D9026O00F03F026O003E4003083O005465787453697A65026O003140030A3O0054657874436F6C6F7233025O00E06F40030A3O00F35168009B0BD3407F1A03063O007EA7341074D9030D3O00880F3594BB59DFC4213488B10A03073O009CA84E40E0D47902295C8FC2F528E43F026O003EC0025O00805140030A3O0033EBBDDA25FBB1DA08E003043O00AE678EC503093O00773D4B376579FD5B3B03073O009836483F58453E02CD5OCCF43F03113O004D6F75736542752O746F6E31436C69636B03073O00436F2O6E65637401EA3O0006013O00E800013O0004313O00E80001001230000100013O0020190001000100022O001D00025O00124B000300033O00124B000400044O0027000200044O002600013O0002001230000200063O00201900020002000700201900020002000800201900020002000900101800010005000200300D0001000A000B001230000200063O00201B00020002000C2O001D00045O00124B0005000D3O00124B0006000E4O0027000400064O002600023O000200201B00020002000F2O001D00045O00124B000500103O00124B000600114O0027000400064O002600023O000200201B00020002000F2O001D00045O00124B000500123O00124B000600134O0027000400064O002600023O000200201B00020002000F2O001D00045O00124B000500143O00124B000600154O0027000400064O002600023O000200201B00020002000F2O001D00045O00124B000500163O00124B000600174O0027000400064O002600023O000200201B00020002000F2O001D00045O00124B000500183O00124B000600194O0027000400064O002600023O000200201B00020002000F2O001D00045O00124B0005001A3O00124B0006001B4O0027000400064O002600023O000200201B00020002000F2O001D00045O00124B0005001C3O00124B0006001D4O0027000400064O002600023O000200201B00020002000F2O001D00045O00124B0005001E3O00124B0006001F4O0027000400064O002600023O0002001230000300013O0020190003000300022O001D00045O00124B000500203O00124B000600214O0027000400064O002600033O0002001230000400233O00201900040004000200124B000500243O00124B000600253O00124B000700243O00124B000800264O001C000400080002001018000300220004001230000400233O00201900040004000200124B000500283O00124B000600293O00124B000700283O00124B0008002A4O001C0004000800020010180003002700040012300004002C3O00201900040004002D00124B0005002E3O00124B0006002E3O00124B0007002E4O001C0004000700020010180003002B000400300D0003002F003000300D00030031003200300D000300330032001018000300050001001230000400013O0020190004000400022O001D00055O00124B000600343O00124B000700354O0027000500074O002600043O00022O001D00055O00124B000600373O00124B000700384O001C000500070002001018000400360005001230000500233O00201900050005000200124B000600393O00124B000700243O00124B000800243O00124B0009003A4O001C00050009000200101800040022000500300D0004003B003C0012300005002C3O00201900050005002D00124B0006003E3O00124B0007003E3O00124B0008003E4O001C0005000800020010180004003D0005001018000400050003001230000500013O0020190005000500022O001D00065O00124B0007003F3O00124B000800404O0027000600084O002600053O00022O001D00065O00124B000700413O00124B000800424O001C000600080002001018000500360006001230000600233O00201900060006000200124B000700393O00124B000800243O00124B000900243O00124B000A003A4O001C0006000A0002001018000500220006001230000600233O00201900060006000200124B000700243O00124B000800243O00124B000900433O00124B000A00444O001C0006000A00020010180005002700060012300006002C3O00201900060006002D00124B000700453O00124B000800453O00124B000900454O001C0006000900020010180005002B00060012300006002C3O00201900060006002D00124B0007003E3O00124B0008003E3O00124B0009003E4O001C0006000900020010180005003D0006001018000500050003001230000600013O0020190006000600022O001D00075O00124B000800463O00124B000900474O0027000700094O002600063O00022O001D00075O00124B000800483O00124B000900494O001C000700090002001018000600360007001230000700233O00201900070007000200124B000800393O00124B000900243O00124B000A00243O00124B000B003A4O001C0007000B0002001018000600220007001230000700233O00201900070007000200124B000800243O00124B000900243O00124B000A004A3O00124B000B002A4O001C0007000B00020010180006002700070012300007002C3O00201900070007002D00124B000800453O00124B000900453O00124B000A00454O001C0007000A00020010180006002B00070012300007002C3O00201900070007002D00124B0008003E3O00124B0009003E3O00124B000A003E4O001C0007000A00020010180006003D000700101800060005000300201900070006004B00201B00070007004C00061000093O000100012O003D8O000700070009000100201900070005004B00201B00070007004C00061000090001000100022O003D8O004C3O00024O00070007000900014O00015O0004313O00E9000100201900013O00392O003F3O00013O00023O00193O0003093O00776F726B737061636503063O0053686172647303043O0067616D6503073O00506C6179657273030B3O004C6F63616C506C6179657203063O00697061697273030B3O004765744368696C6472656E2O033O0049734103083O00F9C1FD54E4C5FC4803043O003CB4A48E030E3O0046696E6446697273744368696C64030D3O007B520C2A2CC9174C5B063D28FF03073O0072383E6549478D028O00026O00F03F027O004003043O0077616974026O00F83F030D3O009BE5D2C7B3CDDED0BDEACFCBAA03043O00A4D889BB03093O0043686172616374657203143O005365745072696D61727950617274434672616D6503063O00434672616D65026O00E03F03113O0066697265636C69636B6465746563746F72004E3O0012303O00013O0020195O0002001230000100033O002019000100010004002019000100010005001230000200063O00201B00033O00072O002E000300044O003B00023O00040004313O004B000100201B0007000600082O001D00095O00124B000A00093O00124B000B000A4O00270009000B4O002600073O00020006010007004B00013O0004313O004B000100201B00070006000B2O001D00095O00124B000A000C3O00124B000B000D4O00270009000B4O002600073O00020006010007004B00013O0004313O004B000100124B0007000E4O0040000800093O002611000700210001000E0004313O0021000100124B0008000E4O0040000900093O00124B0007000F3O0026110007001C0001000F0004313O001C000100261100080029000100100004313O00290001001230000A00113O00124B000B00124O0005000A000200010004313O004B0001002611000800370001000E0004313O0037000100201B000A0006000B2O001D000C5O00124B000D00133O00124B000E00144O0027000C000E4O0026000A3O00022O00220009000A3O002019000A0001001500201B000A000A0016002019000C000600172O0007000A000C000100124B0008000F3O002611000800230001000F0004313O0023000100124B000A000E3O000E32000E00430001000A0004313O00430001001230000B00113O00124B000C00184O0005000B00020001001230000B00194O0022000C00094O0005000B0002000100124B000A000F3O002611000A003A0001000F0004313O003A000100124B000800103O0004313O002300010004313O003A00010004313O002300010004313O004B00010004313O001C00010006360002000A000100020004313O000A00012O003F3O00017O002E3O00028O00026O00F03F03063O00EBC516EB88DF03073O006BB28651D2C69E03063O000C2BA3E18D1C03053O00CA586EE2A603063O00E03DAAC6E0F403053O00AAA36FE29703063O002B188B0B1A0503073O00497150D2582E5703063O00D81B9F20BFA703053O0087E14CAD7203063O0022DF8981948903073O00C77A8DD8D0CCDD03063O008BF242A54EA403063O0096CDBD70901803063O0077D69A6757BB03083O007045E4DF2C64E87103063O008D3E5E85984B03073O00E6B47F67B3D61C03063O00BF57756CDD7303073O0080EC653F26842103063O008E873B7EEEBE03073O00AFCCC97124D68B03063O00779903E5357603053O006427AC55BC03063O008B4AECA6108B03053O0053CD18D9E003063O00B4E39F09D1E403043O005D86A5AD03063O00E9CBEBEF00FB03083O001EDE92A1A25AAED203063O00C4684A5BC11F03043O006A852E1003063O000B1456DA696E03063O00203840139C3A03063O0068FCCF776EDA03073O00E03AA885363A9203064O006512DB4CBE03083O006B39362B9D15E6E703063O0088A229A69F8403073O00AFBBEB7195D9BC03063O00697061697273030C3O00496E766F6B6553657276657203063O00756E7061636B03043O0077616974007E3O00124B3O00014O0040000100023O0026113O0007000100010004313O0007000100124B000100014O0040000200023O00124B3O00023O000E320002000200013O0004313O0002000100261100010009000100010004313O000900012O0020000300124O001D00045O00124B000500033O00124B000600044O001C0004000600022O001D00055O00124B000600053O00124B000700064O001C0005000700022O001D00065O00124B000700073O00124B000800084O001C0006000800022O001D00075O00124B000800093O00124B0009000A4O001C0007000900022O001D00085O00124B0009000B3O00124B000A000C4O001C0008000A00022O001D00095O00124B000A000D3O00124B000B000E4O001C0009000B00022O001D000A5O00124B000B000F3O00124B000C00104O001C000A000C00022O001D000B5O00124B000C00113O00124B000D00124O001C000B000D00022O001D000C5O00124B000D00133O00124B000E00144O001C000C000E00022O001D000D5O00124B000E00153O00124B000F00164O001C000D000F00022O001D000E5O00124B000F00173O00124B001000184O001C000E001000022O001D000F5O00124B001000193O00124B0011001A4O001C000F001100022O001D00105O00124B0011001B3O00124B0012001C4O001C0010001200022O001D00115O00124B0012001D3O00124B0013001E4O001C0011001300022O001D00125O00124B0013001F3O00124B001400204O001C0012001400022O001D00135O00124B001400213O00124B001500224O001C0013001500022O001D00145O00124B001500233O00124B001600244O001C0014001600022O001D00155O00124B001600253O00124B001700264O001C0015001700022O001D00165O00124B001700273O00124B001800284O001C0016001800022O001D00175O00124B001800293O00124B0019002A4O0027001700194O000900033O00012O0022000200033O0012300003002B4O0022000400024O00440003000200050004313O0077000100124B000800014O0040000900093O00261100080070000100010004313O007000012O0020000A3O0001001018000A000200072O00220009000A4O001D000A00013O00201B000A000A002C001230000C002D4O0022000D00094O002E000C000D4O0039000A3O000100124B000800023O00261100080064000100020004313O00640001001230000A002E3O00124B000B00024O0005000A000200010004313O007700010004313O0064000100063600030062000100020004313O006200010004313O007D00010004313O000900010004313O007D00010004313O000200012O003F3O00017O00",v17(),...);
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
