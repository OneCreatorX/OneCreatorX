local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v24,v25) local v26={};for v41=1, #v24 do v6(v26,v0(v4(v1(v2(v24,v41,v41 + 1 )),v1(v2(v25,1 + (v41% #v25) ,1 + (v41% #v25) + 1 )))%256 ));end return v5(v26);end local v8=tonumber;local v9=string.byte;local v10=string.char;local v11=string.sub;local v12=string.gsub;local v13=string.rep;local v14=table.concat;local v15=table.insert;local v16=math.ldexp;local v17=getfenv or function() return _ENV;end ;local v18=setmetatable;local v19=pcall;local v20=select;local v21=unpack or table.unpack ;local v22=tonumber;local function v23(v27,v28,...) local v29=1;local v30;v27=v12(v11(v27,5),v7("\80\106","\30\126\68\155\207"),function(v42) if (v9(v42,2)==79) then local v94=0;while true do if (v94==0) then v30=v8(v11(v42,1,1));return "";end end else local v95=v10(v8(v42,16));if v30 then local v101=v13(v95,v30);v30=nil;return v101;else return v95;end end end);local function v31(v43,v44,v45) if v45 then local v96=(v43/(2^(v44-1)))%(2^(((v45-1) -(v44-1)) + 1)) ;return v96-(v96%1) ;else local v97=2^(v44-1) ;return (((v43%(v97 + v97))>=v97) and 1) or 0 ;end end local function v32() local v46=0;local v47;while true do if (v46==1) then return v47;end if (v46==0) then v47=v9(v27,v29,v29);v29=v29 + 1 ;v46=1;end end end local function v33() local v48,v49=v9(v27,v29,v29 + 2 );v29=v29 + 2 ;return (v49 * (800 -544)) + v48 ;end local function v34() local v50=0;local v51;local v52;local v53;local v54;while true do if (v50==1) then return (v54 * 16777216) + (v53 * 65536) + (v52 * 256) + v51 ;end if (v50==0) then v51,v52,v53,v54=v9(v27,v29,v29 + 3 );v29=v29 + (11 -7) ;v50=1;end end end local function v35() local v55=0;local v56;local v57;local v58;local v59;local v60;local v61;while true do if (v55==3) then if (v60==0) then if (v59==0) then return v61 * 0 ;else v60=1;v58=0;end elseif (v60==2047) then return ((v59==0) and (v61 * (1/0))) or (v61 * NaN) ;end return v16(v61,v60-1023 ) * (v58 + (v59/(2^52))) ;end if (v55==1) then v58=1;v59=(v31(v57,1 -0 ,20) * (2^32)) + v56 ;v55=2;end if (v55==0) then v56=v34();v57=v34();v55=1;end if (v55==2) then v60=v31(v57,21,31);v61=((v31(v57,32)==1) and  -1) or 1 ;v55=3;end end end local function v36(v62) local v63;if  not v62 then v62=v34();if (v62==0) then return "";end end v63=v11(v27,v29,(v29 + v62) -1 );v29=v29 + v62 ;local v64={};for v78=1, #v63 do v64[v78]=v10(v9(v11(v63,v78,v78)));end return v14(v64);end local v37=v34;local function v38(...) return {...},v20("#",...);end local function v39() local v65=0;local v66;local v67;local v68;local v69;local v70;local v71;while true do if (v65==0) then v66={};v67={};v68={};v69={v66,v67,nil,v68};v65=1;end if (v65==1) then v70=v34();v71={};for v102=1,v70 do local v103=0;local v104;local v105;while true do if (v103==1) then if (v104==1) then v105=v32()~=0 ;elseif (v104==2) then v105=v35();elseif (v104==3) then v105=v36();end v71[v102]=v105;break;end if (v103==0) then v104=v32();v105=nil;v103=1;end end end v69[3]=v32();v65=2;end if (2==v65) then for v106=1,v34() do local v107=0;local v108;while true do if (v107==0) then v108=v32();if (v31(v108,1,1)==0) then local v118=0;local v119;local v120;local v121;while true do if (1==v118) then v121={v33(),v33(),nil,nil};if (v119==0) then v121[3]=v33();v121[4]=v33();elseif (v119==1) then v121[3]=v34();elseif (v119==2) then v121[3]=v34() -(2^16) ;elseif (v119==3) then v121[3]=v34() -((4 -2)^16) ;v121[4]=v33();end v118=2;end if (v118==0) then v119=v31(v108,2,3);v120=v31(v108,4,6);v118=1;end if (v118==3) then if (v31(v120,3,3)==1) then v121[4]=v71[v121[4]];end v66[v106]=v121;break;end if (v118==2) then if (v31(v120,620 -(555 + 64) ,932 -(857 + 74) )==1) then v121[2]=v71[v121[570 -(367 + 201) ]];end if (v31(v120,2,2)==1) then v121[3]=v71[v121[3]];end v118=3;end end end break;end end end for v109=928 -(214 + 713) ,v34() do v67[v109-1 ]=v39();end return v69;end end end local function v40(v72,v73,v74) local v75=v72[1];local v76=v72[2];local v77=v72[3];return function(...) local v80=v75;local v81=v76;local v82=v77;local v83=v38;local v84=1;local v85= -1;local v86={};local v87={...};local v88=v20("#",...) -1 ;local v89={};local v90={};for v98=0,v88 do if (v98>=v82) then v86[v98-v82 ]=v87[v98 + 1 + 0 ];else v90[v98]=v87[v98 + 1 ];end end local v91=(v88-v82) + 1 ;local v92;local v93;while true do local v99=0;while true do if (v99==0) then v92=v80[v84];v93=v92[1];v99=1;end if (v99==1) then if (v93<=31) then if (v93<=15) then if (v93<=7) then if (v93<=3) then if (v93<=1) then if (v93>0) then local v132=0;local v133;while true do if (v132==0) then v133=v92[2];v90[v133](v21(v90,v133 + 1 ,v85));break;end end else v90[v92[2]]=v90[v92[3]];end elseif (v93==2) then if (v90[v92[2]]==v92[4]) then v84=v84 + 1 ;else v84=v92[3];end else local v136=0;local v137;local v138;local v139;local v140;while true do if (v136==2) then for v296=v137,v85 do v140=v140 + 1 ;v90[v296]=v138[v140];end break;end if (1==v136) then v85=(v139 + v137) -1 ;v140=0;v136=2;end if (v136==0) then v137=v92[2];v138,v139=v83(v90[v137](v21(v90,v137 + 1 ,v85)));v136=1;end end end elseif (v93<=5) then if (v93==4) then v90[v92[2]]={};else v90[v92[2]]();end elseif (v93>6) then v90[v92[2]]=v90[v92[3]]%v92[4] ;else v90[v92[2]]=v90[v92[1 + 2 ]][v92[881 -(282 + 595) ]];end elseif (v93<=11) then if (v93<=9) then if (v93==8) then local v145=0;local v146;while true do if (v145==0) then v146=v92[2];v90[v146]=v90[v146](v21(v90,v146 + (1638 -(1523 + 114)) ,v92[3]));break;end end else do return;end end elseif (v93==10) then local v147=0;local v148;local v149;local v150;local v151;while true do if (2==v147) then for v299=v148,v85 do local v300=0;while true do if (v300==0) then v151=v151 + 1 ;v90[v299]=v149[v151];break;end end end break;end if (v147==1) then v85=(v150 + v148) -(1 + 0) ;v151=0;v147=2;end if (v147==0) then v148=v92[2];v149,v150=v83(v90[v148](v21(v90,v148 + 1 ,v92[3])));v147=1;end end else do return v90[v92[2]]();end end elseif (v93<=13) then if (v93>12) then local v152=v92[2];local v153=v90[v152 + 2 ];local v154=v90[v152] + v153 ;v90[v152]=v154;if (v153>0) then if (v154<=v90[v152 + 1 ]) then v84=v92[3];v90[v152 + 3 ]=v154;end elseif (v154>=v90[v152 + 1 ]) then v84=v92[3];v90[v152 + 3 ]=v154;end else for v248=v92[2],v92[3] do v90[v248]=nil;end end elseif (v93==14) then v90[v92[2]]= #v90[v92[3]];else v90[v92[2]]=v90[v92[3]]%v92[4] ;end elseif (v93<=23) then if (v93<=19) then if (v93<=(24 -7)) then if (v93==16) then v90[v92[2]]=v90[v92[3]] + v92[4] ;else local v159=0;local v160;while true do if (v159==0) then v160=v92[2];do return v21(v90,v160,v85);end break;end end end elseif (v93==18) then local v161=0;local v162;local v163;local v164;while true do if (v161==0) then v162=v92[2];v163=v90[v162];v161=1;end if (1==v161) then v164=v90[v162 + 2 ];if (v164>0) then if (v163>v90[v162 + 1 ]) then v84=v92[1068 -(68 + 997) ];else v90[v162 + 3 ]=v163;end elseif (v163<v90[v162 + 1 ]) then v84=v92[3];else v90[v162 + 3 ]=v163;end break;end end elseif  not v90[v92[2]] then v84=v84 + 1 ;else v84=v92[3];end elseif (v93<=21) then if (v93==20) then v90[v92[2]]=v92[1273 -(226 + 1044) ] + v90[v92[4]] ;else local v166=v92[2];local v167=v90[v166];local v168=v90[v166 + 2 ];if (v168>0) then if (v167>v90[v166 + 1 ]) then v84=v92[12 -9 ];else v90[v166 + 3 ]=v167;end elseif (v167<v90[v166 + 1 ]) then v84=v92[3];else v90[v166 + 3 ]=v167;end end elseif (v93>(139 -(32 + 85))) then local v169=v92[2];local v170,v171=v83(v90[v169](v90[v169 + 1 ]));v85=(v171 + v169) -1 ;local v172=0;for v250=v169,v85 do v172=v172 + 1 ;v90[v250]=v170[v172];end else local v173=0;local v174;local v175;local v176;local v177;while true do if (v173==1) then v85=(v176 + v174) -1 ;v177=0 + 0 ;v173=2;end if (v173==0) then v174=v92[2];v175,v176=v83(v90[v174](v21(v90,v174 + 1 ,v85)));v173=1;end if (v173==2) then for v309=v174,v85 do local v310=0;while true do if (v310==0) then v177=v177 + 1 ;v90[v309]=v175[v177];break;end end end break;end end end elseif (v93<=27) then if (v93<=25) then if (v93>24) then v90[v92[2]]= #v90[v92[3]];else v90[v92[2]]=v92[1 + 2 ];end elseif (v93>(983 -(892 + 65))) then local v181=0;local v182;while true do if (v181==0) then v182=v92[2];do return v21(v90,v182,v85);end break;end end else local v183=0;local v184;local v185;local v186;while true do if (v183==1) then v186={};v185=v18({},{[v7("\247\50\194\203\167\175\208","\202\168\109\171\165\195")]=function(v311,v312) local v313=v186[v312];return v313[1][v313[4 -2 ]];end,[v7("\217\29\86\50\207\215\223\226\39\64","\177\134\66\56\87\184\190")]=function(v314,v315,v316) local v317=0;local v318;while true do if (v317==0) then v318=v186[v315];v318[1][v318[3 -1 ]]=v316;break;end end end});v183=2;end if (2==v183) then for v319=1,v92[4] do local v320=0;local v321;while true do if (0==v320) then v84=v84 + (1 -0) ;v321=v80[v84];v320=1;end if (v320==1) then if (v321[351 -(87 + 263) ]==32) then v186[v319-1 ]={v90,v321[3]};else v186[v319-(181 -(67 + 113)) ]={v73,v321[3]};end v89[ #v89 + 1 + 0 ]=v186;break;end end end v90[v92[2]]=v40(v184,v185,v74);break;end if (v183==0) then v184=v81[v92[3]];v185=nil;v183=1;end end end elseif (v93<=29) then if (v93==28) then local v187=v92[2];v90[v187]=v90[v187](v21(v90,v187 + 1 ,v92[3]));else v90[v92[2]]=v74[v92[3]];end elseif (v93==30) then v90[v92[2]]=v92[3] + v90[v92[4]] ;else local v192=0;local v193;local v194;while true do if (v192==0) then v193=v92[2];v194=v90[v92[3]];v192=1;end if (v192==1) then v90[v193 + 1 ]=v194;v90[v193]=v194[v92[4]];break;end end end elseif (v93<=47) then if (v93<=39) then if (v93<=(85 -50)) then if (v93<=33) then if (v93==32) then v90[v92[2 + 0 ]]=v90[v92[11 -8 ]];else v90[v92[2]]=v90[v92[955 -(802 + 150) ]] + v92[4] ;end elseif (v93>34) then local v198=v92[2];local v199=v90[v198];for v253=v198 + 1 ,v85 do v15(v199,v90[v253]);end else v90[v92[2]]=v90[v92[3]][v92[4]];end elseif (v93<=37) then if (v93>36) then v90[v92[2]]=v90[v92[3]]%v90[v92[4]] ;else local v203=0;local v204;local v205;while true do if (v203==1) then v90[v204 + 1 ]=v205;v90[v204]=v205[v92[4]];break;end if (v203==0) then v204=v92[2];v205=v90[v92[3]];v203=1;end end end elseif (v93>38) then do return v90[v92[2]]();end else local v206=0;local v207;while true do if (v206==0) then v207=v92[2];do return v90[v207](v21(v90,v207 + 1 ,v92[3]));end break;end end end elseif (v93<=43) then if (v93<=41) then if (v93>40) then local v208=0;local v209;while true do if (v208==0) then v209=v92[2];do return v90[v209](v21(v90,v209 + (2 -1) ,v92[3]));end break;end end elseif (v90[v92[2]]==v92[4]) then v84=v84 + 1 ;else v84=v92[5 -2 ];end elseif (v93==42) then v90[v92[2]]=v92[3];else v84=v92[3];end elseif (v93<=45) then if (v93==44) then do return;end else v90[v92[2]]=v90[v92[3]]%v90[v92[4]] ;end elseif (v93==46) then local v214=0;local v215;local v216;local v217;while true do if (v214==2) then for v322=1,v92[11 -7 ] do local v323=0;local v324;while true do if (v323==0) then v84=v84 + 1 + 0 ;v324=v80[v84];v323=1;end if (v323==1) then if (v324[1]==32) then v217[v322-1 ]={v90,v324[3]};else v217[v322-1 ]={v73,v324[3]};end v89[ #v89 + 1 ]=v217;break;end end end v90[v92[2]]=v40(v215,v216,v74);break;end if (0==v214) then v215=v81[v92[3 + 0 ]];v216=nil;v214=1;end if (1==v214) then v217={};v216=v18({},{[v7("\10\3\56\7\191\137\45","\236\85\92\81\105\219")]=function(v325,v326) local v327=0;local v328;while true do if (v327==0) then v328=v217[v326];return v328[1][v328[999 -(915 + 82) ]];end end end,[v7("\30\51\209\248\164\226\47\8\218\229","\139\65\108\191\157\211")]=function(v329,v330,v331) local v332=v217[v330];v332[1][v332[2]]=v331;end});v214=2;end end else v90[v92[2]]={};end elseif (v93<=55) then if (v93<=51) then if (v93<=49) then if (v93>48) then if v90[v92[1189 -(1069 + 118) ]] then v84=v84 + 1 ;else v84=v92[3];end else local v219=v92[4 -2 ];v90[v219](v21(v90,v219 + (1 -0) ,v85));end elseif (v93>50) then local v220=0;local v221;local v222;while true do if (v220==1) then for v334=v221 + 1 ,v85 do v15(v222,v90[v334]);end break;end if (v220==0) then v221=v92[2];v222=v90[v221];v220=1;end end else local v223=v92[2];v90[v223]=v90[v223](v21(v90,v223 + 1 ,v85));end elseif (v93<=53) then if (v93==52) then local v225=v92[2];local v226,v227=v83(v90[v225](v21(v90,v225 + 1 ,v92[3])));v85=(v227 + v225) -1 ;local v228=0 + 0 ;for v254=v225,v85 do local v255=0;while true do if (v255==0) then v228=v228 + 1 ;v90[v254]=v226[v228];break;end end end else v90[v92[3 -1 ]]=v74[v92[3]];end elseif (v93>(54 + 0)) then if v90[v92[2]] then v84=v84 + 1 ;else v84=v92[3];end else for v256=v92[2],v92[3] do v90[v256]=nil;end end elseif (v93<=59) then if (v93<=57) then if (v93>56) then v84=v92[3];else local v232=0;local v233;local v234;local v235;local v236;while true do if (v232==1) then v85=(v235 + v233) -1 ;v236=0;v232=2;end if (v232==2) then for v337=v233,v85 do v236=v236 + (792 -(368 + 423)) ;v90[v337]=v234[v236];end break;end if (0==v232) then v233=v92[2];v234,v235=v83(v90[v233](v90[v233 + 1 ]));v232=1;end end end elseif (v93==58) then if  not v90[v92[2]] then v84=v84 + 1 ;else v84=v92[3];end else local v237=v92[2];v90[v237]=v90[v237](v21(v90,v237 + 1 ,v85));end elseif (v93<=61) then if (v93>60) then v90[v92[2]]=v73[v92[9 -6 ]];else local v241=v92[2];local v242=v90[v241 + 2 ];local v243=v90[v241] + v242 ;v90[v241]=v243;if (v242>(18 -(10 + 8))) then if (v243<=v90[v241 + 1 ]) then local v340=0;while true do if (v340==0) then v84=v92[3];v90[v241 + 3 ]=v243;break;end end end elseif (v243>=v90[v241 + 1 ]) then v84=v92[11 -8 ];v90[v241 + 3 ]=v243;end end elseif (v93>62) then v90[v92[444 -(416 + 26) ]]=v73[v92[3]];else v90[v92[2]]();end v84=v84 + 1 ;break;end end end end;end return v40(v39(),{},v28)(...);end return v23("LOL!0D3O0003063O00737472696E6703043O006368617203043O00627974652O033O0073756203053O0062697433322O033O0062697403043O0062786F7203053O007461626C6503063O00636F6E63617403063O00696E7365727403053O006D6174636803083O00746F6E756D62657203053O007063612O6C00243O0012353O00013O0020225O0002001235000100013O002022000100010003001235000200013O002022000200020004001235000300053O00063A0003000A000100010004393O000A0001001235000300063O002022000400030007001235000500083O002022000500050009001235000600083O00202200060006000A00061A00073O000100062O00203O00064O00208O00203O00044O00203O00014O00203O00024O00203O00053O001235000800013O00202200080008000B0012350009000C3O001235000A000D3O00061A000B0001000100052O00203O00074O00203O00094O00203O00084O00203O000A4O00203O000B6O000C000B4O0027000C00014O0011000C6O002C3O00013O00023O00023O00026O00F03F026O00704002264O000400025O001218000300014O001900045O001218000500013O0004120003002100012O003F00078O000800024O003F000900014O003F000A00024O003F000B00034O003F000C00046O000D8O000E00063O002010000F000600012O000A000C000F4O0032000B3O00022O003F000C00034O003F000D00046O000E00014O0019000F00014O0025000F0006000F001014000F0001000F2O0019001000014O00250010000600100010140010000100100020100010001000012O000A000D00104O0003000C6O0032000A3O000200200F000A000A00022O00170009000A4O003000073O000100043C0003000500012O003F000300056O000400024O0029000300044O001100036O002C3O00017O00043O00027O004003053O003A25642B3A2O033O0025642B026O00F03F001C3O00061A5O000100012O003D8O003F000100014O003F000200024O003F000300024O000400046O003F000500036O00066O000C000700074O000A000500074O003300043O0001002022000400040001001218000500024O001C000300050002001218000400034O000A000200044O003200013O000200260200010018000100040004393O001800014O00016O000400026O0029000100024O001100015O0004393O001B00012O003F000100044O0027000100014O001100016O002C3O00013O00013O00063O00030A3O006C6F6164737472696E6703043O0067616D6503073O00482O747047657403513O00D9D7CF35F5E18851C3C2CC6BE1B2D316C4C1CE36E3A9C411DFD7DE2BF2F5C411DC8CF42BE398D51BD0D7D437DEF4E810D4E0C920E7AFC80CE98CD624EFB5882DD2D1D235F2A88833C2C4FF20F0F5CB0BD003083O007EB1A3BB4586DBA7026O00F03F010F3O0006313O000D00013O0004393O000D0001001235000100013O001235000200023O00201F0002000200032O003F00045O001218000500043O001218000600054O000A000400064O000300026O003200013O00022O00050001000100010004393O000E000100202200013O00062O002C3O00017O00",v17(),...);
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
