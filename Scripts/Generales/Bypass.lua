local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v24,v25) local v26={};for v41=1, #v24 do v6(v26,v0(v4(v1(v2(v24,v41,v41 + 1 )),v1(v2(v25,1 + (v41% #v25) ,1 + (v41% #v25) + 1 )))%256 ));end return v5(v26);end local v8=tonumber;local v9=string.byte;local v10=string.char;local v11=string.sub;local v12=string.gsub;local v13=string.rep;local v14=table.concat;local v15=table.insert;local v16=math.ldexp;local v17=getfenv or function() return _ENV;end ;local v18=setmetatable;local v19=pcall;local v20=select;local v21=unpack or table.unpack ;local v22=tonumber;local function v23(v27,v28,...) local v29=1;local v30;v27=v12(v11(v27,5),v7("\128\48","\229\174\30\210\99"),function(v42) if (v9(v42,2)==79) then local v81=0;while true do if (v81==0) then v30=v8(v11(v42,1,1));return "";end end else local v82=0;local v83;while true do if (v82==0) then v83=v10(v8(v42,16));if v30 then local v120=0;local v121;while true do if (v120==1) then return v121;end if (v120==0) then v121=v13(v83,v30);v30=nil;v120=1;end end else return v83;end break;end end end end);local function v31(v43,v44,v45) if v45 then local v84=0;local v85;while true do if (v84==0) then v85=(v43/(2^(v44-1)))%(2^(((v45-1) -(v44-(2 -1))) + 1)) ;return v85-(v85%1) ;end end else local v86=2^(v44-1) ;return (((v43%(v86 + v86))>=v86) and 1) or 0 ;end end local function v32() local v46=0;local v47;while true do if (v46==0) then v47=v9(v27,v29,v29);v29=v29 + 1 ;v46=1;end if (v46==1) then return v47;end end end local function v33() local v48=0;local v49;local v50;while true do if (v48==0) then v49,v50=v9(v27,v29,v29 + 2 );v29=v29 + 2 ;v48=1;end if (v48==1) then return (v50 * 256) + v49 ;end end end local function v34() local v51,v52,v53,v54=v9(v27,v29,v29 + 3 );v29=v29 + 4 ;return (v54 * 16777216) + (v53 * (187552 -122016)) + (v52 * 256) + v51 ;end local function v35() local v55=0;local v56;local v57;local v58;local v59;local v60;local v61;while true do if (3==v55) then if (v60==0) then if (v59==0) then return v61 * 0 ;else v60=620 -(555 + 64) ;v58=931 -(857 + 74) ;end elseif (v60==(2615 -(367 + 201))) then return ((v59==0) and (v61 * (1/0))) or (v61 * NaN) ;end return v16(v61,v60-1023 ) * (v58 + (v59/(2^52))) ;end if (v55==2) then v60=v31(v57,21,79 -48 );v61=((v31(v57,32)==1) and  -1) or 1 ;v55=3;end if (v55==1) then v58=1;v59=(v31(v57,1,38 -18 ) * (2^32)) + v56 ;v55=2;end if (v55==0) then v56=v34();v57=v34();v55=1;end end end local function v36(v62) local v63;if  not v62 then local v87=0;while true do if (v87==0) then v62=v34();if (v62==0) then return "";end break;end end end v63=v11(v27,v29,(v29 + v62) -1 );v29=v29 + v62 ;local v64={};for v79=1, #v63 do v64[v79]=v10(v9(v11(v63,v79,v79)));end return v14(v64);end local v37=v34;local function v38(...) return {...},v20("#",...);end local function v39() local v65=0;local v66;local v67;local v68;local v69;local v70;local v71;while true do if (v65==2) then for v92=1,v34() do local v93=v32();if (v31(v93,1,1)==(877 -(282 + 595))) then local v116=v31(v93,2,3);local v117=v31(v93,4,6);local v118={v33(),v33(),nil,nil};if (v116==0) then v118[1640 -(1523 + 114) ]=v33();v118[4]=v33();elseif (v116==(1 + 0)) then v118[3]=v34();elseif (v116==2) then v118[3]=v34() -((2 -0)^(1081 -(68 + 997))) ;elseif (v116==(1273 -(226 + 1044))) then v118[3]=v34() -(2^16) ;v118[4]=v33();end if (v31(v117,1,1)==1) then v118[2]=v71[v118[2]];end if (v31(v117,8 -6 ,2)==1) then v118[3]=v71[v118[3]];end if (v31(v117,3,3)==1) then v118[4]=v71[v118[4]];end v66[v92]=v118;end end for v94=118 -(32 + 85) ,v34() do v67[v94-1 ]=v39();end return v69;end if (v65==1) then v70=v34();v71={};for v96=1,v70 do local v97=0;local v98;local v99;while true do if (v97==1) then if (v98==1) then v99=v32()~=0 ;elseif (v98==(1 + 1)) then v99=v35();elseif (v98==3) then v99=v36();end v71[v96]=v99;break;end if (v97==0) then v98=v32();v99=nil;v97=1;end end end v69[3]=v32();v65=2;end if (v65==0) then v66={};v67={};v68={};v69={v66,v67,nil,v68};v65=1;end end end local function v40(v72,v73,v74) local v75=0;local v76;local v77;local v78;while true do if (0==v75) then v76=v72[1 + 0 ];v77=v72[2];v75=1;end if (1==v75) then v78=v72[3];return function(...) local v100=v76;local v101=v77;local v102=v78;local v103=v38;local v104=1;local v105= -1;local v106={};local v107={...};local v108=v20("#",...) -1 ;local v109={};local v110={};for v114=0,v108 do if (v114>=v102) then v106[v114-v102 ]=v107[v114 + 1 ];else v110[v114]=v107[v114 + 1 ];end end local v111=(v108-v102) + 1 ;local v112;local v113;while true do local v115=0;while true do if (1==v115) then if (v113<=23) then if (v113<=11) then if (v113<=5) then if (v113<=2) then if (v113<=0) then local v141;local v142,v143;local v144;local v145;v110[v112[2]]=v74[v112[3]];v104=v104 + 1 ;v112=v100[v104];v145=v112[1 + 1 ];v144=v110[v112[3]];v110[v145 + 1 ]=v144;v110[v145]=v144[v112[4]];v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v73[v112[3]];v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v112[3];v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v112[3];v104=v104 + 1 ;v112=v100[v104];v145=v112[2];v142,v143=v103(v110[v145](v21(v110,v145 + 1 ,v112[3])));v105=(v143 + v145) -(958 -(892 + 65)) ;v141=0;for v185=v145,v105 do local v186=0;while true do if (v186==0) then v141=v141 + 1 ;v110[v185]=v142[v141];break;end end end v104=v104 + 1 ;v112=v100[v104];v145=v112[2];v142,v143=v103(v110[v145](v21(v110,v145 + 1 ,v105)));v105=(v143 + v145) -1 ;v141=0;for v187=v145,v105 do local v188=0;while true do if (v188==0) then v141=v141 + 1 ;v110[v187]=v142[v141];break;end end end v104=v104 + 1 ;v112=v100[v104];v145=v112[2];v110[v145]=v110[v145](v21(v110,v145 + 1 ,v105));v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]();v104=v104 + 1 ;v112=v100[v104];v104=v112[3];elseif (v113==1) then local v191=v112[2];local v192=v112[4];local v193=v191 + 2 ;local v194={v110[v191](v110[v191 + 1 ],v110[v193])};for v294=1,v192 do v110[v193 + v294 ]=v194[v294];end local v195=v194[1];if v195 then local v481=0;while true do if (v481==0) then v110[v193]=v195;v104=v112[3];break;end end else v104=v104 + 1 ;end else local v196=0;local v197;local v198;local v199;while true do if (v196==1) then v110[v112[2]]={};v104=v104 + 1 ;v112=v100[v104];v196=2;end if (2==v196) then v110[v112[2]]=v112[3];v104=v104 + 1 ;v112=v100[v104];v196=3;end if (v196==5) then v199=v112[2];v198=v110[v199];v197=v110[v199 + (3 -1) ];v196=6;end if (v196==0) then v197=nil;v198=nil;v199=nil;v196=1;end if (v196==4) then v110[v112[2]]=v112[3];v104=v104 + 1 ;v112=v100[v104];v196=5;end if (v196==3) then v110[v112[4 -2 ]]= #v110[v112[3]];v104=v104 + 1 ;v112=v100[v104];v196=4;end if (6==v196) then if (v197>(0 -0)) then if (v198>v110[v199 + 1 ]) then v104=v112[3];else v110[v199 + 3 ]=v198;end elseif (v198<v110[v199 + 1 ]) then v104=v112[3];else v110[v199 + (353 -(87 + 263)) ]=v198;end break;end end end elseif (v113<=(183 -(67 + 113))) then v110[v112[2]]={};elseif (v113>4) then local v200=v112[2 + 0 ];v110[v200](v21(v110,v200 + 1 ,v105));else v110[v112[2]]=v110[v112[3]]%v110[v112[4]] ;end elseif (v113<=8) then if (v113<=6) then local v158=v112[2];local v159,v160=v103(v110[v158](v21(v110,v158 + 1 ,v112[3])));v105=(v160 + v158) -1 ;local v161=0;for v189=v158,v105 do local v190=0;while true do if (v190==0) then v161=v161 + 1 ;v110[v189]=v159[v161];break;end end end elseif (v113==7) then v110[v112[2]][v110[v112[3]]]=v110[v112[4]];else local v204;local v205;local v206,v207;local v208;v110[v112[2]]=v73[v112[3]];v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v73[v112[3]];v104=v104 + 1 ;v112=v100[v104];v110[v112[4 -2 ]]=v73[v112[3]];v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]={};v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v73[v112[3]];v104=v104 + 1 + 0 ;v112=v100[v104];v110[v112[2]]=v110[v112[3]];v104=v104 + 1 ;v112=v100[v104];for v297=v112[2],v112[3] do v110[v297]=nil;end v104=v104 + 1 ;v112=v100[v104];v208=v112[2];v206,v207=v103(v110[v208](v21(v110,v208 + 1 ,v112[3])));v105=(v207 + v208) -1 ;v205=0;for v299=v208,v105 do local v300=0;while true do if (v300==0) then v205=v205 + 1 ;v110[v299]=v206[v205];break;end end end v104=v104 + 1 ;v112=v100[v104];v208=v112[2];v204=v110[v208];for v301=v208 + 1 ,v105 do v15(v204,v110[v301]);end end elseif (v113<=9) then local v162=v112[7 -5 ];v110[v162](v21(v110,v162 + 1 ,v112[3]));elseif (v113==10) then v110[v112[2]]= #v110[v112[3]];else v110[v112[2]]=v73[v112[955 -(802 + 150) ]];end elseif (v113<=17) then if (v113<=14) then if (v113<=12) then v104=v112[3];elseif (v113==13) then local v219=0;while true do if (v219==3) then v110[v112[2]]=v110[v112[5 -2 ]][v112[4]];v104=v104 + 1 ;v112=v100[v104];v219=4;end if (v219==6) then v110[v112[2]]=v74[v112[3]];v104=v104 + 1 ;v112=v100[v104];v219=7;end if (v219==7) then if  not v110[v112[2]] then v104=v104 + 1 ;else v104=v112[3];end break;end if (v219==0) then v110[v112[5 -3 ]]=v74[v112[3]];v104=v104 + 1 ;v112=v100[v104];v219=1;end if (v219==4) then v110[v112[2]]=v74[v112[3 + 0 ]];v104=v104 + 1 ;v112=v100[v104];v219=5;end if (v219==2) then v110[v112[2]]=v74[v112[3]];v104=v104 + 1 ;v112=v100[v104];v219=3;end if (v219==1) then v110[v112[2]]=v110[v112[3]][v112[4]];v104=v104 + 1 ;v112=v100[v104];v219=2;end if (v219==5) then v110[v112[2]]=v110[v112[3]][v112[4]];v104=v104 + 1 ;v112=v100[v104];v219=6;end end else local v220=0;local v221;local v222;local v223;local v224;while true do if (v220==2) then for v607=v221,v105 do local v608=0;while true do if (0==v608) then v224=v224 + 1 ;v110[v607]=v222[v224];break;end end end break;end if (v220==1) then v105=(v223 + v221) -1 ;v224=0;v220=2;end if (v220==0) then v221=v112[2];v222,v223=v103(v110[v221](v110[v221 + 1 ]));v220=1;end end end elseif (v113<=15) then v110[v112[2]]=v112[1000 -(915 + 82) ]~=0 ;elseif (v113==16) then v110[v112[2]]=v110[v112[3]]%v112[4] ;else local v226=v112[2];v110[v226]=v110[v226](v21(v110,v226 + 1 ,v112[3]));end elseif (v113<=20) then if (v113<=18) then local v165=0;local v166;local v167;local v168;local v169;local v170;while true do if (v165==12) then v110[v112[2]][v110[v112[3]]]=v110[v112[4]];v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v73[v112[3]];v104=v104 + 1 ;v112=v100[v104];v110[v112[3 -1 ]]=v112[3];v104=v104 + 1 ;v112=v100[v104];v165=13;end if (v165==7) then v110[v170]=v110[v170](v21(v110,v170 + 1 ,v112[3]));v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v73[v112[3]];v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v112[3];v104=v104 + 1 ;v112=v100[v104];v165=8;end if (v165==10) then v112=v100[v104];v170=v112[2];v110[v170]=v110[v170](v21(v110,v170 + 1 ,v112[3]));v104=v104 + 1 ;v112=v100[v104];v110[v112[6 -4 ]]=v73[v112[3]];v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v112[3];v165=11;end if (v165==20) then v110[v170]=v110[v170](v110[v170 + 1 ]);v104=v104 + 1 ;v112=v100[v104];v170=v112[2];v169=v110[v112[3 + 0 ]];v110[v170 + 1 ]=v169;v110[v170]=v169[v112[4]];v104=v104 + 1 ;v112=v100[v104];v165=21;end if (v165==24) then v104=v104 + 1 ;v112=v100[v104];v170=v112[2];v110[v170]=v110[v170](v21(v110,v170 + 1 ,v112[3]));v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v74[v112[3]];v104=v104 + 1 ;v112=v100[v104];v165=25;end if (v165==18) then v167=0;for v484=v170,v105 do v167=v167 + 1 ;v110[v484]=v166[v167];end v104=v104 + 1 ;v112=v100[v104];v170=v112[2];v110[v170]=v110[v170](v21(v110,v170 + 1 ,v105));v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v74[v112[3]];v165=19;end if (v165==13) then v110[v112[2]]=v112[3];v104=v104 + 1 ;v112=v100[v104];v170=v112[2];v110[v170]=v110[v170](v21(v110,v170 + 1 ,v112[3]));v104=v104 + 1 ;v112=v100[v104];v110[v112[440 -(145 + 293) ]][v110[v112[3]]]=v112[434 -(44 + 386) ];v104=v104 + 1 ;v165=14;end if (v165==17) then v110[v112[2]]=v112[3];v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v112[3];v104=v104 + (1487 -(998 + 488)) ;v112=v100[v104];v170=v112[2];v166,v168=v103(v110[v170](v21(v110,v170 + 1 ,v112[3])));v105=(v168 + v170) -1 ;v165=18;end if (v165==0) then v166=nil;v167=nil;v166,v168=nil;v169=nil;v170=nil;v170=v112[5 -3 ];v169=v110[v112[2 + 1 ]];v110[v170 + (1 -0) ]=v169;v110[v170]=v169[v112[4]];v165=1;end if (v165==26) then v110[v112[2]]=v110[v112[10 -7 ]][v112[4]];v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v110[v112[862 -(814 + 45) ]][v112[4]];v104=v104 + 1 ;v112=v100[v104];v170=v112[2];v110[v170]=v110[v170](v110[v170 + 1 ]);v104=v104 + 1 ;v165=27;end if (v165==19) then v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v110[v112[3]][v112[4]];v104=v104 + 1 + 0 ;v112=v100[v104];v110[v112[2]]=v110[v112[3]];v104=v104 + 1 ;v112=v100[v104];v170=v112[2];v165=20;end if (v165==9) then v112=v100[v104];v110[v112[2]]=v73[v112[3]];v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v112[11 -8 ];v104=v104 + (443 -(416 + 26)) ;v112=v100[v104];v110[v112[2]]=v112[3];v104=v104 + 1 ;v165=10;end if (v165==15) then v104=v104 + 1 ;v112=v100[v104];v170=v112[2];v110[v170](v110[v170 + 1 ]);v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v74[v112[3]];v104=v104 + 1 ;v112=v100[v104];v165=16;end if (v165==29) then v104=v104 + 1 ;v112=v100[v104];v110[v112[4 -2 ]]=v112[1 + 2 ];v104=v104 + 1 ;v112=v100[v104];v170=v112[2];v110[v170]=v110[v170](v21(v110,v170 + 1 ,v112[3]));v104=v104 + 1 ;v112=v100[v104];v165=30;end if (v165==6) then v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v112[3];v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v112[3];v104=v104 + 1 ;v112=v100[v104];v170=v112[2];v165=7;end if (v165==22) then v170=v112[2];v110[v170]=v110[v170](v21(v110,v170 + 1 ,v112[775 -(201 + 571) ]));v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v112[3];v104=v104 + 1 ;v112=v100[v104];v170=v112[2];v110[v170]=v110[v170](v21(v110,v170 + 1 ,v112[1141 -(116 + 1022) ]));v165=23;end if (v165==4) then v112=v100[v104];v110[v112[2]]=v73[v112[3]];v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v112[3];v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v112[4 -1 ];v104=v104 + 1 + 0 ;v165=5;end if (v165==16) then v170=v112[2];v169=v110[v112[3]];v110[v170 + 1 ]=v169;v110[v170]=v169[v112[4]];v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v73[v112[3]];v104=v104 + 1 ;v112=v100[v104];v165=17;end if (21==v165) then v110[v112[2]]=v73[v112[3]];v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v112[3];v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v112[3];v104=v104 + 1 ;v112=v100[v104];v165=22;end if (v165==5) then v112=v100[v104];v170=v112[2];v110[v170]=v110[v170](v21(v110,v170 + 1 ,v112[3]));v104=v104 + 1 ;v112=v100[v104];v110[v112[793 -(368 + 423) ]]={};v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v73[v112[3]];v165=6;end if (v165==1) then v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v73[v112[3]];v104=v104 + (1188 -(1069 + 118)) ;v112=v100[v104];v110[v112[2]]=v112[3];v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v112[3];v165=2;end if (v165==14) then v112=v100[v104];v170=v112[2];v110[v170](v21(v110,v170 + 1 ,v112[3]));v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v74[v112[3]];v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v112[3];v165=15;end if (v165==31) then v170=v112[2];v166={v110[v170](v110[v170 + 1 ])};v167=0;for v487=v170,v112[4] do v167=v167 + 1 ;v110[v487]=v166[v167];end v104=v104 + 1 ;v112=v100[v104];v104=v112[3];break;end if (v165==27) then v112=v100[v104];v170=v112[2];v169=v110[v112[3]];v110[v170 + 1 ]=v169;v110[v170]=v169[v112[4]];v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v73[v112[3]];v104=v104 + 1 ;v165=28;end if (v165==3) then v170=v112[2];v110[v170]=v110[v170](v21(v110,v170 + 1 + 0 ,v105));v104=v104 + 1 ;v112=v100[v104];v170=v112[2];v169=v110[v112[3]];v110[v170 + 1 ]=v169;v110[v170]=v169[v112[4]];v104=v104 + 1 ;v165=4;end if (v165==2) then v104=v104 + 1 ;v112=v100[v104];v170=v112[4 -2 ];v166,v168=v103(v110[v170](v21(v110,v170 + 1 ,v112[3])));v105=(v168 + v170) -1 ;v167=0 -0 ;for v490=v170,v105 do local v491=0;while true do if (v491==0) then v167=v167 + 1 ;v110[v490]=v166[v167];break;end end end v104=v104 + 1 ;v112=v100[v104];v165=3;end if (v165==11) then v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v112[3];v104=v104 + 1 ;v112=v100[v104];v170=v112[2];v110[v170]=v110[v170](v21(v110,v170 + 1 ,v112[3]));v104=v104 + 1 + 0 ;v112=v100[v104];v165=12;end if (v165==8) then v110[v112[2]]=v112[3];v104=v104 + (3 -2) ;v112=v100[v104];v170=v112[2];v110[v170]=v110[v170](v21(v110,v170 + (19 -(10 + 8)) ,v112[3]));v104=v104 + 1 ;v112=v100[v104];v110[v112[2]][v110[v112[3]]]=v110[v112[4]];v104=v104 + 1 ;v165=9;end if (v165==25) then v110[v112[8 -6 ]]=v110[v112[3]][v112[4]];v104=v104 + 1 + 0 ;v112=v100[v104];v110[v112[7 -5 ]]=v74[v112[3]];v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v110[v112[3]][v112[4]];v104=v104 + 1 ;v112=v100[v104];v165=26;end if (v165==28) then v112=v100[v104];v110[v112[2]]=v112[3];v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v112[3];v104=v104 + 1 ;v112=v100[v104];v170=v112[2];v110[v170]=v110[v170](v21(v110,v170 + 1 ,v112[3]));v165=29;end if (v165==30) then v110[v112[2]]=v112[3]~=0 ;v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v74[v112[3]];v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v110[v112[3]];v104=v104 + 1 ;v112=v100[v104];v165=31;end if (v165==23) then v104=v104 + 1 ;v112=v100[v104];v170=v112[2];v169=v110[v112[3]];v110[v170 + 1 ]=v169;v110[v170]=v169[v112[4]];v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v112[3];v165=24;end end elseif (v113==19) then v110[v112[2]]=v112[3] + v110[v112[4]] ;elseif  not v110[v112[2]] then v104=v104 + 1 ;else v104=v112[3];end elseif (v113<=(8 + 13)) then local v171=0;local v172;local v173;local v174;while true do if (0==v171) then v172=v112[2];v173={v110[v172](v110[v172 + 1 ])};v171=1;end if (v171==1) then v174=885 -(261 + 624) ;for v493=v172,v112[4] do v174=v174 + 1 ;v110[v493]=v173[v174];end break;end end elseif (v113==22) then local v229=0;local v230;local v231;local v232;local v233;while true do if (v229==1) then v112=v100[v104];v110[v112[2]]=v73[v112[4 -1 ]];v104=v104 + (1081 -(1020 + 60)) ;v112=v100[v104];v110[v112[2]]=v73[v112[3]];v104=v104 + (1424 -(630 + 793)) ;v112=v100[v104];v110[v112[6 -4 ]]=v73[v112[3]];v229=2;end if (v229==3) then v110[v112[1 + 1 ]]=v110[v112[3]] + v112[4] ;v104=v104 + (3 -2) ;v112=v100[v104];v233=v112[2];v231,v232=v103(v110[v233](v21(v110,v233 + 1 ,v112[1750 -(760 + 987) ])));v105=(v232 + v233) -1 ;v230=0;for v609=v233,v105 do local v610=0;while true do if (v610==0) then v230=v230 + 1 ;v110[v609]=v231[v230];break;end end end v229=4;end if (4==v229) then v104=v104 + 1 ;v112=v100[v104];v233=v112[2];v110[v233]=v110[v233](v21(v110,v233 + (1914 -(1789 + 124)) ,v105));v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v73[v112[3]];v104=v104 + 1 ;v229=5;end if (v229==11) then v112=v100[v104];v233=v112[2];v231,v232=v103(v110[v233](v110[v233 + 1 ]));v105=(v232 + v233) -1 ;v230=0;for v611=v233,v105 do local v612=0;while true do if (v612==0) then v230=v230 + 1 ;v110[v611]=v231[v230];break;end end end v104=v104 + (2 -1) ;v112=v100[v104];v229=12;end if (5==v229) then v112=v100[v104];v110[v112[768 -(745 + 21) ]]=v73[v112[2 + 1 ]];v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v110[v112[7 -4 ]];v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]= #v110[v112[3]];v229=6;end if (v229==8) then v112=v100[v104];v110[v112[1057 -(87 + 968) ]]=v110[v112[3]] + v112[4] ;v104=v104 + 1 ;v112=v100[v104];v233=v112[2];v231,v232=v103(v110[v233](v21(v110,v233 + (4 -3) ,v112[3 + 0 ])));v105=(v232 + v233) -(2 -1) ;v230=0;v229=9;end if (7==v229) then v110[v112[7 -5 ]]= #v110[v112[3]];v104=v104 + 1 + 0 ;v112=v100[v104];v110[v112[2]]=v110[v112[3]]%v110[v112[4]] ;v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v112[3] + v110[v112[4]] ;v104=v104 + 1 + 0 ;v229=8;end if (v229==10) then v104=v104 + 1 ;v112=v100[v104];v233=v112[2];v110[v233]=v110[v233](v21(v110,v233 + 1 ,v105));v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v110[v112[3]]%v112[4] ;v104=v104 + (1414 -(447 + 966)) ;v229=11;end if (v229==9) then for v613=v233,v105 do local v614=0;while true do if (v614==0) then v230=v230 + 1 ;v110[v613]=v231[v230];break;end end end v104=v104 + 1 ;v112=v100[v104];v233=v112[2];v231,v232=v103(v110[v233](v21(v110,v233 + 1 ,v105)));v105=(v232 + v233) -1 ;v230=0;for v615=v233,v105 do v230=v230 + 1 ;v110[v615]=v231[v230];end v229=10;end if (v229==0) then v230=nil;v231,v232=nil;v233=nil;v110[v112[2]]=v110[v112[3]];v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v73[v112[3]];v104=v104 + 1 ;v229=1;end if (v229==12) then v233=v112[2];v110[v233](v21(v110,v233 + 1 ,v105));break;end if (v229==6) then v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v110[v112[3]]%v110[v112[4]] ;v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v112[3] + v110[v112[4]] ;v104=v104 + 1 ;v112=v100[v104];v229=7;end if (v229==2) then v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v110[v112[3]];v104=v104 + (4 -3) ;v112=v100[v104];v110[v112[2]]=v110[v112[3]];v104=v104 + 1 ;v112=v100[v104];v229=3;end end else local v234=0;local v235;local v236;local v237;local v238;while true do if (0==v234) then v235=v112[2];v236,v237=v103(v110[v235](v21(v110,v235 + 1 ,v105)));v234=1;end if (v234==1) then v105=(v237 + v235) -1 ;v238=0;v234=2;end if (v234==2) then for v618=v235,v105 do local v619=0;while true do if (v619==0) then v238=v238 + 1 ;v110[v618]=v236[v238];break;end end end break;end end end elseif (v113<=35) then if (v113<=29) then if (v113<=26) then if (v113<=24) then if (v110[v112[2]]==v110[v112[4]]) then v104=v104 + (1818 -(1703 + 114)) ;else v104=v112[3];end elseif (v113==25) then local v240;v110[v112[2]]=v73[v112[704 -(376 + 325) ]];v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v112[3];v104=v104 + (1 -0) ;v112=v100[v104];v110[v112[2]]=v112[3];v104=v104 + 1 ;v112=v100[v104];v240=v112[2];v110[v240]=v110[v240](v21(v110,v240 + 1 ,v112[3]));v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]={};v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v73[v112[3]];v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v112[3];v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v112[3];v104=v104 + (2 -1) ;v112=v100[v104];v240=v112[2];v110[v240]=v110[v240](v21(v110,v240 + 1 ,v112[3]));v104=v104 + 1 ;v112=v100[v104];v110[v112[1 + 1 ]]=v73[v112[3]];v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v112[3];v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v112[3];v104=v104 + 1 ;v112=v100[v104];v240=v112[2];v110[v240]=v110[v240](v21(v110,v240 + 1 ,v112[3]));v104=v104 + 1 ;v112=v100[v104];v110[v112[2]][v110[v112[3]]]=v110[v112[4]];v104=v104 + (2 -1) ;v112=v100[v104];v110[v112[2]]=v73[v112[3]];v104=v104 + (15 -(9 + 5)) ;v112=v100[v104];v110[v112[378 -(85 + 291) ]]=v112[3];v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v112[3];v104=v104 + 1 ;v112=v100[v104];v240=v112[2];v110[v240]=v110[v240](v21(v110,v240 + 1 ,v112[3]));v104=v104 + 1 ;v112=v100[v104];v110[v112[1267 -(243 + 1022) ]]=v73[v112[3]];v104=v104 + (3 -2) ;v112=v100[v104];v110[v112[2]]=v112[3];v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v112[3 + 0 ];v104=v104 + 1 ;v112=v100[v104];v240=v112[2];v110[v240]=v110[v240](v21(v110,v240 + 1 ,v112[3]));v104=v104 + 1 ;v112=v100[v104];v110[v112[2]][v110[v112[3]]]=v110[v112[4]];v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v73[v112[1183 -(1123 + 57) ]];v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v112[3];v104=v104 + 1 ;v112=v100[v104];v110[v112[2]]=v112[3];v104=v104 + 1 ;v112=v100[v104];v240=v112[2 + 0 ];v110[v240]=v110[v240](v21(v110,v240 + 1 ,v112[3]));v104=v104 + (255 -(163 + 91)) ;v112=v100[v104];v110[v112[2]][v110[v112[3]]]=v112[4];v104=v104 + 1 ;v112=v100[v104];v240=v112[2];v110[v240](v21(v110,v240 + 1 ,v112[3]));v104=v104 + 1 ;v112=v100[v104];v104=v112[3];else local v257=0;local v258;local v259;while true do if (v257==1) then for v620=v258 + 1 ,v105 do v15(v259,v110[v620]);end break;end if (v257==0) then v258=v112[2];v259=v110[v258];v257=1;end end end elseif (v113<=(1957 -(1869 + 61))) then local v175=0;local v176;while true do if (v175==0) then v176=v112[2];do return v110[v176](v21(v110,v176 + 1 ,v112[3]));end break;end end elseif (v113>28) then for v475=v112[2],v112[3] do v110[v475]=nil;end else v110[v112[2]][v110[v112[3]]]=v112[4];end elseif (v113<=32) then if (v113<=30) then local v177=v112[2];local v178=v110[v112[3]];v110[v177 + 1 ]=v178;v110[v177]=v178[v112[4]];elseif (v113==31) then local v262=0;local v263;local v264;local v265;while true do if (v262==1) then v265=v110[v263 + 2 ];if (v265>0) then if (v264>v110[v263 + 1 ]) then v104=v112[3];else v110[v263 + 3 ]=v264;end elseif (v264<v110[v263 + 1 ]) then v104=v112[3];else v110[v263 + 1 + 2 ]=v264;end break;end if (v262==0) then v263=v112[2];v264=v110[v263];v262=1;end end else do return;end end elseif (v113<=(115 -82)) then v110[v112[2]]=v110[v112[3]] + v112[5 -1 ] ;elseif (v113==34) then v110[v112[2]]=v112[3];else local v268=0;local v269;while true do if (v268==0) then v269=v112[2];v110[v269]=v110[v269](v21(v110,v269 + 1 ,v105));break;end end end elseif (v113<=(6 + 35)) then if (v113<=38) then if (v113<=36) then v110[v112[2 -0 ]]=v110[v112[3]][v112[4]];elseif (v113==37) then local v270=0;local v271;while true do if (v270==0) then v271=v112[2];v110[v271](v110[v271 + 1 ]);break;end end else local v272=0;local v273;while true do if (v272==0) then v273=v112[2];v110[v273]=v110[v273](v110[v273 + 1 ]);break;end end end elseif (v113<=39) then if v110[v112[2]] then v104=v104 + 1 ;else v104=v112[3];end elseif (v113>40) then local v275=0;local v276;local v277;local v278;while true do if (v275==0) then v276=v112[2];v277=v110[v276 + 2 ];v275=1;end if (1==v275) then v278=v110[v276] + v277 ;v110[v276]=v278;v275=2;end if (2==v275) then if (v277>0) then if (v278<=v110[v276 + 1 ]) then local v661=0;while true do if (v661==0) then v104=v112[3];v110[v276 + 3 ]=v278;break;end end end elseif (v278>=v110[v276 + 1 + 0 ]) then local v662=0;while true do if (v662==0) then v104=v112[3];v110[v276 + 3 ]=v278;break;end end end break;end end else v110[v112[2]]=v74[v112[3]];end elseif (v113<=44) then if (v113<=42) then v110[v112[2]]();elseif (v113==43) then local v281=0;local v282;local v283;local v284;local v285;while true do if (v281==3) then v112=v100[v104];v110[v112[720 -(15 + 703) ]]=v112[3];v104=v104 + 1 ;v281=4;end if (v281==5) then v105=(v284 + v285) -1 ;v282=0;for v621=v285,v105 do v282=v282 + 1 + 0 ;v110[v621]=v283[v282];end v281=6;end if (0==v281) then v282=nil;v283,v284=nil;v285=nil;v281=1;end if (v281==1) then v110[v112[1476 -(1329 + 145) ]]=v112[974 -(140 + 831) ];v104=v104 + 1 ;v112=v100[v104];v281=2;end if (v281==8) then if (v110[v112[2]]==v112[4]) then v104=v104 + 1 ;else v104=v112[3];end break;end if (v281==2) then v285=v112[2];v110[v285]=v110[v285](v21(v110,v285 + 1 ,v112[3]));v104=v104 + (1851 -(1409 + 441)) ;v281=3;end if (v281==4) then v112=v100[v104];v285=v112[2];v283,v284=v103(v110[v285](v21(v110,v285 + 1 ,v112[3])));v281=5;end if (v281==7) then v110[v285]=v110[v285](v21(v110,v285 + (1722 -(345 + 1376)) ,v105));v104=v104 + 1 ;v112=v100[v104];v281=8;end if (v281==6) then v104=v104 + (439 -(262 + 176)) ;v112=v100[v104];v285=v112[2];v281=7;end end else do return v110[v112[690 -(198 + 490) ]]();end end elseif (v113<=46) then if (v113==45) then local v286=0;local v287;local v288;local v289;while true do if (v286==2) then for v624=1,v112[4] do v104=v104 + 1 ;local v625=v100[v104];if (v625[1]==48) then v289[v624-1 ]={v110,v625[3]};else v289[v624-1 ]={v73,v625[3]};end v109[ #v109 + 1 ]=v289;end v110[v112[2]]=v40(v287,v288,v74);break;end if (v286==1) then v289={};v288=v18({},{[v7("\36\210\143\95\233\56\33","\89\123\141\230\49\141\93")]=function(v627,v628) local v629=v289[v628];return v629[1][v629[2]];end,[v7("\204\78\248\9\7\67\253\117\243\20","\42\147\17\150\108\112")]=function(v630,v631,v632) local v633=0;local v634;while true do if (v633==0) then v634=v289[v631];v634[1][v634[2]]=v632;break;end end end});v286=2;end if (v286==0) then v287=v101[v112[3]];v288=nil;v286=1;end end elseif (v110[v112[2]]==v112[4]) then v104=v104 + 1 ;else v104=v112[3];end elseif (v113==47) then local v290=0;local v291;while true do if (0==v290) then v291=v112[2];do return v21(v110,v291,v105);end break;end end else v110[v112[2]]=v110[v112[3]];end v104=v104 + (4 -3) ;break;end if (v115==0) then v112=v100[v104];v113=v112[1];v115=1;end end end end;end end end return v40(v39(),{},v28)(...);end return v23("LOL!0D3O0003063O00737472696E6703043O006368617203043O00627974652O033O0073756203053O0062697433322O033O0062697403043O0062786F7203053O007461626C6503063O00636F6E63617403063O00696E7365727403053O006D6174636803083O00746F6E756D62657203053O007063612O6C00243O00120D3O00013O00206O000200122O000100013O00202O00010001000300122O000200013O00202O00020002000400122O000300053O00062O0003000A0001000100040C3O000A0001001228000300063O002024000400030007001228000500083O002024000500050009001228000600083O00202400060006000A00062D00073O000100062O00303O00064O00308O00303O00044O00303O00014O00303O00024O00303O00053O001228000800013O00202400080008000B0012280009000C3O001228000A000D3O00062D000B0001000100052O00303O00074O00303O00094O00303O00084O00303O000A4O00303O000B4O0030000C000B4O002C000C00014O002F000C6O00203O00013O00023O00023O00026O00F03F026O00704002264O000200025O00122O000300016O00045O00122O000500013O00042O0003002100012O000B00076O0016000800026O000900016O000A00026O000B00036O000C00046O000D8O000E00063O00202O000F000600014O000C000F6O000B3O00024O000C00036O000D00046O000E00016O000F00016O000F0006000F00102O000F0001000F4O001000016O00100006001000102O00100001001000202O0010001000014O000D00106O000C8O000A3O000200202O000A000A00024O0009000A6O00073O00010004290003000500012O000B000300054O0030000400024O001B000300044O002F00036O00203O00017O00043O00027O004003053O003A25642B3A2O033O0025642B026O00F03F001C3O00062D5O000100012O000B8O0008000100016O000200026O000300026O00048O000500036O00068O000700076O000500076O00043O000100202400040004000100122B000500026O00030005000200122O000400036O000200046O00013O000200262O000100180001000400040C3O001800012O003000016O000300026O001B000100024O002F00015O00040C3O001B00012O000B000100044O002C000100014O002F00016O00203O00013O00013O00353O0003043O0067616D65030A3O0047657453657276696365030A3O007A02BD34A34C049B33BE03053O00D72976DC4603073O00536574436F726503103O0063132C16D05F022B14F75317361BF15E03053O009E3076427203053O009F2D043A7603073O009BCB44705613C5030E3O007FE96CD34E7DC6EA43DC22F3524003083O009826BD569C20188503043O00C852BF5203043O00269C37C7030E3O0084727D2C1A7AFD038A646C29006703083O0023C81D1C4873149A03083O003DAAC3DE99253B1703073O005479DFB1BFED4C026O00144003043O0077616974027O004003073O00482O747047657403503O00B342DDB0290A7F8EA957DEEE3D5924C9AE54DCB33F4233CEB542CCAE2E1E33CEB619E6AE3F7322C4BA42C6B2022O1FCFBE75DBA53B443FD38319C4A1335E7FF2B844C0B02E437FF4A853DBB3744428D503083O00A1DB36A9C05A305003063O00737472696E6703053O006C6F77657203043O00677375622O033O000C514B03043O0045292260034O0003053O0073706C697403013O002C03073O00506C6179657273030B3O004C6F63616C506C6179657203043O004E616D652O033O00F9D09C03063O004BDCA3B76A6203063O00697061697273030A3O006C6F6164737472696E6703513O000AAE9F27CA58F5C425D815F48C3ECD0AAF8922CA07A88838D716BF85239701B58678F60CBFA825DC03AE8425E14D958532FA10BF8A23D61082C43AD80BB4C404DA10B39B23CA4D989227D811A9C53BCC2O03053O00B962DAEB5703103O00F83929E2F0A5DF3521EFDDABDF3528E803063O00CAAB5C4786BE03053O001DC838842C03043O00E849A14C030E3O0082ED187210BEFA50581FAFD6506503053O007EDBB9223D03043O0038CB466603083O00876CAE3E121E179303133O0083FA2FD958A03CD3F6E83FDF10A121CEACEC2E03083O00A7D6894AAB78CE5303083O00AFE5205CECAE84FE03063O00C7EB90523D98026O00F03F01863O0006273O008400013O00040C3O00840001001228000100013O0020120001000100024O00035O00122O000400033O00122O000500046O000300056O00013O000200202O0002000100054O00045O00122O000500063O00122O000600076O0004000600024O00053O00034O00065O00122O000700083O00122O000800096O0006000800024O00075O00122O0008000A3O00122O0009000B6O0007000900024O0005000600074O00065O00122O0007000C3O00122O0008000D6O0006000800024O00075O00122O0008000E3O00122O0009000F6O0007000900024O0005000600074O00065O00122O000700103O00122O000800116O00060008000200202O0005000600124O00020005000100122O000200133O00122O000300146O00020002000100122O000200013O00202O0002000200154O00045O00122O000500163O00122O000600176O000400066O00023O000200122O000300183O00202O0003000300194O000400026O00030002000200202O00030003001A4O00055O00122O0006001B3O00122O0007001C6O00050007000200122O0006001D6O00030006000200202O00030003001E00122O0005001F6O00030005000200122O000400183O00202O00040004001900122O000500013O00202O00050005002000202O00050005002100202O0005000500224O00040002000200202O00040004001A4O00065O00122O000700233O00122O000800246O00060008000200122O0007001D6O0004000700024O00055O00122O000600256O000700036O00060002000800044O00560001000618000400560001000A00040C3O005600012O000F000500013O00040C3O00580001000601000600520001000200040C3O005200010006270005006500013O00040C3O00650001001228000600263O00122O000700013O00202O0007000700154O00095O00122O000A00273O00122O000B00286O0009000B6O00078O00063O00024O00060001000100044O0085000100201E0006000100052O001900085O00122O000900293O00122O000A002A6O0008000A00024O00093O00034O000A5O00122O000B002B3O00122O000C002C6O000A000C00024O000B5O00122O000C002D3O00122O000D002E6O000B000D00024O0009000A000B4O000A5O00122O000B002F3O00122O000C00306O000A000C00024O000B5O00122O000C00313O00122O000D00326O000B000D00024O0009000A000B4O000A5O00122O000B00333O00122O000C00346O000A000C000200202O0009000A00124O00060009000100044O0085000100202400013O00352O00203O00017O00",v17(),...);
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
