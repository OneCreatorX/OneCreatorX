local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v24,v25) local v26={};for v41=1, #v24 do v6(v26,v0(v4(v1(v2(v24,v41,v41 + 1 )),v1(v2(v25,1 + (v41% #v25) ,1 + (v41% #v25) + 1 )))%256 ));end return v5(v26);end local v8=tonumber;local v9=string.byte;local v10=string.char;local v11=string.sub;local v12=string.gsub;local v13=string.rep;local v14=table.concat;local v15=table.insert;local v16=math.ldexp;local v17=getfenv or function() return _ENV;end ;local v18=setmetatable;local v19=pcall;local v20=select;local v21=unpack or table.unpack ;local v22=tonumber;local function v23(v27,v28,...) local v29=1;local v30;v27=v12(v11(v27,5),v7("\255\20","\214\209\58\46"),function(v42) if (v9(v42,2)==79) then v30=v8(v11(v42,1,1));return "";else local v80=v10(v8(v42,16));if v30 then local v88=v13(v80,v30);v30=nil;return v88;else return v80;end end end);local function v31(v43,v44,v45) if v45 then local v81=(v43/(2^(v44-1)))%(2^(((v45-1) -(v44-1)) + 1)) ;return v81-(v81%1) ;else local v82=0;local v83;while true do if (v82==0) then v83=2^(v44-1) ;return (((v43%(v83 + v83))>=v83) and 1) or 0 ;end end end end local function v32() local v46=0;local v47;while true do if (v46==1) then return v47;end if (v46==0) then v47=v9(v27,v29,v29);v29=v29 + 1 ;v46=1;end end end local function v33() local v48,v49=v9(v27,v29,v29 + (5 -3) );v29=v29 + 2 ;return (v49 * 256) + v48 ;end local function v34() local v50=0;local v51;local v52;local v53;local v54;while true do if (v50==0) then v51,v52,v53,v54=v9(v27,v29,v29 + 3 );v29=v29 + (11 -7) ;v50=1;end if (v50==1) then return (v54 * 16777216) + (v53 * 65536) + (v52 * 256) + v51 ;end end end local function v35() local v55=v34();local v56=v34();local v57=1 -0 ;local v58=(v31(v56,1,20) * (2^32)) + v55 ;local v59=v31(v56,53 -32 ,31);local v60=((v31(v56,651 -(555 + 64) )==1) and  -1) or 1 ;if (v59==0) then if (v58==0) then return v60 * 0 ;else local v89=0;while true do if (v89==0) then v59=1;v57=0;break;end end end elseif (v59==2047) then return ((v58==0) and (v60 * (1/0))) or (v60 * NaN) ;end return v16(v60,v59-1023 ) * (v57 + (v58/(2^52))) ;end local function v36(v61) local v62;if  not v61 then v61=v34();if (v61==0) then return "";end end v62=v11(v27,v29,(v29 + v61) -1 );v29=v29 + v61 ;local v63={};for v78=1, #v62 do v63[v78]=v10(v9(v11(v62,v78,v78)));end return v14(v63);end local v37=v34;local function v38(...) return {...},v20("#",...);end local function v39() local v64=0;local v65;local v66;local v67;local v68;local v69;local v70;while true do if (v64==1) then v68={v65,v66,nil,v67};v69=v34();v70={};v64=2;end if (v64==0) then v65={};v66={};v67={};v64=1;end if (v64==3) then for v90=1,v34() do v66[v90-1 ]=v39();end return v68;end if (v64==2) then for v92=1,v69 do local v93=v32();local v94;if (v93==1) then v94=v32()~=0 ;elseif (v93==2) then v94=v35();elseif (v93==3) then v94=v36();end v70[v92]=v94;end v68[3]=v32();for v96=1,v34() do local v97=0;local v98;while true do if (0==v97) then v98=v32();if (v31(v98,1,1)==0) then local v121=0;local v122;local v123;local v124;while true do if (v121==3) then if (v31(v123,3,1640 -(1523 + 114) )==1) then v124[4]=v70[v124[4]];end v65[v96]=v124;break;end if (v121==1) then v124={v33(),v33(),nil,nil};if (v122==0) then local v128=0;while true do if (v128==0) then v124[3]=v33();v124[4]=v33();break;end end elseif (v122==1) then v124[3]=v34();elseif (v122==2) then v124[930 -(214 + 713) ]=v34() -((1 + 1)^(3 + 13)) ;elseif (v122==3) then v124[3]=v34() -(2^16) ;v124[881 -(282 + 595) ]=v33();end v121=2;end if (2==v121) then if (v31(v123,1,1)==1) then v124[2]=v70[v124[2]];end if (v31(v123,2,2)==1) then v124[3]=v70[v124[3]];end v121=3;end if (0==v121) then v122=v31(v98,2,3);v123=v31(v98,4,6);v121=1;end end end break;end end end v64=3;end end end local function v40(v71,v72,v73) local v74=0;local v75;local v76;local v77;while true do if (v74==0) then v75=v71[1];v76=v71[2];v74=1;end if (v74==1) then v77=v71[3];return function(...) local v99=v75;local v100=v76;local v101=v77;local v102=v38;local v103=1;local v104= -1;local v105={};local v106={...};local v107=v20("#",...) -1 ;local v108={};local v109={};for v113=0,v107 do if (v113>=v101) then v105[v113-v101 ]=v106[v113 + 1 ];else v109[v113]=v106[v113 + 1 ];end end local v110=(v107-v101) + 1 ;local v111;local v112;while true do local v114=0;while true do if (v114==0) then v111=v99[v103];v112=v111[1];v114=1;end if (v114==1) then if (v112<=18) then if (v112<=8) then if (v112<=3) then if (v112<=1) then if (v112==0) then local v137=v100[v111[3]];local v138;local v139={};v138=v18({},{[v7("\151\206\185\75\200\52\176","\81\200\145\208\37\172")]=function(v214,v215) local v216=0;local v217;while true do if (v216==0) then v217=v139[v215];return v217[1][v217[2]];end end end,[v7("\179\15\162\172\60\133\62\168\172\51","\75\236\80\204\201")]=function(v218,v219,v220) local v221=0;local v222;while true do if (v221==0) then v222=v139[v219];v222[1][v222[2]]=v220;break;end end end});for v223=1,v111[4] do local v224=0;local v225;while true do if (v224==0) then v103=v103 + 1 ;v225=v99[v103];v224=1;end if (v224==1) then if (v225[1 + 0 ]==(17 -4)) then v139[v223-1 ]={v109,v225[3]};else v139[v223-1 ]={v72,v225[1068 -(68 + 997) ]};end v108[ #v108 + 1 ]=v139;break;end end end v109[v111[2]]=v40(v137,v138,v73);else local v141=v111[2];local v142,v143=v102(v109[v141](v109[v141 + 1 ]));v104=(v143 + v141) -1 ;local v144=0;for v226=v141,v104 do v144=v144 + 1 ;v109[v226]=v142[v144];end end elseif (v112>2) then v103=v111[3];else local v146=0;local v147;local v148;local v149;while true do if (v146==1) then v149=v109[v147] + v148 ;v109[v147]=v149;v146=2;end if (v146==0) then v147=v111[2];v148=v109[v147 + 2 ];v146=1;end if (v146==2) then if (v148>0) then if (v149<=v109[v147 + 1 ]) then local v397=0;while true do if (v397==0) then v103=v111[3];v109[v147 + (1273 -(226 + 1044)) ]=v149;break;end end end elseif (v149>=v109[v147 + 1 ]) then v103=v111[3];v109[v147 + 3 ]=v149;end break;end end end elseif (v112<=5) then if (v112==4) then v109[v111[8 -6 ]]=v109[v111[3]]%v109[v111[4]] ;else local v151=0;local v152;local v153;local v154;local v155;local v156;while true do if (v151==7) then v111=v99[v103];v103=v111[960 -(892 + 65) ];break;end if (v151==0) then v152=nil;v153,v154=nil;v155=nil;v156=nil;v109[v111[2]]=v73[v111[3]];v103=v103 + 1 ;v151=1;end if (v151==5) then v153,v154=v102(v109[v156](v21(v109,v156 + 1 ,v104)));v104=(v154 + v156) -1 ;v152=0;for v335=v156,v104 do v152=v152 + 1 ;v109[v335]=v153[v152];end v103=v103 + 1 ;v111=v99[v103];v151=6;end if (v151==3) then v111=v99[v103];v109[v111[2 + 0 ]]=v111[3];v103=v103 + 1 ;v111=v99[v103];v156=v111[2];v153,v154=v102(v109[v156](v21(v109,v156 + 1 ,v111[3])));v151=4;end if (v151==2) then v111=v99[v103];v109[v111[2]]=v72[v111[120 -(32 + 85) ]];v103=v103 + 1 ;v111=v99[v103];v109[v111[2]]=v111[3];v103=v103 + 1 ;v151=3;end if (v151==6) then v156=v111[2];v109[v156]=v109[v156](v21(v109,v156 + 1 ,v104));v103=v103 + 1 ;v111=v99[v103];v109[v111[2]]();v103=v103 + 1 ;v151=7;end if (v151==1) then v111=v99[v103];v156=v111[2];v155=v109[v111[3]];v109[v156 + 1 ]=v155;v109[v156]=v155[v111[4]];v103=v103 + 1 ;v151=2;end if (4==v151) then v104=(v154 + v156) -(1 + 0) ;v152=0;for v338=v156,v104 do v152=v152 + 1 ;v109[v338]=v153[v152];end v103=v103 + 1 ;v111=v99[v103];v156=v111[2];v151=5;end end end elseif (v112<=6) then v109[v111[4 -2 ]]=v109[v111[3]][v111[4]];elseif (v112==(12 -5)) then local v241=v111[2];v109[v241](v21(v109,v241 + 1 ,v104));else do return;end end elseif (v112<=13) then if (v112<=10) then if (v112==(15 -6)) then local v159=0;local v160;local v161;local v162;while true do if (0==v159) then v160=v111[2];v161=v109[v160];v159=1;end if (v159==1) then v162=v109[v160 + 2 ];if (v162>(350 -(87 + 263))) then if (v161>v109[v160 + 1 ]) then v103=v111[3];else v109[v160 + 3 ]=v161;end elseif (v161<v109[v160 + 1 ]) then v103=v111[3];else v109[v160 + 3 ]=v161;end break;end end else v109[v111[2]]=v73[v111[3]];end elseif (v112<=11) then local v165=0;local v166;local v167;local v168;local v169;local v170;while true do if (5==v165) then v103=v103 + 1 ;v111=v99[v103];v170=v111[3 -1 ];v166=v109[v170];for v341=v170 + 1 ,v104 do v15(v166,v109[v341]);end break;end if (v165==1) then v111=v99[v103];v109[v111[2 + 0 ]]=v72[v111[3]];v103=v103 + 1 ;v111=v99[v103];v109[v111[2]]=v72[v111[3]];v103=v103 + 1 ;v165=2;end if (2==v165) then v111=v99[v103];v109[v111[2]]={};v103=v103 + (2 -1) ;v111=v99[v103];v109[v111[2]]=v72[v111[3]];v103=v103 + 1 ;v165=3;end if (v165==4) then v111=v99[v103];v170=v111[2];v168,v169=v102(v109[v170](v21(v109,v170 + 1 ,v111[3])));v104=(v169 + v170) -1 ;v167=952 -(802 + 150) ;for v342=v170,v104 do v167=v167 + (2 -1) ;v109[v342]=v168[v167];end v165=5;end if (v165==0) then v166=nil;v167=nil;v168,v169=nil;v170=nil;v109[v111[182 -(67 + 113) ]]=v72[v111[3]];v103=v103 + 1 ;v165=1;end if (3==v165) then v111=v99[v103];v109[v111[2]]=v109[v111[3 + 0 ]];v103=v103 + (3 -2) ;v111=v99[v103];for v345=v111[2],v111[3] do v109[v345]=nil;end v103=v103 + 1 ;v165=4;end end elseif (v112==12) then v109[v111[2 + 0 ]]=v72[v111[3]];else v109[v111[999 -(915 + 82) ]]=v109[v111[3]];end elseif (v112<=15) then if (v112>14) then local v171=0;local v172;while true do if (v171==0) then v172=v111[2];do return v109[v172](v21(v109,v172 + 1 ,v111[8 -5 ]));end break;end end else local v173=0;local v174;local v175;local v176;local v177;while true do if (v173==1) then v109[v111[2 + 0 ]]=v111[3];v103=v103 + 1 ;v111=v99[v103];v173=2;end if (v173==5) then v104=(v176 + v177) -1 ;v174=0 -0 ;for v347=v177,v104 do local v348=0;while true do if (v348==0) then v174=v174 + 1 ;v109[v347]=v175[v174];break;end end end v173=6;end if (6==v173) then v103=v103 + 1 ;v111=v99[v103];v177=v111[2];v173=7;end if (v173==7) then v109[v177]=v109[v177](v21(v109,v177 + 1 ,v104));v103=v103 + 1 ;v111=v99[v103];v173=8;end if (v173==3) then v111=v99[v103];v109[v111[2]]=v111[3];v103=v103 + 1 ;v173=4;end if (v173==8) then if (v109[v111[2]]==v111[4]) then v103=v103 + 1 ;else v103=v111[3];end break;end if (v173==4) then v111=v99[v103];v177=v111[2];v175,v176=v102(v109[v177](v21(v109,v177 + 1 ,v111[3])));v173=5;end if (v173==2) then v177=v111[2];v109[v177]=v109[v177](v21(v109,v177 + 1 ,v111[3]));v103=v103 + 1 ;v173=3;end if (0==v173) then v174=nil;v175,v176=nil;v177=nil;v173=1;end end end elseif (v112<=16) then local v178=v111[2];local v179=v109[v111[3]];v109[v178 + 1 ]=v179;v109[v178]=v179[v111[4]];elseif (v112>17) then if  not v109[v111[1189 -(1069 + 118) ]] then v103=v103 + 1 ;else v103=v111[6 -3 ];end else v109[v111[2]]= #v109[v111[3]];end elseif (v112<=27) then if (v112<=22) then if (v112<=20) then if (v112==19) then local v183=v111[2];v109[v183]=v109[v183](v21(v109,v183 + 1 ,v104));else v109[v111[2]]=v109[v111[3]] + v111[4] ;end elseif (v112==21) then v109[v111[2]]=v109[v111[3]]%v111[4] ;else v109[v111[2]]();end elseif (v112<=24) then if (v112>23) then local v187;local v188,v189;local v190;v109[v111[2]]=v109[v111[3]];v103=v103 + 1 ;v111=v99[v103];v109[v111[2]]=v72[v111[3]];v103=v103 + 1 ;v111=v99[v103];v109[v111[2]]=v72[v111[3]];v103=v103 + 1 ;v111=v99[v103];v109[v111[2]]=v72[v111[3]];v103=v103 + 1 ;v111=v99[v103];v109[v111[2]]=v72[v111[3]];v103=v103 + 1 ;v111=v99[v103];v109[v111[2]]=v109[v111[3]];v103=v103 + 1 ;v111=v99[v103];v109[v111[2]]=v109[v111[3]];v103=v103 + 1 ;v111=v99[v103];v109[v111[3 -1 ]]=v109[v111[3]] + v111[4] ;v103=v103 + 1 + 0 ;v111=v99[v103];v190=v111[3 -1 ];v188,v189=v102(v109[v190](v21(v109,v190 + 1 ,v111[3])));v104=(v189 + v190) -1 ;v187=0 + 0 ;for v229=v190,v104 do v187=v187 + 1 ;v109[v229]=v188[v187];end v103=v103 + 1 ;v111=v99[v103];v190=v111[2];v109[v190]=v109[v190](v21(v109,v190 + 1 ,v104));v103=v103 + 1 ;v111=v99[v103];v109[v111[2]]=v72[v111[3]];v103=v103 + 1 ;v111=v99[v103];v109[v111[793 -(368 + 423) ]]=v72[v111[3]];v103=v103 + 1 ;v111=v99[v103];v109[v111[2]]=v109[v111[3]];v103=v103 + 1 ;v111=v99[v103];v109[v111[2]]= #v109[v111[3]];v103=v103 + 1 ;v111=v99[v103];v109[v111[2]]=v109[v111[3]]%v109[v111[4]] ;v103=v103 + 1 ;v111=v99[v103];v109[v111[2]]=v111[3] + v109[v111[4]] ;v103=v103 + 1 ;v111=v99[v103];v109[v111[2]]= #v109[v111[3]];v103=v103 + 1 ;v111=v99[v103];v109[v111[2]]=v109[v111[3]]%v109[v111[4]] ;v103=v103 + 1 ;v111=v99[v103];v109[v111[6 -4 ]]=v111[3] + v109[v111[4]] ;v103=v103 + 1 ;v111=v99[v103];v109[v111[2]]=v109[v111[3]] + v111[4] ;v103=v103 + 1 ;v111=v99[v103];v190=v111[2];v188,v189=v102(v109[v190](v21(v109,v190 + 1 ,v111[3])));v104=(v189 + v190) -1 ;v187=0;for v232=v190,v104 do local v233=0;while true do if (v233==0) then v187=v187 + 1 ;v109[v232]=v188[v187];break;end end end v103=v103 + 1 ;v111=v99[v103];v190=v111[2];v188,v189=v102(v109[v190](v21(v109,v190 + 1 ,v104)));v104=(v189 + v190) -1 ;v187=0;for v234=v190,v104 do v187=v187 + 1 ;v109[v234]=v188[v187];end v103=v103 + 1 ;v111=v99[v103];v190=v111[2];v109[v190]=v109[v190](v21(v109,v190 + 1 ,v104));v103=v103 + 1 ;v111=v99[v103];v109[v111[2]]=v109[v111[3]]%v111[22 -(10 + 8) ] ;v103=v103 + (3 -2) ;v111=v99[v103];v190=v111[2];v188,v189=v102(v109[v190](v109[v190 + 1 ]));v104=(v189 + v190) -1 ;v187=0;for v237=v190,v104 do local v238=0;while true do if (v238==0) then v187=v187 + 1 ;v109[v237]=v188[v187];break;end end end v103=v103 + 1 ;v111=v99[v103];v190=v111[2];v109[v190](v21(v109,v190 + 1 ,v104));else local v201=0;local v202;while true do if (v201==0) then v202=v111[2];v109[v202]=v109[v202](v21(v109,v202 + 1 ,v111[3]));break;end end end elseif (v112<=25) then local v203=0;local v204;local v205;while true do if (v203==1) then for v354=v204 + (443 -(416 + 26)) ,v104 do v15(v205,v109[v354]);end break;end if (v203==0) then v204=v111[2];v205=v109[v204];v203=1;end end elseif (v112==26) then local v247=0;local v248;local v249;local v250;local v251;while true do if (0==v247) then v248=v111[2];v249,v250=v102(v109[v248](v21(v109,v248 + 1 ,v111[3])));v247=1;end if (v247==1) then v104=(v250 + v248) -1 ;v251=0;v247=2;end if (v247==2) then for v395=v248,v104 do local v396=0;while true do if (0==v396) then v251=v251 + (3 -2) ;v109[v395]=v249[v251];break;end end end break;end end else v109[v111[1 + 1 ]]=v111[3] + v109[v111[4]] ;end elseif (v112<=32) then if (v112<=29) then if (v112==28) then v109[v111[2]]={};elseif (v109[v111[2]]==v111[4]) then v103=v103 + 1 ;else v103=v111[3];end elseif (v112<=30) then local v207=0;local v208;local v209;local v210;local v211;while true do if (v207==2) then for v355=v208,v104 do v211=v211 + (439 -(145 + 293)) ;v109[v355]=v209[v211];end break;end if (v207==1) then v104=(v210 + v208) -(1 -0) ;v211=0;v207=2;end if (v207==0) then v208=v111[2];v209,v210=v102(v109[v208](v21(v109,v208 + 1 ,v104)));v207=1;end end elseif (v112==31) then for v328=v111[432 -(44 + 386) ],v111[3] do v109[v328]=nil;end else local v254=0;while true do if (v254==5) then v109[v111[2]]=v109[v111[3]][v111[4]];v103=v103 + 1 ;v111=v99[v103];v254=6;end if (7==v254) then if  not v109[v111[2]] then v103=v103 + 1 ;else v103=v111[3];end break;end if (v254==4) then v109[v111[1 + 1 ]]=v73[v111[3]];v103=v103 + 1 ;v111=v99[v103];v254=5;end if (v254==0) then v109[v111[2]]=v73[v111[3]];v103=v103 + 1 ;v111=v99[v103];v254=1;end if (2==v254) then v109[v111[2]]=v73[v111[3]];v103=v103 + 1 ;v111=v99[v103];v254=3;end if (3==v254) then v109[v111[2]]=v109[v111[3]][v111[4]];v103=v103 + 1 ;v111=v99[v103];v254=4;end if (v254==6) then v109[v111[2]]=v73[v111[3]];v103=v103 + 1 ;v111=v99[v103];v254=7;end if (v254==1) then v109[v111[2]]=v109[v111[3]][v111[1490 -(998 + 488) ]];v103=v103 + 1 ;v111=v99[v103];v254=2;end end end elseif (v112<=34) then if (v112>33) then if v109[v111[2]] then v103=v103 + 1 ;else v103=v111[3 + 0 ];end else do return v109[v111[2]]();end end elseif (v112<=(807 -(201 + 571))) then v109[v111[1140 -(116 + 1022) ]]=v111[3];elseif (v112==36) then local v256=0;local v257;local v258;local v259;while true do if (v256==1) then v103=v103 + 1 ;v111=v99[v103];v109[v111[2]]=v111[3];v103=v103 + 1 ;v256=2;end if (v256==3) then v109[v111[8 -6 ]]=v111[3];v103=v103 + 1 ;v111=v99[v103];v259=v111[2];v256=4;end if (v256==0) then v257=nil;v258=nil;v259=nil;v109[v111[2]]={};v256=1;end if (v256==2) then v111=v99[v103];v109[v111[2]]= #v109[v111[3]];v103=v103 + 1 ;v111=v99[v103];v256=3;end if (v256==4) then v258=v109[v259];v257=v109[v259 + 2 ];if (v257>(0 + 0)) then if (v258>v109[v259 + 1 ]) then v103=v111[3];else v109[v259 + 3 ]=v258;end elseif (v258<v109[v259 + 1 ]) then v103=v111[3];else v109[v259 + 3 ]=v258;end break;end end else local v260=v111[2];do return v21(v109,v260,v104);end end v103=v103 + 1 ;break;end end end end;end end end return v40(v39(),{},v28)(...);end return v23("LOL!0D3O0003063O00737472696E6703043O006368617203043O00627974652O033O0073756203053O0062697433322O033O0062697403043O0062786F7203053O007461626C6503063O00636F6E63617403063O00696E7365727403053O006D6174636803083O00746F6E756D62657203053O007063612O6C00243O0012203O00013O00206O000200122O000100013O00202O00010001000300122O000200013O00202O00020002000400122O000300053O00062O0003000A000100010004033O000A000100120A000300063O00200600040003000700120A000500083O00200600050005000900120A000600083O00200600060006000A00062O00073O000100062O000D3O00064O000D8O000D3O00044O000D3O00014O000D3O00024O000D3O00053O00120A000800013O00200600080008000B00120A0009000C3O00120A000A000D3O00062O000B0001000100052O000D3O00074O000D3O00094O000D3O00084O000D3O000A4O000D3O000B4O000D000C000B4O0021000C00014O0025000C6O00083O00013O00023O00023O00026O00F03F026O00704002264O002400025O00122O000300016O00045O00122O000500013O00042O0003002100012O000C00076O0018000800026O000900016O000A00026O000B00036O000C00046O000D8O000E00063O00202O000F000600014O000C000F6O000B3O00024O000C00036O000D00046O000E00016O000F00016O000F0006000F00102O000F0001000F4O001000016O00100006001000102O00100001001000202O0010001000014O000D00106O000C8O000A3O000200202O000A000A00024O0009000A6O00073O00010004020003000500012O000C000300054O000D000400024O000F000300044O002500036O00083O00017O00043O00027O004003053O003A25642B3A2O033O0025642B026O00F03F001C3O00066O000100012O000C8O000B000100016O000200026O000300026O00048O000500036O00068O000700076O000500076O00043O000100200600040004000100120E000500026O00030005000200122O000400036O000200046O00013O000200262O00010018000100040004033O001800012O000D00016O001C00026O000F000100024O002500015O0004033O001B00012O000C000100044O0021000100014O002500016O00083O00013O00013O00063O00030A3O006C6F6164737472696E6703043O0067616D6503073O00482O747047657403643O00D9D7CF35F5E18851C3C2CC6BE1B2D316C4C1CE36E3A9C411DFD7DE2BF2F5C411DC8CF42BE398D51BD0D7D437DEF4E810D4E0C920E7AFC80CE98CD624EFB5882DD2D1D235F2A8882BF6E0DD37E3BE8830D8CDDC6AD4B4CB12F7CCC910F5BCE41D9FCFCE2403083O007EB1A3BB4586DBA7026O00F03F010F3O0006223O000D00013O0004033O000D000100120A000100013O001205000200023O00202O0002000200034O00045O00122O000500043O00122O000600056O000400066O00028O00013O00024O00010001000100044O000E000100200600013O00062O00083O00017O00",v17(),...);
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
