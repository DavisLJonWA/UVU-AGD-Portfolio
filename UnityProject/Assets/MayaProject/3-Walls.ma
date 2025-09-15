//Maya ASCII 2025ff03 scene
//Name: 3-Walls.ma
//Last modified: Mon, Sep 15, 2025 03:04:02 PM
//Codeset: 1252
requires maya "2025ff03";
requires "mtoa" "5.4.5";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2025";
fileInfo "version" "2025";
fileInfo "cutIdentifier" "202409190603-cbdc5a7e54";
fileInfo "osv" "Windows 11 Home v2009 (Build: 26100)";
fileInfo "UUID" "D7A62B70-47B5-6DFD-37B1-5CBA1EE62878";
createNode transform -s -n "persp";
	rename -uid "7E9E8A2F-4D14-A472-34E8-AB8FA7E9F2B3";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -9.1836589623061933 8.1907130431842923 42.570370657117238 ;
	setAttr ".r" -type "double3" -8.7383527296260617 -370.99999999995975 -2.0250525957652537e-16 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "18B81580-4FF5-F302-D662-499C76FA9F7E";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 54.28767558862981;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "38C66826-477D-7E01-8266-A1B9048E94F1";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1000.1 0 ;
	setAttr ".r" -type "double3" -90 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "6FDF77CD-4BD4-6AF5-6373-C8875657A87B";
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
	rename -uid "666B31C3-4C84-5A08-CDB0-89B7EE4CF12D";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 1000.1 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "3ACC6F68-41A1-AE53-7DC8-EFB570F94FA1";
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
	rename -uid "5CC94455-4399-1484-508C-579F7FE87D1D";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 0 0 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "BF6CC28E-485B-2893-3B96-55A79B41054E";
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
createNode transform -n "Straight_Wall";
	rename -uid "BA985254-4BB8-0130-C31F-03AE1F9D2739";
	setAttr ".t" -type "double3" -0.43739705143118623 6.3186954524093206 -1.6634693315186286 ;
	setAttr ".s" -type "double3" 12.198214781123955 12.198214781123955 1 ;
createNode mesh -n "Straight_WallShape" -p "Straight_Wall";
	rename -uid "385B515C-4C1D-E8EB-2332-DB8EF76BF2D0";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.625 0.07500000111758709 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt";
	setAttr ".pt[34]" -type "float3" 0 0 -1.8626451e-09 ;
	setAttr ".pt[35]" -type "float3" 0 0 -1.8626451e-09 ;
createNode transform -n "in_Turn";
	rename -uid "40B2F6B4-4E44-5BD0-E6BB-81A9A6616FE0";
	setAttr ".t" -type "double3" -10.242567978229021 7.5296650177635032 16.232735646814458 ;
	setAttr ".r" -type "double3" 0 90 0 ;
	setAttr ".s" -type "double3" 5.8338804688768882 14.620157117723497 1 ;
	setAttr ".rp" -type "double3" 2.9169414700031355 -7.3100767380393821 5.7284431527626651 ;
	setAttr ".rpt" -type "double3" 0.78912314499660852 0 -24.124648484414859 ;
	setAttr ".sp" -type "double3" 0.50000021179122545 -0.49999987545808511 5.7284431527626651 ;
	setAttr ".spt" -type "double3" 2.4169412582119101 -6.8100768625812966 0 ;
createNode mesh -n "in_TurnShape" -p "in_Turn";
	rename -uid "70633DD5-4901-2CBB-51AD-52BE85C6A8D2";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.375 0.02500000037252903 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 15 ".pt";
	setAttr ".pt[2]" -type "float3" 0 0 0.15800864 ;
	setAttr ".pt[4]" -type "float3" 0 0 0.15800864 ;
	setAttr ".pt[25]" -type "float3" 0 0 0.15800864 ;
	setAttr ".pt[26]" -type "float3" 0 0 0.15800864 ;
	setAttr ".pt[54]" -type "float3" -0.031513426 0 0.18762118 ;
	setAttr ".pt[55]" -type "float3" 0 0 0.18762118 ;
	setAttr ".pt[56]" -type "float3" 0 0 0.18762118 ;
	setAttr ".pt[57]" -type "float3" -0.031513426 0 0.18762118 ;
	setAttr ".pt[60]" -type "float3" -0.036839459 0 -0.075590074 ;
	setAttr ".pt[61]" -type "float3" 0.013801538 0 -0.075590074 ;
	setAttr ".pt[62]" -type "float3" 0.013801538 0 -0.075590074 ;
	setAttr ".pt[63]" -type "float3" -0.036839459 0 -0.075590074 ;
	setAttr ".pt[64]" -type "float3" 0.013801538 0 0.23360004 ;
	setAttr ".pt[65]" -type "float3" 0.013801538 0 0.23360004 ;
createNode transform -n "out_Turn";
	rename -uid "ED78CE8B-429E-0C05-3D3F-ADB5D1185F56";
	setAttr ".t" -type "double3" 13.807092193801944 7.5296664482749778 -5.4737427055902952 ;
	setAttr ".r" -type "double3" 0 270 0 ;
	setAttr ".s" -type "double3" 5.8338804688768882 14.620157117723497 1 ;
	setAttr ".rp" -type "double3" 1.8933324291137994 -7.3100781685508567 5.7284429960333165 ;
	setAttr ".rpt" -type "double3" -10.03871536254883 0 -2.4181699752807564 ;
	setAttr ".sp" -type "double3" 0.3245408333637485 -0.49999997330323542 5.7284429960333165 ;
	setAttr ".spt" -type "double3" 1.5687915957500509 -6.8100781952476215 0 ;
createNode mesh -n "out_TurnShape" -p "out_Turn";
	rename -uid "A65F1D4A-4181-911A-A7A0-16B9BBC3775D";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.75 0.02500000037252903 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 47 ".pt";
	setAttr ".pt[42]" -type "float3" -0.024616409 0 -0.029918343 ;
	setAttr ".pt[43]" -type "float3" 0 0 -0.029918343 ;
	setAttr ".pt[44]" -type "float3" 0 0 -0.029918343 ;
	setAttr ".pt[45]" -type "float3" -0.024616409 0 -0.029918343 ;
	setAttr ".pt[46]" -type "float3" 0.0024723422 0 -0.029918343 ;
	setAttr ".pt[47]" -type "float3" 0.0024723422 0 0 ;
	setAttr ".pt[48]" -type "float3" 0.0024723422 0 -0.029918343 ;
	setAttr ".pt[49]" -type "float3" 0.0024723422 0 0 ;
	setAttr ".pt[50]" -type "float3" 0.0024723425 0 0.059089836 ;
	setAttr ".pt[51]" -type "float3" 0.0024723425 0 0.059089836 ;
	setAttr ".pt[54]" -type "float3" 0 0 -0.041924149 ;
	setAttr ".pt[55]" -type "float3" 0 0 -0.041924149 ;
	setAttr ".pt[56]" -type "float3" 0 0 -0.041924149 ;
	setAttr ".pt[57]" -type "float3" 0 0 -0.041924149 ;
	setAttr ".pt[62]" -type "float3" 0.0043999562 0 -0.041924149 ;
	setAttr ".pt[63]" -type "float3" 0.0043999562 0 0 ;
	setAttr ".pt[64]" -type "float3" 0.0043999562 0 -0.041924149 ;
	setAttr ".pt[65]" -type "float3" 0.0043999562 0 0 ;
	setAttr ".pt[68]" -type "float3" 0.0043999562 0 0 ;
	setAttr ".pt[70]" -type "float3" 0.0043999562 0 0 ;
	setAttr ".pt[72]" -type "float3" 0.016901802 0 -0.078027397 ;
	setAttr ".pt[73]" -type "float3" 0 0 -0.078027397 ;
	setAttr ".pt[74]" -type "float3" 0 0 -0.078027397 ;
	setAttr ".pt[75]" -type "float3" 0.016901802 0 -0.078027397 ;
	setAttr ".pt[76]" -type "float3" 0.011731357 0 -0.078027397 ;
	setAttr ".pt[77]" -type "float3" 0.011731357 0 0 ;
	setAttr ".pt[78]" -type "float3" 0.011731357 0 -0.078027397 ;
	setAttr ".pt[79]" -type "float3" 0.011731357 0 0 ;
	setAttr ".pt[80]" -type "float3" 0.011731357 0 -0.10527211 ;
	setAttr ".pt[81]" -type "float3" 0.011731357 0 -0.10527211 ;
	setAttr ".pt[96]" -type "float3" 0.030532192 0 -0.08119455 ;
	setAttr ".pt[97]" -type "float3" 0 0 -0.08119455 ;
	setAttr ".pt[98]" -type "float3" 0 0 -0.08119455 ;
	setAttr ".pt[99]" -type "float3" 0.030532192 0 -0.08119455 ;
	setAttr ".pt[100]" -type "float3" 0.01319627 0 -0.08119455 ;
	setAttr ".pt[101]" -type "float3" 0.01319627 0 0 ;
	setAttr ".pt[102]" -type "float3" 0.01319627 0 -0.08119455 ;
	setAttr ".pt[103]" -type "float3" 0.01319627 0 0 ;
	setAttr ".pt[104]" -type "float3" 0.01319627 0 -0.1901682 ;
	setAttr ".pt[105]" -type "float3" 0.01319627 0 -0.1901682 ;
createNode mesh -n "polySurfaceShape1" -p "out_Turn";
	rename -uid "64320B31-466E-475A-AB4C-B08BE54FFA2E";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr -s 6 ".gtag";
	setAttr ".gtag[0].gtagnm" -type "string" "back";
	setAttr ".gtag[0].gtagcmp" -type "componentList" 2 "f[6:10]" "f[28:32]";
	setAttr ".gtag[1].gtagnm" -type "string" "bottom";
	setAttr ".gtag[1].gtagcmp" -type "componentList" 2 "f[11]" "f[33]";
	setAttr ".gtag[2].gtagnm" -type "string" "front";
	setAttr ".gtag[2].gtagcmp" -type "componentList" 3 "f[0:4]" "f[22:26]" "f[34:45]";
	setAttr ".gtag[3].gtagnm" -type "string" "left";
	setAttr ".gtag[3].gtagcmp" -type "componentList" 1 "f[17:21]";
	setAttr ".gtag[4].gtagnm" -type "string" "right";
	setAttr ".gtag[4].gtagcmp" -type "componentList" 1 "f[12:16]";
	setAttr ".gtag[5].gtagnm" -type "string" "top";
	setAttr ".gtag[5].gtagcmp" -type "componentList" 2 "f[5]" "f[27]";
	setAttr ".pv" -type "double2" 0.625 0.3750000074505806 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 63 ".uvst[0].uvsp[0:62]" -type "float2" 0.375 0 0.625 0 0.375
		 0.050000001 0.625 0.050000001 0.375 0.1 0.625 0.1 0.375 0.15000001 0.625 0.15000001
		 0.375 0.2 0.625 0.2 0.375 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.55000001 0.625
		 0.55000001 0.375 0.60000002 0.625 0.60000002 0.375 0.65000004 0.625 0.65000004 0.375
		 0.70000005 0.625 0.70000005 0.375 0.75000006 0.625 0.75000006 0.375 1 0.625 1 0.875
		 0 0.875 0.050000001 0.875 0.1 0.875 0.15000001 0.875 0.2 0.875 0.25 0.125 0 0.125
		 0.050000001 0.125 0.1 0.125 0.15000001 0.125 0.2 0.125 0.25 0.57499999 0 0.57499999
		 1 0.57499999 0.050000004 0.57499999 0.10000001 0.57499999 0.15000001 0.57499999 0.20000002
		 0.57499999 0.25 0.57499999 0.5 0.57499999 0.55000001 0.57499999 0.60000002 0.57499999
		 0.65000004 0.57499999 0.70000005 0.57499999 0.75000012 0.57499999 0.050000004 0.57499999
		 0 0.625 0 0.625 0.050000001 0.57499999 0.10000001 0.625 0.1 0.57499999 0.15000001
		 0.625 0.15000001 0.57499999 0.20000002 0.625 0.2 0.57499999 0.25 0.625 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 48 ".vt[0:47]"  -0.5 -0.49999997 0.5 0.5 -0.49999997 0.5
		 -0.5 -0.41744402 0.5 0.5 -0.41744402 0.5 -0.5 -0.10305572 0.5 0.5 -0.10305572 0.5
		 -0.5 -0.081568718 0.5 0.5 -0.081568718 0.5 -0.5 0.28487587 0.5 0.5 0.28487587 0.5
		 -0.5 0.33434218 0.5 0.5 0.33434218 0.5 -0.5 0.33434218 -0.5 0.5 0.33434218 -0.5 -0.5 0.28487587 -0.5
		 0.5 0.28487587 -0.5 -0.5 -0.081568718 -0.5 0.5 -0.081568718 -0.5 -0.5 -0.10305572 -0.5
		 0.5 -0.10305572 -0.5 -0.5 -0.41744402 -0.5 0.5 -0.41744402 -0.5 -0.5 -0.49999997 -0.5
		 0.5 -0.49999997 -0.5 0.32454062 -0.49999997 0.5 0.32454062 -0.41744402 0.5 0.32454062 -0.10305572 0.5
		 0.32454062 -0.081568718 0.5 0.32454062 0.28487587 0.5 0.32454062 0.33434218 0.5 0.32454062 0.33434218 -0.5
		 0.32454062 0.28487587 -0.5 0.32454062 -0.081568718 -0.5 0.32454062 -0.10305572 -0.5
		 0.32454062 -0.41744402 -0.5 0.32454062 -0.49999997 -0.5 0.32454062 -0.49999997 5.72844315
		 0.32454062 -0.41744402 5.72844315 0.5 -0.49999997 5.72844315 0.5 -0.41744402 5.72844315
		 0.32454062 -0.10305572 5.72844315 0.5 -0.10305572 5.72844315 0.32454062 -0.081568718 5.72844315
		 0.5 -0.081568718 5.72844315 0.32454062 0.28487587 5.72844315 0.5 0.28487587 5.72844315
		 0.32454062 0.33434218 5.72844315 0.5 0.33434218 5.72844315;
	setAttr -s 92 ".ed[0:91]"  0 24 0 2 25 1 4 26 1 6 27 1 8 28 1 10 29 0
		 12 30 0 14 31 1 16 32 1 18 33 1 20 34 1 22 35 0 0 2 0 1 3 1 2 4 0 3 5 1 4 6 0 5 7 1
		 6 8 0 7 9 1 8 10 0 9 11 1 10 12 0 11 13 0 12 14 0 13 15 0 14 16 0 15 17 0 16 18 0
		 17 19 0 18 20 0 19 21 0 20 22 0 21 23 0 22 0 0 23 1 0 21 3 1 19 5 1 17 7 1 15 9 1
		 20 2 1 18 4 1 16 6 1 14 8 1 24 1 1 29 11 1 30 13 0 31 15 1 32 17 1 33 19 1 34 21 1
		 35 23 0 24 25 0 25 26 0 26 27 0 27 28 0 28 29 0 29 30 1 30 31 1 31 32 1 32 33 1 33 34 1
		 34 35 1 35 24 1 24 36 0 25 37 1 36 37 0 1 38 0 36 38 0 3 39 1 38 39 0 37 39 1 26 40 1
		 37 40 0 5 41 1 39 41 0 40 41 1 27 42 1 40 42 0 7 43 1 41 43 0 42 43 1 28 44 1 42 44 0
		 9 45 1 43 45 0 44 45 1 29 46 0 44 46 0 11 47 0 45 47 0 46 47 0;
	setAttr -s 46 -ch 184 ".fc[0:45]" -type "polyFaces" 
		f 4 0 52 -2 -13
		mu 0 4 0 38 40 2
		f 4 1 53 -3 -15
		mu 0 4 2 40 41 4
		f 4 2 54 -4 -17
		mu 0 4 4 41 42 6
		f 4 3 55 -5 -19
		mu 0 4 6 42 43 8
		f 4 4 56 -6 -21
		mu 0 4 8 43 44 10
		f 4 5 57 -7 -23
		mu 0 4 10 44 45 12
		f 4 6 58 -8 -25
		mu 0 4 12 45 46 14
		f 4 7 59 -9 -27
		mu 0 4 14 46 47 16
		f 4 8 60 -10 -29
		mu 0 4 16 47 48 18
		f 4 9 61 -11 -31
		mu 0 4 18 48 49 20
		f 4 10 62 -12 -33
		mu 0 4 20 49 50 22
		f 4 11 63 -1 -35
		mu 0 4 22 50 39 24
		f 4 -36 -34 36 -14
		mu 0 4 1 26 27 3
		f 4 -37 -32 37 -16
		mu 0 4 3 27 28 5
		f 4 -38 -30 38 -18
		mu 0 4 5 28 29 7
		f 4 -39 -28 39 -20
		mu 0 4 7 29 30 9
		f 4 -40 -26 -24 -22
		mu 0 4 9 30 31 11
		f 4 34 12 -41 32
		mu 0 4 32 0 2 33
		f 4 40 14 -42 30
		mu 0 4 33 2 4 34
		f 4 41 16 -43 28
		mu 0 4 34 4 6 35
		f 4 42 18 -44 26
		mu 0 4 35 6 8 36
		f 4 43 20 22 24
		mu 0 4 36 8 10 37
		f 4 -67 68 70 -72
		mu 0 4 51 52 53 54
		f 4 -74 71 75 -77
		mu 0 4 55 51 54 56
		f 4 -79 76 80 -82
		mu 0 4 57 55 56 58
		f 4 -84 81 85 -87
		mu 0 4 59 57 58 60
		f 4 -89 86 90 -92
		mu 0 4 61 59 60 62
		f 4 -58 45 23 -47
		mu 0 4 45 44 11 13
		f 4 -59 46 25 -48
		mu 0 4 46 45 13 15
		f 4 -60 47 27 -49
		mu 0 4 47 46 15 17
		f 4 -61 48 29 -50
		mu 0 4 48 47 17 19
		f 4 -62 49 31 -51
		mu 0 4 49 48 19 21
		f 4 -63 50 33 -52
		mu 0 4 50 49 21 23
		f 4 -64 51 35 -45
		mu 0 4 39 50 23 25
		f 4 -53 64 66 -66
		mu 0 4 40 38 52 51
		f 4 44 67 -69 -65
		mu 0 4 38 1 53 52
		f 4 13 69 -71 -68
		mu 0 4 1 3 54 53
		f 4 -54 65 73 -73
		mu 0 4 41 40 51 55
		f 4 15 74 -76 -70
		mu 0 4 3 5 56 54
		f 4 -55 72 78 -78
		mu 0 4 42 41 55 57
		f 4 17 79 -81 -75
		mu 0 4 5 7 58 56
		f 4 -56 77 83 -83
		mu 0 4 43 42 57 59
		f 4 19 84 -86 -80
		mu 0 4 7 9 60 58
		f 4 -57 82 88 -88
		mu 0 4 44 43 59 61
		f 4 21 89 -91 -85
		mu 0 4 9 11 62 60
		f 4 -46 87 91 -90
		mu 0 4 11 44 61 62;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode lightLinker -s -n "lightLinker1";
	rename -uid "5D1D97DB-4C14-183D-0945-DF9EE0622E26";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "FD8BE4A6-4FC6-2CE1-5CD3-EE8C5C668859";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "0B877A02-4043-433C-64A7-D097770DE9CF";
createNode displayLayerManager -n "layerManager";
	rename -uid "B4210B72-4F90-3E44-AC6E-24AF42878073";
createNode displayLayer -n "defaultLayer";
	rename -uid "EE8E2A54-4B6A-15C8-2D92-9FA4D187918D";
	setAttr ".ufem" -type "stringArray" 0  ;
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "D7746DC3-4CF7-26DB-8D8E-24881F94660D";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "11944B4D-4492-E8C6-0837-278E367DFFF5";
	setAttr ".g" yes;
createNode polyCube -n "polyCube1";
	rename -uid "6E4D43EB-44C0-B01B-7B98-E98BE8B4B875";
	setAttr ".sh" 5;
	setAttr ".cuv" 4;
createNode polyExtrudeFace -n "polyExtrudeFace1";
	rename -uid "F2B2C40E-4948-AEAC-5EDA-2AA54BBCD673";
	setAttr ".ics" -type "componentList" 1 "f[4]";
	setAttr ".ix" -type "matrix" 12.198214781123955 0 0 0 0 12.198214781123955 0 0 0 0 1 0
		 0 6.3186954524093206 -11.674800519483627 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0 12.0562 -11.174801 ;
	setAttr ".rs" 47195;
	setAttr ".lt" -type "double3" 0 0 0.15800835047721939 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -6.0991073905619775 11.694596962474661 -11.174800519483627 ;
	setAttr ".cbx" -type "double3" 6.0991073905619775 12.417802842971298 -11.174800519483627 ;
createNode polyTweak -n "polyTweak1";
	rename -uid "8BCD4426-47B6-D44F-BDF9-71AA2FFDF9ED";
	setAttr ".uopa" yes;
	setAttr -s 16 ".tk";
	setAttr ".tk[2]" -type "float3" 0 -0.10105266 0 ;
	setAttr ".tk[3]" -type "float3" 0 -0.10105266 0 ;
	setAttr ".tk[4]" -type "float3" 0 0.075757198 0 ;
	setAttr ".tk[5]" -type "float3" 0 0.075757198 0 ;
	setAttr ".tk[6]" -type "float3" 0 -0.09848959 0 ;
	setAttr ".tk[7]" -type "float3" 0 -0.09848959 0 ;
	setAttr ".tk[8]" -type "float3" 0 0.14071214 0 ;
	setAttr ".tk[9]" -type "float3" 0 0.14071214 0 ;
	setAttr ".tk[14]" -type "float3" 0 0.14071214 0 ;
	setAttr ".tk[15]" -type "float3" 0 0.14071214 0 ;
	setAttr ".tk[16]" -type "float3" 0 -0.09848959 0 ;
	setAttr ".tk[17]" -type "float3" 0 -0.09848959 0 ;
	setAttr ".tk[18]" -type "float3" 0 0.075757198 0 ;
	setAttr ".tk[19]" -type "float3" 0 0.075757198 0 ;
	setAttr ".tk[20]" -type "float3" 0 -0.10105266 0 ;
	setAttr ".tk[21]" -type "float3" 0 -0.10105266 0 ;
createNode polyExtrudeFace -n "polyExtrudeFace2";
	rename -uid "8C04C92E-416E-B0F3-0A52-6996DC808AB5";
	setAttr ".ics" -type "componentList" 1 "f[0:2]";
	setAttr ".ix" -type "matrix" 12.198214781123955 0 0 0 0 12.198214781123955 0 0 0 0 1 0
		 0 6.3186954524093206 -11.674800519483627 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0 3.2783537 -11.174801 ;
	setAttr ".rs" 57158;
	setAttr ".lt" -type "double3" 0 0 0.15800822212034582 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -6.0991070270268484 0.21958806184734314 -11.174800519483627 ;
	setAttr ".cbx" -type "double3" 6.0991070270268484 6.3371194127704245 -11.174800519483627 ;
createNode polyExtrudeFace -n "polyExtrudeFace3";
	rename -uid "71DB14D3-45C2-935B-746B-BB85DA961472";
	setAttr ".ics" -type "componentList" 1 "f[2]";
	setAttr ".ix" -type "matrix" 12.198214781123955 0 0 0 0 12.198214781123955 0 0 0 0 1 0
		 0 6.3186954524093206 -11.674800519483627 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0 6.1800475 -11.016792 ;
	setAttr ".rs" 36728;
	setAttr ".lt" -type "double3" 0 0 0.14137534118091466 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -6.0991066634917184 6.0229756201381628 -11.016791944044174 ;
	setAttr ".cbx" -type "double3" 6.0991066634917184 6.3371194127704245 -11.016791944044174 ;
createNode polyExtrudeFace -n "polyExtrudeFace4";
	rename -uid "A9F7CD37-4489-2DCA-7033-B2920ACB5462";
	setAttr ".ics" -type "componentList" 1 "f[0]";
	setAttr ".ix" -type "matrix" 12.198214781123955 0 0 0 0 12.198214781123955 0 0 0 0 1 0
		 0 6.3186954524093206 -11.674800519483627 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0 0.82307857 -11.016792 ;
	setAttr ".rs" 34332;
	setAttr ".lt" -type "double3" 0 0 0.22943906557776117 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -6.0991062999565893 0.21958806184734314 -11.016791944044174 ;
	setAttr ".cbx" -type "double3" 6.0991062999565893 1.4265690429450064 -11.016791944044174 ;
createNode deleteComponent -n "deleteComponent1";
	rename -uid "EB023A7D-4C6A-0AF8-86B7-2ABFEF928987";
	setAttr ".dc" -type "componentList" 1 "e[66]";
createNode deleteComponent -n "deleteComponent2";
	rename -uid "9505FD6E-4966-2FA7-12A1-52B4038F19F1";
	setAttr ".dc" -type "componentList" 1 "e[64]";
createNode deleteComponent -n "deleteComponent3";
	rename -uid "511A0A80-4A3D-16D3-FACD-77B956ABFE3A";
	setAttr ".dc" -type "componentList" 1 "e[65]";
createNode deleteComponent -n "deleteComponent4";
	rename -uid "E8574EFE-4630-6047-41EA-EABB7B3CF2BA";
	setAttr ".dc" -type "componentList" 1 "vtx[35]";
createNode deleteComponent -n "deleteComponent5";
	rename -uid "E19C8A04-4E6C-92EB-9932-54988F7C7FF8";
	setAttr ".dc" -type "componentList" 1 "vtx[34]";
createNode polyCube -n "polyCube2";
	rename -uid "4664531D-4911-BA4D-47F1-F7874B1A7F6C";
	setAttr ".sh" 5;
	setAttr ".cuv" 4;
createNode polySplit -n "polySplit1";
	rename -uid "A03A3C9A-4BF6-BEE2-1F44-51B07C552287";
	setAttr -s 13 ".e[0:12]"  0.80000001 0.80000001 0.80000001 0.80000001
		 0.80000001 0.80000001 0.80000001 0.80000001 0.80000001 0.80000001 0.80000001 0.80000001
		 0.80000001;
	setAttr -s 13 ".d[0:12]"  -2147483648 -2147483647 -2147483646 -2147483645 -2147483644 -2147483643 
		-2147483642 -2147483641 -2147483640 -2147483639 -2147483638 -2147483637 -2147483648;
	setAttr ".sma" 180;
	setAttr ".m2015" yes;
createNode polyTweak -n "polyTweak2";
	rename -uid "12049871-47E8-AF38-BC17-1EBFF22FDE9A";
	setAttr ".uopa" yes;
	setAttr -s 23 ".tk";
	setAttr ".tk[1]" -type "float3" -7.4505806e-09 0 0 ;
	setAttr ".tk[2]" -type "float3" 0 -0.11744403 0 ;
	setAttr ".tk[3]" -type "float3" -7.4505806e-09 -0.11744403 0 ;
	setAttr ".tk[4]" -type "float3" 0 -0.0030557311 0 ;
	setAttr ".tk[5]" -type "float3" -7.4505806e-09 -0.0030557311 0 ;
	setAttr ".tk[6]" -type "float3" 0 -0.18156871 0 ;
	setAttr ".tk[7]" -type "float3" -7.4505806e-09 -0.18156871 0 ;
	setAttr ".tk[8]" -type "float3" 0 -0.015124119 0 ;
	setAttr ".tk[9]" -type "float3" -7.4505806e-09 -0.015124119 0 ;
	setAttr ".tk[10]" -type "float3" 0 -0.16565777 0 ;
	setAttr ".tk[11]" -type "float3" -7.4505806e-09 -0.16565777 0 ;
	setAttr ".tk[12]" -type "float3" 0 -0.16565777 0 ;
	setAttr ".tk[13]" -type "float3" -7.4505806e-09 -0.16565777 0 ;
	setAttr ".tk[14]" -type "float3" 0 -0.015124119 0 ;
	setAttr ".tk[15]" -type "float3" -7.4505806e-09 -0.015124119 0 ;
	setAttr ".tk[16]" -type "float3" 0 -0.18156871 0 ;
	setAttr ".tk[17]" -type "float3" -7.4505806e-09 -0.18156871 0 ;
	setAttr ".tk[18]" -type "float3" 0 -0.0030557311 0 ;
	setAttr ".tk[19]" -type "float3" -7.4505806e-09 -0.0030557311 0 ;
	setAttr ".tk[20]" -type "float3" 0 -0.11744403 0 ;
	setAttr ".tk[21]" -type "float3" -7.4505806e-09 -0.11744403 0 ;
	setAttr ".tk[23]" -type "float3" -7.4505806e-09 0 0 ;
createNode polyExtrudeFace -n "polyExtrudeFace5";
	rename -uid "A1E09B41-4EC1-ED4C-659E-7F99EE0F74E3";
	setAttr ".ics" -type "componentList" 1 "f[22:26]";
	setAttr ".ix" -type "matrix" 5.8338804688768882 0 0 0 0 14.620157117723497 0 0 0 0 1 0
		 9.0160465763183311 7.5296669251121324 -11.674801199921262 1;
	setAttr ".ws" yes;
	setAttr ".t" -type "double3" 0 -1.1812772982011666e-13 5.2284430010265224 ;
	setAttr ".pvt" -type "float3" 11.421183 6.3186955 -5.9463611 ;
	setAttr ".rs" 42505;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" 10.909377905864448 0.21958836625038369 -11.174801199921262 ;
	setAttr ".cbx" -type "double3" 11.932986810756775 12.417803023823275 -11.174801199921262 ;
createNode polyTweak -n "polyTweak3";
	rename -uid "F596084B-4C4A-D539-EE8A-53BC88FDCB4B";
	setAttr ".uopa" yes;
	setAttr -s 13 ".tk";
	setAttr ".tk[24]" -type "float3" 0.024540629 0 0 ;
	setAttr ".tk[25]" -type "float3" 0.024540629 0 0 ;
	setAttr ".tk[26]" -type "float3" 0.024540629 0 0 ;
	setAttr ".tk[27]" -type "float3" 0.024540629 0 0 ;
	setAttr ".tk[28]" -type "float3" 0.024540629 0 0 ;
	setAttr ".tk[29]" -type "float3" 0.024540629 0 0 ;
	setAttr ".tk[30]" -type "float3" 0.024540629 0 0 ;
	setAttr ".tk[31]" -type "float3" 0.024540629 0 0 ;
	setAttr ".tk[32]" -type "float3" 0.024540629 0 0 ;
	setAttr ".tk[33]" -type "float3" 0.024540629 0 0 ;
	setAttr ".tk[34]" -type "float3" 0.024540629 0 0 ;
	setAttr ".tk[35]" -type "float3" 0.024540629 0 0 ;
createNode polyExtrudeFace -n "polyExtrudeFace6";
	rename -uid "B3944766-46BE-1800-E96C-1A8B7D1FB7CB";
	setAttr ".ics" -type "componentList" 2 "f[2]" "f[39]";
	setAttr ".ix" -type "matrix" 5.8338804688768882 0 0 0 0 14.620157117723497 0 0 0 0 1 0
		 9.0160465763183311 7.5296669251121324 -11.674801199921262 1;
	setAttr ".ws" yes;
	setAttr ".s" -type "double3" 0.92182152743109813 1 0.92182152743109813 ;
	setAttr ".pvt" -type "float3" 8.5042419 6.180048 -8.5605793 ;
	setAttr ".rs" 38999;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" 6.099106341879887 6.0229761717321608 -11.174801199921262 ;
	setAttr ".cbx" -type "double3" 10.909377732001261 6.3371194526962 -5.9463580541693091 ;
createNode polyExtrudeFace -n "polyExtrudeFace7";
	rename -uid "49439045-45F6-D51A-B5DD-70B44763079A";
	setAttr ".ics" -type "componentList" 2 "f[0]" "f[34]";
	setAttr ".ix" -type "matrix" 0 0 -5.8338804688768882 0 0 14.620157117723497 0 0 1 0 0 0
		 -11.827549360457807 7.5296659714378178 -9.2578600253668988 1;
	setAttr ".ws" yes;
	setAttr ".s" -type "double3" 0.92356164145948871 1 0.92356164145948871 ;
	setAttr ".pvt" -type "float3" -8.7133274 0.82307857 -8.7460556 ;
	setAttr ".rs" 64784;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -11.327549360457807 0.21958828400534092 -11.151191181049828 ;
	setAttr ".cbx" -type "double3" -6.0991062147058539 1.4265688037315236 -6.3409197909284547 ;
createNode polyTweak -n "polyTweak4";
	rename -uid "BC10CD1B-4883-B6E0-0465-70B5F4CD60A2";
	setAttr ".uopa" yes;
	setAttr -s 10 ".tk";
	setAttr ".tk[4]" -type "float3" -0.00085352734 0 0 ;
	setAttr ".tk[6]" -type "float3" -0.00085352734 0 0 ;
	setAttr ".tk[48]" -type "float3" -0.032230727 0 0.095007271 ;
	setAttr ".tk[49]" -type "float3" -0.015040284 0 0.095007271 ;
	setAttr ".tk[50]" -type "float3" -0.015040284 0 0.095007271 ;
	setAttr ".tk[51]" -type "float3" -0.032230727 0 0.095007271 ;
	setAttr ".tk[52]" -type "float3" -0.015040284 0 0.20437607 ;
	setAttr ".tk[53]" -type "float3" -0.015040284 0 0.20437607 ;
createNode polyExtrudeFace -n "polyExtrudeFace8";
	rename -uid "D1AEAAD2-4D51-D123-EF5E-E5B8723B9902";
	setAttr ".ics" -type "componentList" 2 "f[4]" "f[43]";
	setAttr ".ix" -type "matrix" 0 0 -5.8338804688768882 0 0 14.620157117723497 0 0 1 0 0 0
		 -11.827549360457807 7.5296659714378178 -9.2578600253668988 1;
	setAttr ".ws" yes;
	setAttr ".s" -type "double3" 0.91064274720482852 1 0.91064274720482852 ;
	setAttr ".pvt" -type "float3" -8.7133274 12.056198 -8.7460566 ;
	setAttr ".rs" 42644;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -11.327549360457807 11.694595074815958 -11.151191876502574 ;
	setAttr ".cbx" -type "double3" -6.0991062147058539 12.417800327290418 -6.3409204863812008 ;
createNode polyTweak -n "polyTweak5";
	rename -uid "8A7F5FED-4BC0-0037-D101-C1ABAD235736";
	setAttr ".uopa" yes;
	setAttr -s 10 ".tk";
	setAttr ".tk[25]" -type "float3" -0.023037767 0 0 ;
	setAttr ".tk[26]" -type "float3" -0.023037767 0 0 ;
	setAttr ".tk[37]" -type "float3" -0.023037767 0 0 ;
	setAttr ".tk[40]" -type "float3" -0.023037767 0 0 ;
	setAttr ".tk[55]" -type "float3" -0.030853219 0 0 ;
	setAttr ".tk[56]" -type "float3" -0.030853219 0 0 ;
	setAttr ".tk[58]" -type "float3" -0.030853234 0 0.19982709 ;
	setAttr ".tk[59]" -type "float3" -0.030853234 0 0.19982709 ;
createNode polyExtrudeFace -n "polyExtrudeFace9";
	rename -uid "E16963A8-47EE-F09C-EA11-0FBB86832478";
	setAttr ".ics" -type "componentList" 4 "f[6]" "f[16]" "f[28]" "f[44]";
	setAttr ".ix" -type "matrix" -5.8338804688768882 0 -7.1444430428183409e-16 0 0 14.620157117723497 0 0
		 1.2246467991473532e-16 0 -1 0 -9.0160465763183311 7.529666448274976 -11.674800545684214 1;
	setAttr ".ws" yes;
	setAttr ".s" -type "double3" 1.0411309189890352 1 1.0411309189890352 ;
	setAttr ".pvt" -type "float3" -9.0160465 12.056199 -14.289022 ;
	setAttr ".rs" 56413;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -11.932986810756775 11.694596423082388 -17.403243691436167 ;
	setAttr ".cbx" -type "double3" -6.099106341879887 12.417801675556849 -11.174800545684214 ;
createNode polyExtrudeFace -n "polyExtrudeFace10";
	rename -uid "6BFC3FBA-4A6A-30CB-5499-8BA4A4FA64B9";
	setAttr ".ics" -type "componentList" 6 "f[8:10]" "f[12:14]" "f[30:32]" "f[36]" "f[38]" "f[40]";
	setAttr ".ix" -type "matrix" -5.8338804688768882 0 -7.1444430428183409e-16 0 0 14.620157117723497 0 0
		 1.2246467991473532e-16 0 -1 0 -9.0160465763183311 7.529666448274976 -11.674800545684214 1;
	setAttr ".ws" yes;
	setAttr ".s" -type "double3" 1.0372752736951907 1 1.0372752736951907 ;
	setAttr ".pvt" -type "float3" -9.0160465 3.2783535 -14.289022 ;
	setAttr ".rs" 43021;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -11.932986810756775 0.21958832512786319 -17.403243691436167 ;
	setAttr ".cbx" -type "double3" -6.099106341879887 6.3371185401444077 -11.174800545684214 ;
createNode polyTweak -n "polyTweak6";
	rename -uid "4369694B-49E3-7A1B-62B4-A1AEFB8141C7";
	setAttr ".uopa" yes;
	setAttr -s 10 ".tk";
	setAttr ".tk[48]" -type "float3" 0.045182019 0 0 ;
	setAttr ".tk[51]" -type "float3" 0.045182019 0 0 ;
	setAttr ".tk[56]" -type "float3" 0 0 -0.18717851 ;
	setAttr ".tk[57]" -type "float3" 0 0 -0.18717851 ;
createNode polyExtrudeFace -n "polyExtrudeFace11";
	rename -uid "340BC738-43CE-0AB5-0C88-488834113F88";
	setAttr ".ics" -type "componentList" 4 "f[8]" "f[14]" "f[30]" "f[40]";
	setAttr ".ix" -type "matrix" -5.8338804688768882 0 -7.1444430428183409e-16 0 0 14.620157117723497 0 0
		 1.2246467991473532e-16 0 -1 0 -10.461745343742942 7.529666448274976 -11.332561317565702 1;
	setAttr ".ws" yes;
	setAttr ".s" -type "double3" 1.0331851421745992 1 1.0331851421745992 ;
	setAttr ".pvt" -type "float3" -10.516111 6.180047 -13.888741 ;
	setAttr ".rs" 47532;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -13.487416833210471 6.0229756948950044 -17.061004463317655 ;
	setAttr ".cbx" -type "double3" -7.5448051093044981 6.3371181044297717 -10.716477218749784 ;
createNode polyTweak -n "polyTweak7";
	rename -uid "AD00A727-48D8-DA6C-CC9F-61BD54CC7503";
	setAttr ".uopa" yes;
	setAttr -s 11 ".tk";
	setAttr ".tk[52]" -type "float3" 0.018637648 0 0 ;
	setAttr ".tk[55]" -type "float3" 0.018637648 0 0 ;
	setAttr ".tk[57]" -type "float3" 0.018637648 0 0 ;
	setAttr ".tk[59]" -type "float3" 0.018637648 0 0 ;
	setAttr ".tk[68]" -type "float3" 0 0 -0.11608487 ;
	setAttr ".tk[69]" -type "float3" 0 0 -0.11608487 ;
	setAttr ".tk[70]" -type "float3" 0 0 -0.11608487 ;
	setAttr ".tk[71]" -type "float3" 0 0 -0.11608487 ;
createNode polyExtrudeFace -n "polyExtrudeFace12";
	rename -uid "6918EB4A-4274-7575-0CC0-09B8D64F89BB";
	setAttr ".ics" -type "componentList" 5 "f[10]" "f[12]" "f[32]" "f[34]" "f[36]";
	setAttr ".ix" -type "matrix" -5.8338804688768882 0 -7.1444430428183409e-16 0 0 14.620157117723497 0 0
		 1.2246467991473532e-16 0 -1 0 -10.461745343742942 7.529666448274976 -11.332561317565702 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -10.516111 0.82307857 -13.888741 ;
	setAttr ".rs" 51391;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -13.487417528663219 0.21958832512786319 -17.061004463317655 ;
	setAttr ".cbx" -type "double3" -7.5448058047572442 1.4265688448540459 -10.716477218749784 ;
createNode polyExtrudeFace -n "polyExtrudeFace13";
	rename -uid "5E5E3A84-4B63-B2E1-3581-9F8B615C95E7";
	setAttr ".ics" -type "componentList" 4 "f[10]" "f[12]" "f[32]" "f[36]";
	setAttr ".ix" -type "matrix" -5.8338804688768882 0 -7.1444430428183409e-16 0 0 14.620157117723497 0 0
		 1.2246467991473532e-16 0 -1 0 -10.461745343742942 7.529666448274976 -11.332561317565702 1;
	setAttr ".ws" yes;
	setAttr ".s" -type "double3" 1.0599472111161545 1 1.0599472111161545 ;
	setAttr ".pvt" -type "float3" -10.516111 0.82307857 -13.888741 ;
	setAttr ".rs" 59787;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -13.487417528663219 0.21958832512786319 -17.061004463317655 ;
	setAttr ".cbx" -type "double3" -7.5448058047572442 1.4265688448540459 -10.716477218749784 ;
createNode script -n "uiConfigurationScriptNode";
	rename -uid "D736BACB-4C6B-8E3C-9EAF-0C9747F0BAEB";
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
		+ "            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -bluePencil 1\n            -greasePencils 0\n            -excludeObjectPreset \"All\" \n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1524\n            -height 1114\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n"
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
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -bluePencil 1\\n    -greasePencils 0\\n    -excludeObjectPreset \\\"All\\\" \\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1524\\n    -height 1114\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -bluePencil 1\\n    -greasePencils 0\\n    -excludeObjectPreset \\\"All\\\" \\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1524\\n    -height 1114\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 12 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "7620283F-46D7-8146-7A0D-C2BD0370DACE";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 120 -ast 1 -aet 200 ";
	setAttr ".st" 6;
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
connectAttr "deleteComponent5.og" "Straight_WallShape.i";
connectAttr "polyExtrudeFace8.out" "in_TurnShape.i";
connectAttr "polyExtrudeFace13.out" "out_TurnShape.i";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "polyTweak1.out" "polyExtrudeFace1.ip";
connectAttr "Straight_WallShape.wm" "polyExtrudeFace1.mp";
connectAttr "polyCube1.out" "polyTweak1.ip";
connectAttr "polyExtrudeFace1.out" "polyExtrudeFace2.ip";
connectAttr "Straight_WallShape.wm" "polyExtrudeFace2.mp";
connectAttr "polyExtrudeFace2.out" "polyExtrudeFace3.ip";
connectAttr "Straight_WallShape.wm" "polyExtrudeFace3.mp";
connectAttr "polyExtrudeFace3.out" "polyExtrudeFace4.ip";
connectAttr "Straight_WallShape.wm" "polyExtrudeFace4.mp";
connectAttr "polyExtrudeFace4.out" "deleteComponent1.ig";
connectAttr "deleteComponent1.og" "deleteComponent2.ig";
connectAttr "deleteComponent2.og" "deleteComponent3.ig";
connectAttr "deleteComponent3.og" "deleteComponent4.ig";
connectAttr "deleteComponent4.og" "deleteComponent5.ig";
connectAttr "polyTweak2.out" "polySplit1.ip";
connectAttr "polyCube2.out" "polyTweak2.ip";
connectAttr "polyTweak3.out" "polyExtrudeFace5.ip";
connectAttr "in_TurnShape.wm" "polyExtrudeFace5.mp";
connectAttr "polySplit1.out" "polyTweak3.ip";
connectAttr "polyExtrudeFace5.out" "polyExtrudeFace6.ip";
connectAttr "in_TurnShape.wm" "polyExtrudeFace6.mp";
connectAttr "polyTweak4.out" "polyExtrudeFace7.ip";
connectAttr "in_TurnShape.wm" "polyExtrudeFace7.mp";
connectAttr "polyExtrudeFace6.out" "polyTweak4.ip";
connectAttr "polyTweak5.out" "polyExtrudeFace8.ip";
connectAttr "in_TurnShape.wm" "polyExtrudeFace8.mp";
connectAttr "polyExtrudeFace7.out" "polyTweak5.ip";
connectAttr "polySurfaceShape1.o" "polyExtrudeFace9.ip";
connectAttr "out_TurnShape.wm" "polyExtrudeFace9.mp";
connectAttr "polyTweak6.out" "polyExtrudeFace10.ip";
connectAttr "out_TurnShape.wm" "polyExtrudeFace10.mp";
connectAttr "polyExtrudeFace9.out" "polyTweak6.ip";
connectAttr "polyTweak7.out" "polyExtrudeFace11.ip";
connectAttr "out_TurnShape.wm" "polyExtrudeFace11.mp";
connectAttr "polyExtrudeFace10.out" "polyTweak7.ip";
connectAttr "polyExtrudeFace11.out" "polyExtrudeFace12.ip";
connectAttr "out_TurnShape.wm" "polyExtrudeFace12.mp";
connectAttr "polyExtrudeFace12.out" "polyExtrudeFace13.ip";
connectAttr "out_TurnShape.wm" "polyExtrudeFace13.mp";
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "Straight_WallShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "in_TurnShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "out_TurnShape.iog" ":initialShadingGroup.dsm" -na;
// End of 3-Walls.ma
