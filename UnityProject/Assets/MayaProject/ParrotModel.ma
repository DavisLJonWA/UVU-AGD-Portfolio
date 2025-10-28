//Maya ASCII 2025ff03 scene
//Name: ParrotModel.ma
//Last modified: Tue, Oct 28, 2025 01:42:04 PM
//Codeset: 1252
requires maya "2025ff03";
requires -nodeType "aiOptions" -nodeType "aiAOVDriver" -nodeType "aiAOVFilter" -nodeType "aiImagerDenoiserOidn"
		 "mtoa" "5.4.5";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2025";
fileInfo "version" "2025";
fileInfo "cutIdentifier" "202409190603-cbdc5a7e54";
fileInfo "osv" "Windows 11 Home v2009 (Build: 26200)";
fileInfo "UUID" "690F4063-4CDA-6F6B-A90A-068ACB2C5D99";
createNode transform -s -n "persp";
	rename -uid "6A8D7B23-475A-3118-4880-D4883EBB6770";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -5.9733557238405028 48.088473311155312 41.279582660633338 ;
	setAttr ".r" -type "double3" -9.3383527295987996 -4.1999999999999735 -4.982998646141451e-17 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "EA8C9C38-46F6-132F-E407-55B0479BF634";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 46.164250071311258;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" -8.1692849368337601 43.281286372269541 0 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "14AB30EC-42CD-4E28-EF78-D38F2A1E8CE0";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1000.1 0 ;
	setAttr ".r" -type "double3" -90 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "7FA3B5BC-4F49-5AA8-6CD4-999D5B86EA77";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -s -n "front";
	rename -uid "90DFB80B-4AA6-3062-E021-D6A60115462B";
	setAttr ".t" -type "double3" 0 0 1000.1 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "B86B4887-486F-F7FB-11E7-32A930846EE1";
	setAttr -k off ".v";
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 281.12817876429892;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -s -n "side";
	rename -uid "3654E7C5-4680-B034-87B0-E59AE02B1F51";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 0 0 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "D59EC843-47B0-FA66-5190-428A12BEFB00";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -n "imagePlane1";
	rename -uid "D9288E02-4614-CA52-D6E4-04A497C9D890";
	setAttr ".t" -type "double3" 2.1326664605425236 36.456461684675141 0 ;
createNode imagePlane -n "imagePlaneShape1" -p "imagePlane1";
	rename -uid "189FB15B-415F-4D70-BB48-2DA45019F1DE";
	setAttr -k off ".v";
	setAttr ".fc" 203;
	setAttr ".imn" -type "string" "C:/Users/fibbe/Downloads/Unit-4-Parrot.png";
	setAttr ".cov" -type "short2" 3508 2480 ;
	setAttr ".dlc" no;
	setAttr ".w" 35.08;
	setAttr ".h" 24.8;
	setAttr ".cs" -type "string" "sRGB";
createNode transform -n "pCube1";
	rename -uid "F3C976D8-4D31-4C03-4DB1-7BA1B318F246";
	setAttr ".t" -type "double3" -8.0619783386064867 46.350834155460312 5.0994817673875747 ;
	setAttr ".s" -type "double3" 1.3497661882051364 1.3497661882051364 1.3497661882051364 ;
	setAttr ".spt" -type "double3" -1.1591324926091242e-28 9.2045860832103443e-17 0 ;
createNode mesh -n "pCubeShape1" -p "pCube1";
	rename -uid "75C3E7F9-4A68-30C8-2D63-9A9192983A51";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.8125 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt";
	setAttr ".pt[52]" -type "float3" -0.37174445 5.3290705e-15 -2.220446e-16 ;
	setAttr ".pt[55]" -type "float3" -0.37174445 5.3290705e-15 -2.220446e-16 ;
	setAttr ".pt[56]" -type "float3" 0.37174445 5.3290705e-15 -2.220446e-16 ;
	setAttr ".pt[57]" -type "float3" 0.37174445 5.3290705e-15 -2.220446e-16 ;
createNode transform -n "pCube2";
	rename -uid "5DBFBB6C-4043-A4AA-FD3D-26B5C0B4A0BA";
	setAttr ".t" -type "double3" 5.7641437038689407 46.350834155460312 5.0994817673875747 ;
	setAttr ".s" -type "double3" 1.3497661882051364 1.3497661882051364 1.3497661882051364 ;
	setAttr ".spt" -type "double3" -1.1591324926091242e-28 9.2045860832103443e-17 0 ;
createNode mesh -n "pCubeShape2" -p "pCube2";
	rename -uid "7C3D58BC-4070-2101-EABB-ACBF4BB5B46E";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.8125 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 22 ".pt";
	setAttr ".pt[98]" -type "float3" 0.30618337 0 0 ;
	setAttr ".pt[99]" -type "float3" 0.30618337 0 0 ;
	setAttr ".pt[100]" -type "float3" 0.30618337 0 0 ;
	setAttr ".pt[101]" -type "float3" 0.30618337 0 0 ;
	setAttr ".pt[102]" -type "float3" -0.30618337 0 0 ;
	setAttr ".pt[103]" -type "float3" -0.30618337 0 0 ;
	setAttr ".pt[104]" -type "float3" -0.30618337 0 0 ;
	setAttr ".pt[105]" -type "float3" -0.30618337 0 0 ;
	setAttr ".pt[106]" -type "float3" 0.16556068 -0.94944209 -0.50626105 ;
	setAttr ".pt[107]" -type "float3" 0 0.71100038 -0.21584804 ;
	setAttr ".pt[108]" -type "float3" 0.30618337 0.71100038 -0.21584804 ;
	setAttr ".pt[109]" -type "float3" 0.47174406 -0.94944209 -0.50626105 ;
	setAttr ".pt[110]" -type "float3" 0 0.37213448 -1.4018849 ;
	setAttr ".pt[111]" -type "float3" 0.30618337 0.37213448 -1.4018849 ;
	setAttr ".pt[112]" -type "float3" 0 0.37213448 -1.4018849 ;
	setAttr ".pt[113]" -type "float3" 0 0.71100038 -0.21584804 ;
	setAttr ".pt[114]" -type "float3" -0.30618337 0.71100038 -0.21584804 ;
	setAttr ".pt[115]" -type "float3" -0.30618337 0.37213448 -1.4018849 ;
	setAttr ".pt[116]" -type "float3" -0.16556068 -0.94944209 -0.50626105 ;
	setAttr ".pt[117]" -type "float3" -0.47174406 -0.94944209 -0.50626105 ;
createNode mesh -n "polySurfaceShape1" -p "pCube2";
	rename -uid "62B92636-44FD-FEF9-CFDA-83A760838E3F";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr -s 2 ".iog[0].og";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 6 "e[51]" "e[55]" "e[57]" "e[60]" "e[62]" "e[64]";
	setAttr ".iog[0].og[1].gcl" -type "componentList" 2 "e[61]" "e[65]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr -s 6 ".gtag";
	setAttr ".gtag[0].gtagnm" -type "string" "back";
	setAttr ".gtag[0].gtagcmp" -type "componentList" 1 "f[8:11]";
	setAttr ".gtag[1].gtagnm" -type "string" "bottom";
	setAttr ".gtag[1].gtagcmp" -type "componentList" 3 "f[12:15]" "f[24:71]" "f[92:97]";
	setAttr ".gtag[2].gtagnm" -type "string" "front";
	setAttr ".gtag[2].gtagcmp" -type "componentList" 4 "f[0:3]" "f[73:74]" "f[77:78]" "f[80:91]";
	setAttr ".gtag[3].gtagnm" -type "string" "left";
	setAttr ".gtag[3].gtagcmp" -type "componentList" 3 "f[20:23]" "f[75]" "f[79]";
	setAttr ".gtag[4].gtagnm" -type "string" "right";
	setAttr ".gtag[4].gtagcmp" -type "componentList" 3 "f[16:19]" "f[72]" "f[76]";
	setAttr ".gtag[5].gtagnm" -type "string" "top";
	setAttr ".gtag[5].gtagcmp" -type "componentList" 1 "f[4:7]";
	setAttr ".pv" -type "double2" 0.5 0.8125 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 111 ".uvst[0].uvsp[0:110]" -type "float2" 0.375 0 0.375 1 0.625
		 0 0.625 1 0.375 0.25 0.625 0.25 0.375 0.5 0.125 0.25 0.625 0.5 0.875 0.25 0.375 0.75
		 0.125 0 0.625 0.75 0.875 0 0.5 0.125 0.5 0.375 0.5 0.625 0.5 0.875 0.75 0.125 0.25
		 0.125 0.5 0 0.5 1 0.625 0.125 0.5 0.25 0.375 0.125 0.625 0.375 0.75 0.25 0.5 0.5
		 0.375 0.375 0.25 0.25 0.625 0.625 0.875 0.125 0.5 0.75 0.375 0.625 0.125 0.125 0.625
		 0.875 0.75 0 0.375 0.875 0.25 0 0.375 0.75 0.5 0.75 0.5 0.875 0.375 0.875 0.625 0.75
		 0.625 0.875 0.375 0.75 0.5 0.75 0.5 0.875 0.375 0.875 0.625 0.75 0.625 0.875 0.5
		 0.875 0.375 0.875 0.375 0.875 0.5 0.875 0.625 0.875 0.625 0.875 0.375 0.75 0.5 0.75
		 0.375 0.875 0.625 0.75 0.625 0.875 0.5 0.875 0.375 0.875 0.625 0.875 0.375 0.75 0.5
		 0.75 0.5 0.875 0.375 0.875 0.625 0.75 0.625 0.875 0.5625 0.875 0.5625 0.875 0.4375
		 0.875 0.4375 0.875 0.375 0.875 0.4375 0.875 0.4375 0.875 0.375 0.875 0.5625 0.875
		 0.5625 0.875 0.625 0.875 0.625 0.875 0.375 0.875 0.4375 0.875 0.4375 0.875 0.375
		 0.875 0.5625 0.875 0.5625 0.875 0.625 0.875 0.625 0.875 0.625 0.0625 0.375 0.0625
		 0.625 0.09375 0.375 0.09375 0.5 0.125 0.5 0.125 0.5625 0.125 0.5 0.1875 0.4375 0.125
		 0.5625 0.09375 0.5 0.0625 0.4375 0.09375 0.5 0.125 0.5 0.125 0.375 0.75 0.5 0.75
		 0.5 0.875 0.375 0.875 0.625 0.75 0.625 0.875;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 98 ".vt[0:97]"  -0.37493515 -0.37493134 0.37493443 0.37493563 -0.37493134 0.37493443
		 -0.37493515 0.37493515 0.37493443 0.3749361 0.37493515 0.37493443 -0.37493515 0.37493515 -0.37493539
		 0.37493515 0.37493515 -0.37493539 -0.37493515 -0.37493134 -0.51942658 0.37493515 -0.37493134 -0.51942658
		 -0.50616217 0.50616455 -4.7683716e-07 0.50616264 0 -0.50616288 0 -0.50615692 -0.65065432
		 -0.50616217 0 -0.50616288 0.50616264 -0.50615692 -4.7683716e-07 -0.50616217 -0.50615692 -4.7683716e-07
		 0 -0.50615692 0.50616193 0.50616312 0 0.68774199 0 0.50616455 0.50616193 -0.50616217 0 0.68774199
		 0.50616264 0.50616455 -4.7683716e-07 0 0.50616455 -0.50616288 0 -0.074985504 0.57407641
		 0 0.67488861 -4.7683716e-07 0 0 -0.67488337 0 -0.67488098 0.21000266 0.67488337 0 -4.7683716e-07
		 -0.67488289 0 -4.7683716e-07 -0.43380737 -0.80894089 -0.54854131 0 -0.9401741 -0.67976832
		 0 -1.10889435 0.25661778 -0.49287558 -0.9401741 0.046614647 0.4338069 -0.80894089 -0.54854131
		 0.49287605 -0.9401741 0.046614647 -0.69219971 -1.78305054 -0.63461113 0 -1.91428375 -0.76584005
		 -0.73414278 -1.91428375 -0.25967622 0.69220018 -1.78305054 -0.63461542 0.73414373 -1.91428375 -0.25967979
		 9.5367432e-07 -1.14325714 0.39371419 -0.50232363 -0.97453308 0.22848868 -0.74358988 -1.94864273 0.35682702
		 9.5367432e-07 -2.11736298 0.52205157 0.50232649 -0.97453308 0.22848868 0.74359322 -1.94864273 0.35682321
		 -0.73666453 -2.94435358 -0.73138881 -1.4305115e-06 -3.013097763 -0.80013728 -4.7683716e-07 -3.13900757 -0.45549178
		 -0.75837231 -3.029476166 -0.45361996 0.73666477 -2.94435215 -0.73139644 0.75837326 -3.029476166 -0.45362288
		 9.5367432e-07 -3.15223694 0.11592388 -0.76305723 -3.063850403 -0.04930377 0.76305962 -3.063856125 -0.049301624
		 -0.65689921 -4.7894969 -1.1925807 -1.9073486e-06 -4.85824728 -1.22884703 -1.4305115e-06 -4.98415375 -1.047048688
		 -0.65689921 -4.87462234 -1.046060562 0.65689951 -4.78949165 -1.19258761 0.65689951 -4.87461615 -1.046064377
		 0.23343134 -3.084241867 -0.45455694 0.23577499 -3.10804367 0.033311129 -0.23343134 -3.084241867 -0.45455623
		 -0.23577261 -3.10804367 0.033310413 -0.56343555 -4.0071334839 -0.41537642 -0.87225199 -3.97491837 -0.41482639
		 -0.56481361 -4.02113533 -0.12837124 -0.87500763 -3.99514008 -0.17697167 0.5634346 -4.0071334839 -0.41538453
		 0.56481361 -4.021141052 -0.12837791 0.87225103 -3.97491837 -0.4148345 0.87500811 -3.99514008 -0.17697763
		 -0.80553579 -5.012393951 -0.43409467 -1.011599541 -4.99089813 -0.43372726 -0.80645561 -5.021734238 -0.24258518
		 -1.013438225 -5.0043869019 -0.27501512 0.80553436 -5.012393951 -0.4340961 0.80645466 -5.02173996 -0.24258661
		 1.01159811 -4.99089813 -0.43372941 1.013437748 -5.0043869019 -0.27501535 0.44054985 -0.18746567 0.53133798
		 -0.44054794 -0.18746567 0.53133798 0.47335625 -0.093730927 0.60954022 -0.47335529 -0.093730927 0.60954022
		 0 -0.10714722 1.054065466 0 -0.047012329 0.90856004 0.2530818 0.0050048828 0.84543061
		 0 0.29973984 0.85327554 -0.25308037 0.0050048828 0.84543061 0.2202754 -0.11116028 0.74673057
		 0 -0.270504 0.73414302 -0.22027397 -0.11116028 0.74673057 0 0.079051971 0.80696988
		 0 -0.10142136 0.70856071 -0.21683812 -8.93745804 -3.85877037 5.2193609e-06 -9.0062160492 -3.89501786
		 5.709122e-06 -9.13212395 -3.71321988 -0.21683812 -9.022583008 -3.71224999 0.21683812 -8.93746948 -3.85874033
		 0.21683812 -9.022594452 -3.71221685;
	setAttr -s 196 ".ed";
	setAttr ".ed[0:165]"  0 14 0 14 1 0 2 16 0 16 3 0 4 19 1 19 5 1 6 10 0 10 7 0
		 0 79 0 17 2 0 1 78 0 15 3 0 2 8 1 8 4 1 3 18 1 18 5 1 4 11 1 11 6 1 5 9 1 9 7 1 6 13 0
		 13 0 1 7 12 0 12 1 1 20 17 1 15 20 1 16 21 1 21 8 1 18 21 1 19 21 1 19 22 1 22 11 1
		 9 22 1 10 22 1 23 13 0 12 23 0 14 23 1 12 24 1 24 15 1 9 24 1 18 24 1 13 25 1 25 11 1
		 17 25 1 8 25 1 6 26 0 10 27 1 26 27 1 23 28 1 13 29 0 28 29 0 26 29 0 7 30 0 27 30 1
		 12 31 0 30 31 0 31 28 0 26 32 0 27 33 1 32 33 1 29 34 0 32 34 0 30 35 0 33 35 1 31 36 0
		 35 36 0 28 37 0 29 38 0 37 38 0 34 39 1 38 39 0 40 39 1 37 40 1 31 41 0 41 37 0 36 42 1
		 42 40 1 41 42 0 32 43 0 33 44 1 43 44 1 34 46 1 45 60 0 43 46 0 35 47 0 44 47 1 36 48 1
		 47 48 0 48 58 0 40 49 1 45 49 1 39 50 0 49 61 0 46 50 1 42 51 0 48 51 1 51 59 1 43 52 0
		 44 53 1 52 53 0 45 54 1 46 55 0 54 55 0 52 55 0 47 56 0 53 56 0 48 57 0 56 57 0 57 54 0
		 58 45 0 59 49 0 58 59 0 60 46 0 61 50 1 60 61 0 60 62 0 46 63 0 62 63 1 61 64 0 62 64 1
		 50 65 0 64 65 1 63 65 1 58 66 0 59 67 0 66 67 1 48 68 0 68 66 1 51 69 0 68 69 1 69 67 1
		 62 70 0 63 71 0 70 71 0 64 72 0 70 72 0 65 73 0 72 73 0 71 73 0 66 74 0 67 75 0 74 75 0
		 68 76 0 76 74 0 69 77 0 76 77 0 77 75 0 78 80 1 79 81 1 24 78 1 78 20 0 20 79 0 79 25 1
		 80 15 1 81 17 1 24 80 1 80 20 1 20 81 1 81 25 1 20 90 1 15 84 0 16 85 1 82 86 0 20 91 0
		 14 88 1 83 89 0;
	setAttr ".ed[166:195]" 78 87 0 84 82 0 85 82 1 86 17 0 84 85 1 85 86 1 87 83 0
		 88 83 1 89 79 0 87 88 1 88 89 1 90 82 1 84 90 1 90 86 1 91 83 0 87 91 1 91 89 1 52 92 0
		 53 93 1 92 93 0 54 94 1 93 94 1 55 95 0 94 95 0 92 95 0 56 96 0 93 96 0 57 97 0 96 97 0
		 97 94 0;
	setAttr -s 98 -ch 384 ".fc[0:97]" -type "polyFaces" 
		f 5 0 164 176 174 -9
		mu 0 5 0 20 101 102 92
		f 5 1 10 166 175 -165
		mu 0 5 20 2 91 100 101
		f 3 -168 170 168
		mu 0 3 95 97 98
		f 3 171 -163 -169
		mu 0 3 98 99 95
		f 4 2 26 27 -13
		mu 0 4 4 23 15 28
		f 4 3 14 28 -27
		mu 0 4 23 5 25 15
		f 4 -29 15 -6 29
		mu 0 4 15 25 8 27
		f 4 -28 -30 -5 -14
		mu 0 4 28 15 27 6
		f 4 4 30 31 -17
		mu 0 4 6 27 16 33
		f 4 5 18 32 -31
		mu 0 4 27 8 30 16
		f 4 -33 19 -8 33
		mu 0 4 16 30 12 32
		f 4 -32 -34 -7 -18
		mu 0 4 33 16 32 10
		f 4 185 187 189 -191
		mu 0 4 105 106 107 108
		f 4 192 194 195 -188
		mu 0 4 106 109 110 107
		f 4 -36 23 -2 36
		mu 0 4 17 35 3 21
		f 4 -35 -37 -1 -22
		mu 0 4 37 17 21 1
		f 4 -24 37 149 -11
		mu 0 4 2 36 18 91
		f 4 -23 -20 39 -38
		mu 0 4 36 13 31 18
		f 4 -40 -19 -16 40
		mu 0 4 18 31 9 26
		f 4 -39 -41 -15 -12
		mu 0 4 22 18 26 5
		f 4 20 41 42 17
		mu 0 4 11 38 19 34
		f 4 21 8 152 -42
		mu 0 4 38 0 92 19
		f 4 -44 9 12 44
		mu 0 4 19 24 4 29
		f 4 -43 -45 13 16
		mu 0 4 34 19 29 7
		f 4 6 46 -48 -46
		mu 0 4 10 32 40 39
		f 4 34 49 -51 -49
		mu 0 4 17 37 42 41
		f 4 -21 45 51 -50
		mu 0 4 37 10 39 42
		f 4 7 52 -54 -47
		mu 0 4 32 12 43 40
		f 4 22 54 -56 -53
		mu 0 4 12 35 44 43
		f 4 35 48 -57 -55
		mu 0 4 35 17 41 44
		f 4 47 58 -60 -58
		mu 0 4 39 40 46 45
		f 4 68 70 -72 -73
		mu 0 4 51 52 53 54
		f 4 53 62 -64 -59
		mu 0 4 40 43 49 46
		f 4 74 72 -77 -78
		mu 0 4 55 51 54 56
		f 4 50 67 -69 -67
		mu 0 4 41 42 52 51
		f 4 60 69 -71 -68
		mu 0 4 42 48 53 52
		f 4 -134 135 137 -139
		mu 0 4 83 84 85 86
		f 4 56 66 -75 -74
		mu 0 4 44 41 51 55
		f 4 -110 111 110 -91
		mu 0 4 47 71 72 62
		f 4 -65 73 77 -76
		mu 0 4 50 44 55 56
		f 4 59 79 -81 -79
		mu 0 4 45 46 58 57
		f 4 -62 78 83 -82
		mu 0 4 48 45 57 59
		f 4 63 84 -86 -80
		mu 0 4 46 49 60 58
		f 4 65 86 -88 -85
		mu 0 4 49 50 61 60
		f 5 71 91 -114 -93 -90
		mu 0 5 54 53 63 74 62
		f 4 -70 81 93 -92
		mu 0 4 53 48 59 63
		f 4 75 94 -96 -87
		mu 0 4 50 56 64 61
		f 5 76 89 -111 -97 -95
		mu 0 5 56 54 62 72 64
		f 4 80 98 -100 -98
		mu 0 4 57 58 66 65
		f 5 82 112 101 -103 -101
		mu 0 5 47 73 59 68 67
		f 4 -84 97 103 -102
		mu 0 4 59 57 65 68
		f 4 85 104 -106 -99
		mu 0 4 58 60 69 66
		f 4 87 106 -108 -105
		mu 0 4 60 61 70 69
		f 5 88 109 100 -109 -107
		mu 0 5 61 71 47 67 70
		f 4 -142 -144 145 146
		mu 0 4 87 88 89 90
		f 4 -115 -83 90 92
		mu 0 4 74 73 47 62
		f 4 -113 115 117 -117
		mu 0 4 59 73 76 75
		f 4 114 118 -120 -116
		mu 0 4 73 74 77 76
		f 4 113 120 -122 -119
		mu 0 4 74 63 78 77
		f 4 -94 116 122 -121
		mu 0 4 63 59 75 78
		f 4 -112 123 125 -125
		mu 0 4 72 71 80 79
		f 4 -89 126 127 -124
		mu 0 4 71 61 81 80
		f 4 95 128 -130 -127
		mu 0 4 61 64 82 81
		f 4 96 124 -131 -129
		mu 0 4 64 72 79 82
		f 4 -118 131 133 -133
		mu 0 4 75 76 84 83
		f 4 119 134 -136 -132
		mu 0 4 76 77 85 84
		f 4 121 136 -138 -135
		mu 0 4 77 78 86 85
		f 4 -123 132 138 -137
		mu 0 4 78 75 83 86
		f 4 -126 139 141 -141
		mu 0 4 79 80 88 87
		f 4 -128 142 143 -140
		mu 0 4 80 81 89 88
		f 4 129 144 -146 -143
		mu 0 4 81 82 90 89
		f 4 130 140 -147 -145
		mu 0 4 82 79 87 90
		f 3 -150 155 -148
		mu 0 3 91 18 93
		f 3 -151 147 156
		mu 0 3 14 91 93
		f 3 -152 157 -149
		mu 0 3 92 14 94
		f 3 -153 148 158
		mu 0 3 19 92 94
		f 3 -156 38 -154
		mu 0 3 93 18 22
		f 3 -157 153 25
		mu 0 3 14 93 22
		f 3 -158 24 -155
		mu 0 3 94 14 24
		f 3 -159 154 43
		mu 0 3 19 94 24
		f 4 -26 160 178 -160
		mu 0 4 14 22 97 103
		f 4 -25 159 179 169
		mu 0 4 24 14 103 99
		f 3 182 -166 -181
		mu 0 3 104 102 96
		f 3 181 180 -173
		mu 0 3 100 104 96
		f 5 -171 -161 11 -4 161
		mu 0 5 98 97 22 5 23
		f 5 -170 -172 -162 -3 -10
		mu 0 5 24 99 98 23 4
		f 3 -176 172 -174
		mu 0 3 101 100 96
		f 3 -177 173 165
		mu 0 3 102 101 96
		f 3 -179 167 -178
		mu 0 3 103 97 95
		f 3 -180 177 162
		mu 0 3 99 103 95
		f 4 150 163 -182 -167
		mu 0 4 91 14 104 100
		f 4 151 -175 -183 -164
		mu 0 4 14 92 102 104
		f 4 99 184 -186 -184
		mu 0 4 65 66 106 105
		f 4 102 188 -190 -187
		mu 0 4 67 68 108 107
		f 4 -104 183 190 -189
		mu 0 4 68 65 105 108
		f 4 105 191 -193 -185
		mu 0 4 66 69 109 106
		f 4 107 193 -195 -192
		mu 0 4 69 70 110 109
		f 4 108 186 -196 -194
		mu 0 4 70 67 107 110;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode lightLinker -s -n "lightLinker1";
	rename -uid "B8A318CA-4FD4-E6D8-6C70-4AB7194B1AC8";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "0B6FB1AF-4F2F-879E-B72F-93AE272341B3";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "A2D7BF26-4568-8579-736F-828D2CB48AEE";
createNode displayLayerManager -n "layerManager";
	rename -uid "D2857BD4-4AF1-A4A4-E58C-CF8701C6934E";
createNode displayLayer -n "defaultLayer";
	rename -uid "3A273F8F-4B7C-BB95-50B7-C38B3C7BEBC8";
	setAttr ".ufem" -type "stringArray" 0  ;
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "F02941D1-4C06-ED5B-1BF8-DB83D1C65E4E";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "8BF194D8-469A-A302-12A1-D2AB48086C7C";
	setAttr ".g" yes;
createNode script -n "uiConfigurationScriptNode";
	rename -uid "3BEC965F-47A9-D0B5-01C8-A8A8A975555E";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $nodeEditorPanelVisible = stringArrayContains(\"nodeEditorPanel1\", `getPanel -vis`);\n\tint    $nodeEditorWorkspaceControlOpen = (`workspaceControl -exists nodeEditorPanel1Window` && `workspaceControl -q -visible nodeEditorPanel1Window`);\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\n\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n"
		+ "            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n"
		+ "            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -bluePencil 1\n            -greasePencils 0\n            -excludeObjectPreset \"All\" \n            -shadows 0\n            -captureSequenceNumber -1\n            -width 744\n            -height 534\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n"
		+ "            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n"
		+ "            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -bluePencil 1\n            -greasePencils 0\n            -excludeObjectPreset \"All\" \n"
		+ "            -shadows 0\n            -captureSequenceNumber -1\n            -width 744\n            -height 533\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n"
		+ "            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n"
		+ "            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n"
		+ "            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -bluePencil 1\n            -greasePencils 0\n            -excludeObjectPreset \"All\" \n            -shadows 0\n            -captureSequenceNumber -1\n            -width 744\n            -height 533\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n"
		+ "        modelEditor -e \n            -camera \"|persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n"
		+ "            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n"
		+ "            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -bluePencil 1\n            -greasePencils 0\n            -excludeObjectPreset \"All\" \n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1495\n            -height 1114\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"ToggledOutliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"ToggledOutliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 1\n            -showReferenceMembers 1\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n"
		+ "            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -isSet 0\n            -isSetMember 0\n            -showUfeItems 1\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n"
		+ "            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            -renderFilterIndex 0\n            -selectionOrder \"chronological\" \n            -expandAttribute 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 0\n            -showReferenceMembers 0\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n"
		+ "            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -showUfeItems 1\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n"
		+ "            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n"
		+ "                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n"
		+ "                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -showUfeItems 1\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                $editorName;\n"
		+ "\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayValues 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showPlayRangeShades \"on\" \n                -lockPlayRangeShades \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -tangentScale 1\n                -tangentLineThickness 1\n                -keyMinScale 1\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -preSelectionHighlight 0\n                -limitToSelectedCurves 0\n                -constrainDrag 0\n                -valueLinesToggle 0\n                -highlightAffectedCurves 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n"
		+ "                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 1\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -showUfeItems 1\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n"
		+ "                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayValues 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -hierarchyBelow 0\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"timeEditorPanel\" (localizedPanelLabel(\"Time Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Time Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayValues 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayValues 0\n"
		+ "                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n"
		+ "                -showConstraintLabels 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n\tif ($nodeEditorPanelVisible || $nodeEditorWorkspaceControlOpen) {\n\t\tif (\"\" == $panelName) {\n\t\t\tif ($useSceneConfig) {\n\t\t\t\t$panelName = `scriptedPanel -unParent  -type \"nodeEditorPanel\" -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n"
		+ "                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -connectionStyle \"bezier\" \n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -connectedGraphingMode 1\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -showUnitConversions 0\n                -editorMode \"default\" \n                -hasWatchpoint 0\n                $editorName;\n\t\t\t}\n\t\t} else {\n\t\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -connectionStyle \"bezier\" \n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -connectedGraphingMode 1\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n"
		+ "                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -showUnitConversions 0\n                -editorMode \"default\" \n                -hasWatchpoint 0\n                $editorName;\n\t\t\tif (!$useSceneConfig) {\n\t\t\t\tpanel -e -l $label $panelName;\n\t\t\t}\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"shapePanel\" (localizedPanelLabel(\"Shape Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tshapePanel -edit -l (localizedPanelLabel(\"Shape Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"posePanel\" (localizedPanelLabel(\"Pose Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tposePanel -edit -l (localizedPanelLabel(\"Pose Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"profilerPanel\" (localizedPanelLabel(\"Profiler Tool\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Profiler Tool\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"contentBrowserPanel\" (localizedPanelLabel(\"Content Browser\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Content Browser\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-userCreated false\n\t\t\t\t-defaultImage \"\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -bluePencil 1\\n    -greasePencils 0\\n    -excludeObjectPreset \\\"All\\\" \\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1495\\n    -height 1114\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -bluePencil 1\\n    -greasePencils 0\\n    -excludeObjectPreset \\\"All\\\" \\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1495\\n    -height 1114\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 12 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "43FA1251-41C6-B203-80FC-348066286699";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 120 -ast 1 -aet 200 ";
	setAttr ".st" 6;
createNode aiOptions -s -n "defaultArnoldRenderOptions";
	rename -uid "F768B262-4E4D-9027-2A70-EC8A11B436E5";
	setAttr ".version" -type "string" "5.4.5";
createNode aiAOVFilter -s -n "defaultArnoldFilter";
	rename -uid "0100B116-4DAE-4E12-8D76-7691815991E2";
	setAttr ".ai_translator" -type "string" "gaussian";
createNode aiAOVDriver -s -n "defaultArnoldDriver";
	rename -uid "9B5E6D7F-4C37-F070-37A9-91B59A833248";
	setAttr ".ai_translator" -type "string" "exr";
createNode aiAOVDriver -s -n "defaultArnoldDisplayDriver";
	rename -uid "AE5C4D2D-46DA-9F9E-0264-D49E9C81BC87";
	setAttr ".ai_translator" -type "string" "maya";
	setAttr ".output_mode" 0;
createNode aiImagerDenoiserOidn -s -n "defaultArnoldDenoiser";
	rename -uid "5171B64A-4F9D-AFE9-1F22-3C8BB044D6B8";
createNode polyCube -n "polyCube1";
	rename -uid "229DCAAB-47F9-9EF0-97B5-28B191E238B5";
	setAttr ".cuv" 4;
createNode polySmoothFace -n "polySmoothFace1";
	rename -uid "6844EC42-4F45-5262-328E-10831BD319E0";
	setAttr ".ics" -type "componentList" 1 "f[*]";
	setAttr ".sdt" 2;
	setAttr ".suv" yes;
	setAttr ".ps" 0.10000000149011612;
	setAttr ".ro" 1;
	setAttr ".ma" yes;
	setAttr ".m08" yes;
createNode polyExtrudeFace -n "polyExtrudeFace1";
	rename -uid "BA3BB52D-4638-13BC-BA2D-4682309AD458";
	setAttr ".ics" -type "componentList" 1 "f[12:13]";
	setAttr ".ix" -type "matrix" 1.3497661882051364 0 0 0 0 1.3497661882051364 0 0 0 0 1.3497661882051364 0
		 -8.0619783386064867 46.350834155460312 1.7628121351000621 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -8.0619783 45.64233 1.4212117 ;
	setAttr ".rs" 43551;
	setAttr ".lt" -type "double3" -3.2265856653168612e-15 -2.4980018054066022e-16 0.67305496751555505 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -8.7451791581826956 45.4398997293587 1.0796113155238536 ;
	setAttr ".cbx" -type "double3" -7.3787775190302787 45.844759487701474 1.7628121351000621 ;
createNode polyTweak -n "polyTweak1";
	rename -uid "27F227C0-47FC-5E3B-B28E-3FBAF8414B01";
	setAttr ".uopa" yes;
	setAttr -s 26 ".tk[0:25]" -type "float3"  -0.097157277 -0.09715727 0.09715727
		 0.097157277 -0.09715727 0.09715727 -0.097157277 0.09715727 0.097157285 0.097157277
		 0.09715727 0.09715727 -0.097157277 0.097157285 -0.09715727 0.097157277 0.09715727
		 -0.09715727 -0.097157277 -0.09715727 -0.097157285 0.097157277 -0.09715727 -0.09715727
		 -0.13116235 0.13116235 0 0.13116235 -4.2351647e-22 -0.13116235 0 -0.13116235 -0.13116235
		 -0.13116235 4.2351647e-22 -0.13116235 0.13116235 -0.13116235 0 -0.13116235 -0.13116235
		 0 0 -0.13116235 0.13116235 0.13116235 -4.2351647e-22 0.13116235 0 0.13116235 0.13116235
		 -0.13116235 4.2351647e-22 0.13116235 0.13116235 0.13116235 0 0 0.13116235 -0.13116235
		 0 4.2351647e-22 0.17488311 0 0.17488311 0 0 4.2351647e-22 -0.17488311 0 -0.17488311
		 0 0.1748831 -4.2351647e-22 0 -0.1748831 4.2351647e-22 0;
createNode polyExtrudeFace -n "polyExtrudeFace2";
	rename -uid "43C78B6E-4D4E-1777-A073-0CBC5159657E";
	setAttr ".ics" -type "componentList" 1 "f[12:13]";
	setAttr ".ix" -type "matrix" 1.3497661882051364 0 0 0 0 1.3497661882051364 0 0 0 0 1.3497661882051364 0
		 -8.0619783386064867 46.350834155460312 1.7628121351000621 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -8.0619783 45.056519 1.1868846 ;
	setAttr ".rs" 46355;
	setAttr ".lt" -type "double3" 2.0816681711721685e-15 -4.7739590058881731e-15 1.4844264492794912 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -8.7272460915374612 44.854086058043052 0.845284157498575 ;
	setAttr ".cbx" -type "double3" -7.3967109074848487 45.258947948372679 1.5284850575271176 ;
createNode polyTweak -n "polyTweak2";
	rename -uid "7A72C7AC-4D52-0110-7FB3-EFA9AC1E671F";
	setAttr ".uopa" yes;
	setAttr -s 6 ".tk[26:31]" -type "float3"  0.11473519 0 0 0 0 0 0 0 0
		 0.18689322 0 0 -0.11473491 0 0 -0.186893 0 0;
createNode polyExtrudeFace -n "polyExtrudeFace3";
	rename -uid "D67A9986-4DFB-3E91-6A35-A3893619910C";
	setAttr ".ics" -type "componentList" 2 "f[31]" "f[35]";
	setAttr ".ix" -type "matrix" 1.3497661882051364 0 0 0 0 1.3497661882051364 0 0 0 0 1.3497661882051364 0
		 -8.0619783386064867 46.350834155460312 1.7628121351000621 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -8.0619783 44.310543 1.4703952 ;
	setAttr ".rs" 46044;
	setAttr ".lt" -type "double3" 2.0816681711721685e-16 -5.6343818499726694e-15 0.54486082773545286 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -9.0528991189663408 43.539265789330052 1.4123054105614727 ;
	setAttr ".cbx" -type "double3" -7.0710566732709568 45.081818940497442 1.5284850575271176 ;
createNode polyTweak -n "polyTweak3";
	rename -uid "68312FC8-4303-0AD4-927C-2AA5A35324E1";
	setAttr ".uopa" yes;
	setAttr -s 7 ".tk";
	setAttr ".tk[32]" -type "float3" 0.10734235 0 0.27006701 ;
	setAttr ".tk[33]" -type "float3" 0 0 0.27006701 ;
	setAttr ".tk[34]" -type "float3" 0 0 0.27006701 ;
	setAttr ".tk[35]" -type "float3" 0.1244681 0 0.27006701 ;
	setAttr ".tk[36]" -type "float3" -0.1073425 0 0.27006701 ;
	setAttr ".tk[37]" -type "float3" -0.12446838 0 0.27006701 ;
createNode polyExtrudeFace -n "polyExtrudeFace4";
	rename -uid "FC76B22D-4D41-7FBF-9092-01B971875D19";
	setAttr ".ics" -type "componentList" 3 "f[12:13]" "f[38]" "f[40]";
	setAttr ".ix" -type "matrix" 1.3497661882051364 0 0 0 0 1.3497661882051364 0 0 0 0 1.3497661882051364 0
		 -8.0619783386064867 46.350834155460312 1.7628121351000621 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -8.0619764 43.71851 1.4867768 ;
	setAttr ".rs" 64857;
	setAttr ".lt" -type "double3" 4.2188474935755949e-15 8.8817841970012523e-16 1.5660557947283118 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -9.065651457552196 43.492889202197929 0.72910736659079345 ;
	setAttr ".cbx" -type "double3" -7.0583013579487375 43.944132828609071 2.244446389389863 ;
createNode polyTweak -n "polyTweak4";
	rename -uid "81A56667-451B-C16C-7075-4B96DB7AE5CA";
	setAttr ".uopa" yes;
	setAttr -s 8 ".tk";
	setAttr ".tk[28]" -type "float3" 0 0 0.22022076 ;
	setAttr ".tk[29]" -type "float3" 0 0 0.22022076 ;
	setAttr ".tk[31]" -type "float3" 0 0 0.22022076 ;
	setAttr ".tk[40]" -type "float3" 0 0 0.21440895 ;
	setAttr ".tk[41]" -type "float3" 0 0 0.21440895 ;
	setAttr ".tk[43]" -type "float3" 0 0 0.21440895 ;
createNode polyExtrudeFace -n "polyExtrudeFace5";
	rename -uid "8EA3B0BE-4FD1-53A5-9363-A5B753C9D3AF";
	setAttr ".ics" -type "componentList" 1 "f[12:13]";
	setAttr ".ix" -type "matrix" 1.3497661882051364 0 0 0 0 1.3497661882051364 0 0 0 0 1.3497661882051364 0
		 -8.0619783386064867 46.350834155460312 1.7628121351000621 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -8.0619783 42.245277 0.91667277 ;
	setAttr ".rs" 65448;
	setAttr ".lt" -type "double3" -1.0061396160665481e-15 -3.4416913763379853e-15 2.6551019785305749 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -9.0856046018562999 42.11390369164743 0.68281436943387974 ;
	setAttr ".cbx" -type "double3" -7.0383520753566735 42.37664975174534 1.150531174434263 ;
createNode polyTweak -n "polyTweak5";
	rename -uid "055EA8FE-472E-84F7-E83E-F88BBA7F128C";
	setAttr ".uopa" yes;
	setAttr -s 11 ".tk";
	setAttr ".tk[37]" -type "float3" 0 0 0.16522641 ;
	setAttr ".tk[40]" -type "float3" 0 0 0.16522641 ;
	setAttr ".tk[43]" -type "float3" 0.21443301 -0.094473004 0.27873266 ;
	setAttr ".tk[44]" -type "float3" 0 -0.031988636 0.34121835 ;
	setAttr ".tk[45]" -type "float3" 0 0.082451612 0.027969003 ;
	setAttr ".tk[46]" -type "float3" 0.23416306 -0.017102944 0.026268179 ;
	setAttr ".tk[47]" -type "float3" -0.21443231 -0.094475716 0.27873927 ;
	setAttr ".tk[48]" -type "float3" -0.23416306 -0.017102944 0.026270535 ;
	setAttr ".tk[49]" -type "float3" 0 0.094475716 -0.17599109 ;
	setAttr ".tk[50]" -type "float3" 0.23842078 0.014140503 -0.3412165 ;
	setAttr ".tk[51]" -type "float3" -0.2384226 0.014143274 -0.34121832 ;
createNode polySplit -n "polySplit1";
	rename -uid "75ABC428-4BEB-3F20-3902-85B28B4A1DFB";
	setAttr -s 2 ".e[0:1]"  0.5 0.5;
	setAttr -s 2 ".d[0:1]"  -2147483558 -2147483550;
	setAttr ".sma" 180;
	setAttr ".m2015" yes;
createNode polyTweak -n "polyTweak6";
	rename -uid "98D1A392-443D-625F-DC9B-78AE6F085722";
	setAttr ".uopa" yes;
	setAttr -s 6 ".tk[52:57]" -type "float3"  0.70150524 0 0.17312251 -5.8965309e-08
		 0 0.20560801 0 0 0.042760413 0.72321326 0 0.041874949 -0.70150381 0 0.17312859 -0.72321182
		 0 0.04187886;
createNode polySplit -n "polySplit2";
	rename -uid "EC19CC63-4CD9-EB6E-0B0B-FBADE1CBE40B";
	setAttr -s 2 ".e[0:1]"  0.5 0.5;
	setAttr -s 2 ".d[0:1]"  -2147483564 -2147483554;
	setAttr ".sma" 180;
	setAttr ".m2015" yes;
createNode polyExtrudeFace -n "polyExtrudeFace6";
	rename -uid "3A49B29D-4219-9B18-1907-65AF64406AE6";
	setAttr ".ics" -type "componentList" 2 "f[38]" "f[56]";
	setAttr ".ix" -type "matrix" 1.3497661882051364 0 0 0 0 1.3497661882051364 0 0 0 0 1.3497661882051364 0
		 -8.0619783386064867 46.350834155460312 1.7628121351000621 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -8.0619764 42.208725 1.4785208 ;
	setAttr ".rs" 61413;
	setAttr ".lt" -type "double3" 9.6781306926918553e-16 2.0816681711721685e-16 1.2619588987853054 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -9.0919271898946654 42.155696748396771 1.1492665441933223 ;
	setAttr ".cbx" -type "double3" -7.032026269224942 42.261749658928622 1.8077750138160142 ;
createNode polyTweak -n "polyTweak7";
	rename -uid "CF0E4575-43F6-23D3-423D-75AF93102D4C";
	setAttr ".uopa" yes;
	setAttr -s 5 ".tk";
	setAttr ".tk[58]" -type "float3" -0.14575523 0 0 ;
	setAttr ".tk[59]" -type "float3" -0.14575523 0 0 ;
	setAttr ".tk[60]" -type "float3" 0.14575523 0 0 ;
	setAttr ".tk[61]" -type "float3" 0.14575523 0 0 ;
createNode polyExtrudeFace -n "polyExtrudeFace7";
	rename -uid "36733F0B-4D43-472F-96A5-B294CE0111FE";
	setAttr ".ics" -type "componentList" 2 "f[38]" "f[56]";
	setAttr ".ix" -type "matrix" 1.3497661882051364 0 0 0 0 1.3497661882051364 0 0 0 0 1.3497661882051364 0
		 -8.0619783386064867 46.350834155460312 1.7628121351000621 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -8.0619783 40.95443 1.3958414 ;
	setAttr ".rs" 41488;
	setAttr ".lt" -type "double3" 5.1682833360211511e-15 1.124100812432971e-15 1.3692666555600554 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -9.2430348557080979 40.923233925134909 1.2021407434168156 ;
	setAttr ".cbx" -type "double3" -6.880922143314212 40.985623744861783 1.5895418625289996 ;
createNode polyTweak -n "polyTweak8";
	rename -uid "13BFD2B6-4D33-D254-7A31-63BDD2E4ABEA";
	setAttr ".uopa" yes;
	setAttr -s 8 ".tk[62:69]" -type "float3"  -0.24736401 0.0063733975 0.10042523
		 -0.031239193 -0.016174419 0.10004006 -0.24640006 0.016172795 -0.10043543 -0.029310372
		 -0.0020221404 -0.066422321 0.24736518 0.0063733975 0.10043081 0.24640024 0.016174464
		 -0.10043081 0.031239998 -0.016174419 0.10004609 0.029310558 -0.0020197432 -0.066418096;
createNode polyExtrudeFace -n "polyExtrudeFace8";
	rename -uid "A3F14EF5-4E6D-7A23-2E9A-1D921E57DB48";
	setAttr ".ics" -type "componentList" 2 "f[32]" "f[34]";
	setAttr ".ix" -type "matrix" 1.3497661882051364 0 0 0 0 1.3497661882051364 0 0 0 0 1.3497661882051364 0
		 -8.0619783386064867 46.350834155460312 1.7628121351000621 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -8.0619774 44.512978 1.3659811 ;
	setAttr ".rs" 42718;
	setAttr ".lt" -type "double3" 8.2225892761300656e-15 8.3266726846886741e-16 3.0321977249190701 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -9.0528994407756773 43.766998671784449 0.90623066235029925 ;
	setAttr ".cbx" -type "double3" -7.0710559491999492 45.258953097322063 1.8257316529951626 ;
createNode polyTweak -n "polyTweak9";
	rename -uid "950F5367-4482-080C-94EA-9FA8778EE5DE";
	setAttr ".uopa" yes;
	setAttr -s 9 ".tk";
	setAttr ".tk[70]" -type "float3" -0.15243557 0.0030291972 0.047747422 ;
	setAttr ".tk[71]" -type "float3" -0.049682222 -0.0076898825 0.047564276 ;
	setAttr ".tk[72]" -type "float3" -0.15197721 0.007688662 -0.047748737 ;
	setAttr ".tk[73]" -type "float3" -0.048765324 -0.0009615462 -0.031577732 ;
	setAttr ".tk[74]" -type "float3" 0.15243654 0.0030291972 0.047748297 ;
	setAttr ".tk[75]" -type "float3" 0.15197784 0.0076898825 -0.047748305 ;
	setAttr ".tk[76]" -type "float3" 0.049683005 -0.0076898825 0.047565404 ;
	setAttr ".tk[77]" -type "float3" 0.048765801 -0.00096083322 -0.031577498 ;
createNode polyExtrudeFace -n "polyExtrudeFace9";
	rename -uid "2A07F4C7-4687-7A3D-3A24-DE9B61C6AC5E";
	setAttr ".ics" -type "componentList" 2 "f[32]" "f[34]";
	setAttr ".ix" -type "matrix" 1.3497661882051364 0 0 0 0 1.3497661882051364 0 0 0 0 1.3497661882051364 0
		 -8.0619783386064867 46.350834155460312 1.7628121351000621 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -8.0619783 45.586742 1.2694346 ;
	setAttr ".rs" 57717;
	setAttr ".lt" -type "double3" 7.8374806644632145e-15 -1.6653345369377348e-15 2.2723064709026075 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -11.915099678897391 45.093650743475635 0.96553819225015325 ;
	setAttr ".cbx" -type "double3" -4.2088566765062456 46.079837084986877 1.5733308378706741 ;
createNode polyTweak -n "polyTweak10";
	rename -uid "508F6B7C-497D-E5FA-1731-5B960218795B";
	setAttr ".uopa" yes;
	setAttr -s 8 ".tk[78:85]" -type "float3"  -0.0509068 0.036854375 0.086288273
		 -0.030882709 0.081342667 -0.11547049 0.03668863 0.36707771 0.1154661 0.050907277
		 0.4115673 -0.011637463 0.050907306 0.036851779 0.086289786 0.030882819 0.08134003
		 -0.11546898 -0.050907306 0.41156465 -0.011634597 -0.036688395 0.36707649 0.11546897;
createNode polyExtrudeFace -n "polyExtrudeFace10";
	rename -uid "D754BC6F-4744-74DC-FE96-56A448CD7D15";
	setAttr ".ics" -type "componentList" 2 "f[32]" "f[34]";
	setAttr ".ix" -type "matrix" 1.3497661882051364 0 0 0 0 1.3497661882051364 0 0 0 0 1.3497661882051364 0
		 -8.0619783386064867 46.350834155460312 1.7628121351000621 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -8.0619783 46.462662 1.1970831 ;
	setAttr ".rs" 43873;
	setAttr ".lt" -type "double3" -1.7284784714632906e-14 1.85268467234323e-15 1.9779445807172389 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -14.085288199160747 46.066049988591914 0.95264232670012527 ;
	setAttr ".cbx" -type "double3" -2.0386678344335536 46.859276414735504 1.4415240088358321 ;
createNode polyTweak -n "polyTweak11";
	rename -uid "8E62C1F2-4693-552E-7359-1F893E2061D3";
	setAttr ".uopa" yes;
	setAttr -s 8 ".tk[86:93]" -type "float3"  -0.019421628 0.14932245 0.03291798
		 -0.011782341 0.16629563 -0.044055916 0.013997192 0.27530751 0.044049732 0.019421654
		 0.29228142 -0.0044421116 0.019421868 0.14932172 0.032920808 0.011782314 0.16629413
		 -0.044053093 -0.019421868 0.2922799 -0.0044387789 -0.013997165 0.27530751 0.044053093;
createNode polySplit -n "polySplit3";
	rename -uid "F475361D-4B7C-6E29-6CA2-139EE5C90670";
	setAttr -s 5 ".e[0:4]"  0.89999998 0.89999998 0.89999998 0.89999998
		 0.89999998;
	setAttr -s 5 ".d[0:4]"  -2147483490 -2147483485 -2147483487 -2147483489 -2147483490;
	setAttr ".sma" 180;
	setAttr ".m2015" yes;
createNode polyTweak -n "polyTweak12";
	rename -uid "513B9C36-404C-D5EF-A676-BEAE5C413BEE";
	setAttr ".uopa" yes;
	setAttr -s 8 ".tk[94:101]" -type "float3"  -0.027561439 -0.10143808 0.046713777
		 -0.016720591 -0.077351391 -0.062523782 0.01986458 0.07735271 0.062511399 0.027562737
		 0.10144204 -0.0063058198 0.027562546 -0.10143942 0.046719592 0.016720833 -0.077352718
		 -0.062517971 -0.027562546 0.1014394 -0.0062993178 -0.019864105 0.07735271 0.062517971;
createNode polySplit -n "polySplit4";
	rename -uid "C281695B-4C43-3453-B7FB-14A77B5E2355";
	setAttr -s 5 ".e[0:4]"  0.89999998 0.89999998 0.89999998 0.89999998
		 0.89999998;
	setAttr -s 5 ".d[0:4]"  -2147483498 -2147483495 -2147483493 -2147483497 -2147483498;
	setAttr ".sma" 180;
	setAttr ".m2015" yes;
createNode polySplit -n "polySplit5";
	rename -uid "D78620F4-4C28-070F-61D8-5A8BDD7C9F2E";
	setAttr -s 5 ".e[0:4]"  0.89999998 0.89999998 0.89999998 0.89999998
		 0.89999998;
	setAttr -s 5 ".d[0:4]"  -2147483474 -2147483469 -2147483471 -2147483473 -2147483474;
	setAttr ".sma" 180;
	setAttr ".m2015" yes;
createNode polySplit -n "polySplit6";
	rename -uid "D33ADB9E-45A6-E0EF-139C-A5BFAB9CF5BB";
	setAttr -s 5 ".e[0:4]"  0.89999998 0.89999998 0.89999998 0.89999998
		 0.89999998;
	setAttr -s 5 ".d[0:4]"  -2147483482 -2147483479 -2147483477 -2147483481 -2147483482;
	setAttr ".sma" 180;
	setAttr ".m2015" yes;
createNode polySplit -n "polySplit7";
	rename -uid "E03DA048-4092-37BF-4296-629AC76574F6";
	setAttr -s 5 ".e[0:4]"  0.89999998 0.89999998 0.89999998 0.89999998
		 0.89999998;
	setAttr -s 5 ".d[0:4]"  -2147483458 -2147483453 -2147483455 -2147483457 -2147483458;
	setAttr ".sma" 180;
	setAttr ".m2015" yes;
createNode polySplit -n "polySplit8";
	rename -uid "4C58A2A0-455D-0C15-3D7D-ADA363741833";
	setAttr -s 5 ".e[0:4]"  0.89999998 0.89999998 0.89999998 0.89999998
		 0.89999998;
	setAttr -s 5 ".d[0:4]"  -2147483466 -2147483463 -2147483461 -2147483465 -2147483466;
	setAttr ".sma" 180;
	setAttr ".m2015" yes;
createNode polySplit -n "polySplit9";
	rename -uid "07654B47-43D8-1D4C-3F1F-9B9DD1D39767";
	setAttr -s 5 ".e[0:4]"  1 0.5 1 0.5 1;
	setAttr -s 5 ".d[0:4]"  -2147483609 -2147483638 -2147483622 -2147483640 -2147483603;
	setAttr ".sma" 180;
	setAttr ".m2015" yes;
createNode polyTweak -n "polyTweak13";
	rename -uid "C2A2D805-4543-6068-4873-EF9A3EC6D652";
	setAttr ".uopa" yes;
	setAttr -s 8 ".tk";
	setAttr ".tk[6]" -type "float3" 0 0 -0.14449145 ;
	setAttr ".tk[7]" -type "float3" 0 0 -0.14449145 ;
	setAttr ".tk[10]" -type "float3" 0 0 -0.14449145 ;
	setAttr ".tk[15]" -type "float3" 0 0 0.18158059 ;
	setAttr ".tk[17]" -type "float3" 0 0 0.18158059 ;
	setAttr ".tk[20]" -type "float3" 0 0 0.18158059 ;
	setAttr ".tk[23]" -type "float3" 0 0 0.21000338 ;
	setAttr ".tk[28]" -type "float3" 0 0 0.21000338 ;
createNode polySplit -n "polySplit10";
	rename -uid "62ED1ECC-492F-55CE-417A-BBA5608F92EB";
	setAttr -s 5 ".e[0:4]"  0 0.5 1 0.5 1;
	setAttr -s 5 ".d[0:4]"  -2147483608 -2147483402 -2147483622 -2147483401 -2147483603;
	setAttr ".sma" 180;
	setAttr ".m2015" yes;
createNode polyExtrudeFace -n "polyExtrudeFace11";
	rename -uid "748085CE-4680-1E90-71B9-17AA4A4DACA6";
	setAttr ".ics" -type "componentList" 1 "f[2:3]";
	setAttr ".ix" -type "matrix" 1.3497661882051364 0 0 0 0 1.3497661882051364 0 0 0 0 1.3497661882051364 0
		 -8.0619783386064867 46.350834155460312 1.7628121351000621 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -8.0619783 46.692436 2.5938623 ;
	setAttr ".rs" 38162;
	setAttr ".lt" -type "double3" -2.7200464103316335e-15 5.8147930914742574e-15 0.25051078417338457 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -8.7451789168256919 46.350834155460312 2.2688867626327345 ;
	setAttr ".cbx" -type "double3" -7.3787771167686076 47.034037951772888 2.9188379197306049 ;
createNode polyExtrudeFace -n "polyExtrudeFace12";
	rename -uid "1DFFE40A-4C1B-65EC-371A-4D83803B265D";
	setAttr ".ics" -type "componentList" 1 "f[0:1]";
	setAttr ".ix" -type "matrix" 1.3497661882051364 0 0 0 0 1.3497661882051364 0 0 0 0 1.3497661882051364 0
		 -8.0619783386064867 46.350834155460312 1.7628121351000621 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -8.0619783 46.009239 2.5938623 ;
	setAttr ".rs" 55278;
	setAttr ".lt" -type "double3" -2.2828960943854781e-15 1.457167719820518e-15 0.15220699539093124 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -8.6566157001254229 45.667640657046512 2.2688867626327345 ;
	setAttr ".cbx" -type "double3" -7.4673403334688766 46.350834155460312 2.918838000182939 ;
createNode polyTweak -n "polyTweak14";
	rename -uid "8B6963A5-4071-B146-790F-04980282E260";
	setAttr ".uopa" yes;
	setAttr -s 7 ".tk";
	setAttr ".tk[130]" -type "float3" 0 -0.13132185 0.049000129 ;
	setAttr ".tk[131]" -type "float3" 0 -0.13132185 0.049000129 ;
	setAttr ".tk[132]" -type "float3" 0 -0.13132185 0.049000129 ;
	setAttr ".tk[133]" -type "float3" 0 -0.13132185 0.049000129 ;
	setAttr ".tk[134]" -type "float3" 0 -0.13132185 0.049000129 ;
	setAttr ".tk[135]" -type "float3" 0 -0.13132185 0.049000129 ;
createNode polySplit -n "polySplit11";
	rename -uid "FEEA7E23-4795-68E5-E0C2-4DB4ADC909BA";
	setAttr -s 3 ".e[0:2]"  0.5 0.5 0.5;
	setAttr -s 3 ".d[0:2]"  -2147483390 -2147483385 -2147483383;
	setAttr ".sma" 180;
	setAttr ".m2015" yes;
createNode polyTweak -n "polyTweak15";
	rename -uid "C1D02196-4AE4-5A25-89F1-43932C298A9F";
	setAttr ".uopa" yes;
	setAttr -s 11 ".tk";
	setAttr ".tk[130]" -type "float3" -0.062491223 0.020385548 -0.18403433 ;
	setAttr ".tk[132]" -type "float3" -0.062491328 0.020388035 -0.18403432 ;
	setAttr ".tk[133]" -type "float3" 0 0.0203862 -0.18403429 ;
	setAttr ".tk[134]" -type "float3" 0.062491223 0.020385548 -0.18403433 ;
	setAttr ".tk[135]" -type "float3" 0.062491328 0.020388035 -0.18403432 ;
	setAttr ".tk[136]" -type "float3" 0.041810423 0.064327374 -0.082642764 ;
	setAttr ".tk[137]" -type "float3" 0 0.064327218 -0.082642667 ;
	setAttr ".tk[138]" -type "float3" 0 0.029472999 0.023017628 ;
	setAttr ".tk[139]" -type "float3" 0.041810364 0.064329609 -0.082642764 ;
	setAttr ".tk[140]" -type "float3" -0.041810423 0.064327374 -0.082642764 ;
	setAttr ".tk[141]" -type "float3" -0.041810364 0.064329609 -0.082642764 ;
createNode polySplit -n "polySplit12";
	rename -uid "D12CDDF0-4EEA-77FE-DD37-02ABA1CD166A";
	setAttr -s 3 ".e[0:2]"  0.5 0.5 0.5;
	setAttr -s 3 ".d[0:2]"  -2147483367 -2147483375 -2147483373;
	setAttr ".sma" 180;
	setAttr ".m2015" yes;
createNode polyTweak -n "polyTweak16";
	rename -uid "D10760CF-4754-7AE2-EAF8-FD850DD88C5C";
	setAttr ".uopa" yes;
	setAttr -s 4 ".tk";
	setAttr ".tk[131]" -type "float3" 0 -0.086764157 0.013567998 ;
	setAttr ".tk[142]" -type "float3" 0 0.015191178 -0.018688845 ;
	setAttr ".tk[143]" -type "float3" 0 0.056847606 0.079946093 ;
	setAttr ".tk[144]" -type "float3" 0 0.015191178 -0.018688845 ;
createNode polySplit -n "polySplit13";
	rename -uid "5E45AD8A-406F-043F-E365-E09713B9D774";
	setAttr -s 3 ".e[0:2]"  1 0.5 1;
	setAttr -s 3 ".d[0:2]"  -2147483390 -2147483391 -2147483383;
	setAttr ".sma" 180;
	setAttr ".m2015" yes;
createNode polyTweak -n "polyTweak17";
	rename -uid "9C1AE0C4-4CC1-A99E-53DA-BCB18C7E353D";
	setAttr ".uopa" yes;
	setAttr -s 2 ".tk";
	setAttr ".tk[20]" -type "float3" 0 0 -0.21454334 ;
	setAttr ".tk[138]" -type "float3" 0 -0.073727958 -0.026814846 ;
createNode polySplit -n "polySplit14";
	rename -uid "EA7B90FA-46C8-E1E8-5173-74B2F7AC2DB4";
	setAttr -s 3 ".e[0:2]"  0 0.5 0;
	setAttr -s 3 ".d[0:2]"  -2147483361 -2147483376 -2147483359;
	setAttr ".sma" 180;
	setAttr ".m2015" yes;
createNode polyTweak -n "polyTweak18";
	rename -uid "2F3D9466-4A2B-3341-ED5F-5583457D9E4E";
	setAttr ".uopa" yes;
	setAttr ".tk[148]" -type "float3"  0 0.13262597 -0.041022871;
createNode polyMergeVert -n "polyMergeVert1";
	rename -uid "6912EE77-44C1-7733-0BDF-29A5E14154A0";
	setAttr ".ics" -type "componentList" 1 "vtx[*]";
	setAttr ".ix" -type "matrix" 1.3497661882051364 0 0 0 0 1.3497661882051364 0 0 0 0 1.3497661882051364 0
		 -8.0619783386064867 46.350834155460312 1.7628121351000621 1;
	setAttr ".d" 0.001;
	setAttr ".am" yes;
createNode polyTweak -n "polyTweak19";
	rename -uid "D5189FE1-42DE-9882-3C29-2CB3D1554492";
	setAttr ".uopa" yes;
	setAttr -s 5 ".tk";
	setAttr ".tk[20]" -type "float3" 0 -0.074987128 -0.067844011 ;
	setAttr ".tk[138]" -type "float3" 0 0.061569139 -0.026748408 ;
	setAttr ".tk[149]" -type "float3" 0 -0.047131836 -0.080054022 ;
createNode polyExtrudeFace -n "polyExtrudeFace15";
	rename -uid "8DB0DA55-4628-F380-5B7F-A4BCA8D9D4BA";
	setAttr ".ics" -type "componentList" 12 "f[76]" "f[80]" "f[84]" "f[88]" "f[92]" "f[96]" "f[99]" "f[103]" "f[107]" "f[111]" "f[115]" "f[119]";
	setAttr ".ix" -type "matrix" 1.3497661882051364 0 0 0 0 1.3497661882051364 0 0 0 0 1.3497661882051364 0
		 -8.0619783386064867 46.350834155460312 1.7628121351000621 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -8.0619783 45.267334 1.1592708 ;
	setAttr ".rs" 49411;
	setAttr ".lt" -type "double3" -4.6213033400022141e-15 -1.7763568394002505e-15 1.9718840668072504 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -15.959960170950215 43.766998671784449 0.90623066235029925 ;
	setAttr ".cbx" -type "double3" -0.16399650626275797 46.767667353115598 1.4123107606416956 ;
createNode polyExtrudeFace -n "polyExtrudeFace16";
	rename -uid "E062CC1C-4FFF-0C38-978D-47B573189EDE";
	setAttr ".ics" -type "componentList" 4 "f[32]" "f[34]" "f[147]" "f[168]";
	setAttr ".ix" -type "matrix" 1.3497661882051364 0 0 0 0 1.3497661882051364 0 0 0 0 1.3497661882051364 0
		 -8.0619783386064867 46.350834155460312 1.7628121351000621 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -8.061944 46.114567 0.82105619 ;
	setAttr ".rs" 64070;
	setAttr ".lt" -type "double3" -4.7895715171719644e-15 2.9143354396410359e-15 2.7302040321426833 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -16.672599867291762 45.003750650338333 0.34794874521830033 ;
	setAttr ".cbx" -type "double3" 0.54871141365817167 47.225383208906671 1.2941636116175657 ;
createNode polyTweak -n "polyTweak20";
	rename -uid "A401D63B-42BB-7AA0-8E09-DEBEFDA0CE14";
	setAttr ".uopa" yes;
	setAttr -s 32 ".tk";
	setAttr ".tk[140]" -type "float3" 0.02404397 -0.0044863243 0.042334873 ;
	setAttr ".tk[141]" -type "float3" 0.02285783 -0.0081978636 -0.032232746 ;
	setAttr ".tk[142]" -type "float3" 0.014531765 -0.0043271864 -0.029771976 ;
	setAttr ".tk[143]" -type "float3" 0.015660081 -0.00079681783 0.041157883 ;
	setAttr ".tk[144]" -type "float3" -0.04312598 0.024840143 0.043701984 ;
	setAttr ".tk[145]" -type "float3" -0.044055644 0.02193124 -0.014737247 ;
	setAttr ".tk[146]" -type "float3" -0.04815384 0.023953516 -0.012760746 ;
	setAttr ".tk[147]" -type "float3" -0.0472463 0.026793336 0.044290625 ;
	setAttr ".tk[148]" -type "float3" -0.095954806 0.042367339 0.040527645 ;
	setAttr ".tk[149]" -type "float3" -0.096580371 0.04040996 0.0012023102 ;
	setAttr ".tk[150]" -type "float3" -0.10223264 0.042339865 0.0027279593 ;
	setAttr ".tk[151]" -type "float3" -0.10163848 0.044199441 0.040083684 ;
	setAttr ".tk[152]" -type "float3" 0.10223482 -0.038857538 0.053654674 ;
	setAttr ".tk[153]" -type "float3" 0.10052784 -0.044198502 -0.05365245 ;
	setAttr ".tk[154]" -type "float3" -0.10223459 -0.038857538 0.053653598 ;
	setAttr ".tk[155]" -type "float3" -0.1005276 -0.044198502 -0.053653598 ;
	setAttr ".tk[156]" -type "float3" -0.02404378 -0.0044863243 0.042335074 ;
	setAttr ".tk[157]" -type "float3" -0.022857582 -0.0081975562 -0.032232579 ;
	setAttr ".tk[158]" -type "float3" -0.015659943 -0.00079697685 0.041155189 ;
	setAttr ".tk[159]" -type "float3" -0.014531611 -0.0043270378 -0.029774681 ;
	setAttr ".tk[160]" -type "float3" 0.043125995 0.024839532 0.04369707 ;
	setAttr ".tk[161]" -type "float3" 0.044055618 0.021931078 -0.014742182 ;
	setAttr ".tk[162]" -type "float3" 0.047246341 0.026792718 0.044283524 ;
	setAttr ".tk[163]" -type "float3" 0.048153888 0.023953045 -0.012767859 ;
	setAttr ".tk[164]" -type "float3" 0.095955908 0.042366553 0.040509984 ;
	setAttr ".tk[165]" -type "float3" 0.096581496 0.040409323 0.0011846346 ;
	setAttr ".tk[166]" -type "float3" 0.1016404 0.044198502 0.040057734 ;
	setAttr ".tk[167]" -type "float3" 0.10223462 0.042339399 0.0027019368 ;
createNode polyExtrudeFace -n "polyExtrudeFace17";
	rename -uid "DFC4565F-4BFF-4E1C-10F5-FDA91B56B08D";
	setAttr ".ics" -type "componentList" 1 "f[12:13]";
	setAttr ".ix" -type "matrix" 1.3497661882051364 0 0 0 0 1.3497661882051364 0 0 0 0 1.3497661882051364 0
		 -8.0619783386064867 46.350834155460312 1.7628121351000621 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -8.0619783 39.754765 0.22751626 ;
	setAttr ".rs" 62883;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -8.4468706723558373 39.623391950189806 0.10415661143400623 ;
	setAttr ".cbx" -type "double3" -7.6770853612384631 39.88614026295307 0.35087592294502556 ;
createNode polyTweak -n "polyTweak21";
	rename -uid "75DFA294-4CB4-2A17-ECB2-84BDB514AB7A";
	setAttr ".uopa" yes;
	setAttr -s 13 ".tk";
	setAttr ".tk[168]" -type "float3" -0.5424158 -0.20915511 -0.35519224 ;
	setAttr ".tk[169]" -type "float3" -0.52746302 -0.1759384 -0.50585896 ;
	setAttr ".tk[170]" -type "float3" -0.50661033 -0.051490963 -0.38110676 ;
	setAttr ".tk[171]" -type "float3" -0.49599284 -0.018265914 -0.47602329 ;
	setAttr ".tk[172]" -type "float3" -0.15270533 0.77532136 -0.091478705 ;
	setAttr ".tk[173]" -type "float3" -0.14165647 0.80990297 -0.15922999 ;
	setAttr ".tk[174]" -type "float3" 0.54241729 -0.20916346 -0.35517162 ;
	setAttr ".tk[175]" -type "float3" 0.52746415 -0.1759412 -0.50583816 ;
	setAttr ".tk[176]" -type "float3" 0.49600309 -0.018304776 -0.47598246 ;
	setAttr ".tk[177]" -type "float3" 0.506621 -0.051524252 -0.38106582 ;
	setAttr ".tk[178]" -type "float3" 0.14163788 0.8098529 -0.15922618 ;
	setAttr ".tk[179]" -type "float3" 0.15268841 0.77528244 -0.091474801 ;
createNode polyExtrudeFace -n "polyExtrudeFace18";
	rename -uid "BA203B28-45E9-9869-BEF3-F9BCE1FAFE79";
	setAttr ".ics" -type "componentList" 3 "f[12:13]" "f[52]" "f[54]";
	setAttr ".ix" -type "matrix" 1.3497661882051364 0 0 0 0 1.3497661882051364 0 0 0 0 1.3497661882051364 0
		 -8.0619783386064867 46.350834155460312 5.0994817673875747 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -8.0619774 41.000019 3.9640133 ;
	setAttr ".rs" 56357;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -9.0856036364282886 39.623391950189806 3.4408262437215189 ;
	setAttr ".cbx" -type "double3" -7.038351753547337 42.376648464507994 4.487200645817107 ;
createNode polyExtrudeFace -n "polyExtrudeFace19";
	rename -uid "2BE67E2E-4B83-70FB-5EF7-63842FA2E0BE";
	setAttr ".ics" -type "componentList" 1 "f[12:13]";
	setAttr ".ix" -type "matrix" 1.3497661882051364 0 0 0 0 1.3497661882051364 0 0 0 0 1.3497661882051364 0
		 -8.0619783386064867 46.350834155460312 5.0994817673875747 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -8.0619783 39.754765 3.5641849 ;
	setAttr ".rs" 56006;
	setAttr ".lt" -type "double3" -5.6621374255882984e-15 -1.3322676295501878e-15 6.9453985375803793 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -8.4468708332605065 39.623391306571129 3.4408252782935085 ;
	setAttr ".cbx" -type "double3" -7.6770853612384631 39.88614026295307 3.6875444288998596 ;
createNode polyMergeVert -n "polyMergeVert2";
	rename -uid "BA18F96C-404A-0192-4C79-E3BED5588440";
	setAttr ".ics" -type "componentList" 1 "vtx[*]";
	setAttr ".ix" -type "matrix" 1.3497661882051364 0 0 0 0 1.3497661882051364 0 0 0 0 1.3497661882051364 0
		 -8.0619783386064867 46.350834155460312 5.0994817673875747 1;
	setAttr ".am" yes;
createNode polyTweak -n "polyTweak22";
	rename -uid "74DCD2A3-4762-49BD-6628-C2AE54E62C32";
	setAttr ".uopa" yes;
	setAttr -s 29 ".tk";
	setAttr ".tk[56]" -type "float3" -1.1920929e-07 0 0 ;
	setAttr ".tk[57]" -type "float3" -1.1920929e-07 0 0 ;
	setAttr ".tk[180]" -type "float3" 1.7881393e-07 0 0 ;
	setAttr ".tk[183]" -type "float3" 1.7881393e-07 0 0 ;
	setAttr ".tk[184]" -type "float3" -1.1920929e-07 0 0 ;
	setAttr ".tk[185]" -type "float3" -1.1920929e-07 0 0 ;
	setAttr ".tk[186]" -type "float3" -1.1920929e-07 1.9073486e-06 -3.5762787e-07 ;
	setAttr ".tk[187]" -type "float3" -1.7053026e-13 1.6689301e-06 -4.7683716e-07 ;
	setAttr ".tk[188]" -type "float3" -1.4210855e-13 -4.7683716e-07 4.7683716e-07 ;
	setAttr ".tk[189]" -type "float3" -1.1920929e-07 -4.7683716e-07 -5.9604645e-07 ;
	setAttr ".tk[190]" -type "float3" 0 -2.3841858e-07 8.3446503e-07 ;
	setAttr ".tk[191]" -type "float3" 0 1.4305115e-06 7.1525574e-07 ;
	setAttr ".tk[192]" -type "float3" -4.7683716e-07 -9.5367432e-07 0 ;
	setAttr ".tk[193]" -type "float3" 0 0 9.5367432e-07 ;
	setAttr ".tk[194]" -type "float3" 1.1920929e-07 0 1.7881393e-07 ;
	setAttr ".tk[195]" -type "float3" 1.1920929e-07 -1.1920929e-07 -1.7881393e-07 ;
	setAttr ".tk[196]" -type "float3" 0 -2.1457672e-06 -4.7683716e-07 ;
	setAttr ".tk[197]" -type "float3" 0 0 8.3446503e-07 ;
	setAttr ".tk[198]" -type "float3" -7.1525574e-07 -1.7881393e-07 2.3841858e-07 ;
	setAttr ".tk[199]" -type "float3" -7.1525574e-07 2.3841858e-07 -2.9802322e-07 ;
	setAttr ".tk[200]" -type "float3" 1.539161 0 0 ;
	setAttr ".tk[201]" -type "float3" -2.584764e-08 0 0 ;
	setAttr ".tk[202]" -type "float3" -1.2923834e-08 0 0 ;
	setAttr ".tk[203]" -type "float3" 1.539161 0 0 ;
	setAttr ".tk[204]" -type "float3" -1.5391753 0 0 ;
	setAttr ".tk[205]" -type "float3" -1.5391753 0 0 ;
createNode objectSet -n "set1";
	rename -uid "F0CF7B0B-4316-4FA1-3394-A8AFFE6FC29C";
	setAttr ".ihi" 0;
createNode objectSet -n "set2";
	rename -uid "FED0A5A6-421D-B544-3D8E-14B332988184";
	setAttr ".ihi" 0;
createNode polyCloseBorder -n "polyCloseBorder1";
	rename -uid "0C26719A-4298-0F64-B69D-C3989CEEB1AB";
	setAttr ".ics" -type "componentList" 5 "e[51]" "e[55]" "e[57]" "e[60:62]" "e[64:65]";
createNode groupId -n "groupId1";
	rename -uid "E9D943B8-4357-5E25-3A58-5194BA2307D3";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts1";
	rename -uid "4B7399ED-4480-65AD-C3EE-00AA50CD7A22";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 6 "e[51]" "e[55]" "e[57]" "e[60]" "e[62]" "e[64]";
createNode groupId -n "groupId2";
	rename -uid "2EB301BD-4CD4-8FFF-69BC-8BAAB911ED98";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts2";
	rename -uid "0679CDDE-4477-09E0-0B32-1FA7507D0D4F";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 2 "e[61]" "e[65]";
createNode polyExtrudeFace -n "polyExtrudeFace20";
	rename -uid "9AC98673-4119-C0ED-8D5D-6F859FEA00B4";
	setAttr ".ics" -type "componentList" 1 "f[98:99]";
	setAttr ".ix" -type "matrix" 1.3497661882051364 0 0 0 0 1.3497661882051364 0 0 0 0 1.3497661882051364 0
		 15.712869354642901 46.350834155460312 5.0994817673875747 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 15.71287 44.512978 4.7026501 ;
	setAttr ".rs" 38477;
	setAttr ".lt" -type "double3" 1.1583616010835129e-15 -3.5388358909926865e-16 0.98540703169233768 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" 14.721948252473711 43.766998671784449 4.2428993292098021 ;
	setAttr ".cbx" -type "double3" 16.70379174404944 45.258953097322063 5.1624006416640018 ;
createNode polyExtrudeFace -n "polyExtrudeFace21";
	rename -uid "A2F1533B-4689-6949-A16C-3AAAB3E61FFD";
	setAttr ".ics" -type "componentList" 1 "f[102:105]";
	setAttr ".ix" -type "matrix" 1.3497661882051364 0 0 0 0 1.3497661882051364 0 0 0 0 1.3497661882051364 0
		 15.712869354642901 46.350834155460312 5.0994817673875747 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 15.71287 44.549709 4.6869612 ;
	setAttr ".rs" 41807;
	setAttr ".lt" -type "double3" 4.8572257327350599e-16 3.1086244689504383e-15 3.5232105622207572 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" 13.769456334057224 43.766998671784449 4.2115219534524497 ;
	setAttr ".cbx" -type "double3" 17.656283662465924 45.332423456130577 5.1623999980453288 ;
createNode nodeGraphEditorInfo -n "hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "21818E7F-4903-645E-0C60-9BA261071580";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -696.54063404119518 -547.13201289096185 ;
	setAttr ".tgi[0].vh" -type "double2" 803.08824885499234 420.23807853933431 ;
	setAttr ".tgi[0].ni[0].x" -142.85714721679688;
	setAttr ".tgi[0].ni[0].y" 407.14285278320312;
	setAttr ".tgi[0].ni[0].nvs" 3042;
select -ne :time1;
	setAttr ".o" 1;
	setAttr ".unw" 1;
select -ne :hardwareRenderingGlobals;
	setAttr ".otfna" -type "stringArray" 22 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surface" "Particles" "Particle Instance" "Fluids" "Strokes" "Image Planes" "UI" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Hair Systems" "Follicles" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 22 0 1 1 1 1 1
		 1 1 1 0 0 0 0 0 0 0 0 0
		 0 0 0 0 ;
	setAttr ".fprt" yes;
	setAttr ".rtfm" 1;
select -ne :renderPartition;
	setAttr -s 2 ".st";
select -ne :renderGlobalsList1;
select -ne :defaultShaderList1;
	setAttr -s 5 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderingList1;
select -ne :standardSurface1;
	setAttr ".bc" -type "float3" 0.40000001 0.40000001 0.40000001 ;
	setAttr ".sr" 0.5;
select -ne :initialShadingGroup;
	setAttr -s 3 ".dsm";
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :initialMaterialInfo;
select -ne :defaultRenderGlobals;
	addAttr -ci true -h true -sn "dss" -ln "defaultSurfaceShader" -dt "string";
	setAttr ".ren" -type "string" "arnold";
	setAttr ".dss" -type "string" "standardSurface1";
select -ne :defaultResolution;
	setAttr ".pa" 1;
select -ne :defaultColorMgtGlobals;
	setAttr ".cfe" yes;
	setAttr ".cfp" -type "string" "<MAYA_RESOURCES>/OCIO-configs/Maya2022-default/config.ocio";
	setAttr ".vtn" -type "string" "ACES 1.0 SDR-video (sRGB)";
	setAttr ".vn" -type "string" "ACES 1.0 SDR-video";
	setAttr ".dn" -type "string" "sRGB";
	setAttr ".wsn" -type "string" "ACEScg";
	setAttr ".otn" -type "string" "ACES 1.0 SDR-video (sRGB)";
	setAttr ".potn" -type "string" "ACES 1.0 SDR-video (sRGB)";
select -ne :hardwareRenderGlobals;
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
connectAttr ":defaultColorMgtGlobals.cme" "imagePlaneShape1.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "imagePlaneShape1.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "imagePlaneShape1.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "imagePlaneShape1.ws";
connectAttr ":frontShape.msg" "imagePlaneShape1.ltc";
connectAttr "polyMergeVert2.out" "pCubeShape1.i";
connectAttr "groupId1.id" "pCubeShape2.iog.og[0].gid";
connectAttr "set1.mwc" "pCubeShape2.iog.og[0].gco";
connectAttr "groupId2.id" "pCubeShape2.iog.og[1].gid";
connectAttr "set2.mwc" "pCubeShape2.iog.og[1].gco";
connectAttr "polyExtrudeFace21.out" "pCubeShape2.i";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr ":defaultArnoldDenoiser.msg" ":defaultArnoldRenderOptions.imagers" -na
		;
connectAttr ":defaultArnoldDisplayDriver.msg" ":defaultArnoldRenderOptions.drivers"
		 -na;
connectAttr ":defaultArnoldFilter.msg" ":defaultArnoldRenderOptions.filt";
connectAttr ":defaultArnoldDriver.msg" ":defaultArnoldRenderOptions.drvr";
connectAttr "polyCube1.out" "polySmoothFace1.ip";
connectAttr "polyTweak1.out" "polyExtrudeFace1.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace1.mp";
connectAttr "polySmoothFace1.out" "polyTweak1.ip";
connectAttr "polyTweak2.out" "polyExtrudeFace2.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace2.mp";
connectAttr "polyExtrudeFace1.out" "polyTweak2.ip";
connectAttr "polyTweak3.out" "polyExtrudeFace3.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace3.mp";
connectAttr "polyExtrudeFace2.out" "polyTweak3.ip";
connectAttr "polyTweak4.out" "polyExtrudeFace4.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace4.mp";
connectAttr "polyExtrudeFace3.out" "polyTweak4.ip";
connectAttr "polyTweak5.out" "polyExtrudeFace5.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace5.mp";
connectAttr "polyExtrudeFace4.out" "polyTweak5.ip";
connectAttr "polyTweak6.out" "polySplit1.ip";
connectAttr "polyExtrudeFace5.out" "polyTweak6.ip";
connectAttr "polySplit1.out" "polySplit2.ip";
connectAttr "polyTweak7.out" "polyExtrudeFace6.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace6.mp";
connectAttr "polySplit2.out" "polyTweak7.ip";
connectAttr "polyTweak8.out" "polyExtrudeFace7.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace7.mp";
connectAttr "polyExtrudeFace6.out" "polyTweak8.ip";
connectAttr "polyTweak9.out" "polyExtrudeFace8.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace8.mp";
connectAttr "polyExtrudeFace7.out" "polyTweak9.ip";
connectAttr "polyTweak10.out" "polyExtrudeFace9.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace9.mp";
connectAttr "polyExtrudeFace8.out" "polyTweak10.ip";
connectAttr "polyTweak11.out" "polyExtrudeFace10.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace10.mp";
connectAttr "polyExtrudeFace9.out" "polyTweak11.ip";
connectAttr "polyTweak12.out" "polySplit3.ip";
connectAttr "polyExtrudeFace10.out" "polyTweak12.ip";
connectAttr "polySplit3.out" "polySplit4.ip";
connectAttr "polySplit4.out" "polySplit5.ip";
connectAttr "polySplit5.out" "polySplit6.ip";
connectAttr "polySplit6.out" "polySplit7.ip";
connectAttr "polySplit7.out" "polySplit8.ip";
connectAttr "polyTweak13.out" "polySplit9.ip";
connectAttr "polySplit8.out" "polyTweak13.ip";
connectAttr "polySplit9.out" "polySplit10.ip";
connectAttr "polySplit10.out" "polyExtrudeFace11.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace11.mp";
connectAttr "polyTweak14.out" "polyExtrudeFace12.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace12.mp";
connectAttr "polyExtrudeFace11.out" "polyTweak14.ip";
connectAttr "polyTweak15.out" "polySplit11.ip";
connectAttr "polyExtrudeFace12.out" "polyTweak15.ip";
connectAttr "polyTweak16.out" "polySplit12.ip";
connectAttr "polySplit11.out" "polyTweak16.ip";
connectAttr "polyTweak17.out" "polySplit13.ip";
connectAttr "polySplit12.out" "polyTweak17.ip";
connectAttr "polyTweak18.out" "polySplit14.ip";
connectAttr "polySplit13.out" "polyTweak18.ip";
connectAttr "polyTweak19.out" "polyMergeVert1.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert1.mp";
connectAttr "polySplit14.out" "polyTweak19.ip";
connectAttr "polyMergeVert1.out" "polyExtrudeFace15.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace15.mp";
connectAttr "polyTweak20.out" "polyExtrudeFace16.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace16.mp";
connectAttr "polyExtrudeFace15.out" "polyTweak20.ip";
connectAttr "polyTweak21.out" "polyExtrudeFace17.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace17.mp";
connectAttr "polyExtrudeFace16.out" "polyTweak21.ip";
connectAttr "polyExtrudeFace17.out" "polyExtrudeFace18.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace18.mp";
connectAttr "polyExtrudeFace18.out" "polyExtrudeFace19.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace19.mp";
connectAttr "polyTweak22.out" "polyMergeVert2.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert2.mp";
connectAttr "polyExtrudeFace19.out" "polyTweak22.ip";
connectAttr "groupId1.msg" "set1.gn" -na;
connectAttr "pCubeShape2.iog.og[0]" "set1.dsm" -na;
connectAttr "groupId2.msg" "set2.gn" -na;
connectAttr "pCubeShape2.iog.og[1]" "set2.dsm" -na;
connectAttr "groupParts2.og" "polyCloseBorder1.ip";
connectAttr "polySurfaceShape1.o" "groupParts1.ig";
connectAttr "groupId1.id" "groupParts1.gi";
connectAttr "groupParts1.og" "groupParts2.ig";
connectAttr "groupId2.id" "groupParts2.gi";
connectAttr "polyCloseBorder1.out" "polyExtrudeFace20.ip";
connectAttr "pCubeShape2.wm" "polyExtrudeFace20.mp";
connectAttr "polyExtrudeFace20.out" "polyExtrudeFace21.ip";
connectAttr "pCubeShape2.wm" "polyExtrudeFace21.mp";
connectAttr "imagePlaneShape1.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "pCubeShape1.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape2.iog" ":initialShadingGroup.dsm" -na;
// End of ParrotModel.ma
