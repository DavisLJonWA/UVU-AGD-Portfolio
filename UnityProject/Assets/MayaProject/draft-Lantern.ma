//Maya ASCII 2025ff03 scene
//Name: draft-Lantern.ma
//Last modified: Tue, Sep 09, 2025 03:40:41 PM
//Codeset: 1252
requires maya "2025ff03";
requires "mtoa" "5.4.5";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2025";
fileInfo "version" "2025";
fileInfo "cutIdentifier" "202409190603-cbdc5a7e54";
fileInfo "osv" "Windows 11 Home v2009 (Build: 26100)";
fileInfo "UUID" "B3CFFF81-4018-D55F-CC9B-5892B8D194F6";
createNode transform -s -n "persp";
	rename -uid "7F088147-459D-CD72-056D-ADAE1696A174";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -13.424476966329488 12.171516655001925 0.60445194938147029 ;
	setAttr ".r" -type "double3" -15.338352718983451 2073.0000000003201 0 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "1111E147-4FAC-9883-FDF1-078BB9DDDD58";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 15.200859671563045;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "4178F845-4502-C0A3-FAA7-C9B378ABA645";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1000.1 0 ;
	setAttr ".r" -type "double3" -90 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "78329CDA-44A0-52C0-301A-7D9A5C6FA66D";
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
	rename -uid "DFF055B6-48E3-554A-F01E-34B96EEF8FC7";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 1000.1 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "C8C244AF-41D4-D78C-D1D5-5EB08C99BAA8";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -s -n "side";
	rename -uid "F2C3A77A-4132-97A1-9473-03B06C8CA8EF";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 0 0 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "97677B50-44E3-9D51-9714-2892859E0C89";
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
createNode transform -n "pCylinder1";
	rename -uid "47B0C605-49A3-655E-E70B-4DAD9612AB6B";
	setAttr ".t" -type "double3" 0 -3.177660889992481 0 ;
	setAttr ".s" -type "double3" 3.2124759892438592 4.1926120212785047 3.2124759892438592 ;
createNode transform -n "transform6" -p "pCylinder1";
	rename -uid "08964CC5-4AEF-0F1B-AC20-ED9C521158AD";
	setAttr ".v" no;
createNode mesh -n "pCylinderShape1" -p "transform6";
	rename -uid "2D4BC3A7-4FEF-EE33-AAA9-7389942E8565";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr -s 2 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr -s 3 ".ciog[0].cog";
	setAttr ".pv" -type "double2" 0.5 0.50416371412575245 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 50 ".pt[0:49]" -type "float3"  -0.10613952 0.057731256 0.18383893 
		0.10613944 0.057731256 0.18383898 0.21227892 0.057731256 3.1632048e-08 0.10613946 
		0.057731256 -0.18383893 -0.10613945 0.057731256 -0.18383898 -0.21227892 0.057731256 
		0 0 0.19380596 0 -0.087599479 -0.029506275 -0.15172692 -0.17519896 -0.029506275 -2.0581332e-09 
		-0.087599479 -0.029506275 0.15172692 0.087599479 -0.029506275 0.15172692 0.17519896 
		-0.029506275 2.4048541e-08 0.087599434 -0.029506275 -0.15172692 -0.10613952 0.16659376 
		0.18383893 -0.099607624 0.19380596 0.17252541 0.10613944 0.16659376 0.18383898 0.099607587 
		0.19380596 0.17252541 0.21227892 0.16659376 3.1632048e-08 0.19921517 0.19380596 2.9483161e-08 
		0.10613946 0.16659376 -0.18383893 0.099607609 0.19380596 -0.17252541 -0.10613945 
		0.16659376 -0.18383898 -0.099607587 0.19380596 -0.17252541 -0.21227892 0.16659376 
		0 -0.19921517 0.19380596 1.1755443e-09 -0.041604523 0 -0.072061233 -0.083209045 0 
		-2.5709832e-09 -0.041604523 0 0.072061226 0.041604523 0 0.072061233 0.083209045 0 
		9.8281312e-09 0.041604519 0 -0.072061226 -0.041604523 0 0.072061226 0.041604523 0 
		0.072061233 0 0 -1.9226323e-09 0.083209045 0 1.2356838e-08 0.041604519 0 -0.072061226 
		-0.041604523 0 -0.072061233 -0.083209045 0 -2.5709832e-09 0.041604523 9.3132257e-10 
		5.2171032e-09 0.020802259 9.3132257e-10 -0.036030613 -0.020802261 9.3132257e-10 -0.036030617 
		-0.049925435 9.3132257e-10 -2.3116429e-09 -0.020802261 9.3132257e-10 0.036030613 
		0.020802261 9.3132257e-10 0.036030617 0.041604523 0 5.165703e-09 0.020802259 0 -0.036030613 
		-0.020802261 0 -0.036030617 -0.049925435 0 -2.4567242e-09 -0.020802261 0 0.036030613 
		0.020802261 0 0.036030617;
createNode transform -n "pCylinder2";
	rename -uid "17DBE4CA-4863-F5BC-2670-00AAB5084F3D";
	setAttr ".t" -type "double3" 0 1.3252398441371793 2.7432172298431396 ;
	setAttr ".r" -type "double3" 90 0 0 ;
	setAttr ".s" -type "double3" 0.51419665074508869 0.51419665074508869 0.51419665074508869 ;
createNode transform -n "transform1" -p "pCylinder2";
	rename -uid "E6F0C4FB-4327-5D87-1232-D4B13BB935FE";
	setAttr ".v" no;
createNode mesh -n "pCylinderShape2" -p "transform1";
	rename -uid "9E6AE33A-496B-220E-E8B5-919576364ED2";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr -s 2 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.84375 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "pSphere1";
	rename -uid "626B2D0C-41F4-4B35-6031-97BE3C45364C";
	setAttr ".t" -type "double3" 0 4.2082748061890509 0 ;
	setAttr ".s" -type "double3" 1.8983319351414727 2.7776723151223739 1.8983319351414727 ;
createNode transform -n "transform3" -p "pSphere1";
	rename -uid "9357573E-417A-C6B8-93E2-51ADC7CC70E1";
	setAttr ".v" no;
createNode mesh -n "pSphereShape1" -p "transform3";
	rename -uid "EA2D6850-498C-B933-98AD-818A0FF05AF8";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr -s 2 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr -s 3 ".ciog[0].cog";
	setAttr ".pv" -type "double2" 0.50000005960464478 0.5 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "pCylinder4";
	rename -uid "E6056782-4F06-A680-23EC-D38838AB0D29";
	setAttr ".t" -type "double3" 0 1.3252398441371793 -2.7432172019768428 ;
	setAttr ".r" -type "double3" 90 180 0 ;
	setAttr ".s" -type "double3" 0.51419665074508869 0.51419665074508869 0.51419665074508869 ;
createNode mesh -n "polySurfaceShape1" -p "pCylinder4";
	rename -uid "18EA5F81-41DF-BD87-44A4-278824633469";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr -s 10 ".gtag";
	setAttr ".gtag[0].gtagnm" -type "string" "bottom";
	setAttr ".gtag[0].gtagcmp" -type "componentList" 1 "f[6:11]";
	setAttr ".gtag[1].gtagnm" -type "string" "bottomRing";
	setAttr ".gtag[1].gtagcmp" -type "componentList" 1 "e[0:5]";
	setAttr ".gtag[2].gtagnm" -type "string" "cylBottomCap";
	setAttr ".gtag[2].gtagcmp" -type "componentList" 2 "vtx[0:5]" "vtx[12]";
	setAttr ".gtag[3].gtagnm" -type "string" "cylBottomRing";
	setAttr ".gtag[3].gtagcmp" -type "componentList" 1 "vtx[0:5]";
	setAttr ".gtag[4].gtagnm" -type "string" "cylSides";
	setAttr ".gtag[4].gtagcmp" -type "componentList" 1 "vtx[0:11]";
	setAttr ".gtag[5].gtagnm" -type "string" "cylTopCap";
	setAttr ".gtag[5].gtagcmp" -type "componentList" 1 "vtx[6:11]";
	setAttr ".gtag[6].gtagnm" -type "string" "cylTopRing";
	setAttr ".gtag[6].gtagcmp" -type "componentList" 1 "vtx[6:11]";
	setAttr ".gtag[7].gtagnm" -type "string" "sides";
	setAttr ".gtag[7].gtagcmp" -type "componentList" 1 "f[0:5]";
	setAttr ".gtag[8].gtagnm" -type "string" "top";
	setAttr ".gtag[8].gtagcmp" -type "componentList" 1 "f[12:89]";
	setAttr ".gtag[9].gtagnm" -type "string" "topRing";
	setAttr ".gtag[9].gtagcmp" -type "componentList" 1 "e[6:11]";
	setAttr ".pv" -type "double2" 0.5 0.84375 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 100 ".uvst[0].uvsp[0:99]" -type "float2" 0.57812506 0.020933539
		 0.42187503 0.020933509 0.34375 0.15624997 0.421875 0.29156646 0.578125 0.29156649
		 0.65625 0.15625 0.375 0.3125 0.41666666 0.3125 0.45833331 0.3125 0.49999997 0.3125
		 0.54166663 0.3125 0.58333331 0.3125 0.625 0.3125 0.375 0.6875 0.41666666 0.6875 0.45833331
		 0.6875 0.49999997 0.6875 0.54166663 0.6875 0.58333331 0.6875 0.625 0.6875 0.57812506
		 0.70843351 0.42187503 0.70843351 0.34375 0.84375 0.421875 0.97906649 0.578125 0.97906649
		 0.65625 0.84375 0.5 0.15625 0.5 0.84375 0.578125 0.97906649 0.421875 0.97906649 0.34375
		 0.84375 0.42187503 0.70843351 0.57812506 0.70843351 0.65625 0.84375 0.578125 0.97906649
		 0.421875 0.97906649 0.34375 0.84375 0.42187503 0.70843351 0.57812506 0.70843351 0.65625
		 0.84375 0.578125 0.97906649 0.421875 0.97906649 0.34375 0.84375 0.42187503 0.70843351
		 0.57812506 0.70843351 0.65625 0.84375 0.578125 0.97906649 0.421875 0.97906649 0.34375
		 0.84375 0.42187503 0.70843351 0.57812506 0.70843351 0.65625 0.84375 0.578125 0.97906649
		 0.421875 0.97906649 0.34375 0.84375 0.42187503 0.70843351 0.57812506 0.70843351 0.65625
		 0.84375 0.578125 0.97906649 0.421875 0.97906649 0.34375 0.84375 0.42187503 0.70843351
		 0.57812506 0.70843351 0.65625 0.84375 0.578125 0.97906649 0.421875 0.97906649 0.34375
		 0.84375 0.42187503 0.70843351 0.57812506 0.70843351 0.65625 0.84375 0.578125 0.97906649
		 0.421875 0.97906649 0.34375 0.84375 0.42187503 0.70843351 0.57812506 0.70843351 0.65625
		 0.84375 0.578125 0.97906649 0.421875 0.97906649 0.34375 0.84375 0.42187503 0.70843351
		 0.57812506 0.70843351 0.65625 0.84375 0.578125 0.97906649 0.421875 0.97906649 0.34375
		 0.84375 0.42187503 0.70843351 0.57812506 0.70843351 0.65625 0.84375 0.578125 0.97906649
		 0.421875 0.97906649 0.34375 0.84375 0.42187503 0.70843351 0.57812506 0.70843351 0.65625
		 0.84375 0.578125 0.97906649 0.421875 0.97906649 0.34375 0.84375 0.42187503 0.70843351
		 0.57812506 0.70843351 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 7 ".pt[79:85]" -type "float3"  0 -3.5937319 0.0015727301 
		0 -3.5937319 0.0015725589 0 -3.6484919 -1.4579422e-07 0 -3.6484914 3.8308684e-08 
		0 -3.7032514 -0.0015725818 0 -3.7032523 -0.0015727301 0 -3.6484919 7.5338356e-08;
	setAttr -s 86 ".vt[0:85]"  0.49999955 -2.66748095 -0.86602521 -0.4999994 -2.66748095 -0.86602545
		 -0.99999881 -2.66748095 -2.3841858e-07 -0.49999943 -1.80538678 0.86602342 0.4999994 -1.80538678 0.86602342
		 0.99999881 -2.66748095 0 0.49999955 0.19461155 -0.86602521 -0.4999994 0.19461155 -0.86602545
		 -0.99999881 0.19461155 -2.3841858e-07 -0.49999943 0.19461155 0.86602342 0.4999994 0.19461155 0.86602342
		 0.99999881 0.19461155 0 0 -2.66748095 0 0.49999955 0.43574667 -0.86401987 -0.4999994 0.43574667 -0.86402035
		 -0.99999881 0.7098608 -0.042522192 -0.49999943 0.98397636 0.77897739 0.4999994 0.98397636 0.77897739
		 0.99999881 0.7098608 -0.042522192 0.49999955 0.7169981 -1.006790638 -0.4999994 0.7169981 -1.006790638
		 -0.99999881 1.11537504 -0.25077057 -0.49999943 1.51375484 0.50524712 0.4999994 1.51375484 0.50524712
		 0.99999881 1.11537504 -0.25077057 0.49999955 0.88124752 -1.19487119 -0.4999994 0.88124752 -1.19487119
		 -0.99999881 1.498106 -0.62810087 -0.49999943 2.11496115 -0.061331511 0.4999994 2.11496115 -0.061331511
		 0.99999881 1.498106 -0.62810135 0.49999955 0.97441673 -1.42695284 -0.4999994 0.97441673 -1.42695284
		 -0.99999881 1.68677044 -1.032764435 -0.49999949 2.39912605 -0.63857579 0.4999994 2.39912605 -0.63857579
		 0.99999881 1.68677187 -1.032764435 0.49999943 0.98750591 -1.71272182 -0.4999994 0.98750591 -1.71272135
		 -0.99999881 1.74576235 -1.57921028 -0.49999949 2.50401306 -1.44570017 0.49999917 2.50401306 -1.44570017
		 0.99999881 1.74576426 -1.57921171 0.49999836 0.88142204 -2.85215425 -0.49999973 0.88142204 -2.85215425
		 -0.99999923 1.62474489 -2.91012526 -0.49999991 2.36806488 -2.96809721 0.49999753 2.36806488 -2.96809721
		 0.9999966 1.6247468 -2.91012716 0.49999377 -0.23824358 -10.766922 -0.49999973 -0.23823881 -10.766922
		 -0.99999923 0.49125338 -10.90042496 -0.49999991 1.22074509 -11.03393364 0.49999219 1.22074938 -11.03393364
		 0.99998617 0.49125338 -10.90042496 0.46280465 -0.32407761 -10.96356964 -0.53718817 -0.32407331 -10.96356964
		 -1.037187457 0.27455091 -11.40132904 -0.53718811 0.87317705 -11.8390789 0.46280387 0.8731823 -11.83908081
		 0.96279705 0.27455187 -11.40133095 0.4628033 -0.46413088 -11.12004471 -0.53718787 -0.46412516 -11.12004852
		 -1.037186265 -0.087001324 -11.75860214 -0.53718722 0.29012251 -12.39716721 0.46280286 0.29012823 -12.39717102
		 0.96279448 -0.087001324 -11.75860405 0.4628011 -0.79641485 -11.29765892 -0.53718811 -0.79641104 -11.29766273
		 -1.037185192 -0.58297062 -12.0078868866 -0.53718555 -0.36952829 -12.71811295 0.4628022 -0.369524 -12.71812057
		 0.9627918 -0.58297014 -12.0078887939 0.46279973 -1.11279678 -11.33888054 -0.53718829 -1.1127944 -11.33888245
		 -1.037184238 -1.064141273 -12.078886032 -0.53718454 -1.015486717 -12.81889534 0.4628019 -1.01548481 -12.81890297
		 0.96279031 -1.06414175 -12.078891754 0.46279871 -1.50930762 -11.36495018 -0.53718829 -1.50930524 -11.36495209
		 -0.037194077 -1.46064973 -12.10495949 -1.037183642 -1.46065235 -12.10495567 -0.53718394 -1.4119978 -12.84496498
		 0.46280181 -1.41199565 -12.84497261 0.96278924 -1.46065259 -12.1049633;
	setAttr -s 174 ".ed";
	setAttr ".ed[0:165]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 0 0 6 7 0 7 8 0 8 9 1
		 9 10 1 10 11 1 11 6 0 0 6 0 1 7 0 2 8 0 3 9 0 4 10 0 5 11 0 12 0 1 12 1 1 12 2 1
		 12 3 1 12 4 1 12 5 1 6 13 0 7 14 0 13 14 1 8 15 0 14 15 1 9 16 0 15 16 1 10 17 0
		 16 17 1 11 18 0 17 18 1 18 13 1 13 19 0 14 20 0 19 20 1 15 21 0 20 21 1 16 22 0 21 22 1
		 17 23 0 22 23 1 18 24 0 23 24 1 24 19 1 19 25 0 20 26 0 25 26 1 21 27 0 26 27 1 22 28 0
		 27 28 1 23 29 0 28 29 1 24 30 0 29 30 1 30 25 1 25 31 0 26 32 0 31 32 1 27 33 0 32 33 1
		 28 34 0 33 34 1 29 35 0 34 35 1 30 36 0 35 36 1 36 31 1 31 37 0 32 38 0 37 38 1 33 39 0
		 38 39 1 34 40 0 39 40 1 35 41 0 40 41 1 36 42 0 41 42 1 42 37 1 37 43 0 38 44 0 43 44 1
		 39 45 0 44 45 1 40 46 0 45 46 1 41 47 0 46 47 1 42 48 0 47 48 1 48 43 1 43 49 0 44 50 0
		 49 50 1 45 51 0 50 51 1 46 52 0 51 52 1 47 53 0 52 53 1 48 54 0 53 54 1 54 49 1 49 55 0
		 50 56 0 55 56 1 51 57 0 56 57 1 52 58 0 57 58 1 53 59 0 58 59 1 54 60 0 59 60 1 60 55 1
		 55 61 0 56 62 0 61 62 1 57 63 0 62 63 1 58 64 0 63 64 1 59 65 0 64 65 1 60 66 0 65 66 1
		 66 61 1 61 67 0 62 68 0 67 68 1 63 69 0 68 69 1 64 70 0 69 70 1 65 71 0 70 71 1 66 72 0
		 71 72 1 72 67 1 67 73 0 68 74 0 73 74 1 69 75 0 74 75 1 70 76 0 75 76 1 71 77 0 76 77 1
		 72 78 0 77 78 1 78 73 1 73 79 0 74 80 0 79 80 0 80 81 1 79 81 1 75 82 0 80 82 0 82 81 1
		 76 83 0 82 83 0;
	setAttr ".ed[166:173]" 83 81 1 77 84 0 83 84 0 84 81 1 78 85 0 84 85 0 85 81 1
		 85 79 0;
	setAttr -s 90 -ch 348 ".fc[0:89]" -type "polyFaces" 
		f 4 0 13 -7 -13
		mu 0 4 6 7 14 13
		f 4 1 14 -8 -14
		mu 0 4 7 8 15 14
		f 4 2 15 -9 -15
		mu 0 4 8 9 16 15
		f 4 3 16 -10 -16
		mu 0 4 9 10 17 16
		f 4 4 17 -11 -17
		mu 0 4 10 11 18 17
		f 4 5 12 -12 -18
		mu 0 4 11 12 19 18
		f 3 -1 -19 19
		mu 0 3 1 0 26
		f 3 -2 -20 20
		mu 0 3 2 1 26
		f 3 -3 -21 21
		mu 0 3 3 2 26
		f 3 -4 -22 22
		mu 0 3 4 3 26
		f 3 -5 -23 23
		mu 0 3 5 4 26
		f 3 -6 -24 18
		mu 0 3 0 5 26
		f 3 158 159 -161
		mu 0 3 94 95 27
		f 3 162 163 -160
		mu 0 3 95 96 27
		f 3 165 166 -164
		mu 0 3 96 97 27
		f 3 168 169 -167
		mu 0 3 97 98 27
		f 3 171 172 -170
		mu 0 3 98 99 27
		f 3 173 160 -173
		mu 0 3 99 94 27
		f 4 6 25 -27 -25
		mu 0 4 24 23 29 28
		f 4 7 27 -29 -26
		mu 0 4 23 22 30 29
		f 4 8 29 -31 -28
		mu 0 4 22 21 31 30
		f 4 9 31 -33 -30
		mu 0 4 21 20 32 31
		f 4 10 33 -35 -32
		mu 0 4 20 25 33 32
		f 4 11 24 -36 -34
		mu 0 4 25 24 28 33
		f 4 26 37 -39 -37
		mu 0 4 28 29 35 34
		f 4 28 39 -41 -38
		mu 0 4 29 30 36 35
		f 4 30 41 -43 -40
		mu 0 4 30 31 37 36
		f 4 32 43 -45 -42
		mu 0 4 31 32 38 37
		f 4 34 45 -47 -44
		mu 0 4 32 33 39 38
		f 4 35 36 -48 -46
		mu 0 4 33 28 34 39
		f 4 38 49 -51 -49
		mu 0 4 34 35 41 40
		f 4 40 51 -53 -50
		mu 0 4 35 36 42 41
		f 4 42 53 -55 -52
		mu 0 4 36 37 43 42
		f 4 44 55 -57 -54
		mu 0 4 37 38 44 43
		f 4 46 57 -59 -56
		mu 0 4 38 39 45 44
		f 4 47 48 -60 -58
		mu 0 4 39 34 40 45
		f 4 50 61 -63 -61
		mu 0 4 40 41 47 46
		f 4 52 63 -65 -62
		mu 0 4 41 42 48 47
		f 4 54 65 -67 -64
		mu 0 4 42 43 49 48
		f 4 56 67 -69 -66
		mu 0 4 43 44 50 49
		f 4 58 69 -71 -68
		mu 0 4 44 45 51 50
		f 4 59 60 -72 -70
		mu 0 4 45 40 46 51
		f 4 62 73 -75 -73
		mu 0 4 46 47 53 52
		f 4 64 75 -77 -74
		mu 0 4 47 48 54 53
		f 4 66 77 -79 -76
		mu 0 4 48 49 55 54
		f 4 68 79 -81 -78
		mu 0 4 49 50 56 55
		f 4 70 81 -83 -80
		mu 0 4 50 51 57 56
		f 4 71 72 -84 -82
		mu 0 4 51 46 52 57
		f 4 74 85 -87 -85
		mu 0 4 52 53 59 58
		f 4 76 87 -89 -86
		mu 0 4 53 54 60 59
		f 4 78 89 -91 -88
		mu 0 4 54 55 61 60
		f 4 80 91 -93 -90
		mu 0 4 55 56 62 61
		f 4 82 93 -95 -92
		mu 0 4 56 57 63 62
		f 4 83 84 -96 -94
		mu 0 4 57 52 58 63
		f 4 86 97 -99 -97
		mu 0 4 58 59 65 64
		f 4 88 99 -101 -98
		mu 0 4 59 60 66 65
		f 4 90 101 -103 -100
		mu 0 4 60 61 67 66
		f 4 92 103 -105 -102
		mu 0 4 61 62 68 67
		f 4 94 105 -107 -104
		mu 0 4 62 63 69 68
		f 4 95 96 -108 -106
		mu 0 4 63 58 64 69
		f 4 98 109 -111 -109
		mu 0 4 64 65 71 70
		f 4 100 111 -113 -110
		mu 0 4 65 66 72 71
		f 4 102 113 -115 -112
		mu 0 4 66 67 73 72
		f 4 104 115 -117 -114
		mu 0 4 67 68 74 73
		f 4 106 117 -119 -116
		mu 0 4 68 69 75 74
		f 4 107 108 -120 -118
		mu 0 4 69 64 70 75
		f 4 110 121 -123 -121
		mu 0 4 70 71 77 76
		f 4 112 123 -125 -122
		mu 0 4 71 72 78 77
		f 4 114 125 -127 -124
		mu 0 4 72 73 79 78
		f 4 116 127 -129 -126
		mu 0 4 73 74 80 79
		f 4 118 129 -131 -128
		mu 0 4 74 75 81 80
		f 4 119 120 -132 -130
		mu 0 4 75 70 76 81
		f 4 122 133 -135 -133
		mu 0 4 76 77 83 82
		f 4 124 135 -137 -134
		mu 0 4 77 78 84 83
		f 4 126 137 -139 -136
		mu 0 4 78 79 85 84
		f 4 128 139 -141 -138
		mu 0 4 79 80 86 85
		f 4 130 141 -143 -140
		mu 0 4 80 81 87 86
		f 4 131 132 -144 -142
		mu 0 4 81 76 82 87
		f 4 134 145 -147 -145
		mu 0 4 82 83 89 88
		f 4 136 147 -149 -146
		mu 0 4 83 84 90 89
		f 4 138 149 -151 -148
		mu 0 4 84 85 91 90
		f 4 140 151 -153 -150
		mu 0 4 85 86 92 91
		f 4 142 153 -155 -152
		mu 0 4 86 87 93 92
		f 4 143 144 -156 -154
		mu 0 4 87 82 88 93
		f 4 146 157 -159 -157
		mu 0 4 88 89 95 94
		f 4 148 161 -163 -158
		mu 0 4 89 90 96 95
		f 4 150 164 -166 -162
		mu 0 4 90 91 97 96
		f 4 152 167 -169 -165
		mu 0 4 91 92 98 97
		f 4 154 170 -172 -168
		mu 0 4 92 93 99 98
		f 4 155 156 -174 -171
		mu 0 4 93 88 94 99;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "transform2" -p "pCylinder4";
	rename -uid "9715BC4B-45F8-8675-3DA1-3B85C3B8AB68";
	setAttr ".v" no;
createNode mesh -n "pCylinderShape4" -p "transform2";
	rename -uid "CED43EA3-43B4-80ED-1275-87924068F64B";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr -s 2 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.84375 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "pCylinder5";
	rename -uid "D252BC24-48D0-0A31-500D-6F88828E3BC3";
	setAttr ".s" -type "double3" 0.72780096231148206 0.99091422339673341 0.91136402012829842 ;
	setAttr ".rp" -type "double3" 5.5511151231257827e-17 4.4054119355266561 1.3933148412803575e-08 ;
	setAttr ".sp" -type "double3" 5.5511151231257827e-17 4.4054119355266561 1.3933148412803575e-08 ;
createNode transform -n "transform5" -p "pCylinder5";
	rename -uid "A73E6465-4F7F-9B26-CE27-60938391382C";
	setAttr ".v" no;
createNode mesh -n "pCylinder5Shape" -p "transform5";
	rename -uid "C07B2A5F-4375-4848-619E-9A9B2E1D3C07";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr -s 2 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.50000004470348358 0.70843350887298584 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 172 ".pt";
	setAttr ".pt[0:165]" -type "float3"  0 0 0.1831615 0 0 0.1831615 0 0 0.1831615 
		0 0 0.24235693 0 0 0.24235693 0 0 0.1831615 0 0 0.37968618 0 0 0.37968618 0 0 0.37968618 
		0 0 0.37968618 0 0 0.37968618 0 0 0.37968618 0 0 0.1831615 0 0 0.39624372 0 0 0.39624372 
		0 0 0.41506565 0 0 0.43388757 0 0 0.43388757 0 0 0.41506565 0 0 0.4155556 0 0 0.4155556 
		0 0 0.44291013 0 0 0.4702647 0 0 0.4702647 0 0 0.44291013 0 0 0.42683387 0 0 0.42683387 
		0 0 0.46919036 0 0 0.51154643 0 0 0.51154643 0 0 0.46919036 0 0 0.43323132 0 0 0.43323132 
		0 0 0.48214477 0 0 0.53105855 0 0 0.53105855 0 0 0.48214498 0 0 0.43413007 0 0 0.43413007 
		0 0 0.48619553 0 0 0.53826064 0 0 0.53826064 0 0 0.48619565 0 0 0.42684573 0 0 0.42684573 
		0 0 0.47788587 0 0 0.52892566 0 0 0.52892566 0 0 0.47788599 0 5.9604645e-08 0.34996423 
		0 5.9604645e-08 0.34996456 0 5.9604645e-08 0.40005493 0 5.9604645e-08 0.45014533 
		0 5.9604645e-08 0.45014539 0 5.9604645e-08 0.40005493 0 5.9604645e-08 0.34407055 
		0 5.9604645e-08 0.34407088 0 5.9604645e-08 0.3851749 0 5.9604645e-08 0.42627993 0 
		5.9604645e-08 0.4262799 0 5.9604645e-08 0.3851752 0 5.9604645e-08 0.33445382 0 5.9604645e-08 
		0.33445424 0 5.9604645e-08 0.36034933 0 5.9604645e-08 0.38624439 0 5.9604645e-08 
		0.3862448 0 5.9604645e-08 0.36034933 0 5.9604645e-08 0.3116377 0 5.9604645e-08 0.31163794 
		0 5.9604645e-08 0.32629374 0 5.9604645e-08 0.34094965 0 5.9604645e-08 0.34095007 
		0 5.9604645e-08 0.32629392 0 5.9604645e-08 0.28991339 0 5.9604645e-08 0.28991359 
		0 5.9604645e-08 0.29325429 0 5.9604645e-08 0.29659516 0 5.9604645e-08 0.29659531 
		0 5.9604645e-08 0.29325426 0 5.9604645e-08 0.015924552 0 5.9604645e-08 0.015924776 
		0 5.9604645e-08 0.015505596 0 5.9604645e-08 0.015505438 0 5.9604645e-08 0.015086196 
		0 5.9604645e-08 0.015086323 0 5.9604645e-08 0.015505405 0 0 -0.1831615 0 0 -0.1831615 
		0 0 -0.1831615 0 0 -0.24235693 0 0 -0.24235693 0 0 -0.1831615 0 0 -0.37968618 0 0 
		-0.37968618 0 0 -0.37968618 0 0 -0.37968618 0 0 -0.37968618 0 0 -0.37968618 0 0 -0.1831615 
		0 0 -0.39624372 0 0 -0.39624372 0 0 -0.41506565 0 0 -0.43388757 0 0 -0.43388757 0 
		0 -0.41506565 0 0 -0.4155556 0 0 -0.4155556 0 0 -0.44291013 0 0 -0.4702647 0 0 -0.4702647 
		0 0 -0.44291013 0 0 -0.42683387 0 0 -0.42683387 0 0 -0.46919036 0 0 -0.51154643 0 
		0 -0.51154643 0 0 -0.46919036 0 0 -0.43323132 0 0 -0.43323132 0 0 -0.48214477 0 0 
		-0.53105855 0 0 -0.53105855 0 0 -0.48214498 0 0 -0.43413007 0 0 -0.43413007 0 0 -0.48619553 
		0 0 -0.53826064 0 0 -0.53826064 0 0 -0.48619565 0 0 -0.42684573 0 0 -0.42684573 0 
		0 -0.47788587 0 0 -0.52892566 0 0 -0.52892566 0 0 -0.47788599 0 5.9604645e-08 -0.34996423 
		0 5.9604645e-08 -0.34996456 0 5.9604645e-08 -0.40005493 0 5.9604645e-08 -0.45014533 
		0 5.9604645e-08 -0.45014539 0 5.9604645e-08 -0.40005493 0 5.9604645e-08 -0.34407055 
		0 5.9604645e-08 -0.34407088 0 5.9604645e-08 -0.3851749 0 5.9604645e-08 -0.42627993 
		0 5.9604645e-08 -0.4262799 0 5.9604645e-08 -0.3851752 0 5.9604645e-08 -0.33445382 
		0 5.9604645e-08 -0.33445424 0 5.9604645e-08 -0.36034933 0 5.9604645e-08 -0.38624439 
		0 5.9604645e-08 -0.3862448 0 5.9604645e-08 -0.36034933 0 5.9604645e-08 -0.3116377 
		0 5.9604645e-08 -0.31163794 0 5.9604645e-08 -0.32629374 0 5.9604645e-08 -0.34094965 
		0 5.9604645e-08 -0.34095007 0 5.9604645e-08 -0.32629392 0 5.9604645e-08 -0.28991339 
		0 5.9604645e-08 -0.28991359 0 5.9604645e-08 -0.29325429 0 5.9604645e-08 -0.29659516 
		0 5.9604645e-08 -0.29659531 0 5.9604645e-08 -0.29325426 0 5.9604645e-08 -0.015924552;
	setAttr ".pt[166:171]" 0 5.9604645e-08 -0.015924776 0 5.9604645e-08 -0.015505596 
		0 5.9604645e-08 -0.015505438 0 5.9604645e-08 -0.015086196 0 5.9604645e-08 -0.015086323 
		0 5.9604645e-08 -0.015505405;
createNode transform -n "pCylinder6";
	rename -uid "5A088CCE-42D1-66C6-C644-2F8E2B332AA0";
	setAttr ".t" -type "double3" 0 7.4676715272623966 0 ;
	setAttr ".s" -type "double3" 1.3229688593653228 0.48244595403503776 1.3229688593653228 ;
createNode transform -n "transform4" -p "pCylinder6";
	rename -uid "899284C5-4947-9BCF-925B-BE9AE0295635";
	setAttr ".v" no;
createNode mesh -n "pCylinderShape5" -p "transform4";
	rename -uid "2E81870A-407C-F768-2EA9-5EAFAA48A9F6";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr -s 2 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr -s 3 ".ciog[0].cog";
	setAttr ".pv" -type "double2" 0.50000005960464478 0.5 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "pCylinder7";
	rename -uid "B58121CC-459B-3246-89CB-AEB6726EEB98";
	setAttr ".rp" -type "double3" 0 4.7608222875166089 1.2349783418130755e-09 ;
	setAttr ".sp" -type "double3" 0 4.7608222875166089 1.2349783418130755e-09 ;
createNode mesh -n "pCylinder7Shape" -p "pCylinder7";
	rename -uid "4859281D-4F90-5765-FF99-6EA9948D27C3";
	setAttr -k off ".v";
	setAttr -s 2 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode lightLinker -s -n "lightLinker1";
	rename -uid "56633B25-434B-2687-2917-3A95576B98FA";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "F921EF8A-497F-1364-C4F3-4EAC2E35D2F8";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "92833825-4F2D-BC56-5588-9A924A06D163";
createNode displayLayerManager -n "layerManager";
	rename -uid "059D6EC9-4C59-F8EC-9D19-6F9B1896AD09";
createNode displayLayer -n "defaultLayer";
	rename -uid "5C34A445-4E78-8946-3239-13B0D513E2AE";
	setAttr ".ufem" -type "stringArray" 0  ;
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "007FFE7E-4A85-D925-B862-12A1061622BF";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "B004C696-4E09-7ED9-9E74-E6B4314C9204";
	setAttr ".g" yes;
createNode polyCylinder -n "polyCylinder1";
	rename -uid "36A02057-43B0-F377-59B6-10A5B52152BA";
	setAttr ".sa" 6;
	setAttr ".sc" 1;
	setAttr ".cuv" 3;
createNode polySplit -n "polySplit1";
	rename -uid "69869966-4C89-F24D-E4C1-7EBFDC6C6B30";
	setAttr -s 7 ".e[0:6]"  0.5 0.5 0.5 0.5 0.5 0.5 0.5;
	setAttr -s 7 ".d[0:6]"  -2147483620 -2147483619 -2147483624 -2147483623 -2147483622 -2147483621 
		-2147483620;
	setAttr ".sma" 180;
	setAttr ".m2015" yes;
createNode polyTweak -n "polyTweak1";
	rename -uid "D3D4F69F-48CD-2F3D-FAB5-5396C17B81C6";
	setAttr ".uopa" yes;
	setAttr -s 7 ".tk";
	setAttr ".tk[0]" -type "float3" 0 1.7334954 0 ;
	setAttr ".tk[1]" -type "float3" 0 1.7334954 0 ;
	setAttr ".tk[2]" -type "float3" 0 1.7334954 0 ;
	setAttr ".tk[3]" -type "float3" 0 1.7334954 0 ;
	setAttr ".tk[4]" -type "float3" 0 1.7334954 0 ;
	setAttr ".tk[5]" -type "float3" 0 1.7334954 0 ;
	setAttr ".tk[12]" -type "float3" 0 1.7334954 0 ;
createNode polyBevel3 -n "polyBevel1";
	rename -uid "793C67D0-40FF-6010-5CEA-24AB0A696F2B";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[0:5]";
	setAttr ".ix" -type "matrix" 3.8379965076610794 0 0 0 0 3.8379965076610794 0 0 0 0 3.8379965076610794 0
		 0 -3.177660889992481 0 1;
	setAttr ".ws" yes;
	setAttr ".oaf" yes;
	setAttr ".f" 0.19999999999999996;
	setAttr ".at" 180;
	setAttr ".sn" yes;
	setAttr ".mv" yes;
	setAttr ".mvt" 0.0001;
	setAttr ".sa" 30;
createNode polyTweak -n "polyTweak2";
	rename -uid "83880079-44BC-87D0-B6BD-C3A6A05CB217";
	setAttr ".uopa" yes;
	setAttr -s 10 ".tk";
	setAttr ".tk[13]" -type "float3" 0 0.17579025 1.5805352e-08 ;
	setAttr ".tk[14]" -type "float3" 0.16266204 0.17579025 0.28173968 ;
	setAttr ".tk[15]" -type "float3" 0.32532409 0.17579025 9.6954134e-09 ;
	setAttr ".tk[16]" -type "float3" 0.16266192 0.17579025 -0.28173971 ;
	setAttr ".tk[17]" -type "float3" -0.1626621 0.17579025 -0.28173968 ;
	setAttr ".tk[18]" -type "float3" -0.32532409 0.17579025 -3.8781653e-08 ;
	setAttr ".tk[19]" -type "float3" -0.16266192 0.17579025 0.28173968 ;
createNode polySplit -n "polySplit2";
	rename -uid "7BCCF104-4DFB-9EBB-DDB3-E1BF6E3B32DC";
	setAttr -s 7 ".e[0:6]"  0.5 0.5 0.5 0.5 0.5 0.5 0.5;
	setAttr -s 7 ".d[0:6]"  -2147483636 -2147483635 -2147483634 -2147483633 -2147483632 -2147483631 
		-2147483636;
	setAttr ".sma" 180;
	setAttr ".m2015" yes;
createNode polyExtrudeFace -n "polyExtrudeFace1";
	rename -uid "3AFB9694-40DC-1D28-9E89-068A91E295CC";
	setAttr ".ics" -type "componentList" 1 "f[0:5]";
	setAttr ".ix" -type "matrix" 3.8379965076610794 0 0 0 0 3.8379965076610794 0 0 0 0 3.8379965076610794 0
		 0 -3.177660889992481 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0 1.6631358 0 ;
	setAttr ".rs" 34487;
	setAttr ".lt" -type "double3" 0 0 0.43854719909297923 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -1.5837954271686139 1.6631358102050129 -1.3716086759991128 ;
	setAttr ".cbx" -type "double3" 1.5837954271686139 1.6631358102050129 1.3716086759991128 ;
createNode polyTweak -n "polyTweak3";
	rename -uid "431384FF-47B1-FBF8-E27B-E6934E179039";
	setAttr ".uopa" yes;
	setAttr -s 7 ".tk";
	setAttr ".tk[7]" -type "float3" 0 0.085491844 0 ;
	setAttr ".tk[26]" -type "float3" 0 0.085491844 0 ;
	setAttr ".tk[27]" -type "float3" 0 0.085491844 0 ;
	setAttr ".tk[28]" -type "float3" 0 0.085491844 0 ;
	setAttr ".tk[29]" -type "float3" 0 0.085491844 0 ;
	setAttr ".tk[30]" -type "float3" 0 0.085491844 0 ;
	setAttr ".tk[31]" -type "float3" 0 0.085491844 0 ;
createNode polyCylinder -n "polyCylinder2";
	rename -uid "34DEFCC3-4DC8-C971-402F-2B9EC60B355C";
	setAttr ".sa" 6;
	setAttr ".sc" 1;
	setAttr ".cuv" 3;
createNode polyExtrudeFace -n "polyExtrudeFace2";
	rename -uid "36269591-46C7-288F-E8BE-A58B34E9A03F";
	setAttr ".ics" -type "componentList" 1 "f[12:17]";
	setAttr ".ix" -type "matrix" 0.51419665074508869 0 0 0 0 0 0.51419665074508869 0
		 0 -0.51419665074508869 0 0 0 1.3252398441371793 2.7432172298431396 1;
	setAttr ".ws" yes;
	setAttr ".ro" -type "double3" -18.452617896861835 0 0 ;
	setAttr ".pvt" -type "float3" 0 1.3252399 3.2574139 ;
	setAttr ".rs" 38972;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -0.51419665074508869 0.87993245939502884 3.2574138805882282 ;
	setAttr ".cbx" -type "double3" 0.51419665074508869 1.7705472595278384 3.2574138805882282 ;
createNode polyTweak -n "polyTweak4";
	rename -uid "DCE91D0A-4344-8E26-B696-F197CD96588F";
	setAttr ".uopa" yes;
	setAttr -s 8 ".tk";
	setAttr ".tk[0]" -type "float3" 0 -1.6674789 0 ;
	setAttr ".tk[1]" -type "float3" 0 -1.6674789 0 ;
	setAttr ".tk[2]" -type "float3" 0 -1.6674789 0 ;
	setAttr ".tk[5]" -type "float3" 0 -1.6674789 0 ;
	setAttr ".tk[12]" -type "float3" 0 -1.6674789 0 ;
createNode polyExtrudeFace -n "polyExtrudeFace3";
	rename -uid "27ED3ACF-454B-AEF9-5CDD-C9B2BEAB9E6B";
	setAttr ".ics" -type "componentList" 1 "f[12:17]";
	setAttr ".ix" -type "matrix" 0.51419665074508869 0 0 0 0 0 0.51419665074508869 0
		 0 -0.51419665074508869 0 0 0 1.3252398441371793 2.7432172298431396 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0 1.3471038 3.5223525 ;
	setAttr ".rs" 62457;
	setAttr ".lt" -type "double3" -9.9261673506363321e-24 1.3877787807814457e-17 0.21981631835161972 ;
	setAttr ".lr" -type "double3" -18.667992879081989 0 0 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -0.51419662009657996 0.92469160281557183 3.381403587227398 ;
	setAttr ".cbx" -type "double3" 0.51419662009657996 1.7695161517492286 3.6633012147215633 ;
createNode polyTweak -n "polyTweak5";
	rename -uid "4C869BEE-4F4F-895C-64F3-6CBD02F772FB";
	setAttr ".uopa" yes;
	setAttr -s 7 ".tk[13:19]" -type "float3"  0 0.51524794 -0.042520378
		 0 0.51524794 -0.042520378 0 0.51524794 -0.042520378 0 0.51524794 -0.042520378 0 0.51524794
		 -0.042520378 0 0.51524794 -0.042520378 0 0.51524794 -0.042520378;
createNode polyExtrudeFace -n "polyExtrudeFace4";
	rename -uid "30FAE85C-46F9-2C90-04B7-879275D0ECD6";
	setAttr ".ics" -type "componentList" 1 "f[12:17]";
	setAttr ".ix" -type "matrix" 0.51419665074508869 0 0 0 0 0 0.51419665074508869 0
		 0 -0.51419665074508869 0 0 0 1.3252398441371793 2.7432172298431396 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0 1.4541854 3.7308669 ;
	setAttr ".rs" 42766;
	setAttr ".lt" -type "double3" -2.3161057151484775e-23 -4.5796699765787707e-16 0.22244864313429336 ;
	setAttr ".lr" -type "double3" -22.800616256663972 0 0 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -0.51419655879956261 1.0654425191418988 3.526022069516646 ;
	setAttr ".cbx" -type "double3" 0.51419655879956261 1.8429282181828492 3.9357117189378532 ;
createNode polyTweak -n "polyTweak6";
	rename -uid "D5775A45-4AA1-796D-50B8-F791798C7662";
	setAttr ".uopa" yes;
	setAttr -s 7 ".tk[19:25]" -type "float3"  0 0 -0.072939217 0 0 -0.072939217
		 0 0 -0.072939217 0 0 -0.072939217 0 0 -0.072939217 0 0 -0.072939217 0 0 -0.072939217;
createNode polyExtrudeFace -n "polyExtrudeFace5";
	rename -uid "6A4A8C44-4FB3-CF6D-AD06-4289B7E9864E";
	setAttr ".ics" -type "componentList" 1 "f[12:17]";
	setAttr ".ix" -type "matrix" 0.51419665074508869 0 0 0 0 0 0.51419665074508869 0
		 0 -0.51419665074508869 0 0 0 1.3252398441371793 2.7432172298431396 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0 1.6482073 3.9276645 ;
	setAttr ".rs" 60395;
	setAttr ".lt" -type "double3" 0 8.3266726846886741e-17 0.28257090022448572 ;
	setAttr ".lr" -type "double3" -27.237142343038261 0 0 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -0.51419649750254515 1.3567759796346088 3.6104794907080953 ;
	setAttr ".cbx" -type "double3" 0.51419649750254515 1.9396386066724118 4.2448496183815259 ;
createNode polyTweak -n "polyTweak7";
	rename -uid "1258BF41-4E69-509C-0AE6-5485F35D135C";
	setAttr ".uopa" yes;
	setAttr -s 7 ".tk[25:31]" -type "float3"  0 -0.087553672 -0.09313371
		 0 -0.087553672 -0.09313371 0 -2.8889254e-08 -0.17565458 0 3.9650338e-08 -0.17565458
		 0 0.087553658 -0.25817522 0 0.087553605 -0.25817522 0 -2.8889254e-08 -0.17565458;
createNode polyExtrudeFace -n "polyExtrudeFace6";
	rename -uid "A592CF92-48A4-035E-90CF-4DAAA11A52CD";
	setAttr ".ics" -type "componentList" 1 "f[12:17]";
	setAttr ".ix" -type "matrix" 0.51419665074508869 0 0 0 0 0 0.51419665074508869 0
		 0 -0.51419665074508869 0 0 0 1.3252398441371793 2.7432172298431396 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0 1.8562838 4.0246768 ;
	setAttr ".rs" 54896;
	setAttr ".lt" -type "double3" 0 -1.9428902930940239e-16 0.30364609116361568 ;
	setAttr ".lr" -type "double3" -37.94460867565558 0 0 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -0.51419643620552768 1.6535933777912208 3.6583860520823452 ;
	setAttr ".cbx" -type "double3" 0.51419643620552768 2.0589742146695755 4.3909674870139996 ;
createNode polyTweak -n "polyTweak8";
	rename -uid "202BE1A0-41E5-E4CC-87C9-CE870D814259";
	setAttr ".uopa" yes;
	setAttr -s 7 ".tk[31:37]" -type "float3"  0 -0.183139 0 0 -0.183139
		 0 0 -0.183139 0 0 -0.183139 0 0 -0.183139 0 0 -0.183139 0 0 -0.183139 0;
createNode polyExtrudeFace -n "polyExtrudeFace7";
	rename -uid "AD2829D4-4697-DBE0-555A-3C85FB13A811";
	setAttr ".ics" -type "componentList" 1 "f[12:17]";
	setAttr ".ix" -type "matrix" 0.51419665074508869 0 0 0 0 0 0.51419665074508869 0
		 0 -0.51419665074508869 0 0 0 1.3252398441371793 2.7432172298431396 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -1.685668e-07 2.1372647 4.0550084 ;
	setAttr ".rs" 36037;
	setAttr ".lt" -type "double3" -1.5799149699762829e-22 -3.6082248300317588e-16 0.76960868168993246 ;
	setAttr ".lr" -type "double3" -28.891047266094798 0 0 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -0.51419637490851033 2.0686139062238205 3.665116403298561 ;
	setAttr ".cbx" -type "double3" 0.51419603777491441 2.2059156700281677 4.4449007711414472 ;
createNode polyTweak -n "polyTweak9";
	rename -uid "8B36ACE3-47B8-A082-E03B-71821E69317F";
	setAttr ".uopa" yes;
	setAttr -s 7 ".tk[37:43]" -type "float3"  0 -0.22692749 -0.029753238
		 0 -0.22692749 -0.029753238 0 -0.22692749 -0.029753238 0 -0.22692749 -0.029753238
		 0 -0.22692749 -0.029753238 0 -0.22692749 -0.029753238 0 -0.22692749 -0.029753238;
createNode polyExtrudeFace -n "polyExtrudeFace8";
	rename -uid "C33893D0-4451-03C1-16A7-80A8FDF57AC7";
	setAttr ".ics" -type "componentList" 1 "f[12:17]";
	setAttr ".ix" -type "matrix" 0.51419665074508869 0 0 0 0 0 0.51419665074508869 0
		 0 -0.51419665074508869 0 0 0 1.3252398441371793 2.7432172298431396 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -8.5815822e-07 2.8216169 3.9927814 ;
	setAttr ".rs" 60524;
	setAttr ".lt" -type "double3" 0 3.6082248300317588e-16 3.0841457729461648 ;
	setAttr ".lr" -type "double3" -11.823077906077764 0 0 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -0.51419662009657996 2.7918082546100376 3.6105679423042392 ;
	setAttr ".cbx" -type "double3" 0.51419490378009214 2.8514257337573135 4.3749949554015375 ;
createNode polyTweak -n "polyTweak10";
	rename -uid "9F5C4914-4C17-DE59-70CE-E48E4CEF3EC1";
	setAttr ".uopa" yes;
	setAttr -s 7 ".tk[43:49]" -type "float3"  0 -0.38056111 0.14313042 0
		 -0.38056111 0.14313042 0 -0.38056111 0.14313042 0 -0.38056111 0.14313042 0 -0.38056111
		 0.14313042 0 -0.38056111 0.14313042 0 -0.38056111 0.14313042;
createNode polySphere -n "polySphere1";
	rename -uid "2215DFF2-44F3-5234-AD7D-F0A256191ED6";
	setAttr ".sa" 10;
	setAttr ".sh" 10;
createNode polySplit -n "polySplit3";
	rename -uid "67B539EB-4251-62BD-AE9D-A99690363645";
	setAttr -s 7 ".e[0:6]"  0.5 0.5 0.5 0.40000001 0.5 0.5 0.5;
	setAttr -s 7 ".d[0:6]"  -2147483581 -2147483578 -2147483575 -2147483572 -2147483584 -2147483585 
		-2147483581;
	setAttr ".sma" 180;
	setAttr ".m2015" yes;
createNode polyExtrudeEdge -n "polyExtrudeEdge1";
	rename -uid "C131664F-4B5F-3B3A-40E7-65ADCF5AC1DF";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[84:89]";
	setAttr ".ix" -type "matrix" 3.8379965076610794 0 0 0 0 3.8379965076610794 0 0 0 0 3.8379965076610794 0
		 0 -3.177660889992481 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.0791898 2.1016824 0 ;
	setAttr ".rs" 41020;
	setAttr ".lt" -type "double3" 0 0 0.10697046213846528 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -0.79189771358430694 2.1016825169438782 -0.68580433799955642 ;
	setAttr ".cbx" -type "double3" 0.95027731349177291 2.1016825169438782 0.68580433799955642 ;
createNode polyExtrudeFace -n "polyExtrudeFace9";
	rename -uid "5F7CB795-4CA1-66F8-11CE-3A99557BF7AA";
	setAttr ".ics" -type "componentList" 1 "f[12:17]";
	setAttr ".ix" -type "matrix" 0.51419665074508869 0 0 0 0 0 0.51419665074508869 0
		 0 -0.51419665074508869 0 0 0 1.3252398441371793 2.7432172298431396 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -3.4326329e-06 6.9302039 2.9958186 ;
	setAttr ".rs" 36611;
	setAttr ".lt" -type "double3" 0 8.4654505627668186e-16 0.3162670088474992 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -0.51419655879956261 6.8615555642404953 2.6207144662526587 ;
	setAttr ".cbx" -type "double3" 0.51418969353361099 6.9988520565013435 3.3709227780000508 ;
createNode polyTweak -n "polyTweak11";
	rename -uid "2CB29339-48AA-7B41-1196-25B0A4494B27";
	setAttr ".uopa" yes;
	setAttr -s 51 ".tk";
	setAttr ".tk[3]" -type "float3" 0 -0.80538279 0 ;
	setAttr ".tk[4]" -type "float3" 0 -0.80538279 0 ;
	setAttr ".tk[6]" -type "float3" 0 -0.80538279 0 ;
	setAttr ".tk[7]" -type "float3" 0 -0.80538279 0 ;
	setAttr ".tk[8]" -type "float3" 0 -0.80538279 0 ;
	setAttr ".tk[9]" -type "float3" 0 -0.80538279 0 ;
	setAttr ".tk[10]" -type "float3" 0 -0.80538279 0 ;
	setAttr ".tk[11]" -type "float3" 0 -0.80538279 0 ;
	setAttr ".tk[13]" -type "float3" 0 -0.80538279 0 ;
	setAttr ".tk[14]" -type "float3" 0 -0.80538279 0 ;
	setAttr ".tk[15]" -type "float3" 0 -0.80538279 0 ;
	setAttr ".tk[16]" -type "float3" 0 -0.80538279 0 ;
	setAttr ".tk[17]" -type "float3" 0 -0.80538279 0 ;
	setAttr ".tk[18]" -type "float3" 0 -0.80538279 0 ;
	setAttr ".tk[19]" -type "float3" 0 -0.80538279 0 ;
	setAttr ".tk[20]" -type "float3" 0 -0.80538279 0 ;
	setAttr ".tk[21]" -type "float3" 0 -0.80538279 0 ;
	setAttr ".tk[22]" -type "float3" 0 -0.80538279 0 ;
	setAttr ".tk[23]" -type "float3" 0 -0.80538279 0 ;
	setAttr ".tk[24]" -type "float3" 0 -0.80538279 0 ;
	setAttr ".tk[25]" -type "float3" 0 -0.80538279 0 ;
	setAttr ".tk[26]" -type "float3" 0 -0.80538279 0 ;
	setAttr ".tk[27]" -type "float3" 0 -0.80538279 0 ;
	setAttr ".tk[28]" -type "float3" 0 -0.80538279 0 ;
	setAttr ".tk[29]" -type "float3" 0 -0.80538279 0 ;
	setAttr ".tk[30]" -type "float3" 0 -0.80538279 0 ;
	setAttr ".tk[31]" -type "float3" 0 -0.80538279 0 ;
	setAttr ".tk[32]" -type "float3" 0 -0.80538279 0 ;
	setAttr ".tk[33]" -type "float3" 0 -0.80538279 0 ;
	setAttr ".tk[34]" -type "float3" 0 -0.80538279 0 ;
	setAttr ".tk[35]" -type "float3" 0 -0.80538279 0 ;
	setAttr ".tk[36]" -type "float3" 0 -0.80538279 0 ;
	setAttr ".tk[37]" -type "float3" 0 -0.80538279 0 ;
	setAttr ".tk[38]" -type "float3" 0 -0.80538279 0 ;
	setAttr ".tk[39]" -type "float3" 0 -0.80538279 0 ;
	setAttr ".tk[40]" -type "float3" 0 -0.80538279 0 ;
	setAttr ".tk[41]" -type "float3" 0 -0.80538279 0 ;
	setAttr ".tk[42]" -type "float3" 0 -0.80538279 0 ;
	setAttr ".tk[43]" -type "float3" 0 -0.80538279 0 ;
	setAttr ".tk[44]" -type "float3" 0 -0.80538279 0 ;
	setAttr ".tk[45]" -type "float3" 0 -0.80538279 0 ;
	setAttr ".tk[46]" -type "float3" 0 -0.80538279 0 ;
	setAttr ".tk[47]" -type "float3" 0 -0.80538279 0 ;
	setAttr ".tk[48]" -type "float3" 0 -0.80538279 0 ;
	setAttr ".tk[49]" -type "float3" 0 -1.4725088 -2.0104725 ;
	setAttr ".tk[50]" -type "float3" 0 -1.4725088 -2.0104725 ;
	setAttr ".tk[51]" -type "float3" 0 -1.4725088 -2.0104725 ;
	setAttr ".tk[52]" -type "float3" 0 -1.4725088 -2.0104725 ;
	setAttr ".tk[53]" -type "float3" 0 -1.4725088 -2.0104725 ;
	setAttr ".tk[54]" -type "float3" 0 -1.4725088 -2.0104725 ;
	setAttr ".tk[55]" -type "float3" 0 -1.4725088 -2.0104725 ;
createNode polyExtrudeFace -n "polyExtrudeFace10";
	rename -uid "734C5A5F-4025-C5C8-93CB-81A0CA02A2DD";
	setAttr ".ics" -type "componentList" 1 "f[12:17]";
	setAttr ".ix" -type "matrix" 0.51419665074508869 0 0 0 0 0 0.51419665074508869 0
		 0 -0.51419665074508869 0 0 0 1.3252398441371793 2.7432172298431396 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -0.019125711 7.1877651 2.8843915 ;
	setAttr ".rs" 42402;
	setAttr ".lt" -type "double3" 0 -1.4988010832439613e-15 0.42134877343134869 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -0.53331856181581505 6.9626711241843022 2.5765785296082728 ;
	setAttr ".cbx" -type "double3" 0.49506713884420162 7.4128589774538085 3.1922047342689264 ;
createNode polyTweak -n "polyTweak12";
	rename -uid "70584CF2-4062-E01D-862B-17839377E195";
	setAttr ".uopa" yes;
	setAttr -s 7 ".tk[55:61]" -type "float3"  -0.037188195 0.024892218 0.40837207
		 -0.037188195 0.024891753 0.40836999 -0.037188195 -0.10597504 0.10412095 -0.037188195
		 -0.10597504 0.1041207 -0.037188195 -0.23684202 -0.20012914 -0.037188195 -0.23684244
		 -0.20013101 -0.037188195 -0.10597598 0.1041203;
createNode polyExtrudeFace -n "polyExtrudeFace11";
	rename -uid "F210DC31-4467-B1BC-07E7-8DBB9B322615";
	setAttr ".ics" -type "componentList" 1 "f[12:17]";
	setAttr ".ix" -type "matrix" 0.51419665074508869 0 0 0 0 0 0.51419665074508869 0
		 0 -0.51419665074508869 0 0 0 1.3252398441371793 2.7432172298431396 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -0.019126048 7.3714762 2.6984818 ;
	setAttr ".rs" 47091;
	setAttr ".lt" -type "double3" 7.3594457622189885e-18 9.9920072216264089e-16 0.50223925597057784 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -0.53331788754862341 7.0431295892559804 2.5045632229864547 ;
	setAttr ".cbx" -type "double3" 0.49506579030981829 7.6998231712202303 2.892400286480445 ;
createNode polyTweak -n "polyTweak13";
	rename -uid "D69E1023-4DE1-E8C9-789F-FFAC6A15FDD2";
	setAttr ".uopa" yes;
	setAttr -s 7 ".tk[61:67]" -type "float3"  0 0.34363994 0.50497079 0
		 0.34363875 0.5049684 0 0.12214039 0.30416539 0 0.12213962 0.30416551 0 -0.099359632
		 0.10336203 0 -0.099360749 0.10335992 0 0.12213884 0.30416533;
createNode polyExtrudeFace -n "polyExtrudeFace12";
	rename -uid "0879657A-47D6-7E82-40D3-6EBBA8E76694";
	setAttr ".ics" -type "componentList" 1 "f[12:17]";
	setAttr ".ix" -type "matrix" 0.51419665074508869 0 0 0 0 0 0.51419665074508869 0
		 0 -0.51419665074508869 0 0 0 1.3252398441371793 2.7432172298431396 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -0.019126417 7.4996567 2.4434564 ;
	setAttr ".rs" 53305;
	setAttr ".lt" -type "double3" -4.1687785290304459e-18 -1.3877787807814457e-15 0.24920178692075504 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -0.53331715198441432 7.1344587125858281 2.3337036867529934 ;
	setAttr ".cbx" -type "double3" 0.49506431918140009 7.8648548475492737 2.5532092256061532 ;
createNode polyTweak -n "polyTweak14";
	rename -uid "880C8282-4E07-8243-5583-BDA816671E3B";
	setAttr ".uopa" yes;
	setAttr -s 7 ".tk[67:73]" -type "float3"  0 0.50873816 0.31908664 0
		 0.50873762 0.31908578 0 0.34505627 0.24741748 0 0.34505633 0.24741796 0 0.18137419
		 0.17574969 0 0.18137266 0.17574862 0 0.34505489 0.24741766;
createNode polyExtrudeFace -n "polyExtrudeFace13";
	rename -uid "96C9B14A-4318-4084-2427-5791F3B8996D";
	setAttr ".ics" -type "componentList" 1 "f[12:17]";
	setAttr ".ix" -type "matrix" 0.51419665074508869 0 0 0 0 0 0.51419665074508869 0
		 0 -0.51419665074508869 0 0 0 1.3252398441371793 2.7432172298431396 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -0.019126538 7.5361652 2.1960397 ;
	setAttr ".rs" 46220;
	setAttr ".lt" -type "double3" 3.9911133683438564e-18 4.5276282722994665e-16 0.204324693690839 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -0.53331666160827496 7.1556542404590147 2.171020850834648 ;
	setAttr ".cbx" -type "double3" 0.49506358361719099 7.9166763268324054 2.2210585256137025 ;
createNode polyTweak -n "polyTweak15";
	rename -uid "F9C796A1-4AEA-4AEE-8F07-50BD6D1B8C06";
	setAttr ".uopa" yes;
	setAttr -s 7 ".tk[73:79]" -type "float3"  0 0.14775318 0.098266914 0
		 0.1477527 0.098266318 0 -0.0170347 0.068484515 0 -0.017034268 0.068485007 0 -0.18182209
		 0.038703352 0 -0.18182389 0.038702682 0 -0.017035982 0.068484992;
createNode polySoftEdge -n "polySoftEdge1";
	rename -uid "0F18D947-4E3D-5C41-4115-8C9940B0C4A9";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[*]";
	setAttr ".ix" -type "matrix" 1.8983319351414727 0 0 0 0 2.7776723151223739 0 0 0 0 1.8983319351414727 0
		 0 4.1109138356149941 0 1;
	setAttr ".a" 0;
createNode polyTweak -n "polyTweak16";
	rename -uid "781908A3-4162-D9E8-03DB-C992988721A1";
	setAttr ".uopa" yes;
	setAttr -s 63 ".tk";
	setAttr ".tk[0]" -type "float3" 0 0.21981004 0 ;
	setAttr ".tk[1]" -type "float3" 0 0.21981004 0 ;
	setAttr ".tk[2]" -type "float3" 0 0.21981004 0 ;
	setAttr ".tk[3]" -type "float3" 0 0.21981004 0 ;
	setAttr ".tk[4]" -type "float3" 0 0.21981004 0 ;
	setAttr ".tk[5]" -type "float3" 0 0.21981004 0 ;
	setAttr ".tk[6]" -type "float3" 0 0.21981004 0 ;
	setAttr ".tk[7]" -type "float3" 0 0.21981004 0 ;
	setAttr ".tk[8]" -type "float3" 0 0.21981004 0 ;
	setAttr ".tk[9]" -type "float3" 0 0.21981004 0 ;
	setAttr ".tk[10]" -type "float3" 0 0.14717239 0 ;
	setAttr ".tk[11]" -type "float3" 0 0.14717239 0 ;
	setAttr ".tk[12]" -type "float3" 0 0.14717239 0 ;
	setAttr ".tk[13]" -type "float3" 0 0.14717239 0 ;
	setAttr ".tk[14]" -type "float3" 0 0.14717239 0 ;
	setAttr ".tk[15]" -type "float3" 0 0.14717239 0 ;
	setAttr ".tk[16]" -type "float3" 0 0.14717239 0 ;
	setAttr ".tk[17]" -type "float3" 0 0.14717239 0 ;
	setAttr ".tk[18]" -type "float3" 0 0.14717239 0 ;
	setAttr ".tk[19]" -type "float3" 0 0.14717239 0 ;
	setAttr ".tk[20]" -type "float3" 0 0.034036618 0 ;
	setAttr ".tk[21]" -type "float3" 0 0.034036618 0 ;
	setAttr ".tk[22]" -type "float3" 0 0.034036618 0 ;
	setAttr ".tk[23]" -type "float3" 0 0.034036618 0 ;
	setAttr ".tk[24]" -type "float3" 0 0.034036618 0 ;
	setAttr ".tk[25]" -type "float3" 0 0.034036618 0 ;
	setAttr ".tk[26]" -type "float3" 0 0.034036618 0 ;
	setAttr ".tk[27]" -type "float3" 0 0.034036618 0 ;
	setAttr ".tk[28]" -type "float3" 0 0.034036618 0 ;
	setAttr ".tk[29]" -type "float3" 0 0.034036618 0 ;
	setAttr ".tk[60]" -type "float3" 0 -0.075251855 0 ;
	setAttr ".tk[61]" -type "float3" 0 -0.075251855 0 ;
	setAttr ".tk[62]" -type "float3" 0 -0.075251855 0 ;
	setAttr ".tk[63]" -type "float3" 0 -0.075251855 0 ;
	setAttr ".tk[64]" -type "float3" 0 -0.075251855 0 ;
	setAttr ".tk[65]" -type "float3" 0 -0.075251855 0 ;
	setAttr ".tk[66]" -type "float3" 0 -0.075251855 0 ;
	setAttr ".tk[67]" -type "float3" 0 -0.075251855 0 ;
	setAttr ".tk[68]" -type "float3" 0 -0.075251855 0 ;
	setAttr ".tk[69]" -type "float3" 0 -0.075251855 0 ;
	setAttr ".tk[70]" -type "float3" 0 -0.13398807 0 ;
	setAttr ".tk[71]" -type "float3" 0 -0.13398807 0 ;
	setAttr ".tk[72]" -type "float3" 0 -0.13398807 0 ;
	setAttr ".tk[73]" -type "float3" 0 -0.13398807 0 ;
	setAttr ".tk[74]" -type "float3" 0 -0.13398807 0 ;
	setAttr ".tk[75]" -type "float3" 0 -0.13398807 0 ;
	setAttr ".tk[76]" -type "float3" 0 -0.13398807 0 ;
	setAttr ".tk[77]" -type "float3" 0 -0.13398807 0 ;
	setAttr ".tk[78]" -type "float3" 0 -0.13398807 0 ;
	setAttr ".tk[79]" -type "float3" 0 -0.13398807 0 ;
	setAttr ".tk[80]" -type "float3" 0 -0.17169908 0 ;
	setAttr ".tk[81]" -type "float3" 0 -0.17169908 0 ;
	setAttr ".tk[82]" -type "float3" 0 -0.17169908 0 ;
	setAttr ".tk[83]" -type "float3" 0 -0.17169908 0 ;
	setAttr ".tk[84]" -type "float3" 0 -0.17169908 0 ;
	setAttr ".tk[85]" -type "float3" 0 -0.17169908 0 ;
	setAttr ".tk[86]" -type "float3" 0 -0.17169908 0 ;
	setAttr ".tk[87]" -type "float3" 0 -0.17169908 0 ;
	setAttr ".tk[88]" -type "float3" 0 -0.17169908 0 ;
	setAttr ".tk[89]" -type "float3" 0 -0.17169908 0 ;
	setAttr ".tk[90]" -type "float3" 0 0.24483924 0 ;
	setAttr ".tk[91]" -type "float3" 0 -0.18469338 0 ;
createNode polySoftEdge -n "polySoftEdge2";
	rename -uid "E47F50D7-4644-8E9B-6D66-69859A731C9C";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[*]";
	setAttr ".ix" -type "matrix" -0.51419665074508869 0 -6.2970928246726238e-17 0 6.2970928246726238e-17 0 -0.51419665074508869 0
		 0 -0.51419665074508869 0 0 0 1.3252398441371793 -2.7432172019768428 1;
	setAttr ".a" 0;
createNode polySoftEdge -n "polySoftEdge3";
	rename -uid "30F9AB53-4968-8503-1AF7-8C8FA0BCCB7A";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[*]";
	setAttr ".ix" -type "matrix" 0.51419665074508869 0 0 0 0 0 0.51419665074508869 0
		 0 -0.51419665074508869 0 0 0 1.3252398441371793 2.7432172298431396 1;
	setAttr ".a" 0;
createNode polyTweak -n "polyTweak17";
	rename -uid "B635EBEC-4167-F3D8-1D09-7780CB8F86F7";
	setAttr ".uopa" yes;
	setAttr -s 7 ".tk[79:85]" -type "float3"  0 -3.59373188 0.0015727301
		 0 -3.59373188 0.0015725589 0 -3.64849186 -1.4579422e-07 0 -3.64849138 3.8308684e-08
		 0 -3.70325136 -0.0015725818 0 -3.70325232 -0.0015727301 0 -3.64849186 7.5338356e-08;
createNode polySoftEdge -n "polySoftEdge4";
	rename -uid "2A829B8D-4E3F-5F30-C8E3-03B74B77A61A";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[*]";
	setAttr ".ix" -type "matrix" 3.8379965076610794 0 0 0 0 3.8379965076610794 0 0 0 0 3.8379965076610794 0
		 0 -3.177660889992481 0 1;
	setAttr ".a" 0;
createNode polyUnite -n "polyUnite1";
	rename -uid "D9FB95EA-4AD4-FA39-42B1-C7A62F95A943";
	setAttr -s 2 ".ip";
	setAttr -s 2 ".im";
createNode groupId -n "groupId1";
	rename -uid "A1ECEF20-4115-33E5-45D8-10A000AC7912";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts1";
	rename -uid "D9168F99-4475-B13D-6F67-ACA7EB272DD9";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:89]";
createNode groupId -n "groupId2";
	rename -uid "D0BBFE34-4207-1524-6AE6-9A8B4B45EFA5";
	setAttr ".ihi" 0;
createNode groupId -n "groupId3";
	rename -uid "0BBB823C-4C65-198D-073B-78BB60564C8F";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts2";
	rename -uid "6566339E-4215-8A4A-D722-54A2EB373CDF";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:89]";
createNode groupId -n "groupId4";
	rename -uid "EDCB2555-4D18-58C4-B921-4FB4E5DEE245";
	setAttr ".ihi" 0;
createNode groupId -n "groupId5";
	rename -uid "72DF5CCD-428D-5C5F-8BD6-6DB70B9DD893";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts3";
	rename -uid "59964EF7-45D8-DB65-C98F-12863EB272C9";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:179]";
createNode groupId -n "groupId6";
	rename -uid "3D93A052-4F4A-5F4E-FD34-548CE7F6E712";
	setAttr ".ihi" 0;
createNode polyCylinder -n "polyCylinder3";
	rename -uid "06858495-41DF-4F9E-565A-90A2B139CDDE";
	setAttr ".sa" 6;
	setAttr ".sc" 1;
	setAttr ".cuv" 3;
createNode script -n "uiConfigurationScriptNode";
	rename -uid "69F225D4-4BA4-2A72-5203-6790816D7EF1";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $nodeEditorPanelVisible = stringArrayContains(\"nodeEditorPanel1\", `getPanel -vis`);\n\tint    $nodeEditorWorkspaceControlOpen = (`workspaceControl -exists nodeEditorPanel1Window` && `workspaceControl -q -visible nodeEditorPanel1Window`);\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\n\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n"
		+ "            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n"
		+ "            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -bluePencil 1\n            -greasePencils 0\n            -excludeObjectPreset \"All\" \n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n"
		+ "            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n"
		+ "            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -bluePencil 1\n            -greasePencils 0\n            -excludeObjectPreset \"All\" \n"
		+ "            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n"
		+ "            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n"
		+ "            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n"
		+ "            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -bluePencil 1\n            -greasePencils 0\n            -excludeObjectPreset \"All\" \n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n"
		+ "            -camera \"|persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n"
		+ "            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n"
		+ "            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -bluePencil 1\n            -greasePencils 0\n            -excludeObjectPreset \"All\" \n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1274\n            -height 1114\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n"
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
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -bluePencil 1\\n    -greasePencils 0\\n    -excludeObjectPreset \\\"All\\\" \\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1274\\n    -height 1114\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -bluePencil 1\\n    -greasePencils 0\\n    -excludeObjectPreset \\\"All\\\" \\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1274\\n    -height 1114\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 12 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "87DBADDF-408C-3F08-E1FC-22B86AE6B73D";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 120 -ast 1 -aet 200 ";
	setAttr ".st" 6;
createNode polyExtrudeFace -n "polyExtrudeFace14";
	rename -uid "60DC337A-4D8B-CB46-485F-0A8C74A306CA";
	setAttr ".ics" -type "componentList" 1 "f[6:11]";
	setAttr ".ix" -type "matrix" 1.3229688593653228 0 0 0 0 0.48244595403503776 0 0 0 0 1.3229688593653228 0
		 0 7.4676715272623966 0 1;
	setAttr ".ws" yes;
	setAttr ".s" -type "double3" 0.71208710290272625 1 0.71208710290272625 ;
	setAttr ".pvt" -type "float3" 0 6.9852257 -3.9427544e-08 ;
	setAttr ".rs" 33195;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -1.3229688593653228 6.9852255732273587 -1.1457247777725386 ;
	setAttr ".cbx" -type "double3" 1.3229688593653228 6.9852255732273587 1.1457246989174497 ;
createNode polyExtrudeFace -n "polyExtrudeFace15";
	rename -uid "DE8D165C-4ADB-30E9-00AF-39906495D4FB";
	setAttr ".ics" -type "componentList" 1 "f[6:11]";
	setAttr ".ix" -type "matrix" 1.3229688593653228 0 0 0 0 0.48244595403503776 0 0 0 0 1.3229688593653228 0
		 0 7.4676715272623966 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0 6.6679144 -3.9427544e-08 ;
	setAttr ".rs" 63680;
	setAttr ".lt" -type "double3" 1.3234889800848443e-23 -5.5511151231257827e-17 0.46939473185047742 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -0.71093634846111775 6.6679141680476999 -0.61568902137702541 ;
	setAttr ".cbx" -type "double3" 0.71093634846111775 6.6679141680476999 0.61568894252193651 ;
createNode polyTweak -n "polyTweak18";
	rename -uid "8DF3F710-403E-65D1-BA1A-D0B28FA944A2";
	setAttr ".uopa" yes;
	setAttr -s 20 ".tk";
	setAttr ".tk[0]" -type "float3" 0 -5.9604645e-08 0 ;
	setAttr ".tk[1]" -type "float3" 0 -5.9604645e-08 0 ;
	setAttr ".tk[2]" -type "float3" 0 -5.9604645e-08 0 ;
	setAttr ".tk[3]" -type "float3" 0 -5.9604645e-08 0 ;
	setAttr ".tk[4]" -type "float3" 0 -5.9604645e-08 0 ;
	setAttr ".tk[5]" -type "float3" 0 -5.9604645e-08 0 ;
	setAttr ".tk[6]" -type "float3" 0 -5.9604645e-08 0 ;
	setAttr ".tk[13]" -type "float3" -0.087353848 -0.65771478 0.15130121 ;
	setAttr ".tk[14]" -type "float3" 0.087353773 -0.65771478 0.15130121 ;
	setAttr ".tk[15]" -type "float3" 0 -0.65771478 -5.2066915e-09 ;
	setAttr ".tk[16]" -type "float3" 0.17470759 -0.65771478 2.082677e-08 ;
	setAttr ".tk[17]" -type "float3" 0.087353811 -0.65771478 -0.15130121 ;
	setAttr ".tk[18]" -type "float3" -0.087353781 -0.65771478 -0.15130121 ;
	setAttr ".tk[19]" -type "float3" -0.17470759 -0.65771478 -5.2066915e-09 ;
	setAttr ".tk[21]" -type "float3" 0 -5.9604645e-08 0 ;
	setAttr ".tk[22]" -type "float3" 0 -5.9604645e-08 0 ;
	setAttr ".tk[29]" -type "float3" 0 -5.9604645e-08 0 ;
	setAttr ".tk[30]" -type "float3" 0 -5.9604645e-08 0 ;
	setAttr ".tk[31]" -type "float3" 0 -5.9604645e-08 0 ;
	setAttr ".tk[32]" -type "float3" 0 -5.9604645e-08 0 ;
createNode polyBevel3 -n "polyBevel2";
	rename -uid "45FEFCAC-4CFF-E06D-6814-B8B4A1744677";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[6:11]";
	setAttr ".ix" -type "matrix" 1.3229688593653228 0 0 0 0 0.48244595403503776 0 0 0 0 1.3229688593653228 0
		 0 7.4676715272623966 0 1;
	setAttr ".ws" yes;
	setAttr ".oaf" yes;
	setAttr ".f" 0.19999999999999996;
	setAttr ".at" 180;
	setAttr ".sn" yes;
	setAttr ".mv" yes;
	setAttr ".mvt" 0.0001;
	setAttr ".sa" 30;
createNode polyTweak -n "polyTweak19";
	rename -uid "AF3EAA35-4823-2BD2-00F1-A884E57D5838";
	setAttr ".uopa" yes;
	setAttr -s 14 ".tk";
	setAttr ".tk[6]" -type "float3" 0 0.53693813 0 ;
	setAttr ".tk[7]" -type "float3" 0 0.53693813 0 ;
	setAttr ".tk[8]" -type "float3" 0 0.53693813 0 ;
	setAttr ".tk[9]" -type "float3" 0 0.53693813 0 ;
	setAttr ".tk[10]" -type "float3" 0 0.53693813 0 ;
	setAttr ".tk[11]" -type "float3" 0 0.53693813 0 ;
	setAttr ".tk[12]" -type "float3" 0 0.53693813 0 ;
	setAttr ".tk[19]" -type "float3" 0 -5.9604645e-08 0 ;
	setAttr ".tk[20]" -type "float3" 0 -5.9604645e-08 0 ;
	setAttr ".tk[21]" -type "float3" 0 -5.9604645e-08 0 ;
	setAttr ".tk[22]" -type "float3" 0 -5.9604645e-08 0 ;
	setAttr ".tk[23]" -type "float3" 0 -5.9604645e-08 0 ;
	setAttr ".tk[24]" -type "float3" 0 -5.9604645e-08 0 ;
	setAttr ".tk[25]" -type "float3" 0 -5.9604645e-08 0 ;
createNode polyExtrudeFace -n "polyExtrudeFace16";
	rename -uid "88E02376-4991-C7FA-F2EA-4F966AACC170";
	setAttr ".ics" -type "componentList" 1 "f[30:35]";
	setAttr ".ix" -type "matrix" 1.3229688593653228 0 0 0 0 0.48244595403503776 0 0 0 0 1.3229688593653228 0
		 0 7.4676715272623966 0 1;
	setAttr ".ws" yes;
	setAttr ".s" -type "double3" 0.71825309571692486 1 0.71825309571692486 ;
	setAttr ".pvt" -type "float3" 0 8.2091608 0 ;
	setAttr ".rs" 58929;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -1.0584015985731503 8.2091609088036979 -0.91660272173585078 ;
	setAttr ".cbx" -type "double3" 1.0584015985731503 8.2091609088036979 0.91660272173585078 ;
createNode polyExtrudeFace -n "polyExtrudeFace17";
	rename -uid "4302A409-4B04-6CB3-7412-4A9683FCC603";
	setAttr ".ics" -type "componentList" 1 "f[30:35]";
	setAttr ".ix" -type "matrix" 1.3229688593653228 0 0 0 0 0.48244595403503776 0 0 0 0 1.3229688593653228 0
		 0 7.4676715272623966 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0 8.2978878 0 ;
	setAttr ".rs" 50177;
	setAttr ".lt" -type "double3" 0 0 0.19048334645655274 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -0.76020019785252058 8.2978881252383125 -0.65835273925409066 ;
	setAttr ".cbx" -type "double3" 0.76020019785252058 8.2978881252383125 0.65835273925409066 ;
createNode polyTweak -n "polyTweak20";
	rename -uid "52D87759-4A45-75D4-96F5-E2861A02A7A5";
	setAttr ".uopa" yes;
	setAttr -s 9 ".tk";
	setAttr ".tk[31]" -type "float3" 0 0.18391123 0 ;
	setAttr ".tk[32]" -type "float3" 0 0.18391123 0 ;
	setAttr ".tk[33]" -type "float3" 0 0.18391123 0 ;
	setAttr ".tk[34]" -type "float3" 0 0.18391123 0 ;
	setAttr ".tk[35]" -type "float3" 0 0.18391123 0 ;
	setAttr ".tk[36]" -type "float3" 0 0.18391123 0 ;
	setAttr ".tk[37]" -type "float3" 0 0.18391123 0 ;
createNode polyExtrudeFace -n "polyExtrudeFace18";
	rename -uid "B13044A6-4968-DD97-DC88-F986370CC8F7";
	setAttr ".ics" -type "componentList" 1 "f[30:35]";
	setAttr ".ix" -type "matrix" 1.3229688593653228 0 0 0 0 0.48244595403503776 0 0 0 0 1.3229688593653228 0
		 0 7.4676715272623966 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0 8.4883709 0 ;
	setAttr ".rs" 50590;
	setAttr ".lt" -type "double3" -2.6469779601696886e-23 0 0.24791108654896377 ;
	setAttr ".ls" -type "double3" 1.3818164066204937 1.3818164066204937 1 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -0.76020019785252058 8.4883712780073317 -0.65835273925409066 ;
	setAttr ".cbx" -type "double3" 0.76020019785252058 8.4883712780073317 0.65835273925409066 ;
createNode polyExtrudeFace -n "polyExtrudeFace19";
	rename -uid "0F7DE92C-458B-BBE7-0FDF-A8A4A565D59E";
	setAttr ".ics" -type "componentList" 1 "f[30:35]";
	setAttr ".ix" -type "matrix" 1.3229688593653228 0 0 0 0 0.48244595403503776 0 0 0 0 1.3229688593653228 0
		 0 7.4676715272623966 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -3.9427544e-08 8.6087942 0 ;
	setAttr ".rs" 56575;
	setAttr ".lt" -type "double3" 2.6469779601696886e-23 -4.2587900071827512e-17 0.10849352245844797 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -0.90532873081910281 8.6087944720990066 -0.78403769695498426 ;
	setAttr ".cbx" -type "double3" 0.90532865196401391 8.6087944720990066 0.78403769695498426 ;
createNode polyTweak -n "polyTweak21";
	rename -uid "C3F5E95C-4329-56A3-53CB-30BE4372E188";
	setAttr ".uopa" yes;
	setAttr -s 7 ".tk[43:49]" -type "float3"  0 -0.2642529 0 0 -0.2642529
		 0 0 -0.2642529 0 0 -0.2642529 0 0 -0.2642529 0 0 -0.2642529 0 0 -0.2642529 0;
createNode polyExtrudeFace -n "polyExtrudeFace20";
	rename -uid "A1530D0A-4DAC-088D-49AF-259176353F8D";
	setAttr ".ics" -type "componentList" 1 "f[30:35]";
	setAttr ".ix" -type "matrix" 1.3229688593653228 0 0 0 0 0.48244595403503776 0 0 0 0 1.3229688593653228 0
		 0 7.4676715272623966 0 1;
	setAttr ".ws" yes;
	setAttr ".s" -type "double3" 0.77335997266898127 1 0.77335997266898127 ;
	setAttr ".pvt" -type "float3" -3.9427544e-08 8.717289 3.9427544e-08 ;
	setAttr ".rs" 37578;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -0.90532873081910281 8.7172885189726994 -0.78403769695498426 ;
	setAttr ".cbx" -type "double3" 0.90532865196401391 8.7172885189726994 0.78403777581007317 ;
createNode polySoftEdge -n "polySoftEdge5";
	rename -uid "CDB93E19-4B83-BF08-F6C9-468BCDC8085A";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[*]";
	setAttr ".ix" -type "matrix" 1.3229688593653228 0 0 0 0 0.48244595403503776 0 0 0 0 1.3229688593653228 0
		 0 7.4676715272623966 0 1;
	setAttr ".a" 0;
createNode polyTweak -n "polyTweak22";
	rename -uid "6213D9A1-47A6-84E7-08F8-FC873DCB778E";
	setAttr ".uopa" yes;
	setAttr -s 7 ".tk[55:61]" -type "float3"  0 0.19526003 0 0 0.19526003
		 0 0 0.19526003 0 0 0.19526003 0 0 0.19526003 0 0 0.19526003 0 0 0.19526003 0;
createNode polySoftEdge -n "polySoftEdge6";
	rename -uid "12E60456-4B21-66D6-3E63-0995196E6B1D";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[*]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".a" 0;
createNode polySoftEdge -n "polySoftEdge7";
	rename -uid "2049052D-40A4-F2F5-D216-1A95098E33C4";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[*]";
	setAttr ".ix" -type "matrix" 1.8983319351414727 0 0 0 0 2.7776723151223739 0 0 0 0 1.8983319351414727 0
		 0 4.1109138356149941 0 1;
	setAttr ".a" 0;
createNode polySoftEdge -n "polySoftEdge8";
	rename -uid "5EDB0C25-4714-36C1-D83E-068D39863A12";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[*]";
	setAttr ".ix" -type "matrix" 3.8379965076610794 0 0 0 0 3.8379965076610794 0 0 0 0 3.8379965076610794 0
		 0 -3.177660889992481 0 1;
	setAttr ".a" 0;
createNode polyUnite -n "polyUnite2";
	rename -uid "98E02FD9-4CAB-B559-E568-A99DEE4F1F15";
	setAttr -s 4 ".ip";
	setAttr -s 4 ".im";
createNode groupId -n "groupId7";
	rename -uid "B24E28C7-4AA9-5442-0DEE-B9AB9BDA90BF";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts4";
	rename -uid "2D5F9956-4E8A-B3FB-ACF1-2585D992B503";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:53]";
createNode groupId -n "groupId8";
	rename -uid "AFABB637-49DB-95F0-8BC9-9391DC544789";
	setAttr ".ihi" 0;
createNode groupId -n "groupId9";
	rename -uid "2F61C66B-4E34-C3F9-3B91-25BDB6CD430A";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts5";
	rename -uid "57EDF071-421A-B6F5-0C46-7196B38F23FE";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:65]";
createNode groupId -n "groupId10";
	rename -uid "440AA8BF-432C-2946-D27E-F98E50656AC2";
	setAttr ".ihi" 0;
createNode groupId -n "groupId11";
	rename -uid "119F6D28-409A-0D8A-2CC3-639D03E1148F";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts6";
	rename -uid "3CE4FA4C-4EF3-2E91-FA86-9E8D2D216583";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:99]";
createNode groupId -n "groupId12";
	rename -uid "0BC5AE33-4714-FA99-CA66-0CBBC8919439";
	setAttr ".ihi" 0;
createNode groupId -n "groupId13";
	rename -uid "EC619E62-4EC9-F130-1F8F-D3A6D86F8283";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts7";
	rename -uid "01457F67-4696-4006-BC64-52BCFB93033F";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:399]";
createNode groupId -n "groupId14";
	rename -uid "911935CC-468C-78F5-ECE0-5E8A9E1F7FFB";
	setAttr ".ihi" 0;
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
	setAttr -s 14 ".dsm";
	setAttr ".ro" yes;
	setAttr -s 12 ".gn";
select -ne :initialParticleSE;
	setAttr ".ro" yes;
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
connectAttr "groupId7.id" "pCylinderShape1.iog.og[2].gid";
connectAttr ":initialShadingGroup.mwc" "pCylinderShape1.iog.og[2].gco";
connectAttr "groupParts4.og" "pCylinderShape1.i";
connectAttr "groupId8.id" "pCylinderShape1.ciog.cog[2].cgid";
connectAttr "groupId3.id" "pCylinderShape2.iog.og[0].gid";
connectAttr ":initialShadingGroup.mwc" "pCylinderShape2.iog.og[0].gco";
connectAttr "groupParts2.og" "pCylinderShape2.i";
connectAttr "groupId4.id" "pCylinderShape2.ciog.cog[0].cgid";
connectAttr "groupId11.id" "pSphereShape1.iog.og[2].gid";
connectAttr ":initialShadingGroup.mwc" "pSphereShape1.iog.og[2].gco";
connectAttr "groupParts6.og" "pSphereShape1.i";
connectAttr "groupId12.id" "pSphereShape1.ciog.cog[2].cgid";
connectAttr "groupId1.id" "pCylinderShape4.iog.og[0].gid";
connectAttr ":initialShadingGroup.mwc" "pCylinderShape4.iog.og[0].gco";
connectAttr "groupParts1.og" "pCylinderShape4.i";
connectAttr "groupId2.id" "pCylinderShape4.ciog.cog[0].cgid";
connectAttr "polySoftEdge6.out" "pCylinder5Shape.i";
connectAttr "groupId5.id" "pCylinder5Shape.iog.og[0].gid";
connectAttr ":initialShadingGroup.mwc" "pCylinder5Shape.iog.og[0].gco";
connectAttr "groupId6.id" "pCylinder5Shape.ciog.cog[0].cgid";
connectAttr "groupId9.id" "pCylinderShape5.iog.og[2].gid";
connectAttr ":initialShadingGroup.mwc" "pCylinderShape5.iog.og[2].gco";
connectAttr "groupParts5.og" "pCylinderShape5.i";
connectAttr "groupId10.id" "pCylinderShape5.ciog.cog[2].cgid";
connectAttr "groupParts7.og" "pCylinder7Shape.i";
connectAttr "groupId13.id" "pCylinder7Shape.iog.og[0].gid";
connectAttr ":initialShadingGroup.mwc" "pCylinder7Shape.iog.og[0].gco";
connectAttr "groupId14.id" "pCylinder7Shape.ciog.cog[0].cgid";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "polyTweak1.out" "polySplit1.ip";
connectAttr "polyCylinder1.out" "polyTweak1.ip";
connectAttr "polyTweak2.out" "polyBevel1.ip";
connectAttr "pCylinderShape1.wm" "polyBevel1.mp";
connectAttr "polySplit1.out" "polyTweak2.ip";
connectAttr "polyBevel1.out" "polySplit2.ip";
connectAttr "polyTweak3.out" "polyExtrudeFace1.ip";
connectAttr "pCylinderShape1.wm" "polyExtrudeFace1.mp";
connectAttr "polySplit2.out" "polyTweak3.ip";
connectAttr "polyTweak4.out" "polyExtrudeFace2.ip";
connectAttr "pCylinderShape2.wm" "polyExtrudeFace2.mp";
connectAttr "polyCylinder2.out" "polyTweak4.ip";
connectAttr "polyTweak5.out" "polyExtrudeFace3.ip";
connectAttr "pCylinderShape2.wm" "polyExtrudeFace3.mp";
connectAttr "polyExtrudeFace2.out" "polyTweak5.ip";
connectAttr "polyTweak6.out" "polyExtrudeFace4.ip";
connectAttr "pCylinderShape2.wm" "polyExtrudeFace4.mp";
connectAttr "polyExtrudeFace3.out" "polyTweak6.ip";
connectAttr "polyTweak7.out" "polyExtrudeFace5.ip";
connectAttr "pCylinderShape2.wm" "polyExtrudeFace5.mp";
connectAttr "polyExtrudeFace4.out" "polyTweak7.ip";
connectAttr "polyTweak8.out" "polyExtrudeFace6.ip";
connectAttr "pCylinderShape2.wm" "polyExtrudeFace6.mp";
connectAttr "polyExtrudeFace5.out" "polyTweak8.ip";
connectAttr "polyTweak9.out" "polyExtrudeFace7.ip";
connectAttr "pCylinderShape2.wm" "polyExtrudeFace7.mp";
connectAttr "polyExtrudeFace6.out" "polyTweak9.ip";
connectAttr "polyTweak10.out" "polyExtrudeFace8.ip";
connectAttr "pCylinderShape2.wm" "polyExtrudeFace8.mp";
connectAttr "polyExtrudeFace7.out" "polyTweak10.ip";
connectAttr "polyExtrudeFace1.out" "polySplit3.ip";
connectAttr "polySplit3.out" "polyExtrudeEdge1.ip";
connectAttr "pCylinderShape1.wm" "polyExtrudeEdge1.mp";
connectAttr "polyTweak11.out" "polyExtrudeFace9.ip";
connectAttr "pCylinderShape2.wm" "polyExtrudeFace9.mp";
connectAttr "polyExtrudeFace8.out" "polyTweak11.ip";
connectAttr "polyTweak12.out" "polyExtrudeFace10.ip";
connectAttr "pCylinderShape2.wm" "polyExtrudeFace10.mp";
connectAttr "polyExtrudeFace9.out" "polyTweak12.ip";
connectAttr "polyTweak13.out" "polyExtrudeFace11.ip";
connectAttr "pCylinderShape2.wm" "polyExtrudeFace11.mp";
connectAttr "polyExtrudeFace10.out" "polyTweak13.ip";
connectAttr "polyTweak14.out" "polyExtrudeFace12.ip";
connectAttr "pCylinderShape2.wm" "polyExtrudeFace12.mp";
connectAttr "polyExtrudeFace11.out" "polyTweak14.ip";
connectAttr "polyTweak15.out" "polyExtrudeFace13.ip";
connectAttr "pCylinderShape2.wm" "polyExtrudeFace13.mp";
connectAttr "polyExtrudeFace12.out" "polyTweak15.ip";
connectAttr "polyTweak16.out" "polySoftEdge1.ip";
connectAttr "pSphereShape1.wm" "polySoftEdge1.mp";
connectAttr "polySphere1.out" "polyTweak16.ip";
connectAttr "polySurfaceShape1.o" "polySoftEdge2.ip";
connectAttr "pCylinderShape4.wm" "polySoftEdge2.mp";
connectAttr "polyTweak17.out" "polySoftEdge3.ip";
connectAttr "pCylinderShape2.wm" "polySoftEdge3.mp";
connectAttr "polyExtrudeFace13.out" "polyTweak17.ip";
connectAttr "polyExtrudeEdge1.out" "polySoftEdge4.ip";
connectAttr "pCylinderShape1.wm" "polySoftEdge4.mp";
connectAttr "pCylinderShape4.o" "polyUnite1.ip[0]";
connectAttr "pCylinderShape2.o" "polyUnite1.ip[1]";
connectAttr "pCylinderShape4.wm" "polyUnite1.im[0]";
connectAttr "pCylinderShape2.wm" "polyUnite1.im[1]";
connectAttr "polySoftEdge2.out" "groupParts1.ig";
connectAttr "groupId1.id" "groupParts1.gi";
connectAttr "polySoftEdge3.out" "groupParts2.ig";
connectAttr "groupId3.id" "groupParts2.gi";
connectAttr "polyUnite1.out" "groupParts3.ig";
connectAttr "groupId5.id" "groupParts3.gi";
connectAttr "polyCylinder3.out" "polyExtrudeFace14.ip";
connectAttr "pCylinderShape5.wm" "polyExtrudeFace14.mp";
connectAttr "polyTweak18.out" "polyExtrudeFace15.ip";
connectAttr "pCylinderShape5.wm" "polyExtrudeFace15.mp";
connectAttr "polyExtrudeFace14.out" "polyTweak18.ip";
connectAttr "polyTweak19.out" "polyBevel2.ip";
connectAttr "pCylinderShape5.wm" "polyBevel2.mp";
connectAttr "polyExtrudeFace15.out" "polyTweak19.ip";
connectAttr "polyBevel2.out" "polyExtrudeFace16.ip";
connectAttr "pCylinderShape5.wm" "polyExtrudeFace16.mp";
connectAttr "polyTweak20.out" "polyExtrudeFace17.ip";
connectAttr "pCylinderShape5.wm" "polyExtrudeFace17.mp";
connectAttr "polyExtrudeFace16.out" "polyTweak20.ip";
connectAttr "polyExtrudeFace17.out" "polyExtrudeFace18.ip";
connectAttr "pCylinderShape5.wm" "polyExtrudeFace18.mp";
connectAttr "polyTweak21.out" "polyExtrudeFace19.ip";
connectAttr "pCylinderShape5.wm" "polyExtrudeFace19.mp";
connectAttr "polyExtrudeFace18.out" "polyTweak21.ip";
connectAttr "polyExtrudeFace19.out" "polyExtrudeFace20.ip";
connectAttr "pCylinderShape5.wm" "polyExtrudeFace20.mp";
connectAttr "polyTweak22.out" "polySoftEdge5.ip";
connectAttr "pCylinderShape5.wm" "polySoftEdge5.mp";
connectAttr "polyExtrudeFace20.out" "polyTweak22.ip";
connectAttr "groupParts3.og" "polySoftEdge6.ip";
connectAttr "pCylinder5Shape.wm" "polySoftEdge6.mp";
connectAttr "polySoftEdge1.out" "polySoftEdge7.ip";
connectAttr "pSphereShape1.wm" "polySoftEdge7.mp";
connectAttr "polySoftEdge4.out" "polySoftEdge8.ip";
connectAttr "pCylinderShape1.wm" "polySoftEdge8.mp";
connectAttr "pCylinderShape1.o" "polyUnite2.ip[0]";
connectAttr "pCylinder5Shape.o" "polyUnite2.ip[1]";
connectAttr "pCylinderShape5.o" "polyUnite2.ip[2]";
connectAttr "pSphereShape1.o" "polyUnite2.ip[3]";
connectAttr "pCylinderShape1.wm" "polyUnite2.im[0]";
connectAttr "pCylinder5Shape.wm" "polyUnite2.im[1]";
connectAttr "pCylinderShape5.wm" "polyUnite2.im[2]";
connectAttr "pSphereShape1.wm" "polyUnite2.im[3]";
connectAttr "polySoftEdge8.out" "groupParts4.ig";
connectAttr "groupId7.id" "groupParts4.gi";
connectAttr "polySoftEdge5.out" "groupParts5.ig";
connectAttr "groupId9.id" "groupParts5.gi";
connectAttr "polySoftEdge7.out" "groupParts6.ig";
connectAttr "groupId11.id" "groupParts6.gi";
connectAttr "polyUnite2.out" "groupParts7.ig";
connectAttr "groupId13.id" "groupParts7.gi";
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "pCylinderShape4.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "pCylinderShape4.ciog.cog[0]" ":initialShadingGroup.dsm" -na;
connectAttr "pCylinderShape2.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "pCylinderShape2.ciog.cog[0]" ":initialShadingGroup.dsm" -na;
connectAttr "pCylinder5Shape.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "pCylinder5Shape.ciog.cog[0]" ":initialShadingGroup.dsm" -na;
connectAttr "pCylinderShape1.iog.og[2]" ":initialShadingGroup.dsm" -na;
connectAttr "pCylinderShape1.ciog.cog[2]" ":initialShadingGroup.dsm" -na;
connectAttr "pCylinderShape5.iog.og[2]" ":initialShadingGroup.dsm" -na;
connectAttr "pCylinderShape5.ciog.cog[2]" ":initialShadingGroup.dsm" -na;
connectAttr "pSphereShape1.iog.og[2]" ":initialShadingGroup.dsm" -na;
connectAttr "pSphereShape1.ciog.cog[2]" ":initialShadingGroup.dsm" -na;
connectAttr "pCylinder7Shape.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "pCylinder7Shape.ciog.cog[0]" ":initialShadingGroup.dsm" -na;
connectAttr "groupId1.msg" ":initialShadingGroup.gn" -na;
connectAttr "groupId2.msg" ":initialShadingGroup.gn" -na;
connectAttr "groupId3.msg" ":initialShadingGroup.gn" -na;
connectAttr "groupId4.msg" ":initialShadingGroup.gn" -na;
connectAttr "groupId5.msg" ":initialShadingGroup.gn" -na;
connectAttr "groupId7.msg" ":initialShadingGroup.gn" -na;
connectAttr "groupId8.msg" ":initialShadingGroup.gn" -na;
connectAttr "groupId9.msg" ":initialShadingGroup.gn" -na;
connectAttr "groupId10.msg" ":initialShadingGroup.gn" -na;
connectAttr "groupId11.msg" ":initialShadingGroup.gn" -na;
connectAttr "groupId12.msg" ":initialShadingGroup.gn" -na;
connectAttr "groupId13.msg" ":initialShadingGroup.gn" -na;
// End of draft-Lantern.ma
