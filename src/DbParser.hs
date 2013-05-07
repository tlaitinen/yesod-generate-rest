{-# OPTIONS_GHC -w #-}
{-# OPTIONS -fglasgow-exts -cpp #-}
module DbParser (parse) where
import DbLexer
import DbTypes
import ModuleMerger
import System.IO
import Data.Maybe
import Data.Typeable
import Prelude hiding (catch) 
import Control.Exception
import System.Exit
import qualified GHC.Exts as Happy_GHC_Exts

-- parser produced by Happy Version 1.18.9

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26 t27 t28 t29 t30 t31 t32 t33 t34
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15
	| HappyAbsSyn16 t16
	| HappyAbsSyn17 t17
	| HappyAbsSyn18 t18
	| HappyAbsSyn19 t19
	| HappyAbsSyn20 t20
	| HappyAbsSyn21 t21
	| HappyAbsSyn22 t22
	| HappyAbsSyn23 t23
	| HappyAbsSyn24 t24
	| HappyAbsSyn25 t25
	| HappyAbsSyn26 t26
	| HappyAbsSyn27 t27
	| HappyAbsSyn28 t28
	| HappyAbsSyn29 t29
	| HappyAbsSyn30 t30
	| HappyAbsSyn31 t31
	| HappyAbsSyn32 t32
	| HappyAbsSyn33 t33
	| HappyAbsSyn34 t34

action_0 (4#) = happyGoto action_3
action_0 (5#) = happyGoto action_2
action_0 x = happyTcHack x happyReduce_2

action_1 (5#) = happyGoto action_2
action_1 x = happyTcHack x happyFail

action_2 (35#) = happyShift action_6
action_2 (6#) = happyGoto action_4
action_2 (7#) = happyGoto action_5
action_2 x = happyTcHack x happyReduce_5

action_3 (83#) = happyAccept
action_3 x = happyTcHack x happyFail

action_4 x = happyTcHack x happyReduce_3

action_5 (36#) = happyShift action_12
action_5 (38#) = happyShift action_13
action_5 (39#) = happyShift action_14
action_5 (8#) = happyGoto action_8
action_5 (9#) = happyGoto action_9
action_5 (11#) = happyGoto action_10
action_5 (19#) = happyGoto action_11
action_5 x = happyTcHack x happyReduce_1

action_6 (57#) = happyShift action_7
action_6 x = happyTcHack x happyFail

action_7 (46#) = happyShift action_18
action_7 x = happyTcHack x happyFail

action_8 x = happyTcHack x happyReduce_6

action_9 x = happyTcHack x happyReduce_9

action_10 x = happyTcHack x happyReduce_7

action_11 x = happyTcHack x happyReduce_8

action_12 (43#) = happyShift action_17
action_12 x = happyTcHack x happyFail

action_13 (43#) = happyShift action_16
action_13 x = happyTcHack x happyFail

action_14 (43#) = happyShift action_15
action_14 x = happyTcHack x happyFail

action_15 (48#) = happyShift action_22
action_15 x = happyTcHack x happyFail

action_16 (55#) = happyShift action_21
action_16 (17#) = happyGoto action_20
action_16 x = happyTcHack x happyReduce_30

action_17 (47#) = happyShift action_19
action_17 x = happyTcHack x happyFail

action_18 x = happyTcHack x happyReduce_4

action_19 (43#) = happyShift action_28
action_19 (10#) = happyGoto action_27
action_19 x = happyTcHack x happyFail

action_20 (48#) = happyShift action_26
action_20 x = happyTcHack x happyFail

action_21 (43#) = happyShift action_25
action_21 (18#) = happyGoto action_24
action_21 x = happyTcHack x happyFail

action_22 (20#) = happyGoto action_23
action_22 x = happyTcHack x happyReduce_35

action_23 (42#) = happyShift action_35
action_23 (21#) = happyGoto action_33
action_23 (26#) = happyGoto action_34
action_23 x = happyTcHack x happyReduce_48

action_24 (54#) = happyShift action_32
action_24 x = happyTcHack x happyReduce_31

action_25 x = happyTcHack x happyReduce_32

action_26 (20#) = happyGoto action_31
action_26 x = happyTcHack x happyReduce_35

action_27 (37#) = happyShift action_29
action_27 (46#) = happyShift action_30
action_27 x = happyTcHack x happyFail

action_28 x = happyTcHack x happyReduce_11

action_29 (43#) = happyShift action_44
action_29 x = happyTcHack x happyFail

action_30 x = happyTcHack x happyReduce_10

action_31 (42#) = happyShift action_35
action_31 (21#) = happyGoto action_33
action_31 (26#) = happyGoto action_43
action_31 x = happyTcHack x happyReduce_48

action_32 (43#) = happyShift action_42
action_32 x = happyTcHack x happyFail

action_33 (46#) = happyShift action_41
action_33 x = happyTcHack x happyFail

action_34 (40#) = happyShift action_39
action_34 (49#) = happyShift action_40
action_34 (27#) = happyGoto action_38
action_34 x = happyTcHack x happyFail

action_35 (69#) = happyShift action_37
action_35 (34#) = happyGoto action_36
action_35 x = happyTcHack x happyReduce_70

action_36 (43#) = happyShift action_49
action_36 (58#) = happyShift action_50
action_36 (59#) = happyShift action_51
action_36 (60#) = happyShift action_52
action_36 (61#) = happyShift action_53
action_36 (62#) = happyShift action_54
action_36 (63#) = happyShift action_55
action_36 (64#) = happyShift action_56
action_36 (65#) = happyShift action_57
action_36 (66#) = happyShift action_58
action_36 (67#) = happyShift action_59
action_36 (68#) = happyShift action_60
action_36 (33#) = happyGoto action_48
action_36 x = happyTcHack x happyFail

action_37 x = happyTcHack x happyReduce_71

action_38 (46#) = happyShift action_47
action_38 x = happyTcHack x happyFail

action_39 (43#) = happyShift action_46
action_39 x = happyTcHack x happyFail

action_40 x = happyTcHack x happyReduce_34

action_41 x = happyTcHack x happyReduce_36

action_42 x = happyTcHack x happyReduce_33

action_43 (40#) = happyShift action_39
action_43 (27#) = happyGoto action_38
action_43 (28#) = happyGoto action_45
action_43 x = happyTcHack x happyReduce_51

action_44 x = happyTcHack x happyReduce_12

action_45 (81#) = happyShift action_70
action_45 (29#) = happyGoto action_68
action_45 (30#) = happyGoto action_69
action_45 x = happyTcHack x happyReduce_54

action_46 (42#) = happyShift action_67
action_46 (32#) = happyGoto action_66
action_46 x = happyTcHack x happyReduce_57

action_47 x = happyTcHack x happyReduce_49

action_48 (41#) = happyShift action_64
action_48 (82#) = happyShift action_65
action_48 (22#) = happyGoto action_61
action_48 (23#) = happyGoto action_62
action_48 (24#) = happyGoto action_63
action_48 x = happyTcHack x happyReduce_39

action_49 x = happyTcHack x happyReduce_38

action_50 x = happyTcHack x happyReduce_59

action_51 x = happyTcHack x happyReduce_60

action_52 x = happyTcHack x happyReduce_61

action_53 x = happyTcHack x happyReduce_62

action_54 x = happyTcHack x happyReduce_63

action_55 x = happyTcHack x happyReduce_64

action_56 x = happyTcHack x happyReduce_65

action_57 x = happyTcHack x happyReduce_66

action_58 x = happyTcHack x happyReduce_67

action_59 x = happyTcHack x happyReduce_68

action_60 x = happyTcHack x happyReduce_69

action_61 x = happyTcHack x happyReduce_37

action_62 (41#) = happyShift action_64
action_62 (82#) = happyShift action_65
action_62 (24#) = happyGoto action_79
action_62 x = happyTcHack x happyReduce_40

action_63 x = happyTcHack x happyReduce_41

action_64 (42#) = happyShift action_78
action_64 x = happyTcHack x happyFail

action_65 (57#) = happyShift action_77
action_65 x = happyTcHack x happyFail

action_66 x = happyTcHack x happyReduce_50

action_67 (42#) = happyShift action_67
action_67 (32#) = happyGoto action_76
action_67 x = happyTcHack x happyReduce_57

action_68 (46#) = happyShift action_75
action_68 x = happyTcHack x happyFail

action_69 (41#) = happyShift action_74
action_69 (12#) = happyGoto action_72
action_69 (31#) = happyGoto action_73
action_69 x = happyTcHack x happyReduce_14

action_70 (43#) = happyShift action_71
action_70 x = happyTcHack x happyFail

action_71 x = happyTcHack x happyReduce_53

action_72 (49#) = happyShift action_83
action_72 (70#) = happyShift action_84
action_72 (71#) = happyShift action_85
action_72 (72#) = happyShift action_86
action_72 (73#) = happyShift action_87
action_72 (77#) = happyShift action_88
action_72 (13#) = happyGoto action_82
action_72 x = happyTcHack x happyFail

action_73 (46#) = happyShift action_81
action_73 x = happyTcHack x happyFail

action_74 (42#) = happyShift action_80
action_74 x = happyTcHack x happyFail

action_75 x = happyTcHack x happyReduce_52

action_76 x = happyTcHack x happyReduce_58

action_77 x = happyTcHack x happyReduce_44

action_78 x = happyTcHack x happyReduce_43

action_79 x = happyTcHack x happyReduce_42

action_80 x = happyTcHack x happyReduce_56

action_81 x = happyTcHack x happyReduce_55

action_82 x = happyTcHack x happyReduce_15

action_83 x = happyTcHack x happyReduce_13

action_84 (48#) = happyShift action_90
action_84 (14#) = happyGoto action_94
action_84 x = happyTcHack x happyFail

action_85 (48#) = happyShift action_90
action_85 (14#) = happyGoto action_93
action_85 x = happyTcHack x happyFail

action_86 (48#) = happyShift action_90
action_86 (14#) = happyGoto action_92
action_86 x = happyTcHack x happyFail

action_87 (48#) = happyShift action_90
action_87 (14#) = happyGoto action_91
action_87 x = happyTcHack x happyFail

action_88 (48#) = happyShift action_90
action_88 (14#) = happyGoto action_89
action_88 x = happyTcHack x happyFail

action_89 x = happyTcHack x happyReduce_20

action_90 (15#) = happyGoto action_95
action_90 x = happyTcHack x happyReduce_22

action_91 x = happyTcHack x happyReduce_19

action_92 x = happyTcHack x happyReduce_18

action_93 x = happyTcHack x happyReduce_17

action_94 x = happyTcHack x happyReduce_16

action_95 (49#) = happyShift action_97
action_95 (74#) = happyShift action_98
action_95 (75#) = happyShift action_99
action_95 (76#) = happyShift action_100
action_95 (78#) = happyShift action_101
action_95 (79#) = happyShift action_102
action_95 (80#) = happyShift action_103
action_95 (16#) = happyGoto action_96
action_95 x = happyTcHack x happyFail

action_96 (46#) = happyShift action_108
action_96 x = happyTcHack x happyFail

action_97 x = happyTcHack x happyReduce_21

action_98 x = happyTcHack x happyReduce_24

action_99 (42#) = happyShift action_107
action_99 x = happyTcHack x happyFail

action_100 (42#) = happyShift action_106
action_100 x = happyTcHack x happyFail

action_101 x = happyTcHack x happyReduce_27

action_102 (42#) = happyShift action_105
action_102 x = happyTcHack x happyFail

action_103 (42#) = happyShift action_104
action_103 x = happyTcHack x happyFail

action_104 x = happyTcHack x happyReduce_29

action_105 x = happyTcHack x happyReduce_28

action_106 x = happyTcHack x happyReduce_26

action_107 x = happyTcHack x happyReduce_25

action_108 x = happyTcHack x happyReduce_23

happyReduce_1 = happySpecReduce_2  4# happyReduction_1
happyReduction_1 (HappyAbsSyn7  happy_var_2)
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (DbModule happy_var_1 (getEntities happy_var_2) 
                                        (getClasses happy_var_2)
                                        (getEnums happy_var_2)
	)
happyReduction_1 _ _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_0  5# happyReduction_2
happyReduction_2  =  HappyAbsSyn5
		 ([]
	)

happyReduce_3 = happySpecReduce_2  5# happyReduction_3
happyReduction_3 (HappyAbsSyn6  happy_var_2)
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_2 : happy_var_1
	)
happyReduction_3 _ _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_3  6# happyReduction_4
happyReduction_4 _
	(HappyTerminal (Tk _ (TString happy_var_2)))
	_
	 =  HappyAbsSyn6
		 (happy_var_2
	)
happyReduction_4 _ _ _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_0  7# happyReduction_5
happyReduction_5  =  HappyAbsSyn7
		 ([]
	)

happyReduce_6 = happySpecReduce_2  7# happyReduction_6
happyReduction_6 (HappyAbsSyn8  happy_var_2)
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_2 : happy_var_1
	)
happyReduction_6 _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_1  8# happyReduction_7
happyReduction_7 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn8
		 (EntityDef happy_var_1
	)
happyReduction_7 _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_1  8# happyReduction_8
happyReduction_8 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn8
		 (ClassDef happy_var_1
	)
happyReduction_8 _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_1  8# happyReduction_9
happyReduction_9 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 (EnumDef happy_var_1
	)
happyReduction_9 _  = notHappyAtAll 

happyReduce_10 = happyReduce 5# 9# happyReduction_10
happyReduction_10 (_ `HappyStk`
	(HappyAbsSyn10  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Tk _ (TUpperId happy_var_2))) `HappyStk`
	(HappyTerminal happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (DbEnum (mkLoc happy_var_1) happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_11 = happySpecReduce_1  10# happyReduction_11
happyReduction_11 (HappyTerminal (Tk _ (TUpperId happy_var_1)))
	 =  HappyAbsSyn10
		 ([happy_var_1]
	)
happyReduction_11 _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  10# happyReduction_12
happyReduction_12 (HappyTerminal (Tk _ (TUpperId happy_var_3)))
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_3 : happy_var_1
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happyReduce 10# 11# happyReduction_13
happyReduction_13 (_ `HappyStk`
	(HappyAbsSyn12  happy_var_9) `HappyStk`
	(HappyAbsSyn30  happy_var_8) `HappyStk`
	(HappyAbsSyn28  happy_var_7) `HappyStk`
	(HappyAbsSyn26  happy_var_6) `HappyStk`
	(HappyAbsSyn20  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_3) `HappyStk`
	(HappyTerminal (Tk _ (TUpperId happy_var_2))) `HappyStk`
	(HappyTerminal happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (Entity (mkLoc happy_var_1) happy_var_2 happy_var_3 happy_var_5 happy_var_6 happy_var_7 happy_var_8 happy_var_9
	) `HappyStk` happyRest

happyReduce_14 = happySpecReduce_0  12# happyReduction_14
happyReduction_14  =  HappyAbsSyn12
		 ([]
	)

happyReduce_15 = happySpecReduce_2  12# happyReduction_15
happyReduction_15 (HappyAbsSyn13  happy_var_2)
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (happy_var_2 : happy_var_1
	)
happyReduction_15 _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_2  13# happyReduction_16
happyReduction_16 (HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (Service GetService happy_var_2
	)
happyReduction_16 _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_2  13# happyReduction_17
happyReduction_17 (HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (Service PutService happy_var_2
	)
happyReduction_17 _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_2  13# happyReduction_18
happyReduction_18 (HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (Service PostService happy_var_2
	)
happyReduction_18 _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_2  13# happyReduction_19
happyReduction_19 (HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (Service DeleteService happy_var_2
	)
happyReduction_19 _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_2  13# happyReduction_20
happyReduction_20 (HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (Service ValidateService happy_var_2
	)
happyReduction_20 _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  14# happyReduction_21
happyReduction_21 _
	(HappyAbsSyn15  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (happy_var_2
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_0  15# happyReduction_22
happyReduction_22  =  HappyAbsSyn15
		 ([]
	)

happyReduce_23 = happySpecReduce_3  15# happyReduction_23
happyReduction_23 _
	(HappyAbsSyn16  happy_var_2)
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_2 : happy_var_1
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_1  16# happyReduction_24
happyReduction_24 _
	 =  HappyAbsSyn16
		 (PublicService
	)

happyReduce_25 = happySpecReduce_2  16# happyReduction_25
happyReduction_25 (HappyTerminal (Tk _ (TLowerId happy_var_2)))
	_
	 =  HappyAbsSyn16
		 (ServicePreHook happy_var_2
	)
happyReduction_25 _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_2  16# happyReduction_26
happyReduction_26 (HappyTerminal (Tk _ (TLowerId happy_var_2)))
	_
	 =  HappyAbsSyn16
		 (ServicePostHook happy_var_2
	)
happyReduction_26 _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_1  16# happyReduction_27
happyReduction_27 _
	 =  HappyAbsSyn16
		 (ServiceDefaultFilterSort
	)

happyReduce_28 = happySpecReduce_2  16# happyReduction_28
happyReduction_28 (HappyTerminal (Tk _ (TLowerId happy_var_2)))
	_
	 =  HappyAbsSyn16
		 (ServiceFilter happy_var_2
	)
happyReduction_28 _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_2  16# happyReduction_29
happyReduction_29 (HappyTerminal (Tk _ (TLowerId happy_var_2)))
	_
	 =  HappyAbsSyn16
		 (ServiceSelectOpts happy_var_2
	)
happyReduction_29 _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_0  17# happyReduction_30
happyReduction_30  =  HappyAbsSyn17
		 ([]
	)

happyReduce_31 = happySpecReduce_2  17# happyReduction_31
happyReduction_31 (HappyAbsSyn18  happy_var_2)
	_
	 =  HappyAbsSyn17
		 (happy_var_2
	)
happyReduction_31 _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_1  18# happyReduction_32
happyReduction_32 (HappyTerminal (Tk _ (TUpperId happy_var_1)))
	 =  HappyAbsSyn18
		 ([happy_var_1]
	)
happyReduction_32 _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_3  18# happyReduction_33
happyReduction_33 (HappyTerminal (Tk _ (TUpperId happy_var_3)))
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn18
		 (happy_var_3 : happy_var_1
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happyReduce 6# 19# happyReduction_34
happyReduction_34 (_ `HappyStk`
	(HappyAbsSyn26  happy_var_5) `HappyStk`
	(HappyAbsSyn20  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Tk _ (TUpperId happy_var_2))) `HappyStk`
	(HappyTerminal happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn19
		 (Class (mkLoc happy_var_1) happy_var_2 happy_var_4 happy_var_5
	) `HappyStk` happyRest

happyReduce_35 = happySpecReduce_0  20# happyReduction_35
happyReduction_35  =  HappyAbsSyn20
		 ([]
	)

happyReduce_36 = happySpecReduce_3  20# happyReduction_36
happyReduction_36 _
	(HappyAbsSyn21  happy_var_2)
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (happy_var_2 : happy_var_1
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyReduce_37 = happyReduce 4# 21# happyReduction_37
happyReduction_37 ((HappyAbsSyn22  happy_var_4) `HappyStk`
	(HappyAbsSyn33  happy_var_3) `HappyStk`
	(HappyAbsSyn34  happy_var_2) `HappyStk`
	(HappyTerminal (Tk _ (TLowerId happy_var_1))) `HappyStk`
	happyRest)
	 = HappyAbsSyn21
		 (Field happy_var_2 happy_var_1 (NormalField (tokenType happy_var_3) happy_var_4)
	) `HappyStk` happyRest

happyReduce_38 = happySpecReduce_3  21# happyReduction_38
happyReduction_38 (HappyTerminal (Tk _ (TUpperId happy_var_3)))
	(HappyAbsSyn34  happy_var_2)
	(HappyTerminal (Tk _ (TLowerId happy_var_1)))
	 =  HappyAbsSyn21
		 (Field happy_var_2 happy_var_1 (EntityField happy_var_3)
	)
happyReduction_38 _ _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_0  22# happyReduction_39
happyReduction_39  =  HappyAbsSyn22
		 ([]
	)

happyReduce_40 = happySpecReduce_1  22# happyReduction_40
happyReduction_40 (HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn22
		 (happy_var_1
	)
happyReduction_40 _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_1  23# happyReduction_41
happyReduction_41 (HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn23
		 ([happy_var_1]
	)
happyReduction_41 _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_2  23# happyReduction_42
happyReduction_42 (HappyAbsSyn24  happy_var_2)
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn23
		 (happy_var_2 : happy_var_1
	)
happyReduction_42 _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_2  24# happyReduction_43
happyReduction_43 (HappyTerminal (Tk _ (TLowerId happy_var_2)))
	_
	 =  HappyAbsSyn24
		 (FieldCheck happy_var_2
	)
happyReduction_43 _ _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_2  24# happyReduction_44
happyReduction_44 (HappyTerminal (Tk _ (TString happy_var_2)))
	_
	 =  HappyAbsSyn24
		 (FieldDefault happy_var_2
	)
happyReduction_44 _ _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_1  25# happyReduction_45
happyReduction_45 (HappyTerminal (Tk _ (TString happy_var_1)))
	 =  HappyAbsSyn25
		 (StringValue happy_var_1
	)
happyReduction_45 _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_1  25# happyReduction_46
happyReduction_46 (HappyTerminal (Tk _ (TInt happy_var_1)))
	 =  HappyAbsSyn25
		 (IntValue happy_var_1
	)
happyReduction_46 _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_1  25# happyReduction_47
happyReduction_47 (HappyTerminal (Tk _ (TFloat happy_var_1)))
	 =  HappyAbsSyn25
		 (FloatValue happy_var_1
	)
happyReduction_47 _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_0  26# happyReduction_48
happyReduction_48  =  HappyAbsSyn26
		 ([]
	)

happyReduce_49 = happySpecReduce_3  26# happyReduction_49
happyReduction_49 _
	(HappyAbsSyn27  happy_var_2)
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn26
		 (happy_var_2 : happy_var_1
	)
happyReduction_49 _ _ _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_3  27# happyReduction_50
happyReduction_50 (HappyAbsSyn32  happy_var_3)
	(HappyTerminal (Tk _ (TUpperId happy_var_2)))
	_
	 =  HappyAbsSyn27
		 (Unique happy_var_2 happy_var_3
	)
happyReduction_50 _ _ _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_0  28# happyReduction_51
happyReduction_51  =  HappyAbsSyn28
		 ([]
	)

happyReduce_52 = happySpecReduce_3  28# happyReduction_52
happyReduction_52 _
	(HappyAbsSyn29  happy_var_2)
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn28
		 (happy_var_2 : happy_var_1
	)
happyReduction_52 _ _ _  = notHappyAtAll 

happyReduce_53 = happySpecReduce_2  29# happyReduction_53
happyReduction_53 (HappyTerminal (Tk _ (TUpperId happy_var_2)))
	_
	 =  HappyAbsSyn29
		 (happy_var_2
	)
happyReduction_53 _ _  = notHappyAtAll 

happyReduce_54 = happySpecReduce_0  30# happyReduction_54
happyReduction_54  =  HappyAbsSyn30
		 ([]
	)

happyReduce_55 = happySpecReduce_3  30# happyReduction_55
happyReduction_55 _
	(HappyAbsSyn31  happy_var_2)
	(HappyAbsSyn30  happy_var_1)
	 =  HappyAbsSyn30
		 (happy_var_2 : happy_var_1
	)
happyReduction_55 _ _ _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_2  31# happyReduction_56
happyReduction_56 (HappyTerminal (Tk _ (TLowerId happy_var_2)))
	_
	 =  HappyAbsSyn31
		 (happy_var_2
	)
happyReduction_56 _ _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_0  32# happyReduction_57
happyReduction_57  =  HappyAbsSyn32
		 ([]
	)

happyReduce_58 = happySpecReduce_2  32# happyReduction_58
happyReduction_58 (HappyAbsSyn32  happy_var_2)
	(HappyTerminal (Tk _ (TLowerId happy_var_1)))
	 =  HappyAbsSyn32
		 (happy_var_1 : happy_var_2
	)
happyReduction_58 _ _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_1  33# happyReduction_59
happyReduction_59 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn33
		 (happy_var_1
	)
happyReduction_59 _  = notHappyAtAll 

happyReduce_60 = happySpecReduce_1  33# happyReduction_60
happyReduction_60 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn33
		 (happy_var_1
	)
happyReduction_60 _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_1  33# happyReduction_61
happyReduction_61 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn33
		 (happy_var_1
	)
happyReduction_61 _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_1  33# happyReduction_62
happyReduction_62 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn33
		 (happy_var_1
	)
happyReduction_62 _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_1  33# happyReduction_63
happyReduction_63 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn33
		 (happy_var_1
	)
happyReduction_63 _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_1  33# happyReduction_64
happyReduction_64 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn33
		 (happy_var_1
	)
happyReduction_64 _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_1  33# happyReduction_65
happyReduction_65 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn33
		 (happy_var_1
	)
happyReduction_65 _  = notHappyAtAll 

happyReduce_66 = happySpecReduce_1  33# happyReduction_66
happyReduction_66 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn33
		 (happy_var_1
	)
happyReduction_66 _  = notHappyAtAll 

happyReduce_67 = happySpecReduce_1  33# happyReduction_67
happyReduction_67 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn33
		 (happy_var_1
	)
happyReduction_67 _  = notHappyAtAll 

happyReduce_68 = happySpecReduce_1  33# happyReduction_68
happyReduction_68 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn33
		 (happy_var_1
	)
happyReduction_68 _  = notHappyAtAll 

happyReduce_69 = happySpecReduce_1  33# happyReduction_69
happyReduction_69 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn33
		 (happy_var_1
	)
happyReduction_69 _  = notHappyAtAll 

happyReduce_70 = happySpecReduce_0  34# happyReduction_70
happyReduction_70  =  HappyAbsSyn34
		 (False
	)

happyReduce_71 = happySpecReduce_1  34# happyReduction_71
happyReduction_71 _
	 =  HappyAbsSyn34
		 (True
	)

happyNewToken action sts stk [] =
	action 83# 83# notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	Tk _ TImport -> cont 35#;
	Tk _ TEnum -> cont 36#;
	Tk _ TPipe -> cont 37#;
	Tk _ TEntity -> cont 38#;
	Tk _ TClass -> cont 39#;
	Tk _ TUnique -> cont 40#;
	Tk _ TCheck -> cont 41#;
	Tk _ (TLowerId happy_dollar_dollar) -> cont 42#;
	Tk _ (TUpperId happy_dollar_dollar) -> cont 43#;
	Tk _ (TInt happy_dollar_dollar) -> cont 44#;
	Tk _ (TFloat happy_dollar_dollar) -> cont 45#;
	Tk _ TSemicolon -> cont 46#;
	Tk _ TEquals -> cont 47#;
	Tk _ TLBrace -> cont 48#;
	Tk _ TRBrace -> cont 49#;
	Tk _ TLParen -> cont 50#;
	Tk _ TRParen -> cont 51#;
	Tk _ TLBrack -> cont 52#;
	Tk _ TRBrack -> cont 53#;
	Tk _ TComma -> cont 54#;
	Tk _ TColon -> cont 55#;
	Tk _ TDot -> cont 56#;
	Tk _ (TString happy_dollar_dollar) -> cont 57#;
	Tk _ TWord32 -> cont 58#;
	Tk _ TWord64 -> cont 59#;
	Tk _ TInt32 -> cont 60#;
	Tk _ TInt64 -> cont 61#;
	Tk _ TText -> cont 62#;
	Tk _ TBool -> cont 63#;
	Tk _ TDouble -> cont 64#;
	Tk _ TTime -> cont 65#;
	Tk _ TDate -> cont 66#;
	Tk _ TDateTime -> cont 67#;
	Tk _ TZonedTime -> cont 68#;
	Tk _ TMaybe -> cont 69#;
	Tk _ TGet -> cont 70#;
	Tk _ TPut -> cont 71#;
	Tk _ TPost -> cont 72#;
	Tk _ TDelete -> cont 73#;
	Tk _ TPublic -> cont 74#;
	Tk _ TPreHook -> cont 75#;
	Tk _ TPostHook -> cont 76#;
	Tk _ TValidate -> cont 77#;
	Tk _ TDefaultFilterSort -> cont 78#;
	Tk _ TFilter -> cont 79#;
	Tk _ TSelectOpts -> cont 80#;
	Tk _ TDeriving -> cont 81#;
	Tk _ TDefault -> cont 82#;
	_ -> happyError' (tk:tks)
	}

happyError_ 83# tk tks = happyError' tks
happyError_ _ tk tks = happyError' (tk:tks)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Monad HappyIdentity where
    return = HappyIdentity
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => [(Token)] -> HappyIdentity a
happyError' = HappyIdentity . parseError

dbdef tks = happyRunIdentity happySomeParser where
  happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


data ParseError = ParseError String deriving (Show, Typeable)
instance Exception ParseError

parseError :: [Token] -> a
parseError (t:ts) = throw (ParseError $ "Parse error : unexpected " ++ show (tokenType t) ++ " at line " ++ show (tokenLineNum t) ++ " col " ++ show (tokenColNum t))
parseError _ = throw (ParseError $ "Parse error : unexpected end of file")

parseModules :: [ImportPath] -> [FilePath] -> IO [(FilePath,DbModule)]
parseModules handled (path:paths)
    | path `elem` handled = return []
    | otherwise = do
        s <- readFile path
        let mod = (dbdef . lexer) s
        catch (do rest <- parseModules (path:handled) (paths ++ dbImports mod)
                  return ((path,mod):rest))
              (\(ParseError msg) -> do 
                    putStrLn $ path ++ ": " ++ msg
                    exitWith (ExitFailure 1))
parseModules _ [] = return []

parse path = parseModules [] [path]
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 

{-# LINE 30 "templates/GenericTemplate.hs" #-}








{-# LINE 51 "templates/GenericTemplate.hs" #-}

{-# LINE 61 "templates/GenericTemplate.hs" #-}

{-# LINE 70 "templates/GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is 1#, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept 1# tk st sts (_ `HappyStk` ans `HappyStk` _) =
	happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
	(happyTcHack j ) (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

{-# LINE 148 "templates/GenericTemplate.hs" #-}

-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Happy_GHC_Exts.Int# ->                    -- token number
         Happy_GHC_Exts.Int# ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state 1# tk st sts stk@(x `HappyStk` _) =
     let (i) = (case x of { HappyErrorToken (Happy_GHC_Exts.I# (i)) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn 1# tk st sts stk
     = happyFail 1# tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn 1# tk st sts stk
     = happyFail 1# tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn 1# tk st sts stk
     = happyFail 1# tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn 1# tk st sts stk
     = happyFail 1# tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn 1# tk st sts stk
     = happyFail 1# tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) sts of
	 sts1@(((st1@(HappyState (action))):(_))) ->
        	let r = fn stk in  -- it doesn't hurt to always seq here...
       		happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn 1# tk st sts stk
     = happyFail 1# tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
        happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))
       where (sts1@(((st1@(HappyState (action))):(_)))) = happyDrop k ((st):(sts))
             drop_stk = happyDropStk k stk

happyMonad2Reduce k nt fn 1# tk st sts stk
     = happyFail 1# tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
       happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))
       where (sts1@(((st1@(HappyState (action))):(_)))) = happyDrop k ((st):(sts))
             drop_stk = happyDropStk k stk





             new_state = action


happyDrop 0# l = l
happyDrop n ((_):(t)) = happyDrop (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) t

happyDropStk 0# l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Happy_GHC_Exts.-# (1#::Happy_GHC_Exts.Int#)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

{-# LINE 246 "templates/GenericTemplate.hs" #-}
happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (1# is the error token)

-- parse error if we are in recovery and we fail again
happyFail 1# tk old_st _ stk@(x `HappyStk` _) =
     let (i) = (case x of { HappyErrorToken (Happy_GHC_Exts.I# (i)) -> i }) in
--	trace "failing" $ 
        happyError_ i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  1# tk old_st (((HappyState (action))):(sts)) 
						(saved_tok `HappyStk` _ `HappyStk` stk) =
--	trace ("discarding state, depth " ++ show (length stk))  $
	action 1# 1# tk (HappyState (action)) sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail  i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
	action 1# 1# tk (HappyState (action)) sts ( (HappyErrorToken (Happy_GHC_Exts.I# (i))) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions


happyTcHack :: Happy_GHC_Exts.Int# -> a -> a
happyTcHack x y = y
{-# INLINE happyTcHack #-}


-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--	happySeq = happyDoSeq
-- otherwise it emits
-- 	happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# LINE 312 "templates/GenericTemplate.hs" #-}
{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
