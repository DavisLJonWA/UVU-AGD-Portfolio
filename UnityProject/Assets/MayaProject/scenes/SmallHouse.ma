//Maya ASCII 2025ff03 scene
//Name: SmallHouse.ma
//Last modified: Mon, Nov 17, 2025 03:55:51 PM
//Codeset: 1252
requires maya "2025ff03";
requires "stereoCamera" "10.0";
requires -nodeType "aiOptions" -nodeType "aiAOVDriver" -nodeType "aiAOVFilter" -nodeType "aiImagerDenoiserOidn"
		 "mtoa" "5.4.5";
requires "stereoCamera" "10.0";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2025";
fileInfo "version" "2025";
fileInfo "cutIdentifier" "202409190603-cbdc5a7e54";
fileInfo "osv" "Windows 11 Home v2009 (Build: 26200)";
fileInfo "UUID" "8F4194F1-43CB-7DED-5C63-7B8DD4BAFDAD";
createNode transform -s -n "persp";
	rename -uid "B1EFE5D9-4F1C-7055-F825-099014105575";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.44437081768836073 2.6472607968244084 10.522157785862341 ;
	setAttr ".r" -type "double3" 3.2616472679835389 359.39999999965505 -2.4849445959823945e-17 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "DD6ADFC9-4429-50C8-B690-F393B37192FD";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 9.0439594574657285;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" 1.4312006235122681 4.1687469482421875 -2.6634678840637207 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "A344186D-4BE0-B601-9297-E2937A618B40";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1000.1 0 ;
	setAttr ".r" -type "double3" -90 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "2924D2A9-4388-FB3F-1059-5DB0134A08DF";
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
	rename -uid "0E744880-4552-F7C3-12A2-F7822B4CD1C3";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 1000.1 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "90AA4C82-4E44-6432-98C5-BC8CF78B9441";
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
	rename -uid "7A9E2005-4985-CD97-A7DB-EC8BF959A4A0";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 0 0 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "6A78FAB6-42C3-54A7-DBEA-9B977AC39FB4";
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
createNode transform -n "pCube1";
	rename -uid "B08FF5C4-4C20-DC02-19A2-4C9102378876";
	setAttr ".rp" -type "double3" 0 2.9593489532036981 0 ;
	setAttr ".sp" -type "double3" 0 2.9593489532036981 0 ;
createNode mesh -n "pCubeShape1" -p "pCube1";
	rename -uid "2E2D3C04-4404-DCA3-D3B2-3D81D71818F0";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.82534927129745483 0.22499998658895493 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 44 ".pt";
	setAttr ".pt[5]" -type "float3" -0.0073328442 0.0090881297 -0.0019926403 ;
	setAttr ".pt[9]" -type "float3" -0.00012459776 0.00015442311 -3.3858414e-05 ;
	setAttr ".pt[11]" -type "float3" -0.0078332927 0.009708371 -0.002128633 ;
	setAttr ".pt[15]" -type "float3" -0.00050187093 0.0006220052 -0.00013637928 ;
	setAttr ".pt[29]" -type "float3" -0.0011473057 0.0014219397 -0.00031177088 ;
	setAttr ".pt[30]" -type "float3" -0.00041949539 0.00051991129 -0.00011399443 ;
	setAttr ".pt[35]" -type "float3" -0.00061043672 0.0007565589 -0.00016588115 ;
	setAttr ".pt[36]" -type "float3" -0.01055466 0.013081159 -0.002868142 ;
	setAttr ".pt[37]" -type "float3" -0.010513314 0.013029917 -0.0028569067 ;
	setAttr ".pt[52]" -type "float3" -0.0010610158 0.0013149948 -0.00028832231 ;
	setAttr ".pt[53]" -type "float3" -0.0091890479 0.011388659 -0.0024970486 ;
	setAttr ".pt[61]" -type "float3" -0.012966611 0.016070468 -0.0035235693 ;
	setAttr ".pt[62]" -type "float3" -0.00088984624 0.0011028511 -0.00024180836 ;
	setAttr ".pt[66]" -type "float3" -0.0015498269 0.0019208136 -0.00042115262 ;
	setAttr ".pt[67]" -type "float3" -0.014715464 0.018237947 -0.0039988053 ;
	setAttr ".pt[79]" -type "float3" -0.0044572395 0.0055241822 -0.0012112181 ;
	setAttr ".pt[92]" -type "float3" -0.011119161 0.013780787 -0.0030215397 ;
	setAttr ".pt[93]" -type "float3" -0.00086233485 0.0010687544 -0.00023433242 ;
	setAttr ".pt[94]" -type "float3" -0.0090176128 0.011176185 -0.002450462 ;
	setAttr ".pt[95]" -type "float3" -0.016059972 0.019904295 -0.004364165 ;
	setAttr ".pt[102]" -type "float3" -0.00019042667 0.00023600966 -5.1746883e-05 ;
	setAttr ".pt[110]" -type "float3" -0.0059425742 0.0073650666 -0.0016148457 ;
	setAttr ".pt[111]" -type "float3" -0.0062403949 0.0077341781 -0.0016957761 ;
	setAttr ".pt[118]" -type "float3" -0.00053690665 0.00066542748 -0.00014589995 ;
	setAttr ".pt[119]" -type "float3" -0.0051032943 0.0063248854 -0.0013867783 ;
	setAttr ".pt[120]" -type "float3" -0.00088984624 0.0011028511 -0.00024180836 ;
	setAttr ".pt[121]" -type "float3" -0.0091153774 0.011297354 -0.0024770293 ;
	setAttr ".pt[122]" -type "float3" -0.013668358 0.016940195 -0.0037142637 ;
	setAttr ".pt[123]" -type "float3" -0.013436333 0.016652629 -0.0036512129 ;
	setAttr ".pt[128]" -type "float3" -0.0094315819 0.011689247 -0.0025629548 ;
	setAttr ".pt[129]" -type "float3" -0.0097740581 0.012113704 -0.0026560193 ;
	setAttr ".pt[130]" -type "float3" -0.016199149 0.020076796 -0.004401987 ;
	setAttr ".pt[131]" -type "float3" -0.014530651 0.018008897 -0.0039485851 ;
	setAttr ".pt[138]" -type "float3" -0.00033149851 0.00041085042 -9.0082001e-05 ;
	setAttr ".pt[139]" -type "float3" -0.0003981269 0.00049342785 -0.00010818771 ;
	setAttr ".pt[140]" -type "float3" -0.0086278543 0.010693128 -0.002344548 ;
	setAttr ".pt[141]" -type "float3" -0.0074004959 0.0091719767 -0.0020110242 ;
	setAttr ".pt[158]" -type "float3" -0.0039818757 0.0049350294 -0.0010820419 ;
	setAttr ".pt[159]" -type "float3" -0.0024774624 0.0030705004 -0.00067322981 ;
	setAttr ".pt[160]" -type "float3" -0.0020570662 0.0025494723 -0.00055899075 ;
	setAttr ".pt[161]" -type "float3" -0.0034730779 0.0043044393 -0.00094378047 ;
	setAttr ".pt[171]" -type "float3" -0.0045235618 0.0056063808 -0.0012292406 ;
createNode mesh -n "polySurfaceShape1" -p "pCube1";
	rename -uid "D7779254-4920-7A43-0AD5-D9BC497AD673";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr -s 6 ".gtag";
	setAttr ".gtag[0].gtagnm" -type "string" "back";
	setAttr ".gtag[0].gtagcmp" -type "componentList" 5 "f[2]" "f[9]" "f[12]" "f[88:89]" "f[96:97]";
	setAttr ".gtag[1].gtagnm" -type "string" "bottom";
	setAttr ".gtag[1].gtagcmp" -type "componentList" 8 "f[3]" "f[13:15]" "f[18:21]" "f[31:34]" "f[37:40]" "f[47:50]" "f[60:63]" "f[66:69]";
	setAttr ".gtag[2].gtagnm" -type "string" "front";
	setAttr ".gtag[2].gtagcmp" -type "componentList" 4 "f[0]" "f[10:11]" "f[86:87]" "f[94:95]";
	setAttr ".gtag[3].gtagnm" -type "string" "left";
	setAttr ".gtag[3].gtagcmp" -type "componentList" 12 "f[5]" "f[8]" "f[16:17]" "f[25:26]" "f[35:36]" "f[45:46]" "f[56:57]" "f[64:65]" "f[92:93]" "f[98:101]" "f[106:107]" "f[110:115]";
	setAttr ".gtag[4].gtagnm" -type "string" "right";
	setAttr ".gtag[4].gtagcmp" -type "componentList" 12 "f[4]" "f[7]" "f[22]" "f[29:30]" "f[41]" "f[44]" "f[51:53]" "f[72:85]" "f[90:91]" "f[102:105]" "f[108:109]" "f[116:121]";
	setAttr ".gtag[5].gtagnm" -type "string" "top";
	setAttr ".gtag[5].gtagcmp" -type "componentList" 8 "f[1]" "f[6]" "f[23:24]" "f[27:28]" "f[42:43]" "f[54:55]" "f[58:59]" "f[70:71]";
	setAttr ".pv" -type "double2" 0.83437496423721313 0.22499999403953552 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 172 ".uvst[0].uvsp[0:171]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25 0.5 0.25 0.5 0.5 0.625 0.22499999 0.625 0.52499998
		 0.87499994 0.22499999 0.375 0.22499999 0.125 0.22499999 0.37499997 0.52499998 0.5
		 0.22499999 0.5 0.52499998 0.5 0 0.5 1 0.5 0.75 0.40000001 0 0.40000001 1 0.40000001
		 0.75 0.60000002 0 0.60000002 1 0.60000002 0.75 0.25 0.25 0.375 0.375 0.25 0.22499999
		 0.25 0 0.375 0.875 0.40000001 0.875 0.5 0.875 0.60000002 0.875 0.625 0.875 0.75 0
		 0.75 0.22499999 0.625 0.375 0.75 0.25 0.5 0.375 0.1375 0 0.37499997 0.76249993 0.1375
		 0.22499999 0.1375 0.25 0.375 0.48750001 0.5 0.48750001 0.625 0.48750001 0.86249995
		 0.25 0.86249995 0.22499999 0.625 0.76249993 0.86249995 0 0.60000002 0.76249999 0.5
		 0.76249999 0.40000001 0.76249999 0.36249998 0.25 0.37499997 0.26249999 0.36249998
		 0.22499998 0.36249998 0 0.375 0.98750001 0.39999998 0.98749995 0.5 0.98749995 0.60000002
		 0.98749995 0.625 0.98750001 0.63750005 0 0.63749999 0.22499998 0.625 0.26249999 0.63749999
		 0.25 0.5 0.26249999 0.75 0.1125 0.86249995 0.1125 0.19374999 0.25 0.375 0.43125001
		 0.19374999 0.22499999 0.19374999 0 0.375 0.81874996 0.40000001 0.81875002 0.5 0.81875002
		 0.60000002 0.81875002 0.625 0.81874996 0.80624998 0 0.80624998 0.1125 0.80624998
		 0.22499999 0.625 0.43125001 0.80624998 0.25 0.5 0.43125001 0.16 0 0.375 0.78499997
		 0.16 0.22499999 0.16 0.25 0.375 0.46500003 0.5 0.46500003 0.625 0.46500003 0.83999991
		 0.25 0.625 0.78499997 0.83999997 0 0.60000002 0.78499997 0.5 0.78499997 0.40000001
		 0.78499997 0.22750001 0.25 0.375 0.39750001 0.22750001 0.22499999 0.22749999 0 0.375
		 0.85249996 0.40000004 0.85250008 0.5 0.85250008 0.60000002 0.85250008 0.625 0.85249996
		 0.77249998 0 0.625 0.39750001 0.77250004 0.25 0.5 0.39750001 0.75 0.22499999 0.75
		 0.1125 0.75 0 0.77249998 0 0.83999997 0 0.86249995 0 0.86249995 0.1125 0.86249995
		 0.22499999 0.80624998 0.22499999 0.80624998 0 0.86249995 0.23885822 0.75 0.23885822
		 0.78505814 0.22499999 0.82744181 0.22499999 0.5 0.22499999 0.625 0.22499999 0.625
		 0.25 0.5 0.25 0.375 0.5 0.5 0.5 0.5 0.52499998 0.37499997 0.52499998 0.63749999 0.22499998
		 0.63749999 0.25 0.36249998 0.22499998 0.375 0.22499999 0.375 0.25 0.36249998 0.25
		 0.625 0.5 0.625 0.52499998 0.125 0.22499999 0.1375 0.22499999 0.1375 0.25 0.125 0.25
		 0.22750001 0.22499999 0.25 0.22499999 0.25 0.25 0.22750001 0.25 0.77250004 0.25 0.75
		 0.25 0.75 0.23885822 0.78505814 0.22499999 0.80624998 0.22499999 0.80624998 0.25
		 0.16 0.22499999 0.16 0.25 0.19374999 0.22499999 0.19374999 0.25 0.875 0.25 0.86249995
		 0.25 0.86249995 0.23885822 0.87499994 0.22499999 0.82744181 0.22499999 0.83999991
		 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 133 ".pt[0:132]" -type "float3"  -0.93120062 2.0281484 2.7891765 
		0.93120062 2.0281484 2.7891765 -0.93120062 3.8905497 2.7891765 0.93120062 3.8905497 
		2.7891765 -0.93120062 3.8905497 -2.7891765 0.93120062 3.8905497 -2.7891765 -0.93120062 
		2.0281484 -2.7891765 0.93120062 2.0281484 -2.7891765 0 4.4435554 2.7891765 0 4.4435554 
		-2.7891765 0.93120062 3.7043092 2.7891765 0.93120062 3.7043092 -2.7891765 -0.93120062 
		3.7043092 2.7891765 -0.93120062 3.7043092 -2.7891765 0 4.2573152 2.7891765 0 4.2573152 
		-2.7891765 0 2.0281484 2.7891765 0 2.0281484 -2.7891765 -0.74496055 2.0281484 2.7891765 
		-0.74496055 2.0281484 -2.7891765 0.74496055 2.0281484 2.7891765 0.74496055 2.0281484 
		-2.7891765 -0.93120062 3.8905497 0 -0.93120062 3.7043092 0 -0.93120062 2.0281484 
		0 -0.74496055 2.0281484 0 0 2.0281484 0 0.74496055 2.0281484 0 0.93120062 2.0281484 
		0 0.93120062 3.4726622 0 0.93120062 3.8905497 0 0 4.4435554 0 -0.93120062 2.0281484 
		-2.5102587 -0.93120062 3.7043092 -2.5102587 -0.93120062 3.8905497 -2.5102587 0 4.4435554 
		-2.5102587 0.93120062 3.8905497 -2.5102587 0.93120062 3.4726622 -2.5102587 0.93120062 
		2.0281484 -2.5102587 0.74496055 2.0281484 -2.5102587 0 2.0281484 -2.5102587 -0.74496055 
		2.0281484 -2.5102587 -0.93120062 3.8905497 2.5102587 -0.93120062 3.7043092 2.5102587 
		-0.93120062 2.0281484 2.5102587 -0.74496049 2.0281484 2.5102587 0 2.0281484 2.5102587 
		0.74496049 2.0281484 2.5102587 0.93120062 2.0281484 2.5102587 0.93120062 3.7043092 
		2.5102587 0.93120062 3.8905497 2.5102587 0 4.4435554 2.5102587 0.93120062 3.272085 
		0 0.93120062 3.272085 -2.5102587 -0.93120062 3.8905497 -1.2551293 -0.93120062 3.7043092 
		-1.2551293 -0.93120062 2.0281484 -1.2551293 -0.74496055 2.0281484 -1.2551293 0 2.0281484 
		-1.2551293 0.74496055 2.0281484 -1.2551293 0.93120062 2.0281484 -1.2551293 0.93120062 
		3.8443346 -1.2551293 0.93120062 3.8905497 -1.2551293 0 4.4435554 -1.2551293 -0.93120062 
		2.0281484 -2.0082071 -0.93120062 3.7043092 -2.0082071 -0.93120062 3.8905497 -2.0082071 
		0 4.4435554 -2.0082071 0.93120062 3.8905497 -2.0082071 0.93120062 2.0281484 -2.0082071 
		0.74496055 2.0281484 -2.0082071 0 2.0281484 -2.0082071 -0.74496055 2.0281484 -2.0082071 
		-0.93120062 3.8905497 -0.50205171 -0.93120062 3.7043092 -0.50205171 -0.93120062 2.0281484 
		-0.50205171 -0.74496067 2.0281484 -0.50205171 0 2.0281484 -0.50205171 0.74496067 
		2.0281484 -0.50205171 0.93120062 2.0281484 -0.50205171 0.93120062 3.8905497 -0.50205171 
		0 4.4435554 -0.50205171 2.8891294 3.272085 8.2847937e-15 2.8891294 3.4726624 8.2847937e-15 
		2.8891294 2.0281482 -0.50205171 2.8891294 2.0281482 8.2847937e-15 2.8891294 3.272085 
		-2.5102587 2.8891294 2.0281484 -2.0082071 2.8891294 2.0281482 -2.5102587 2.8891294 
		3.4726624 -2.5102587 2.8891294 3.6365409 -1.2551293 2.8891294 3.8443346 -1.2551293 
		2.8891294 2.0281484 -1.2551293 0.93120062 3.7043092 -2.5102587 0.93120062 3.7043092 
		0 0.93120062 3.7043097 -0.78226697 0.93120062 3.7043092 -1.7279918 0 4.4620366 2.9286351 
		0 4.2664843 2.9286351 1.0261027 3.7142329 2.9286351 1.0261027 3.8813806 2.9286351 
		-1.0261027 3.8813806 -2.9286351 0 4.4620366 -2.9286351 0 4.2664843 -2.9286351 -1.0261027 
		3.6858282 -2.9286351 1.0261027 3.7142329 2.6357715 1.0261027 3.8813806 2.6357715 
		-1.0261027 3.8813806 2.6357715 -1.0261027 3.6858282 2.6357715 -1.0261027 3.6858282 
		2.9286351 -1.0261027 3.8813806 2.9286351 1.0261027 3.8813806 -2.9286351 1.0261027 
		3.7142324 -2.9286351 -1.0261027 3.6858282 -2.6357715 -1.0261027 3.8813806 -2.6357715 
		-1.0261027 3.8813806 -0.52715433 -1.0261027 3.6858282 -0.52715433 -1.0261027 3.6858282 
		0 -1.0261027 3.8813806 0 1.0261027 3.8813806 0 1.0261027 3.8813806 -0.52715433 1.0261027 
		3.7142329 0 1.0261027 3.7043095 -0.78226697 1.0261027 3.8443346 -1.2551293 1.0261027 
		3.8813806 -1.2551293 -1.0261027 3.6858282 -2.1086175 -1.0261027 3.8813806 -2.1086175 
		-1.0261027 3.6858282 -1.3178858 -1.0261027 3.8813806 -1.3178858 1.0261027 3.8813806 
		-2.6357715 1.0261027 3.7142324 -2.6357715 1.0261027 3.7043092 -1.7279919 1.0261027 
		3.8813806 -2.1086175;
	setAttr -s 133 ".vt[0:132]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5 0 0.79693162 0.5 0 0.79693162 -0.5
		 0.5 0.39999986 0.5 0.5 0.39999986 -0.5 -0.5 0.39999986 0.5 -0.5 0.39999986 -0.5 0 0.69693148 0.5
		 0 0.69693148 -0.5 0 -0.5 0.5 0 -0.5 -0.5 -0.40000001 -0.5 0.5 -0.40000001 -0.5 -0.5
		 0.40000001 -0.5 0.5 0.40000001 -0.5 -0.5 -0.5 0.5 0 -0.5 0.39999986 0 -0.5 -0.5 0
		 -0.40000001 -0.5 0 0 -0.5 0 0.40000001 -0.5 0 0.5 -0.5 0 0.5 0.27561903 0 0.5 0.5 0
		 0 0.79693162 0 -0.5 -0.5 -0.44999999 -0.5 0.39999986 -0.44999999 -0.5 0.5 -0.44999999
		 0 0.79693162 -0.44999999 0.5 0.5 -0.44999999 0.5 0.27561903 -0.44999999 0.5 -0.5 -0.44999999
		 0.40000001 -0.5 -0.44999999 0 -0.5 -0.44999999 -0.40000001 -0.5 -0.44999999 -0.5 0.5 0.44999999
		 -0.5 0.39999986 0.44999999 -0.5 -0.5 0.44999999 -0.39999998 -0.5 0.44999999 0 -0.5 0.44999999
		 0.39999998 -0.5 0.44999999 0.5 -0.5 0.44999999 0.5 0.39999986 0.44999999 0.5 0.5 0.44999999
		 0 0.79693162 0.44999999 0.5 0.16792083 0 0.5 0.16792083 -0.44999999 -0.5 0.5 -0.22499999
		 -0.5 0.39999986 -0.22499999 -0.5 -0.5 -0.22499999 -0.40000001 -0.5 -0.22499999 0 -0.5 -0.22499999
		 0.40000001 -0.5 -0.22499999 0.5 -0.5 -0.22499999 0.5 0.47518528 -0.22499999 0.5 0.5 -0.22499999
		 0 0.79693162 -0.22499999 -0.5 -0.5 -0.36000001 -0.5 0.39999986 -0.36000001 -0.5 0.5 -0.36000001
		 0 0.79693162 -0.36000001 0.5 0.5 -0.36000001 0.5 -0.5 -0.36000001 0.40000001 -0.5 -0.36000001
		 0 -0.5 -0.36000001 -0.40000001 -0.5 -0.36000001 -0.5 0.5 -0.089999996 -0.5 0.39999986 -0.089999996
		 -0.5 -0.5 -0.089999989 -0.40000007 -0.5 -0.089999996 0 -0.5 -0.089999996 0.40000007 -0.5 -0.089999996
		 0.5 -0.5 -0.089999989 0.5 0.5 -0.089999996 0 0.79693162 -0.089999996 1.55129266 0.16792083 1.4851685e-15
		 1.55129266 0.27561915 1.4851685e-15 1.55129266 -0.50000006 -0.089999989 1.55129266 -0.50000006 1.4851685e-15
		 1.55129266 0.16792083 -0.44999999 1.55129266 -0.5 -0.36000001 1.55129266 -0.50000006 -0.44999999
		 1.55129266 0.27561915 -0.44999999 1.55129266 0.36361229 -0.22499999 1.55129266 0.47518528 -0.22499999
		 1.55129266 -0.5 -0.22499999 0.5 0.39999986 -0.44999999 0.5 0.39999986 0 0.5 0.4000001 -0.14023261
		 0.5 0.39999986 -0.3097674 0 0.80685484 0.52499998 0 0.70185483 0.52499998 0.55095679 0.39007664 0.52499998
		 0.55095679 0.49507678 0.52499998 -0.55095679 0.49507678 -0.52499998 0 0.80685484 -0.52499998
		 0 0.70185483 -0.52499998 -0.55095679 0.39007664 -0.52499998 0.55095679 0.39007664 0.47249997
		 0.55095679 0.49507678 0.47249997 -0.55095679 0.49507678 0.47249997 -0.55095679 0.39007664 0.47249997
		 -0.55095679 0.39007664 0.52499998 -0.55095679 0.49507678 0.52499998 0.55095679 0.49507678 -0.52499998
		 0.55095679 0.39007664 -0.52499998 -0.55095679 0.39007664 -0.47249997 -0.55095679 0.49507678 -0.47249997
		 -0.55095679 0.49507678 -0.094499998 -0.55095679 0.39007664 -0.094499998 -0.55095679 0.39007664 0
		 -0.55095679 0.49507678 0 0.55095679 0.49507678 0 0.55095679 0.49507678 -0.094499998
		 0.55095679 0.39007664 0 0.55095679 0.40000004 -0.14023261 0.55095679 0.4751853 -0.22499999
		 0.55095679 0.49507678 -0.22499999 -0.55095679 0.39007664 -0.37800002 -0.55095679 0.49507678 -0.37800002
		 -0.55095679 0.39007664 -0.23624998 -0.55095679 0.49507678 -0.23624998 0.55095679 0.49507678 -0.47249997
		 0.55095679 0.39007664 -0.47249997 0.55095679 0.39999986 -0.30976743 0.55095679 0.49507678 -0.37800002;
	setAttr -s 253 ".ed";
	setAttr ".ed[0:165]"  0 18 0 2 8 1 4 9 1 6 19 0 0 12 0 1 10 0 2 42 1 3 50 1
		 6 32 0 7 38 0 8 3 1 9 5 1 8 51 1 11 7 0 10 49 0 13 6 0 12 43 0 11 15 0 12 14 0 14 10 0
		 15 13 0 16 20 0 17 21 0 16 46 1 18 16 0 19 17 0 18 45 1 20 1 0 21 7 0 20 47 1 22 73 1
		 23 74 0 24 44 0 25 76 1 26 77 1 27 78 1 28 48 0 30 80 1 31 81 1 23 24 1 24 25 1 25 26 1
		 26 27 1 27 28 1 28 52 0 29 94 1 30 31 1 31 22 1 32 64 0 33 13 0 34 4 1 35 9 1 36 5 1
		 38 69 1 39 21 1 40 17 1 41 19 1 32 33 1 34 35 1 35 36 1 37 53 0 38 39 1 39 40 1 40 41 1
		 41 32 1 42 22 1 43 23 0 44 0 0 45 25 1 46 26 1 47 27 1 48 1 0 50 30 1 51 31 1 43 44 1
		 44 45 1 45 46 1 46 47 1 47 48 1 48 49 1 50 51 1 51 42 1 52 29 0 53 38 0 54 66 1 55 65 0
		 56 75 0 57 72 1 58 71 1 59 70 1 60 79 1 62 68 1 63 67 1 55 56 1 56 57 1 57 58 1 58 59 1
		 59 60 1 62 63 1 63 54 1 64 56 0 65 33 0 66 34 1 67 35 1 68 36 1 61 96 0 69 60 1 70 39 1
		 71 40 1 72 41 1 64 65 1 66 67 1 67 68 1 69 70 1 70 71 1 71 72 1 72 64 1 73 54 1 74 55 0
		 75 24 0 76 57 1 77 58 1 78 59 1 79 28 1 29 95 0 80 62 1 81 63 1 74 75 1 75 76 1 76 77 1
		 77 78 1 78 79 1 80 81 1 81 73 1 52 82 1 29 83 0 82 83 0 79 84 1 28 85 0 85 82 0 84 85 0
		 53 86 1 69 87 1 38 88 0 88 87 0 86 88 0 37 89 0 89 86 0 61 91 1 90 91 1 90 86 1 91 89 0
		 60 92 1 92 90 1 87 92 0 82 90 1 92 84 0 83 91 0 93 37 1 11 93 0 49 94 0 95 61 0 94 95 0
		 96 37 0 93 96 0 8 97 0;
	setAttr ".ed[166:252]" 14 98 0 97 98 1 10 99 1 98 99 0 3 100 1 99 100 0 97 100 0
		 4 101 1 9 102 0 101 102 0 15 103 0 102 103 1 13 104 1 103 104 0 101 104 0 49 105 1
		 99 105 0 50 106 1 105 106 1 100 106 0 42 107 1 43 108 1 107 108 1 12 109 1 109 108 0
		 2 110 1 109 110 0 110 107 0 109 98 0 110 97 0 5 111 1 102 111 0 11 112 1 111 112 0
		 112 103 0 33 113 1 113 104 0 34 114 1 113 114 1 114 101 0 73 115 1 74 116 1 115 116 1
		 23 117 1 117 116 0 22 118 1 118 117 1 118 115 0 30 119 1 80 120 1 119 120 0 94 121 1
		 121 119 1 95 122 1 121 122 0 61 123 0 122 123 0 62 124 1 123 124 1 120 124 0 108 117 0
		 107 118 0 105 121 0 106 119 0 65 125 1 125 113 0 66 126 1 125 126 1 126 114 0 55 127 1
		 127 125 0 54 128 1 128 127 1 128 126 0 116 127 0 115 128 0 36 129 1 129 111 0 93 130 1
		 129 130 1 112 130 0 96 131 0 123 131 0 130 131 0 68 132 1 132 129 0 124 132 0;
	setAttr -s 122 -ch 506 ".fc[0:121]" -type "polyFaces" 
		f 4 167 169 171 -173
		mu 0 4 135 132 133 134
		f 4 1 12 81 -7
		mu 0 4 2 14 74 62
		f 4 175 177 179 -181
		mu 0 4 136 137 138 139
		f 4 29 78 71 -28
		mu 0 4 31 68 69 9
		f 4 182 184 -186 -172
		mu 0 4 133 140 141 134
		f 4 74 67 4 16
		mu 0 4 63 64 0 19
		f 4 80 -13 10 7
		mu 0 4 72 74 14 3
		f 4 -72 79 -15 -6
		mu 0 4 1 70 71 16
		f 4 188 -191 192 193
		mu 0 4 145 142 143 144
		f 8 -21 -18 13 -29 -23 -26 -4 -16
		mu 0 8 21 23 17 7 32 26 29 6
		f 8 0 24 21 27 5 -20 -19 -5
		mu 0 8 0 27 24 30 1 16 22 19
		f 4 194 -168 -196 -193
		mu 0 4 143 132 135 144
		f 4 -178 197 199 200
		mu 0 4 138 137 146 147
		f 4 26 76 -24 -25
		mu 0 4 28 66 67 25
		f 4 75 -27 -1 -68
		mu 0 4 65 66 28 8
		f 4 23 77 -30 -22
		mu 0 4 25 67 68 31
		f 4 -203 204 205 180
		mu 0 4 148 149 150 151
		f 4 8 57 49 15
		mu 0 4 12 47 49 20
		f 4 3 -57 64 -9
		mu 0 4 6 29 60 48
		f 4 63 56 25 -56
		mu 0 4 59 60 29 26
		f 4 62 55 22 -55
		mu 0 4 58 59 26 32
		f 4 61 54 28 9
		mu 0 4 56 58 32 7
		f 6 159 158 60 83 -10 -14
		mu 0 6 18 128 55 76 57 10
		f 4 -52 59 52 -12
		mu 0 4 15 52 53 5
		f 4 58 51 -3 -51
		mu 0 4 51 52 15 4
		f 4 127 119 -40 31
		mu 0 4 107 108 36 35
		f 4 208 -211 -213 213
		mu 0 4 155 152 153 154
		f 4 -48 38 133 -31
		mu 0 4 34 46 117 106
		f 4 132 -39 -47 37
		mu 0 4 115 117 46 44
		f 6 -217 -219 220 222 224 -226
		mu 0 6 156 157 158 159 160 161
		f 4 -137 155 149 -158
		mu 0 4 118 119 87 126
		f 4 -44 35 131 123
		mu 0 4 41 40 112 113
		f 4 -43 34 130 -36
		mu 0 4 40 39 111 112
		f 4 -42 33 129 -35
		mu 0 4 39 38 110 111
		f 4 128 -34 -41 -120
		mu 0 4 109 110 38 37
		f 4 212 -227 -189 227
		mu 0 4 154 153 142 145
		f 4 39 32 -75 66
		mu 0 4 35 36 64 63
		f 4 40 -69 -76 -33
		mu 0 4 37 38 66 65
		f 4 -77 68 41 -70
		mu 0 4 67 66 38 39
		f 4 -78 69 42 -71
		mu 0 4 68 67 39 40
		f 4 -79 70 43 36
		mu 0 4 69 68 40 41
		f 4 228 218 -230 -185
		mu 0 4 140 158 157 141
		f 4 46 -74 -81 72
		mu 0 4 44 46 74 72
		f 4 -82 73 47 -66
		mu 0 4 62 74 46 34
		f 5 -140 -141 -157 153 -156
		mu 0 5 119 120 121 127 87
		f 4 -205 -232 233 234
		mu 0 4 150 149 162 163
		f 4 -58 48 110 101
		mu 0 4 49 47 92 94
		f 4 -65 -110 116 -49
		mu 0 4 48 60 104 93
		f 4 115 109 -64 -109
		mu 0 4 103 104 60 59
		f 4 114 108 -63 -108
		mu 0 4 102 103 59 58
		f 4 113 107 -62 53
		mu 0 4 100 102 58 56
		f 5 -145 -146 -151 -154 -155
		mu 0 5 122 123 124 87 127
		f 4 -148 -152 -150 150
		mu 0 4 124 125 126 87
		f 3 164 163 -159
		mu 0 3 128 131 55
		f 4 -60 -104 112 104
		mu 0 4 53 52 97 98
		f 4 111 103 -59 -103
		mu 0 4 96 97 52 51
		f 4 -111 100 -94 85
		mu 0 4 94 92 80 79
		f 4 -234 -237 -239 239
		mu 0 4 163 162 164 165
		f 4 -100 92 -112 -85
		mu 0 4 78 91 97 96
		f 4 -113 -93 -99 91
		mu 0 4 98 97 91 89
		f 4 -98 89 -114 106
		mu 0 4 85 84 102 100
		f 4 -97 88 -115 -90
		mu 0 4 84 83 103 102
		f 4 -96 87 -116 -89
		mu 0 4 83 82 104 103
		f 4 -117 -88 -95 -101
		mu 0 4 93 104 82 81
		f 4 238 -241 -209 241
		mu 0 4 165 164 152 155
		f 4 93 86 -128 118
		mu 0 4 79 80 108 107
		f 4 94 -121 -129 -87
		mu 0 4 81 82 110 109
		f 4 -130 120 95 -122
		mu 0 4 111 110 82 83
		f 4 -131 121 96 -123
		mu 0 4 112 111 83 84
		f 4 -132 122 97 90
		mu 0 4 113 112 84 85
		f 4 98 -127 -133 125
		mu 0 4 89 91 117 115
		f 4 -134 126 99 -118
		mu 0 4 106 117 91 78
		f 4 -83 134 136 -136
		mu 0 4 43 75 119 118
		f 4 -45 138 139 -135
		mu 0 4 75 42 120 119
		f 4 -124 137 140 -139
		mu 0 4 42 114 121 120
		f 4 -54 143 144 -143
		mu 0 4 101 57 123 122
		f 4 -84 141 145 -144
		mu 0 4 57 76 124 123
		f 4 -61 146 147 -142
		mu 0 4 76 55 125 124
		f 5 -147 -164 -106 148 151
		mu 0 5 125 55 131 88 126
		f 4 -107 142 154 -153
		mu 0 4 86 101 122 127
		f 4 -91 152 156 -138
		mu 0 4 114 86 127 121
		f 5 157 -149 -162 -125 135
		mu 0 5 118 126 88 130 43
		f 4 -200 -244 245 -247
		mu 0 4 169 166 167 168
		f 6 45 -161 -80 -37 44 82
		mu 0 6 43 129 71 70 42 75
		f 3 -163 -46 124
		mu 0 3 130 129 43
		f 6 248 -250 -246 -252 -253 -225
		mu 0 6 160 170 168 167 171 161
		f 4 19 168 -170 -167
		mu 0 4 22 16 133 132
		f 4 -11 165 172 -171
		mu 0 4 3 14 135 134
		f 4 2 174 -176 -174
		mu 0 4 4 15 137 136
		f 4 20 178 -180 -177
		mu 0 4 23 21 139 138
		f 4 14 181 -183 -169
		mu 0 4 16 71 140 133
		f 4 -8 170 185 -184
		mu 0 4 73 3 134 141
		f 4 -17 189 190 -188
		mu 0 4 63 19 143 142
		f 4 6 186 -194 -192
		mu 0 4 2 61 145 144
		f 4 18 166 -195 -190
		mu 0 4 19 22 132 143
		f 4 -2 191 195 -166
		mu 0 4 14 2 144 135
		f 4 11 196 -198 -175
		mu 0 4 15 5 146 137
		f 4 17 176 -201 -199
		mu 0 4 17 23 138 147
		f 4 -50 201 202 -179
		mu 0 4 20 49 149 148
		f 4 50 173 -206 -204
		mu 0 4 50 13 151 150
		f 4 -32 209 210 -208
		mu 0 4 107 35 153 152
		f 4 30 206 -214 -212
		mu 0 4 33 105 155 154
		f 4 -38 214 216 -216
		mu 0 4 116 45 157 156
		f 4 162 219 -221 -218
		mu 0 4 129 130 159 158
		f 4 161 221 -223 -220
		mu 0 4 130 88 160 159
		f 4 -126 215 225 -224
		mu 0 4 90 116 156 161
		f 4 -67 187 226 -210
		mu 0 4 35 63 142 153
		f 4 65 211 -228 -187
		mu 0 4 61 33 154 145
		f 4 160 217 -229 -182
		mu 0 4 71 129 158 140
		f 4 -73 183 229 -215
		mu 0 4 45 73 141 157
		f 4 -102 230 231 -202
		mu 0 4 49 94 162 149
		f 4 102 203 -235 -233
		mu 0 4 95 50 150 163
		f 4 -86 235 236 -231
		mu 0 4 94 79 164 162
		f 4 84 232 -240 -238
		mu 0 4 77 95 163 165
		f 4 -119 207 240 -236
		mu 0 4 79 107 152 164
		f 4 117 237 -242 -207
		mu 0 4 105 77 165 155
		f 4 -53 242 243 -197
		mu 0 4 11 54 167 166
		f 4 -160 198 246 -245
		mu 0 4 128 18 169 168
		f 4 105 247 -249 -222
		mu 0 4 88 131 170 160
		f 4 -165 244 249 -248
		mu 0 4 131 128 168 170
		f 4 -105 250 251 -243
		mu 0 4 54 99 171 167
		f 4 -92 223 252 -251
		mu 0 4 99 90 161 171;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode lightLinker -s -n "lightLinker1";
	rename -uid "82B68E0A-4500-88EE-E188-AF8D548BFA31";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "1A8583E0-4724-B5E9-B5E9-EA83CFC842AE";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "346DFF5A-4E2F-3BF3-0FFA-CE8EA29EE9AB";
createNode displayLayerManager -n "layerManager";
	rename -uid "D1D0BFC3-44E9-888B-4837-8990F51FD207";
createNode displayLayer -n "defaultLayer";
	rename -uid "C1DE5C64-4F5A-ECFB-BC5D-6FB54BAB01E9";
	setAttr ".ufem" -type "stringArray" 0  ;
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "0C9876F9-4214-833D-A58C-A08364828729";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "57B1A4D7-406C-4B0F-9E6A-A0B204BBBB01";
	setAttr ".g" yes;
createNode script -n "uiConfigurationScriptNode";
	rename -uid "1F8BCD62-48F2-0D96-D9C5-3DAB1A3A4C8D";
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
		+ "            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -bluePencil 1\n            -greasePencils 0\n            -excludeObjectPreset \"All\" \n            -shadows 0\n            -captureSequenceNumber -1\n            -width 2220\n            -height 1114\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n"
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
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"contentBrowserPanel\" (localizedPanelLabel(\"Content Browser\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Content Browser\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"Stereo\" (localizedPanelLabel(\"Stereo\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels  $panelName;\n{ string $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -camera \"|persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n"
		+ "                -headsUpDisplay 1\n                -holdOuts 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 32768\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -depthOfFieldPreview 1\n                -maxConstantTransparency 1\n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n"
		+ "                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -controllers 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n"
		+ "                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -bluePencil 1\n                -greasePencils 0\n                -excludeObjectPreset \"All\" \n                -shadows 0\n                -captureSequenceNumber -1\n                -width 0\n                -height 0\n                -sceneRenderFilter 0\n                -displayMode \"centerEye\" \n                -viewColor 0 0 0 1 \n                -useCustomBackground 1\n                $editorName;\n            stereoCameraView -e -viewSelected 0 $editorName;\n"
		+ "            stereoCameraView -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName; };\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-userCreated false\n\t\t\t\t-defaultImage \"\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -bluePencil 1\\n    -greasePencils 0\\n    -excludeObjectPreset \\\"All\\\" \\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 2220\\n    -height 1114\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -bluePencil 1\\n    -greasePencils 0\\n    -excludeObjectPreset \\\"All\\\" \\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 2220\\n    -height 1114\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 12 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "FE33F8D1-4093-3354-A36E-ACA57F9B41F7";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 120 -ast 1 -aet 200 ";
	setAttr ".st" 6;
createNode aiOptions -s -n "defaultArnoldRenderOptions";
	rename -uid "18480F6E-4406-EEB6-F2E0-628844A4CC71";
	setAttr ".version" -type "string" "5.4.5";
createNode aiAOVFilter -s -n "defaultArnoldFilter";
	rename -uid "1DCA47E9-4CE2-FA56-D31C-C791C3E83937";
	setAttr ".ai_translator" -type "string" "gaussian";
createNode aiAOVDriver -s -n "defaultArnoldDriver";
	rename -uid "56EFAC8B-4919-376B-2C3B-0686D560CD90";
	setAttr ".ai_translator" -type "string" "exr";
createNode aiAOVDriver -s -n "defaultArnoldDisplayDriver";
	rename -uid "C05F48F4-4400-AD02-86B9-4B945BA85C8F";
	setAttr ".ai_translator" -type "string" "maya";
	setAttr ".output_mode" 0;
createNode aiImagerDenoiserOidn -s -n "defaultArnoldDenoiser";
	rename -uid "2C0F92E4-4FBF-4A14-187C-07B5C5BCCC74";
createNode polySplit -n "polySplit1";
	rename -uid "22F8A8A6-4113-23E5-D06D-CC9052EBE464";
	setAttr -s 2 ".v[0:1]" -type "float3"  1.506267 4.146811 -1.927634 
		1.5160021 4.1453009 -1.028712;
	setAttr -s 5 ".e[0:4]"  0.80226302 78 0.028571401 81 0.18878999;
	setAttr -s 5 ".d[0:4]"  -2147483543 0 -2147483500 1 -2147483487;
	setAttr ".sma" 180;
	setAttr ".m2015" yes;
createNode objectSet -n "set1";
	rename -uid "2E9541B3-43FC-5D35-FDFB-7188DB12487B";
	setAttr ".ihi" 0;
createNode groupId -n "groupId1";
	rename -uid "AEB2FAD4-4EB1-2438-B0D7-2EB60F71B2D3";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts1";
	rename -uid "1C6A7194-4B3E-E8EE-FAC1-A0B070ABABBA";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 3 "e[105]" "e[148]" "e[255:259]";
createNode polyTweak -n "polyTweak1";
	rename -uid "E2CDEF95-4959-B2A1-CC2B-FAA313708638";
	setAttr ".uopa" yes;
	setAttr -s 6 ".tk";
	setAttr ".tk[133]" -type "float3" 0 -0.042554855 -0.11026406 ;
	setAttr ".tk[134]" -type "float3" 0.05988121 4.7683716e-07 0 ;
	setAttr ".tk[135]" -type "float3" 0 -0.040629387 0.10527498 ;
	setAttr ".tk[136]" -type "float3" 0.070792556 -0.042501926 -0.1101253 ;
	setAttr ".tk[137]" -type "float3" 0.061057448 -0.040991306 0.10621244 ;
createNode deleteComponent -n "deleteComponent1";
	rename -uid "B464A5E7-4B5F-4034-BCF5-728049DADD55";
	setAttr ".dc" -type "componentList" 1 "f[122:123]";
createNode objectSet -n "set2";
	rename -uid "B96F21AA-463B-F826-2E89-A3939FCEB40B";
	setAttr ".ihi" 0;
createNode groupId -n "groupId2";
	rename -uid "891A601C-40B7-A32F-E072-DD9AC6029EB0";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts2";
	rename -uid "E40B0155-4BA2-1CA9-0FA8-288E4E35FF0E";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 7 "e[105]" "e[160]" "e[218]" "e[220:221]" "e[246:247]" "e[252]" "e[254]";
createNode deleteComponent -n "deleteComponent2";
	rename -uid "C3606E48-44B1-60BE-5600-EE8B8CEA74A8";
	setAttr ".dc" -type "componentList" 2 "f[104]" "f[118]";
createNode polyMergeVert -n "polyMergeVert1";
	rename -uid "DBE99A11-4A00-5CB9-511D-F082C628156A";
	setAttr ".ics" -type "componentList" 1 "vtx[*]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".am" yes;
createNode polyExtrudeFace -n "polyExtrudeFace1";
	rename -uid "748798E0-4885-3AD4-F0AD-1B967579F694";
	setAttr ".ics" -type "componentList" 4 "f[30]" "f[52]" "f[72]" "f[77]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".s" -type "double3" 1.1199999988492149 1.1199999988492149 1.1199999988492149 ;
	setAttr ".pvt" -type "float3" 2.9358113 3.8797629 -1.4801294 ;
	setAttr ".rs" 46607;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" 1.4312006235122681 3.4400057792663574 -2.9602587223052979 ;
	setAttr ".cbx" -type "double3" 4.4404220581054688 4.3195199966430664 9.7699626167013776e-15 ;
createNode polySplit -n "polySplit2";
	rename -uid "31D99575-41AD-7132-7316-8F9D069046EE";
	setAttr -s 2 ".v[0:1]" -type "float3"  1.431201 3.822468 0.348616 
		1.431201 3.26702 0.34915999;
	setAttr -s 4 ".e[0:3]"  0.31691301 83 83 0.94909501;
	setAttr -s 4 ".d[0:3]"  -2147483603 0 1 -2147483604;
	setAttr ".sma" 180;
	setAttr ".m2015" yes;
createNode polyTweak -n "polyTweak2";
	rename -uid "9AA1B272-410C-3724-B60C-A381A5F6E0D5";
	setAttr ".uopa" yes;
	setAttr -s 5 ".tk";
	setAttr ".tk[138]" -type "float3" 0.18250874 0 0 ;
	setAttr ".tk[139]" -type "float3" 0.18250874 0 0 ;
createNode polySplit -n "polySplit3";
	rename -uid "E2365B9B-48FB-B29B-D39C-F8A8AA2B1982";
	setAttr -s 2 ".v[0:1]" -type "float3"  1.431201 3.3789771 -3.1588781 
		1.431201 3.7565839 -3.1686821;
	setAttr -s 4 ".e[0:3]"  0.031451799 22 22 0.90221202;
	setAttr -s 4 ".d[0:3]"  -2147483565 0 1 -2147483495;
	setAttr ".sma" 180;
	setAttr ".m2015" yes;
createNode deleteComponent -n "deleteComponent3";
	rename -uid "66DC45F0-471A-6B11-D0FE-2EB0B1D67D9B";
	setAttr ".dc" -type "componentList" 1 "f[127]";
createNode deleteComponent -n "deleteComponent4";
	rename -uid "67890BEA-4053-E45E-B82A-64BEE84217CC";
	setAttr ".dc" -type "componentList" 1 "f[22]";
createNode polyTweak -n "polyTweak3";
	rename -uid "731C59F4-4D67-9C6A-4F42-97BB2C1F2EE6";
	setAttr ".uopa" yes;
	setAttr -s 7 ".tk";
	setAttr ".tk[140]" -type "float3" 0.18055356 0 0 ;
	setAttr ".tk[141]" -type "float3" 0.18055356 0 0 ;
	setAttr ".tk[146]" -type "float3" 1.1920929e-07 0.060131311 0 ;
	setAttr ".tk[147]" -type "float3" 0 -0.034815311 -2.3841858e-07 ;
	setAttr ".tk[148]" -type "float3" 0 0.0082578659 0.021003962 ;
	setAttr ".tk[149]" -type "float3" 0 -0.024080753 0.030807972 ;
createNode deleteComponent -n "deleteComponent5";
	rename -uid "56E13527-4DD0-8F13-D046-92A19C945C2D";
	setAttr ".dc" -type "componentList" 1 "f[82]";
createNode deleteComponent -n "deleteComponent6";
	rename -uid "5F210275-4A78-D430-FC49-ACB568A1BF02";
	setAttr ".dc" -type "componentList" 1 "f[122]";
createNode polyMergeVert -n "polyMergeVert2";
	rename -uid "C90E5B2F-4C01-175B-AB2E-74B67E231CA4";
	setAttr ".ics" -type "componentList" 1 "vtx[*]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".am" yes;
createNode polyTweak -n "polyTweak4";
	rename -uid "CBC22B81-404C-C96C-9B63-D0AA8186A79B";
	setAttr ".uopa" yes;
	setAttr -s 6 ".tk";
	setAttr ".tk[142]" -type "float3" 0 -0.11282992 0 ;
	setAttr ".tk[143]" -type "float3" 0 0.097322941 0 ;
	setAttr ".tk[144]" -type "float3" 0.0019551516 -0.089964867 -0.17100048 ;
	setAttr ".tk[145]" -type "float3" 0.0019551516 0.12021494 -0.17154446 ;
createNode polySplit -n "polySplit4";
	rename -uid "EAF9D7C9-4F63-D1F9-C1D6-3C876C82BABC";
	setAttr -s 2 ".e[0:1]"  1 0.90572298;
	setAttr -s 2 ".d[0:1]"  -2147483629 -2147483489;
	setAttr ".sma" 180;
	setAttr ".m2015" yes;
createNode polyTweak -n "polyTweak5";
	rename -uid "79ACAD65-4CA8-A03D-5318-64A720CE7A4E";
	setAttr ".uopa" yes;
	setAttr -s 54 ".tk";
	setAttr ".tk[2]" -type "float3" 0 0.058403075 0 ;
	setAttr ".tk[3]" -type "float3" 0 0.058403075 0 ;
	setAttr ".tk[4]" -type "float3" 0 0.058403075 0 ;
	setAttr ".tk[5]" -type "float3" 0 0.058403075 0 ;
	setAttr ".tk[8]" -type "float3" 0 0.028154429 0 ;
	setAttr ".tk[9]" -type "float3" 0 0.028154429 0 ;
	setAttr ".tk[11]" -type "float3" 0 -3.7252903e-09 0 ;
	setAttr ".tk[12]" -type "float3" 0 0.04700274 0 ;
	setAttr ".tk[13]" -type "float3" 0 0.04700274 0 ;
	setAttr ".tk[22]" -type "float3" 0 0.058403075 0 ;
	setAttr ".tk[23]" -type "float3" 0 0.04700274 0 ;
	setAttr ".tk[30]" -type "float3" 0 0.058403075 0 ;
	setAttr ".tk[31]" -type "float3" 0 0.028154429 0 ;
	setAttr ".tk[33]" -type "float3" 0 0.04700274 0 ;
	setAttr ".tk[34]" -type "float3" 0 0.058403075 0 ;
	setAttr ".tk[35]" -type "float3" 0 0.028154429 0 ;
	setAttr ".tk[36]" -type "float3" 0 0.058403075 0 ;
	setAttr ".tk[42]" -type "float3" 0 0.058403075 0 ;
	setAttr ".tk[43]" -type "float3" 0 0.04700274 0 ;
	setAttr ".tk[50]" -type "float3" 0 0.058403075 0 ;
	setAttr ".tk[51]" -type "float3" 0 0.028154429 0 ;
	setAttr ".tk[52]" -type "float3" 0 0.014211234 0 ;
	setAttr ".tk[53]" -type "float3" 0 0.0057592979 0 ;
	setAttr ".tk[54]" -type "float3" 0 0.058403075 0 ;
	setAttr ".tk[55]" -type "float3" 0 0.04700274 0 ;
	setAttr ".tk[61]" -type "float3" 0 0.058403075 0 ;
	setAttr ".tk[62]" -type "float3" 0 0.028154429 0 ;
	setAttr ".tk[64]" -type "float3" 0 0.04700274 0 ;
	setAttr ".tk[65]" -type "float3" 0 0.058403075 0 ;
	setAttr ".tk[66]" -type "float3" 0 0.028154429 0 ;
	setAttr ".tk[67]" -type "float3" 0 0.058403075 0 ;
	setAttr ".tk[72]" -type "float3" 0 0.058403075 0 ;
	setAttr ".tk[73]" -type "float3" 0 0.04700274 0 ;
	setAttr ".tk[79]" -type "float3" 0 0.058403075 0 ;
	setAttr ".tk[80]" -type "float3" 0 0.028154429 0 ;
	setAttr ".tk[81]" -type "float3" 0 0.014211234 0 ;
	setAttr ".tk[85]" -type "float3" 0 0.0057592979 0 ;
	setAttr ".tk[89]" -type "float3" 0 0.014446735 0 ;
	setAttr ".tk[92]" -type "float3" 0 -3.7252903e-09 0 ;
	setAttr ".tk[95]" -type "float3" 0 -3.7252903e-09 0 ;
	setAttr ".tk[100]" -type "float3" 0 -3.7252903e-09 0 ;
	setAttr ".tk[101]" -type "float3" 0 -3.7252903e-09 0 ;
	setAttr ".tk[133]" -type "float3" 0 -0.049077027 0 ;
	setAttr ".tk[135]" -type "float3" 0 -0.052770615 0 ;
	setAttr ".tk[136]" -type "float3" 0 -0.058266032 0 ;
	setAttr ".tk[139]" -type "float3" 0 -0.049077027 0 ;
	setAttr ".tk[140]" -type "float3" 0 -0.058266032 0 ;
createNode polySplit -n "polySplit5";
	rename -uid "075C9CF7-4993-4FA5-4CD5-6C948BCDB2AC";
	setAttr -s 2 ".e[0:1]"  0 0.100293;
	setAttr -s 2 ".d[0:1]"  -2147483630 -2147483464;
	setAttr ".sma" 180;
	setAttr ".m2015" yes;
createNode polyTweak -n "polyTweak6";
	rename -uid "CFE632A7-4C91-983D-1AE6-16BC40CE6942";
	setAttr ".uopa" yes;
	setAttr ".tk[142]" -type "float3"  0.0028215647 0 0;
createNode polySplit -n "polySplit6";
	rename -uid "411D4ECF-47C3-0875-D7E2-14A6FAF2B313";
	setAttr -s 15 ".e[0:14]"  0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5
		 0.5 0.5 0.5 0.5;
	setAttr -s 15 ".d[0:14]"  -2147483616 -2147483584 -2147483433 -2147483432 -2147483585 -2147483577 
		-2147483578 -2147483430 -2147483431 -2147483497 -2147483612 -2147483580 -2147483581 -2147483582 -2147483616;
	setAttr ".sma" 180;
	setAttr ".m2015" yes;
createNode polyTweak -n "polyTweak7";
	rename -uid "4E0CC06E-415F-F092-EDDE-A79715DC6309";
	setAttr ".uopa" yes;
	setAttr -s 67 ".tk";
	setAttr ".tk[0]" -type "float3" 0.14359739 -6.6181855e-08 -0.4096742 ;
	setAttr ".tk[1]" -type "float3" -0.098901294 -6.6181855e-08 -0.4096742 ;
	setAttr ".tk[6]" -type "float3" 0.14359739 -6.6181855e-08 0.147635 ;
	setAttr ".tk[7]" -type "float3" -0.098901294 -6.6181855e-08 0.147635 ;
	setAttr ".tk[10]" -type "float3" 0 3.7252903e-09 0 ;
	setAttr ".tk[11]" -type "float3" 0 -2.7939677e-09 0 ;
	setAttr ".tk[16]" -type "float3" 0.022348013 -6.6181855e-08 -0.4096742 ;
	setAttr ".tk[17]" -type "float3" 0.022348013 -6.6181855e-08 0.147635 ;
	setAttr ".tk[18]" -type "float3" 0.11934757 -6.6181855e-08 -0.4096742 ;
	setAttr ".tk[19]" -type "float3" 0.11934757 -6.6181855e-08 0.147635 ;
	setAttr ".tk[20]" -type "float3" -0.074651442 -6.6181855e-08 -0.4096742 ;
	setAttr ".tk[21]" -type "float3" -0.074651442 -6.6181855e-08 0.147635 ;
	setAttr ".tk[24]" -type "float3" 0.14359739 -6.6181855e-08 -0.13101959 ;
	setAttr ".tk[25]" -type "float3" 0.11934757 -6.6181855e-08 -0.13101959 ;
	setAttr ".tk[26]" -type "float3" 0.022348013 -6.6181855e-08 -0.13101959 ;
	setAttr ".tk[27]" -type "float3" -0.074651442 -6.6181855e-08 -0.13101959 ;
	setAttr ".tk[28]" -type "float3" -0.098901294 -6.6181855e-08 -0.13101959 ;
	setAttr ".tk[32]" -type "float3" 0.14359739 -6.6181855e-08 0.11976942 ;
	setAttr ".tk[38]" -type "float3" -0.098901294 -6.6181855e-08 0.11976942 ;
	setAttr ".tk[39]" -type "float3" -0.074651442 -6.6181855e-08 0.11976942 ;
	setAttr ".tk[40]" -type "float3" 0.022348013 -6.6181855e-08 0.11976942 ;
	setAttr ".tk[41]" -type "float3" 0.11934757 -6.6181855e-08 0.11976942 ;
	setAttr ".tk[44]" -type "float3" 0.14359739 -6.6181855e-08 -0.38180861 ;
	setAttr ".tk[45]" -type "float3" 0.11934757 -6.6181855e-08 -0.38180861 ;
	setAttr ".tk[46]" -type "float3" 0.022348013 -6.6181855e-08 -0.38180861 ;
	setAttr ".tk[47]" -type "float3" -0.074651413 -6.6181855e-08 -0.38180861 ;
	setAttr ".tk[48]" -type "float3" -0.098901294 -6.6181855e-08 -0.38180861 ;
	setAttr ".tk[49]" -type "float3" 0 3.7252903e-09 0 ;
	setAttr ".tk[54]" -type "float3" 0 2.9802322e-08 0 ;
	setAttr ".tk[55]" -type "float3" 0 2.9802322e-08 0 ;
	setAttr ".tk[56]" -type "float3" 0.14359739 -2.9802322e-08 -0.0056250626 ;
	setAttr ".tk[57]" -type "float3" 0.11934757 -2.9802322e-08 -0.0056250626 ;
	setAttr ".tk[58]" -type "float3" 0.022348013 -2.9802322e-08 -0.0056250626 ;
	setAttr ".tk[59]" -type "float3" -0.074651442 -2.9802322e-08 -0.0056250626 ;
	setAttr ".tk[60]" -type "float3" -0.098901294 -2.9802322e-08 -0.0056250626 ;
	setAttr ".tk[61]" -type "float3" 0 2.9802322e-08 0 ;
	setAttr ".tk[62]" -type "float3" 0 2.9802322e-08 0 ;
	setAttr ".tk[63]" -type "float3" 0.14359739 -6.6181855e-08 0.069611676 ;
	setAttr ".tk[68]" -type "float3" -0.098901294 -6.6181855e-08 0.069611676 ;
	setAttr ".tk[69]" -type "float3" -0.074651442 -6.6181855e-08 0.069611676 ;
	setAttr ".tk[70]" -type "float3" 0.022348013 -6.6181855e-08 0.069611676 ;
	setAttr ".tk[71]" -type "float3" 0.11934757 -6.6181855e-08 0.069611676 ;
	setAttr ".tk[74]" -type "float3" 0.14359739 -6.6181855e-08 -0.080861777 ;
	setAttr ".tk[75]" -type "float3" 0.11934757 -6.6181855e-08 -0.080861777 ;
	setAttr ".tk[76]" -type "float3" 0.022348013 -6.6181855e-08 -0.080861777 ;
	setAttr ".tk[77]" -type "float3" -0.07465145 -6.6181855e-08 -0.080861777 ;
	setAttr ".tk[78]" -type "float3" -0.098901294 -6.6181855e-08 -0.080861777 ;
	setAttr ".tk[83]" -type "float3" -0.35383841 6.6181855e-08 -0.080861777 ;
	setAttr ".tk[84]" -type "float3" -0.35383841 6.6181855e-08 -0.13101959 ;
	setAttr ".tk[86]" -type "float3" -0.35383841 -6.6181855e-08 0.069611676 ;
	setAttr ".tk[87]" -type "float3" -0.35383841 6.6181855e-08 0.11976942 ;
	setAttr ".tk[89]" -type "float3" 0 2.9802322e-08 0 ;
	setAttr ".tk[90]" -type "float3" 0 2.9802322e-08 0 ;
	setAttr ".tk[91]" -type "float3" -0.35383841 -2.9802322e-08 -0.0056250626 ;
	setAttr ".tk[92]" -type "float3" 0 -2.7939677e-09 0 ;
	setAttr ".tk[93]" -type "float3" 0 3.7252903e-09 0 ;
	setAttr ".tk[94]" -type "float3" 0 3.7252903e-09 0 ;
	setAttr ".tk[95]" -type "float3" 0 -2.7939677e-09 0 ;
	setAttr ".tk[122]" -type "float3" 0 2.9802322e-08 0 ;
	setAttr ".tk[123]" -type "float3" 0 2.9802322e-08 0 ;
	setAttr ".tk[126]" -type "float3" 0 2.9802322e-08 0 ;
	setAttr ".tk[127]" -type "float3" 0 2.9802322e-08 0 ;
	setAttr ".tk[134]" -type "float3" 0 2.9802322e-08 0 ;
	setAttr ".tk[135]" -type "float3" 0 2.9802322e-08 0 ;
	setAttr ".tk[143]" -type "float3" -0.012309074 7.4505806e-09 0 ;
createNode polySplit -n "polySplit7";
	rename -uid "9220588D-4BF7-D920-446E-DBAA00645DB2";
	setAttr -s 13 ".e[0:12]"  0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5
		 0.5 0.5;
	setAttr -s 13 ".d[0:12]"  -2147483508 -2147483384 -2147483383 -2147483513 -2147483511 -2147483512 
		-2147483505 -2147483517 -2147483516 -2147483519 -2147483389 -2147483388 -2147483518;
	setAttr ".sma" 180;
	setAttr ".m2015" yes;
createNode polyTweak -n "polyTweak8";
	rename -uid "C69670E1-4284-FD79-6C35-7DA9A64C63C1";
	setAttr ".uopa" yes;
	setAttr -s 137 ".tk";
	setAttr ".tk[0]" -type "float3" 0 -1.4901161e-08 0 ;
	setAttr ".tk[1]" -type "float3" 0 -1.4901161e-08 0 ;
	setAttr ".tk[2]" -type "float3" 0 0.087963201 0 ;
	setAttr ".tk[3]" -type "float3" 0 0.087963201 0 ;
	setAttr ".tk[4]" -type "float3" 0 -0.014364858 0 ;
	setAttr ".tk[5]" -type "float3" 0 -0.07689812 0 ;
	setAttr ".tk[8]" -type "float3" 0 0.073523849 0 ;
	setAttr ".tk[9]" -type "float3" 0 -0.07689812 0 ;
	setAttr ".tk[10]" -type "float3" 0 0.088302851 0 ;
	setAttr ".tk[11]" -type "float3" 0 -0.07275822 0 ;
	setAttr ".tk[12]" -type "float3" 0 0.087963201 0 ;
	setAttr ".tk[13]" -type "float3" 0 -0.0081577804 0 ;
	setAttr ".tk[14]" -type "float3" 0 0.067923449 0 ;
	setAttr ".tk[15]" -type "float3" 0 -0.073440775 0 ;
	setAttr ".tk[16]" -type "float3" 0 -1.4901161e-08 0 ;
	setAttr ".tk[18]" -type "float3" 0 -1.4901161e-08 0 ;
	setAttr ".tk[20]" -type "float3" 0 -1.4901161e-08 0 ;
	setAttr ".tk[22]" -type "float3" 0 0.42359918 0 ;
	setAttr ".tk[23]" -type "float3" 0 0.41401738 0 ;
	setAttr ".tk[24]" -type "float3" 0 -1.4901161e-08 0 ;
	setAttr ".tk[25]" -type "float3" 0 -1.4901161e-08 0 ;
	setAttr ".tk[26]" -type "float3" 0 -1.4901161e-08 0 ;
	setAttr ".tk[27]" -type "float3" 0 -1.4901161e-08 0 ;
	setAttr ".tk[28]" -type "float3" 0 -1.4901161e-08 0 ;
	setAttr ".tk[29]" -type "float3" 0 0.36033785 0 ;
	setAttr ".tk[30]" -type "float3" 0 0.42334288 0 ;
	setAttr ".tk[31]" -type "float3" 0 0.42334288 0 ;
	setAttr ".tk[33]" -type "float3" 0 -0.013388855 0 ;
	setAttr ".tk[34]" -type "float3" 0 -0.021423826 0 ;
	setAttr ".tk[35]" -type "float3" 0 -0.095796458 0 ;
	setAttr ".tk[36]" -type "float3" 0 -0.095796458 0 ;
	setAttr ".tk[37]" -type "float3" 0 -0.077086426 0 ;
	setAttr ".tk[42]" -type "float3" 0 0.17087276 0 ;
	setAttr ".tk[43]" -type "float3" 0 0.17083098 0 ;
	setAttr ".tk[44]" -type "float3" 0 -1.4901161e-08 0 ;
	setAttr ".tk[45]" -type "float3" 0 -1.4901161e-08 0 ;
	setAttr ".tk[46]" -type "float3" 0 -1.4901161e-08 0 ;
	setAttr ".tk[47]" -type "float3" 0 -1.4901161e-08 0 ;
	setAttr ".tk[48]" -type "float3" 0 -1.4901161e-08 0 ;
	setAttr ".tk[49]" -type "float3" 0 0.17138289 0 ;
	setAttr ".tk[50]" -type "float3" 0 0.17087276 0 ;
	setAttr ".tk[51]" -type "float3" 0 0.15332744 0 ;
	setAttr ".tk[52]" -type "float3" 0 0.28774884 0 ;
	setAttr ".tk[53]" -type "float3" 0 -0.060214914 0 ;
	setAttr ".tk[54]" -type "float3" 0 0.07518208 0 ;
	setAttr ".tk[55]" -type "float3" 0 0.072213531 0 ;
	setAttr ".tk[61]" -type "float3" 0 0.013499119 0 ;
	setAttr ".tk[62]" -type "float3" 0 0.013499119 0 ;
	setAttr ".tk[64]" -type "float3" 0 -0.017652603 0 ;
	setAttr ".tk[65]" -type "float3" 0 -0.026477944 0 ;
	setAttr ".tk[66]" -type "float3" 0 -0.10980676 0 ;
	setAttr ".tk[67]" -type "float3" 0 -0.10980676 0 ;
	setAttr ".tk[72]" -type "float3" 0 0.25904283 0 ;
	setAttr ".tk[73]" -type "float3" 0 0.24387421 0 ;
	setAttr ".tk[74]" -type "float3" 0 -7.4505806e-09 0 ;
	setAttr ".tk[75]" -type "float3" 0 -7.4505806e-09 0 ;
	setAttr ".tk[76]" -type "float3" 0 -7.4505806e-09 0 ;
	setAttr ".tk[77]" -type "float3" 0 -7.4505806e-09 0 ;
	setAttr ".tk[78]" -type "float3" 0 -7.4505806e-09 0 ;
	setAttr ".tk[79]" -type "float3" 0 0.24054952 0 ;
	setAttr ".tk[80]" -type "float3" 0 0.24054952 0 ;
	setAttr ".tk[81]" -type "float3" 0 -0.050301354 0 ;
	setAttr ".tk[82]" -type "float3" 0 -0.050307125 0 ;
	setAttr ".tk[83]" -type "float3" 0 -0.0025976973 0 ;
	setAttr ".tk[84]" -type "float3" 0 -0.0052485839 0 ;
	setAttr ".tk[85]" -type "float3" 0 0.23989266 0 ;
	setAttr ".tk[86]" -type "float3" 0 0.012693811 0 ;
	setAttr ".tk[87]" -type "float3" 0 0.025185447 0 ;
	setAttr ".tk[88]" -type "float3" 0 0.23969108 0 ;
	setAttr ".tk[89]" -type "float3" 0 0.043026425 0 ;
	setAttr ".tk[90]" -type "float3" 0 0.034600154 0 ;
	setAttr ".tk[92]" -type "float3" 0 -0.091010168 0 ;
	setAttr ".tk[93]" -type "float3" 0 0.41036406 0 ;
	setAttr ".tk[94]" -type "float3" 0 0.12771267 0 ;
	setAttr ".tk[95]" -type "float3" 0 -0.086517319 0 ;
	setAttr ".tk[96]" -type "float3" 0 0.04249914 0 ;
	setAttr ".tk[97]" -type "float3" 0 0.038801432 0 ;
	setAttr ".tk[98]" -type "float3" 0 0.055566575 0 ;
	setAttr ".tk[99]" -type "float3" 0 0.055566575 0 ;
	setAttr ".tk[100]" -type "float3" 0 -0.0055798525 0 ;
	setAttr ".tk[101]" -type "float3" 0 -0.065819658 0 ;
	setAttr ".tk[102]" -type "float3" 0 -0.062964678 0 ;
	setAttr ".tk[103]" -type "float3" 0 -0.0020062339 0 ;
	setAttr ".tk[104]" -type "float3" 0 0.13380243 0 ;
	setAttr ".tk[105]" -type "float3" 0 0.13380243 0 ;
	setAttr ".tk[106]" -type "float3" 0 0.13380243 0 ;
	setAttr ".tk[107]" -type "float3" 0 0.13380243 0 ;
	setAttr ".tk[108]" -type "float3" 0 0.055566575 0 ;
	setAttr ".tk[109]" -type "float3" 0 0.055566575 0 ;
	setAttr ".tk[110]" -type "float3" 0 -0.064972267 0 ;
	setAttr ".tk[111]" -type "float3" 0 -0.061427929 0 ;
	setAttr ".tk[112]" -type "float3" 0 -0.0056035076 0 ;
	setAttr ".tk[113]" -type "float3" 0 -0.011290872 0 ;
	setAttr ".tk[114]" -type "float3" 0 0.24691638 0 ;
	setAttr ".tk[115]" -type "float3" 0 0.22700319 0 ;
	setAttr ".tk[116]" -type "float3" 0 0.40379211 0 ;
	setAttr ".tk[117]" -type "float3" 0 0.41827422 0 ;
	setAttr ".tk[118]" -type "float3" 0 0.41801792 0 ;
	setAttr ".tk[119]" -type "float3" 0 0.22595702 0 ;
	setAttr ".tk[120]" -type "float3" 0 0.40605518 0 ;
	setAttr ".tk[121]" -type "float3" 0 0.12652758 0 ;
	setAttr ".tk[122]" -type "float3" 0 0.0098279472 0 ;
	setAttr ".tk[123]" -type "float3" 0 0.011378026 0 ;
	setAttr ".tk[124]" -type "float3" 0 -0.010298001 0 ;
	setAttr ".tk[125]" -type "float3" 0 -0.018003676 0 ;
	setAttr ".tk[126]" -type "float3" 0 0.061386958 0 ;
	setAttr ".tk[127]" -type "float3" 0 0.066491209 0 ;
	setAttr ".tk[128]" -type "float3" 0 -0.086959131 0 ;
	setAttr ".tk[129]" -type "float3" 0 -0.082669765 0 ;
	setAttr ".tk[130]" -type "float3" 0 -0.086003043 0 ;
	setAttr ".tk[131]" -type "float3" 0 -0.10897905 0 ;
	setAttr ".tk[132]" -type "float3" 0 -0.051725909 0 ;
	setAttr ".tk[133]" -type "float3" 0 -0.051725909 0 ;
	setAttr ".tk[134]" -type "float3" 0 0.044026654 0 ;
	setAttr ".tk[135]" -type "float3" 0 0.035482258 0 ;
	setAttr ".tk[136]" -type "float3" 0 0.24657956 0 ;
	setAttr ".tk[137]" -type "float3" 0 0.24657956 0 ;
	setAttr ".tk[138]" -type "float3" 0 0.3131575 0 ;
	setAttr ".tk[139]" -type "float3" 0 0.39613315 0 ;
	setAttr ".tk[140]" -type "float3" 0 -0.065312147 0 ;
	setAttr ".tk[141]" -type "float3" 0 -0.049905125 0 ;
	setAttr ".tk[142]" -type "float3" 0 0.054204129 0 ;
	setAttr ".tk[143]" -type "float3" 0 0.054204129 0 ;
	setAttr ".tk[144]" -type "float3" 0 -2.9802322e-08 0 ;
	setAttr ".tk[145]" -type "float3" 0 0.53666633 0 ;
	setAttr ".tk[146]" -type "float3" 0 0.52333671 0 ;
	setAttr ".tk[147]" -type "float3" 0 0.52114052 0 ;
	setAttr ".tk[148]" -type "float3" 0 0.5320974 0 ;
	setAttr ".tk[149]" -type "float3" 0 0.5320974 0 ;
	setAttr ".tk[150]" -type "float3" 0 0.5320974 0 ;
	setAttr ".tk[151]" -type "float3" 0 0.52114052 0 ;
	setAttr ".tk[152]" -type "float3" 0 0.52333671 0 ;
	setAttr ".tk[153]" -type "float3" 0 0.53650367 0 ;
	setAttr ".tk[154]" -type "float3" 0 -2.9802322e-08 0 ;
	setAttr ".tk[155]" -type "float3" 0 -2.9802322e-08 0 ;
	setAttr ".tk[156]" -type "float3" 0 -2.9802322e-08 0 ;
	setAttr ".tk[157]" -type "float3" 0 -2.9802322e-08 0 ;
createNode polySplit -n "polySplit8";
	rename -uid "E2027C0C-4CFC-269E-BBCF-FA83281C4C48";
	setAttr -s 3 ".e[0:2]"  1 0.50888401 0;
	setAttr -s 3 ".d[0:2]"  -2147483518 -2147483406 -2147483348;
	setAttr ".sma" 180;
	setAttr ".m2015" yes;
createNode polyMergeVert -n "polyMergeVert3";
	rename -uid "91D6C8B9-43B4-855A-FAE0-C6A8625D86CD";
	setAttr ".ics" -type "componentList" 1 "vtx[*]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".am" yes;
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
	setAttr ".ro" yes;
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
select -ne :ikSystem;
	setAttr -s 4 ".sol";
connectAttr "polyMergeVert3.out" "pCubeShape1.i";
connectAttr "groupId1.id" "pCubeShape1.iog.og[0].gid";
connectAttr "set1.mwc" "pCubeShape1.iog.og[0].gco";
connectAttr "groupId2.id" "pCubeShape1.iog.og[1].gid";
connectAttr "set2.mwc" "pCubeShape1.iog.og[1].gco";
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
connectAttr "polySurfaceShape1.o" "polySplit1.ip";
connectAttr "groupId1.msg" "set1.gn" -na;
connectAttr "pCubeShape1.iog.og[0]" "set1.dsm" -na;
connectAttr "polySplit1.out" "groupParts1.ig";
connectAttr "groupId1.id" "groupParts1.gi";
connectAttr "groupParts1.og" "polyTweak1.ip";
connectAttr "polyTweak1.out" "deleteComponent1.ig";
connectAttr "groupId2.msg" "set2.gn" -na;
connectAttr "pCubeShape1.iog.og[1]" "set2.dsm" -na;
connectAttr "deleteComponent1.og" "groupParts2.ig";
connectAttr "groupId2.id" "groupParts2.gi";
connectAttr "groupParts2.og" "deleteComponent2.ig";
connectAttr "deleteComponent2.og" "polyMergeVert1.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert1.mp";
connectAttr "polyMergeVert1.out" "polyExtrudeFace1.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace1.mp";
connectAttr "polyTweak2.out" "polySplit2.ip";
connectAttr "polyExtrudeFace1.out" "polyTweak2.ip";
connectAttr "polySplit2.out" "polySplit3.ip";
connectAttr "polySplit3.out" "deleteComponent3.ig";
connectAttr "deleteComponent3.og" "deleteComponent4.ig";
connectAttr "deleteComponent4.og" "polyTweak3.ip";
connectAttr "polyTweak3.out" "deleteComponent5.ig";
connectAttr "deleteComponent5.og" "deleteComponent6.ig";
connectAttr "polyTweak4.out" "polyMergeVert2.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert2.mp";
connectAttr "deleteComponent6.og" "polyTweak4.ip";
connectAttr "polyTweak5.out" "polySplit4.ip";
connectAttr "polyMergeVert2.out" "polyTweak5.ip";
connectAttr "polyTweak6.out" "polySplit5.ip";
connectAttr "polySplit4.out" "polyTweak6.ip";
connectAttr "polyTweak7.out" "polySplit6.ip";
connectAttr "polySplit5.out" "polyTweak7.ip";
connectAttr "polyTweak8.out" "polySplit7.ip";
connectAttr "polySplit6.out" "polyTweak8.ip";
connectAttr "polySplit7.out" "polySplit8.ip";
connectAttr "polySplit8.out" "polyMergeVert3.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert3.mp";
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "pCubeShape1.iog" ":initialShadingGroup.dsm" -na;
// End of SmallHouse.ma
