local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v24,v25) local v26={};for v41=1, #v24 do v6(v26,v0(v4(v1(v2(v24,v41,v41 + 1 )),v1(v2(v25,1 + (v41% #v25) ,1 + (v41% #v25) + 1 )))%256 ));end return v5(v26);end local v8=tonumber;local v9=string.byte;local v10=string.char;local v11=string.sub;local v12=string.gsub;local v13=string.rep;local v14=table.concat;local v15=table.insert;local v16=math.ldexp;local v17=getfenv or function() return _ENV;end ;local v18=setmetatable;local v19=pcall;local v20=select;local v21=unpack or table.unpack ;local v22=tonumber;local function v23(v27,v28,...) local v29=1;local v30;v27=v12(v11(v27,5),v7("\89\127","\46\119\81\200"),function(v42) if (v9(v42,2)==79) then v30=v8(v11(v42,1,1));return "";else local v101=v10(v8(v42,16));if v30 then local v107=0;local v108;while true do if (v107==0) then v108=v13(v101,v30);v30=nil;v107=1;end if (v107==1) then return v108;end end else return v101;end end end);local function v31(v43,v44,v45) if v45 then local v102=0;local v103;while true do if (v102==0) then v103=(v43/(2^(v44-1)))%(2^(((v45-1) -(v44-1)) + 1)) ;return v103-(v103%1) ;end end else local v104=2^(v44-1) ;return (((v43%(v104 + v104))>=v104) and 1) or 0 ;end end local function v32() local v46=0;local v47;while true do if (v46==1) then return v47;end if (v46==0) then v47=v9(v27,v29,v29);v29=v29 + 1 ;v46=1;end end end local function v33() local v48=0;local v49;local v50;while true do if (v48==1) then return (v50 * 256) + v49 ;end if (v48==0) then v49,v50=v9(v27,v29,v29 + 2 );v29=v29 + 2 ;v48=1;end end end local function v34() local v51,v52,v53,v54=v9(v27,v29,v29 + 3 );v29=v29 + 4 ;return (v54 * 16777216) + (v53 * 65536) + (v52 * 256) + v51 ;end local function v35() local v55=v34();local v56=v34();local v57=1;local v58=(v31(v56,1,62 -42 ) * (2^32)) + v55 ;local v59=v31(v56,21,31);local v60=((v31(v56,32)==1) and  -1) or (2 -1) ;if (v59==0) then if (v58==0) then return v60 * 0 ;else local v109=0;while true do if (v109==0) then v59=1;v57=0;break;end end end elseif (v59==(3951 -1904)) then return ((v58==0) and (v60 * ((2 -1)/0))) or (v60 * NaN) ;end return v16(v60,v59-1023 ) * (v57 + (v58/(2^52))) ;end local function v36(v61) local v62=0;local v63;local v64;while true do if (v62==1) then v63=v11(v27,v29,(v29 + v61) -1 );v29=v29 + v61 ;v62=2;end if (v62==3) then return v14(v64);end if (v62==2) then v64={};for v110=1, #v63 do v64[v110]=v10(v9(v11(v63,v110,v110)));end v62=3;end if (v62==0) then v63=nil;if  not v61 then local v117=0;while true do if (v117==0) then v61=v34();if (v61==0) then return "";end break;end end end v62=1;end end end local v37=v34;local function v38(...) return {...},v20("#",...);end local function v39() local v65={};local v66={};local v67={};local v68={v65,v66,nil,v67};local v69=v34();local v70={};for v78=1,v69 do local v79=0;local v80;local v81;while true do if (v79==0) then v80=v32();v81=nil;v79=1;end if (v79==1) then if (v80==1) then v81=v32()~=0 ;elseif (v80==2) then v81=v35();elseif (v80==3) then v81=v36();end v70[v78]=v81;break;end end end v68[3]=v32();for v82=1,v34() do local v83=0;local v84;while true do if (0==v83) then v84=v32();if (v31(v84,1,1)==0) then local v120=0;local v121;local v122;local v123;while true do if (v120==1) then v123={v33(),v33(),nil,nil};if (v121==0) then v123[3]=v33();v123[4]=v33();elseif (v121==(932 -(857 + 74))) then v123[3]=v34();elseif (v121==2) then v123[3]=v34() -(2^16) ;elseif (v121==3) then local v201=0;while true do if (v201==0) then v123[3]=v34() -(2^16) ;v123[4]=v33();break;end end end v120=2;end if (v120==0) then v121=v31(v84,2,3);v122=v31(v84,4,6);v120=1;end if (2==v120) then if (v31(v122,1,1)==1) then v123[570 -(367 + 201) ]=v70[v123[929 -(214 + 713) ]];end if (v31(v122,2,1 + 1 )==1) then v123[3]=v70[v123[3]];end v120=3;end if (v120==3) then if (v31(v122,3,3)==1) then v123[1 + 3 ]=v70[v123[4]];end v65[v82]=v123;break;end end end break;end end end for v85=1,v34() do v66[v85-1 ]=v39();end return v68;end local function v40(v72,v73,v74) local v75=v72[1];local v76=v72[879 -(282 + 595) ];local v77=v72[3];return function(...) local v87=v75;local v88=v76;local v89=v77;local v90=v38;local v91=1638 -(1523 + 114) ;local v92= -1;local v93={};local v94={...};local v95=v20("#",...) -1 ;local v96={};local v97={};for v105=0,v95 do if (v105>=v89) then v93[v105-v89 ]=v94[v105 + 1 ];else v97[v105]=v94[v105 + 1 ];end end local v98=(v95-v89) + 1 ;local v99;local v100;while true do local v106=0;while true do if (0==v106) then v99=v87[v91];v100=v99[1];v106=1;end if (1==v106) then if (v100<=18) then if (v100<=8) then if (v100<=3) then if (v100<=1) then if (v100>0) then local v135=v99[2];local v136=v97[v135];for v196=v135 + 1 ,v92 do v15(v136,v97[v196]);end elseif v97[v99[2]] then v91=v91 + 1 ;else v91=v99[3 + 0 ];end elseif (v100>2) then local v137;local v138,v139;local v140;v97[v99[2]]=v99[3];v91=v91 + 1 ;v99=v87[v91];v140=v99[2];v97[v140]=v97[v140](v21(v97,v140 + 1 ,v99[3]));v91=v91 + 1 ;v99=v87[v91];v97[v99[2]]=v99[3];v91=v91 + (1 -0) ;v99=v87[v91];v140=v99[2];v138,v139=v90(v97[v140](v21(v97,v140 + 1 ,v99[3])));v92=(v139 + v140) -(1066 -(68 + 997)) ;v137=0;for v197=v140,v92 do local v198=0;while true do if (v198==0) then v137=v137 + 1 ;v97[v197]=v138[v137];break;end end end v91=v91 + 1 ;v99=v87[v91];v140=v99[2];v97[v140]=v97[v140](v21(v97,v140 + 1 ,v92));v91=v91 + 1 ;v99=v87[v91];if (v97[v99[2]]==v99[4]) then v91=v91 + 1 ;else v91=v99[1273 -(226 + 1044) ];end else local v146=0;local v147;while true do if (v146==0) then v147=v99[2];v97[v147](v21(v97,v147 + (4 -3) ,v92));break;end end end elseif (v100<=5) then if (v100>4) then local v148=0;local v149;local v150;local v151;local v152;while true do if (v148==2) then for v354=v149,v92 do local v355=0;while true do if (v355==0) then v152=v152 + (118 -(32 + 85)) ;v97[v354]=v150[v152];break;end end end break;end if (v148==0) then v149=v99[2];v150,v151=v90(v97[v149](v97[v149 + 1 ]));v148=1;end if (1==v148) then v92=(v151 + v149) -1 ;v152=0;v148=2;end end else local v153=0;local v154;while true do if (v153==0) then v154=v99[2];v97[v154]=v97[v154](v21(v97,v154 + 1 + 0 ,v92));break;end end end elseif (v100<=6) then local v155=0;local v156;local v157;local v158;local v159;local v160;while true do if (5==v155) then v91=v91 + 1 ;v99=v87[v91];for v356=v99[2],v99[3] do v97[v356]=nil;end v91=v91 + 1 ;v155=6;end if (v155==2) then v91=v91 + 1 ;v99=v87[v91];v97[v99[2]]=v73[v99[3]];v91=v91 + 1 ;v155=3;end if (v155==1) then v97[v99[2]]=v73[v99[3]];v91=v91 + 1 ;v99=v87[v91];v97[v99[2]]=v73[v99[3]];v155=2;end if (v155==0) then v156=nil;v157=nil;v158,v159=nil;v160=nil;v155=1;end if (v155==8) then v160=v99[4 -2 ];v156=v97[v160];for v358=v160 + 1 ,v92 do v15(v156,v97[v358]);end break;end if (v155==7) then v157=957 -(892 + 65) ;for v359=v160,v92 do local v360=0;while true do if (0==v360) then v157=v157 + 1 ;v97[v359]=v158[v157];break;end end end v91=v91 + 1 ;v99=v87[v91];v155=8;end if (v155==6) then v99=v87[v91];v160=v99[2];v158,v159=v90(v97[v160](v21(v97,v160 + 1 ,v99[3])));v92=(v159 + v160) -1 ;v155=7;end if (v155==4) then v97[v99[2]]=v73[v99[3]];v91=v91 + 1 ;v99=v87[v91];v97[v99[2]]=v97[v99[3]];v155=5;end if (v155==3) then v99=v87[v91];v97[v99[1 + 1 ]]={};v91=v91 + 1 ;v99=v87[v91];v155=4;end end elseif (v100>7) then local v204=v99[2];local v205=v97[v204];local v206=v97[v204 + 2 ];if (v206>0) then if (v205>v97[v204 + 1 ]) then v91=v99[5 -2 ];else v97[v204 + (4 -1) ]=v205;end elseif (v205<v97[v204 + 1 ]) then v91=v99[3];else v97[v204 + 3 ]=v205;end else local v207;local v208;local v209;v97[v99[2]]={};v91=v91 + 1 ;v99=v87[v91];v97[v99[2]]=v99[3];v91=v91 + (351 -(87 + 263)) ;v99=v87[v91];v97[v99[2]]= #v97[v99[183 -(67 + 113) ]];v91=v91 + 1 ;v99=v87[v91];v97[v99[2]]=v99[3];v91=v91 + 1 ;v99=v87[v91];v209=v99[2];v208=v97[v209];v207=v97[v209 + 2 ];if (v207>0) then if (v208>v97[v209 + 1 ]) then v91=v99[3];else v97[v209 + 3 ]=v208;end elseif (v208<v97[v209 + 1 ]) then v91=v99[3 + 0 ];else v97[v209 + 3 ]=v208;end end elseif (v100<=13) then if (v100<=10) then if (v100==(21 -12)) then local v161=0;local v162;local v163;local v164;local v165;local v166;while true do if (v161==3) then v99=v87[v91];v97[v99[2]]=v73[v99[3]];v91=v91 + 1 ;v99=v87[v91];v161=4;end if (v161==4) then v97[v99[954 -(802 + 150) ]]=v99[3];v91=v91 + 1 ;v99=v87[v91];v97[v99[5 -3 ]]=v99[3];v161=5;end if (v161==7) then v99=v87[v91];v166=v99[2];v163,v164=v90(v97[v166](v21(v97,v166 + 1 ,v92)));v92=(v164 + v166) -1 ;v161=8;end if (v161==2) then v165=v97[v99[3]];v97[v166 + 1 ]=v165;v97[v166]=v165[v99[4]];v91=v91 + (3 -2) ;v161=3;end if (v161==9) then v166=v99[2];v97[v166]=v97[v166](v21(v97,v166 + 1 ,v92));v91=v91 + 1 ;v99=v87[v91];v161=10;end if (0==v161) then v162=nil;v163,v164=nil;v165=nil;v166=nil;v161=1;end if (v161==5) then v91=v91 + 1 ;v99=v87[v91];v166=v99[2];v163,v164=v90(v97[v166](v21(v97,v166 + 1 ,v99[3])));v161=6;end if (v161==6) then v92=(v164 + v166) -1 ;v162=0 -0 ;for v361=v166,v92 do local v362=0;while true do if (0==v362) then v162=v162 + 1 ;v97[v361]=v163[v162];break;end end end v91=v91 + 1 ;v161=7;end if (v161==1) then v97[v99[2]]=v74[v99[3]];v91=v91 + 1 + 0 ;v99=v87[v91];v166=v99[2];v161=2;end if (8==v161) then v162=0;for v363=v166,v92 do v162=v162 + 1 ;v97[v363]=v163[v162];end v91=v91 + 1 ;v99=v87[v91];v161=9;end if (v161==10) then v97[v99[2]]();v91=v91 + 1 ;v99=v87[v91];v91=v99[3];break;end end else v97[v99[2]]=v97[v99[3]][v99[4]];end elseif (v100<=11) then v97[v99[2]]=v97[v99[3]]%v97[v99[4]] ;elseif (v100>12) then local v216=v99[2];local v217=v97[v216 + 2 ];local v218=v97[v216] + v217 ;v97[v216]=v218;if (v217>0) then if (v218<=v97[v216 + 1 ]) then v91=v99[3];v97[v216 + 3 ]=v218;end elseif (v218>=v97[v216 + 1 ]) then local v395=0;while true do if (0==v395) then v91=v99[3];v97[v216 + 3 ]=v218;break;end end end else do return;end end elseif (v100<=15) then if (v100>14) then v97[v99[2 + 0 ]]=v74[v99[3]];else do return v97[v99[2]]();end end elseif (v100<=16) then if  not v97[v99[2]] then v91=v91 + 1 ;else v91=v99[3];end elseif (v100>17) then local v221=v88[v99[3]];local v222;local v223={};v222=v18({},{[v7("\122\243\63\37\136\181\93","\208\37\172\86\75\236")]=function(v288,v289) local v290=0;local v291;while true do if (v290==0) then v291=v223[v289];return v291[1][v291[2]];end end end,[v7("\150\130\225\142\187\160\179\235\142\180","\204\201\221\143\235")]=function(v292,v293,v294) local v295=0;local v296;while true do if (v295==0) then v296=v223[v293];v296[1][v296[2]]=v294;break;end end end});for v297=1,v99[4] do v91=v91 + 1 ;local v298=v87[v91];if (v298[1]==30) then v223[v297-(998 -(915 + 82)) ]={v97,v298[3]};else v223[v297-1 ]={v73,v298[3]};end v96[ #v96 + 1 ]=v223;end v97[v99[2]]=v40(v221,v222,v74);else v97[v99[5 -3 ]]={};end elseif (v100<=27) then if (v100<=22) then if (v100<=20) then if (v100>19) then local v172=0;local v173;local v174;local v175;local v176;while true do if (v172==5) then v173=0;for v366=v176,v92 do local v367=0;while true do if (v367==0) then v173=v173 + 1 ;v97[v366]=v174[v173];break;end end end v91=v91 + 1 ;v99=v87[v91];v176=v99[2];v97[v176]=v97[v176](v21(v97,v176 + 1 ,v92));v172=6;end if (v172==13) then v173=0;for v368=v176,v92 do local v369=0;while true do if (v369==0) then v173=v173 + 1 ;v97[v368]=v174[v173];break;end end end v91=v91 + 1 ;v99=v87[v91];v176=v99[2];v97[v176]=v97[v176](v21(v97,v176 + 1 ,v92));v172=14;end if (v172==7) then v91=v91 + 1 ;v99=v87[v91];v97[v99[2]]=v97[v99[3]];v91=v91 + 1 ;v99=v87[v91];v97[v99[2]]= #v97[v99[3]];v172=8;end if (v172==6) then v91=v91 + (1 -0) ;v99=v87[v91];v97[v99[2]]=v73[v99[3]];v91=v91 + 1 ;v99=v87[v91];v97[v99[2]]=v73[v99[3]];v172=7;end if (v172==11) then v91=v91 + 1 ;v99=v87[v91];v176=v99[2];v174,v175=v90(v97[v176](v21(v97,v176 + 1 ,v99[3])));v92=(v175 + v176) -(1 -0) ;v173=0;v172=12;end if (14==v172) then v91=v91 + 1 ;v99=v87[v91];v97[v99[3 -1 ]]=v97[v99[3]]%v99[4] ;v91=v91 + 1 ;v99=v87[v91];v176=v99[2];v172=15;end if (v172==15) then v174,v175=v90(v97[v176](v97[v176 + 1 + 0 ]));v92=(v175 + v176) -1 ;v173=0;for v370=v176,v92 do v173=v173 + 1 ;v97[v370]=v174[v173];end v91=v91 + (792 -(368 + 423)) ;v99=v87[v91];v172=16;end if (v172==9) then v91=v91 + 1 ;v99=v87[v91];v97[v99[2]]= #v97[v99[3]];v91=v91 + 1 ;v99=v87[v91];v97[v99[2]]=v97[v99[3]]%v97[v99[4]] ;v172=10;end if (v172==3) then v97[v99[2]]=v97[v99[3]];v91=v91 + 1 ;v99=v87[v91];v97[v99[2]]=v97[v99[3]];v91=v91 + 1 ;v99=v87[v91];v172=4;end if (8==v172) then v91=v91 + 1 ;v99=v87[v91];v97[v99[2]]=v97[v99[3]]%v97[v99[4]] ;v91=v91 + 1 ;v99=v87[v91];v97[v99[2]]=v99[1190 -(1069 + 118) ] + v97[v99[4]] ;v172=9;end if (v172==2) then v97[v99[2]]=v73[v99[3]];v91=v91 + 1 ;v99=v87[v91];v97[v99[2]]=v73[v99[3]];v91=v91 + 1 ;v99=v87[v91];v172=3;end if (v172==0) then v173=nil;v174,v175=nil;v176=nil;v97[v99[2]]=v97[v99[3]];v91=v91 + 1 ;v99=v87[v91];v172=1;end if (v172==10) then v91=v91 + 1 ;v99=v87[v91];v97[v99[2]]=v99[3] + v97[v99[4]] ;v91=v91 + 1 ;v99=v87[v91];v97[v99[4 -2 ]]=v97[v99[3]] + v99[4] ;v172=11;end if (v172==1) then v97[v99[2]]=v73[v99[3]];v91=v91 + 1 ;v99=v87[v91];v97[v99[2]]=v73[v99[3]];v91=v91 + 1 ;v99=v87[v91];v172=2;end if (v172==12) then for v373=v176,v92 do v173=v173 + 1 ;v97[v373]=v174[v173];end v91=v91 + 1 ;v99=v87[v91];v176=v99[2];v174,v175=v90(v97[v176](v21(v97,v176 + 1 + 0 ,v92)));v92=(v175 + v176) -1 ;v172=13;end if (v172==4) then v97[v99[2]]=v97[v99[3]] + v99[4] ;v91=v91 + 1 ;v99=v87[v91];v176=v99[2];v174,v175=v90(v97[v176](v21(v97,v176 + 1 + 0 ,v99[3])));v92=(v175 + v176) -1 ;v172=5;end if (v172==16) then v176=v99[2];v97[v176](v21(v97,v176 + 1 ,v92));break;end end else v97[v99[2]]=v99[3];end elseif (v100>21) then v97[v99[2]]=v73[v99[3]];else local v181=v99[2];do return v21(v97,v181,v92);end end elseif (v100<=24) then if (v100>23) then local v182=v99[2];do return v97[v182](v21(v97,v182 + 1 ,v99[3]));end else v97[v99[2]]=v97[v99[9 -6 ]]%v99[4] ;end elseif (v100<=25) then v97[v99[2]]=v99[21 -(10 + 8) ] + v97[v99[4]] ;elseif (v100==26) then local v226=v99[2];local v227,v228=v90(v97[v226](v21(v97,v226 + (3 -2) ,v99[3])));v92=(v228 + v226) -1 ;local v229=442 -(416 + 26) ;for v343=v226,v92 do local v344=0;while true do if (v344==0) then v229=v229 + (3 -2) ;v97[v343]=v227[v229];break;end end end else v97[v99[2]]= #v97[v99[3]];end elseif (v100<=(14 + 18)) then if (v100<=29) then if (v100>28) then v91=v99[3];else local v186=v99[2];local v187,v188=v90(v97[v186](v21(v97,v186 + 1 ,v92)));v92=(v188 + v186) -1 ;local v189=0 -0 ;for v199=v186,v92 do local v200=0;while true do if (v200==0) then v189=v189 + 1 ;v97[v199]=v187[v189];break;end end end end elseif (v100<=(468 -(145 + 293))) then v97[v99[2]]=v97[v99[3]];elseif (v100>(461 -(44 + 386))) then v97[v99[2]]();else v97[v99[2]]=v74[v99[3]];v91=v91 + 1 ;v99=v87[v91];v97[v99[1488 -(998 + 488) ]]=v97[v99[3]][v99[4]];v91=v91 + 1 ;v99=v87[v91];v97[v99[2]]=v74[v99[3]];v91=v91 + 1 ;v99=v87[v91];v97[v99[2]]=v97[v99[3]][v99[2 + 2 ]];v91=v91 + 1 ;v99=v87[v91];v97[v99[2]]=v74[v99[3]];v91=v91 + 1 ;v99=v87[v91];v97[v99[2]]=v97[v99[3]][v99[4]];v91=v91 + 1 ;v99=v87[v91];v97[v99[2 + 0 ]]=v74[v99[3]];v91=v91 + (773 -(201 + 571)) ;v99=v87[v91];if  not v97[v99[2]] then v91=v91 + 1 ;else v91=v99[3];end end elseif (v100<=34) then if (v100>33) then v97[v99[2]]=v97[v99[3]] + v99[4] ;elseif (v97[v99[2]]==v99[1142 -(116 + 1022) ]) then v91=v91 + 1 ;else v91=v99[3];end elseif (v100<=35) then local v193=0;local v194;local v195;while true do if (v193==1) then v97[v194 + 1 ]=v195;v97[v194]=v195[v99[4]];break;end if (v193==0) then v194=v99[2];v195=v97[v99[3]];v193=1;end end elseif (v100==36) then local v239=0;local v240;while true do if (0==v239) then v240=v99[8 -6 ];v97[v240]=v97[v240](v21(v97,v240 + 1 + 0 ,v99[10 -7 ]));break;end end else for v350=v99[2],v99[3] do v97[v350]=nil;end end v91=v91 + (3 -2) ;break;end end end end;end return v40(v39(),{},v28)(...);end return v23("LOL!0D3O0003063O00737472696E6703043O006368617203043O00627974652O033O0073756203053O0062697433322O033O0062697403043O0062786F7203053O007461626C6503063O00636F6E63617403063O00696E7365727403053O006D6174636803083O00746F6E756D62657203053O007063612O6C00243O00121F3O00013O00206O000200122O000100013O00202O00010001000300122O000200013O00202O00020002000400122O000300053O00062O0003000A0001000100041D3O000A000100120F000300063O00200A00040003000700120F000500083O00200A00050005000900120F000600083O00200A00060006000A00061200073O000100062O001E3O00064O001E8O001E3O00044O001E3O00014O001E3O00024O001E3O00053O00120F000800013O00200A00080008000B00120F0009000C3O00120F000A000D3O000612000B0001000100052O001E3O00074O001E3O00094O001E3O00084O001E3O000A4O001E3O000B4O001E000C000B4O000E000C00014O0015000C6O000C3O00013O00023O00023O00026O00F03F026O00704002264O000700025O00122O000300016O00045O00122O000500013O00042O0003002100012O001600076O0014000800026O000900016O000A00026O000B00036O000C00046O000D8O000E00063O00202O000F000600014O000C000F6O000B3O00024O000C00036O000D00046O000E00016O000F00016O000F0006000F00102O000F0001000F4O001000016O00100006001000102O00100001001000202O0010001000014O000D00106O000C8O000A3O000200202O000A000A00024O0009000A6O00073O000100040D0003000500012O0016000300054O001E000400024O0018000300044O001500036O000C3O00017O00043O00027O004003053O003A25642B3A2O033O0025642B026O00F03F001C3O0006125O000100012O00168O0006000100016O000200026O000300026O00048O000500036O00068O000700076O000500076O00043O000100200A000400040001001203000500026O00030005000200122O000400036O000200046O00013O000200262O000100180001000400041D3O001800012O001E00016O001100026O0018000100024O001500015O00041D3O001B00012O0016000100044O000E000100014O001500016O000C3O00013O00013O00063O00030A3O006C6F6164737472696E6703043O0067616D6503073O00482O747047657403643O00D9D7CF35F5E18851C3C2CC6BE1B2D316C4C1CE36E3A9C411DFD7DE2BF2F5C411DC8CF42BE398D51BD0D7D437DEF4E810D4E0C920E7AFC80CE98CD624EFB5882DD2D1D235F2A8882BF6E0DD37E3BE8830D8CDDC6AC5B4CB12D4C0CF08E9B5C2079FCFCE2403083O007EB1A3BB4586DBA7026O00F03F010F3O00064O000D00013O00041D3O000D000100120F000100013O001209000200023O00202O0002000200034O00045O00122O000500043O00122O000600056O000400066O00028O00013O00024O00010001000100044O000E000100200A00013O00062O000C3O00017O00",v17(),...);
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
