local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v24,v25) local v26={};for v42=1, #v24 do v6(v26,v0(v4(v1(v2(v24,v42,v42 + 1 )),v1(v2(v25,1 + (v42% #v25) ,1 + (v42% #v25) + 1 )))%256 ));end return v5(v26);end local v8=tonumber;local v9=string.byte;local v10=string.char;local v11=string.sub;local v12=string.gsub;local v13=string.rep;local v14=table.concat;local v15=table.insert;local v16=math.ldexp;local v17=getfenv or function() return _ENV;end ;local v18=setmetatable;local v19=pcall;local v20=select;local v21=unpack or table.unpack ;local v22=tonumber;local function v23(v27,v28,...) local v29=0;local v30;local v31;local v32;local v33;local v34;local v35;local v36;local v37;local v38;local v39;local v40;local v41;while true do if (v29==3) then function v36() local v43=0;local v44;local v45;local v46;local v47;local v48;local v49;while true do if (v43==3) then if (v48==0) then if (v47==0) then return v49 * (0 + 0) ;else local v124=0;while true do if (v124==0) then v48=1;v46=0;break;end end end elseif (v48==(2924 -(282 + 595))) then return ((v47==0) and (v49 * (1/0))) or (v49 * NaN) ;end return v16(v49,v48-1023 ) * (v46 + (v47/(2^52))) ;end if (v43==1) then v46=569 -(367 + 201) ;v47=(v32(v45,1,20) * (2^32)) + v44 ;v43=2;end if (v43==0) then v44=v35();v45=v35();v43=1;end if (v43==2) then v48=v32(v45,21,958 -(214 + 713) );v49=((v32(v45,32)==1) and  -(1 + 0)) or 1 ;v43=3;end end end v37=nil;function v37(v50) local v51=0;local v52;local v53;while true do if (v51==1) then v52=v11(v27,v30,(v30 + v50) -1 );v30=v30 + v50 ;v51=2;end if (v51==2) then v53={};for v104=1, #v52 do v53[v104]=v10(v9(v11(v52,v104,v104)));end v51=3;end if (v51==0) then v52=nil;if  not v50 then v50=v35();if (v50==0) then return "";end end v51=1;end if (v51==3) then return v14(v53);end end end v38=v35;v29=4;end if (2==v29) then function v34() local v54=0;local v55;local v56;while true do if (v54==1) then return (v56 * 256) + v55 ;end if (v54==0) then v55,v56=v9(v27,v30,v30 + 2 );v30=v30 + 2 ;v54=1;end end end v35=nil;function v35() local v57=0;local v58;local v59;local v60;local v61;while true do if (v57==0) then v58,v59,v60,v61=v9(v27,v30,v30 + 3 );v30=v30 + 4 ;v57=1;end if (v57==1) then return (v61 * 16777216) + (v60 * (66467 -(857 + 74))) + (v59 * 256) + v58 ;end end end v36=nil;v29=3;end if (v29==1) then function v32(v62,v63,v64) if v64 then local v95=(v62/(2^(v63-1)))%(2^(((v64-1) -(v63-1)) + (1 -0))) ;return v95-(v95%1) ;else local v96=0;local v97;while true do if (v96==0) then v97=2^(v63-1) ;return (((v62%(v97 + v97))>=v97) and (2 -1)) or (619 -(555 + 64)) ;end end end end v33=nil;function v33() local v65=0;local v66;while true do if (v65==1) then return v66;end if (v65==0) then v66=v9(v27,v30,v30);v30=v30 + 1 ;v65=1;end end end v34=nil;v29=2;end if (v29==5) then v41=nil;function v41(v67,v68,v69) local v70=v67[1];local v71=v67[1 + 1 ];local v72=v67[960 -(892 + 65) ];return function(...) local v81=v70;local v82=v71;local v83=v72;local v84=v39;local v85=1;local v86= -1;local v87={};local v88={...};local v89=v20("#",...) -(1 -0) ;local v90={};local v91={};for v98=0,v89 do if (v98>=v83) then v87[v98-v83 ]=v88[v98 + 1 ];else v91[v98]=v88[v98 + 1 ];end end local v92=(v89-v83) + 1 ;local v93;local v94;while true do v93=v81[v85];v94=v93[1];if (v94<=11) then if (v94<=(8 -3)) then if (v94<=2) then if (v94<=0) then v91[v93[2]]=v91[v93[3]][v93[4]];elseif (v94>1) then local v148=v93[2];v91[v148]=v91[v148](v21(v91,v148 + 1 ,v86));else v91[v93[2]]=v41(v82[v93[3]],nil,v69);end elseif (v94<=3) then if (v91[v93[2]]==v93[354 -(87 + 263) ]) then v85=v85 + 1 ;else v85=v93[3];end elseif (v94==4) then local v152=v93[2];v91[v152]=v91[v152](v21(v91,v152 + 1 ,v93[3]));else v91[v93[2]]=v69[v93[3]];end elseif (v94<=8) then if (v94<=6) then do return v91[v93[2]]();end elseif (v94==7) then local v156=0;local v157;local v158;local v159;local v160;local v161;while true do if (v156==2) then v91[v161]=v160[v93[4]];v85=v85 + 1 ;v93=v81[v85];v91[v93[2]]=v93[183 -(67 + 113) ];v85=v85 + 1 ;v156=3;end if (v156==4) then for v251=v161,v86 do local v252=0;while true do if (v252==0) then v157=v157 + 1 ;v91[v251]=v158[v157];break;end end end v85=v85 + 1 ;v93=v81[v85];v161=v93[2];v91[v161]=v91[v161](v21(v91,v161 + 1 ,v86));v156=5;end if (v156==0) then v157=nil;v158,v159=nil;v160=nil;v161=nil;v91[v93[2]]=v69[v93[3]];v156=1;end if (3==v156) then v93=v81[v85];v161=v93[2];v158,v159=v84(v91[v161](v21(v91,v161 + 1 ,v93[3])));v86=(v159 + v161) -1 ;v157=0;v156=4;end if (v156==6) then v85=v93[3];break;end if (1==v156) then v85=v85 + 1 ;v93=v81[v85];v161=v93[2];v160=v91[v93[3]];v91[v161 + 1 ]=v160;v156=2;end if (v156==5) then v85=v85 + 1 ;v93=v81[v85];v91[v93[2]]();v85=v85 + 1 ;v93=v81[v85];v156=6;end end else local v162=v93[2];local v163,v164=v84(v91[v162](v21(v91,v162 + 1 ,v93[3])));v86=(v164 + v162) -(1 + 0) ;local v165=0;for v195=v162,v86 do local v196=0;while true do if (0==v196) then v165=v165 + 1 ;v91[v195]=v163[v165];break;end end end end elseif (v94<=(21 -12)) then v91[v93[2]]=v93[3];elseif (v94>10) then local v166=0;local v167;while true do if (v166==0) then v167=v93[2];do return v21(v91,v167,v86);end break;end end else v91[v93[2]]();end elseif (v94<=17) then if (v94<=14) then if (v94<=12) then do return;end elseif (v94==13) then local v168=0;local v169;while true do if (v168==0) then v169=v93[2];do return v91[v169](v21(v91,v169 + 1 + 0 ,v93[3]));end break;end end else v91[v93[7 -5 ]]=v68[v93[3]];end elseif (v94<=15) then local v131=v93[2];local v132=v91[v93[3]];v91[v131 + (953 -(802 + 150)) ]=v132;v91[v131]=v132[v93[4]];elseif (v94>(42 -26)) then for v197=v93[2],v93[3] do v91[v197]=nil;end else local v172=0;local v173;local v174;while true do if (1==v172) then for v255=v173 + 1 ,v86 do v15(v174,v91[v255]);end break;end if (0==v172) then v173=v93[2];v174=v91[v173];v172=1;end end end elseif (v94<=20) then if (v94<=18) then local v136=0;local v137;local v138;local v139;local v140;while true do if (v136==5) then v140=v93[2];v91[v140]=v91[v140](v21(v91,v140 + 1 ,v86));v85=v85 + 1 ;v93=v81[v85];v136=6;end if (v136==2) then v85=v85 + (1 -0) ;v93=v81[v85];v91[v93[2]]=v93[3 + 0 ];v85=v85 + 1 ;v136=3;end if (v136==1) then v85=v85 + 1 ;v93=v81[v85];v140=v93[2];v91[v140]=v91[v140](v21(v91,v140 + 1 ,v93[3]));v136=2;end if (v136==3) then v93=v81[v85];v140=v93[2];v138,v139=v84(v91[v140](v21(v91,v140 + 1 ,v93[1000 -(915 + 82) ])));v86=(v139 + v140) -1 ;v136=4;end if (v136==6) then if (v91[v93[2]]==v93[4]) then v85=v85 + 1 ;else v85=v93[3];end break;end if (v136==0) then v137=nil;v138,v139=nil;v140=nil;v91[v93[2]]=v93[3];v136=1;end if (v136==4) then v137=0;for v220=v140,v86 do local v221=0;while true do if (v221==0) then v137=v137 + 1 ;v91[v220]=v138[v137];break;end end end v85=v85 + 1 ;v93=v81[v85];v136=5;end end elseif (v94>19) then v91[v93[2]]={};else local v176;local v177;local v178,v179;local v180;v91[v93[2]]=v68[v93[3]];v85=v85 + 1 ;v93=v81[v85];v91[v93[2]]=v68[v93[3]];v85=v85 + 1 ;v93=v81[v85];v91[v93[2]]=v68[v93[3]];v85=v85 + (2 -1) ;v93=v81[v85];v91[v93[2]]={};v85=v85 + 1 ;v93=v81[v85];v91[v93[2]]=v68[v93[3]];v85=v85 + 1 ;v93=v81[v85];v91[v93[2 + 0 ]]=v91[v93[3]];v85=v85 + 1 ;v93=v81[v85];for v213=v93[2],v93[3] do v91[v213]=nil;end v85=v85 + 1 ;v93=v81[v85];v180=v93[2];v178,v179=v84(v91[v180](v21(v91,v180 + 1 ,v93[3])));v86=(v179 + v180) -1 ;v177=0;for v215=v180,v86 do v177=v177 + 1 ;v91[v215]=v178[v177];end v85=v85 + 1 ;v93=v81[v85];v180=v93[2];v176=v91[v180];for v218=v180 + 1 ,v86 do v15(v176,v91[v218]);end end elseif (v94<=22) then if (v94>21) then v91[v93[2]]=v91[v93[3]];else v85=v93[3];end elseif (v94>23) then local v191=0;local v192;local v193;local v194;while true do if (v191==2) then for v256=1,v93[4] do local v257=0;local v258;while true do if (v257==1) then if (v258[1]==22) then v194[v256-(1188 -(1069 + 118)) ]={v91,v258[3]};else v194[v256-1 ]={v68,v258[3]};end v90[ #v90 + (2 -1) ]=v194;break;end if (v257==0) then v85=v85 + 1 ;v258=v81[v85];v257=1;end end end v91[v93[2]]=v41(v192,v193,v69);break;end if (0==v191) then v192=v82[v93[3]];v193=nil;v191=1;end if (1==v191) then v194={};v193=v18({},{[v7("\230\31\54\179\221\37\39","\221\185\64\95")]=function(v259,v260) local v261=v194[v260];return v261[1][v261[2]];end,[v7("\216\119\81\4\240\65\81\5\226\80","\97\135\40\63")]=function(v262,v263,v264) local v265=v194[v263];v265[1][v265[2 -0 ]]=v264;end});v191=2;end end elseif v91[v93[2]] then v85=v85 + 1 ;else v85=v93[3];end v85=v85 + 1 ;end end;end return v41(v40(),{},v28)(...);end if (v29==0) then v30=1;v31=nil;v27=v12(v11(v27,5),v7("\224\18","\81\206\60\83\91\79"),function(v73) if (v9(v73,5 -3 )==(226 -147)) then local v101=0;while true do if (v101==0) then v31=v8(v11(v73,1,1));return "";end end else local v102=v10(v8(v73,16));if v31 then local v110=0;local v111;while true do if (v110==1) then return v111;end if (v110==0) then v111=v13(v102,v31);v31=nil;v110=1;end end else return v102;end end end);v32=nil;v29=1;end if (4==v29) then v39=nil;function v39(...) return {...},v20("#",...);end v40=nil;function v40() local v74=0;local v75;local v76;local v77;local v78;local v79;local v80;while true do if (v74==0) then v75={};v76={};v77={};v78={v75,v76,nil,v77};v74=1;end if (v74==2) then for v112=1,v35() do local v113=v33();if (v32(v113,1,1)==0) then local v120=0;local v121;local v122;local v123;while true do if (v120==3) then if (v32(v122,3,3)==(118 -(32 + 85))) then v123[4]=v80[v123[4 + 0 ]];end v75[v112]=v123;break;end if (0==v120) then v121=v32(v113,2,3);v122=v32(v113,4,6);v120=1;end if (v120==2) then if (v32(v122,1,1)==1) then v123[2]=v80[v123[2]];end if (v32(v122,2,8 -6 )==1) then v123[3]=v80[v123[3]];end v120=3;end if (v120==1) then v123={v34(),v34(),nil,nil};if (v121==0) then local v147=0;while true do if (v147==0) then v123[3]=v34();v123[4]=v34();break;end end elseif (v121==1) then v123[3]=v35();elseif (v121==(2 -0)) then v123[3]=v35() -(2^(1081 -(68 + 997))) ;elseif (v121==(1273 -(226 + 1044))) then local v269=0;while true do if (0==v269) then v123[3]=v35() -(2^16) ;v123[4]=v34();break;end end end v120=2;end end end end for v114=1,v35() do v76[v114-1 ]=v40();end return v78;end if (v74==1) then v79=v35();v80={};for v116=1,v79 do local v117=0;local v118;local v119;while true do if (v117==0) then v118=v33();v119=nil;v117=1;end if (v117==1) then if (v118==1) then v119=v33()~=(0 + 0) ;elseif (v118==2) then v119=v36();elseif (v118==3) then v119=v37();end v80[v116]=v119;break;end end end v78[3]=v33();v74=2;end end end v29=5;end end end return v23(v7("\98\132\252\51\127\151\30\139\30\251\128\33\127\149\30\139\30\251\135\33\120\151\26\246\24\242\134\87\121\148\29\247\30\254\131\93\127\147\27\128\24\250\135\38\121\144\27\252\30\248\128\42\124\236\29\244\25\255\134\84\121\230\26\241\24\143\134\32\121\150\26\246\30\248\128\39\124\236\29\244\25\251\134\33\121\146\31\139\24\136\128\34\127\231\30\139\30\251\129\32\127\150\30\139\30\251\128\35\124\236\29\244\28\251\134\93\127\147\29\246\30\251\129\32\127\150\29\244\30\250\128\34\127\144\30\139\30\251\129\32\127\150\29\244\30\249\128\34\127\151\30\139\30\251\128\36\126\155\29\244\30\248\131\93\127\147\29\245\30\251\128\38\125\236\29\244\31\253\131\93\127\147\29\245\26\132\128\34\126\149\21\139\30\251\129\36\124\236\29\244\30\249\132\93\127\147\28\242\29\132\128\34\127\144\25\139\30\251\129\36\127\147\29\240\30\251\128\33\123\236\29\244\30\253\128\34\127\151\29\244\30\250\132\93\127\147\29\134\30\251\128\38\121\236\29\244\30\136\131\93\127\147\29\245\29\132\128\34\127\146\30\139\30\251\128\38\124\236\29\244\30\249\135\93\127\147\25\244\30\248\128\39\124\236\29\244\29\138\130\39\121\151\31\134\29\138\130\93\127\144\30\139\30\251\130\39\121\151\31\134\30\249\134\93\127\147\107\244\29\141\128\34\126\225\30\139\30\251\128\32\127\146\21\139\30\251\129\33\127\147\29\245\22\132\128\34\127\145\29\244\30\250\134\93\127\147\29\247\30\251\128\35\121\236\29\244\30\255\136\93\127\147\29\241\30\251\128\32\121\236\29\244\30\253\136\93\127\147\29\243\30\251\128\37\121\236\29\244\30\254\128\34\127\148\27\139\30\251\128\38\124\236\29\244\30\250\128\34\125\147\31\139\30\251\128\38\127\147\29\240\30\251\128\35\127\147\31\139\31\249\128\34\127\150\29\244\30\249\134\93\127\147\29\247\30\251\128\39\127\147\29\246\30\251\129\32\125\236\29\244\30\255\128\34\127\144\27\139\30\251\128\32\127\147\29\240\24\132\128\34\127\146\30\139\30\251\128\32\127\147\31\242\28\132\128\34\127\146\29\244\31\252\128\34\127\146\29\244\30\255\128\34\127\151\28\241\29\132\128\34\126\148\29\244\30\250\130\93\127\147\28\242\30\251\128\35\121\236\29\244\31\255\128\34\127\145\27\139\30\251\128\86\127\147\29\245\30\251\128\32\123\236\29\244\30\137\128\34\127\146\24\139\30\251\128\38\126\150\30\139\30\251\129\83\127\147\29\245\28\132\128\34\127\230\29\244\30\250\128\34\127\144\25\139\30\251\128\36\127\147\29\245\30\251\128\35\123\236\29\244\30\137\128\34\127\146\27\139\30\251\128\81\124\236\29\244\30\250\131\93\127\147\29\245\29\132\128\34\127\150\30\139\30\251\128\33\127\226\30\139\30\251\134\81\121\229\27\245\24\255\135\33\120\151\26\246\24\242\134\87\121\148\29\247\30\255\131\93\127\147\27\243\24\250\134\86\121\150\29\247\30\252\131\93\127\147\25\252\28\132\135\38\120\147\25\243\24\254\135\38\127\144\24\252\29\132\128\34\121\155\31\139\25\255\135\34\120\144\30\133\28\132\130\84\120\145\27\245\25\252\130\87\121\148\27\253\25\255\134\42\120\150\27\246\25\254\135\33\121\150\26\246\24\248\134\84\121\230\26\240\24\254\134\87\120\151\31\129\24\248\134\84\121\231\31\130\26\141\134\87\121\150\25\247\25\249\134\39\121\146\26\240\24\141\135\32\122\155\31\130\26\141\134\87\121\150\25\247\25\249\134\39\121\146\26\240\24\141\135\32\122\155\31\130\24\143\134\35\121\154\27\129\28\141\133\33\121\144\26\246\24\242\135\34\120\151\26\247\28\141\133\39\123\148\25\247\24\253\135\32\125\236\27\241\28\141\132\39\121\224\27\242\26\141\133\34\125\230\27\135\25\254\134\35\127\145\27\139\30\251\246\34\124\229\29\245\30\136\131\93\127\147\29\242\31\252\131\93\127\147\29\133\30\251\128\35\124\236\29\244\30\255\129\39\124\236\29\244\30\138\128\34\127\146\29\244\31\249\128\39\127\147\29\245\30\251\128\35\124\236\29\244\31\249\128\37\127\147\29\246\30\251\128\32\124\236\29\244\28\251\130\93\127\147\29\246\30\251\128\32\127\147\29\247\30\251\129\32\125\236\29\244\30\255\128\34\127\151\27\139\30\251\128\32\127\147\29\240\24\132\128\34\127\146\30\139\30\251\128\32\123\236\29\244\30\250\128\34\127\146\29\244\30\250\128\34\127\151\25\139\30\251\128\80\127\147\29\245\30\251\130\34\125\236\29\244\30\250\131\93\127\147\29\241\28\132\128\34\127\224\30\139\30\251\128\35\120\236\29\244","\196\46\203\176\18\79\163\45"),v17(),...);
-- âš ï¸ WARNING: integrity protected!
--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.3) ~  Much Love, Ferib 

]]--
