(* ::Package:: *)

(*
zjui.wl
Author:
Myth (https://github.com/Mythologyli)
DX3906G (https://github.com/DX3906G)
*)
BeginPackage["ZJUI`"];


ConvertDh[dh_] :=
    (
        len = Length[dh];
        h = Table[0, {i, len}];
        For[i = 1, i <= len, i++,
            h[[i]] = ({{Cos[dh[[i, 4]]], -Sin[dh[[i, 4]]], 0, dh[[i, 
                2]]}, {Sin[dh[[i, 4]]] * Cos[dh[[i, 1]]], Cos[dh[[i, 4]]] * Cos[dh[[i,
                 1]]], -Sin[dh[[i, 1]]], -Sin[dh[[i, 1]]] * dh[[i, 3]]}, {Sin[dh[[i, 
                4]]] * Sin[dh[[i, 1]]], Cos[dh[[i, 4]]] * Sin[dh[[i, 1]]], Cos[dh[[i,
                 1]]], Cos[dh[[i, 1]]] * dh[[i, 3]]}, {0, 0, 0, 1}})
        ];
        T = h[[1]];
        For[i = 2, i <= len, i++,
            T = T . h[[i]]
        ];
        FullSimplify[T]
    );


FixedAngles[R_] :=
    (
        beta = ArcTan[Sqrt[R[[1, 1]] ^ 2 + R[[2, 1]] ^ 2], -R[[3, 1]]
            ];
        alpha = ArcTan[R[[1, 1]] / Cos[beta], R[[2, 1]] / Cos[beta]];
            
        gamma = ArcTan[R[[3, 3]] / Cos[beta], R[[3, 2]] / Cos[beta]];
            
        {alpha, beta, gamma}
    );


ForwardKinematicsZJU[\[Theta]_]:=(
T=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{
RowBox[{
RowBox[{"-", 
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "6"], "]"}]}], " ", 
RowBox[{"(", 
RowBox[{
RowBox[{
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "5"], "]"}], " ", 
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "1"], "]"}]}], "+", 
RowBox[{
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "1"], "]"}], " ", 
RowBox[{"Cos", "[", 
RowBox[{
SubscriptBox["\[Theta]", "2"], "+", 
SubscriptBox["\[Theta]", "3"], "+", 
SubscriptBox["\[Theta]", "4"]}], "]"}], " ", 
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "5"], "]"}]}]}], ")"}]}], "+", 
RowBox[{
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "1"], "]"}], " ", 
RowBox[{"Sin", "[", 
RowBox[{
SubscriptBox["\[Theta]", "2"], "+", 
SubscriptBox["\[Theta]", "3"], "+", 
SubscriptBox["\[Theta]", "4"]}], "]"}], " ", 
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "6"], "]"}]}]}], 
RowBox[{
RowBox[{
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "5"], "]"}], " ", 
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "1"], "]"}], " ", 
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "6"], "]"}]}], "+", 
RowBox[{
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "1"], "]"}], " ", 
RowBox[{"(", 
RowBox[{
RowBox[{
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "6"], "]"}], " ", 
RowBox[{"Sin", "[", 
RowBox[{
SubscriptBox["\[Theta]", "2"], "+", 
SubscriptBox["\[Theta]", "3"], "+", 
SubscriptBox["\[Theta]", "4"]}], "]"}]}], "+", 
RowBox[{
RowBox[{"Cos", "[", 
RowBox[{
SubscriptBox["\[Theta]", "2"], "+", 
SubscriptBox["\[Theta]", "3"], "+", 
SubscriptBox["\[Theta]", "4"]}], "]"}], " ", 
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "5"], "]"}], " ", 
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "6"], "]"}]}]}], ")"}]}]}], 
RowBox[{
RowBox[{
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "1"], "]"}], " ", 
RowBox[{"Cos", "[", 
RowBox[{
SubscriptBox["\[Theta]", "2"], "+", 
SubscriptBox["\[Theta]", "3"], "+", 
SubscriptBox["\[Theta]", "4"]}], "]"}], " ", 
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "5"], "]"}]}], "-", 
RowBox[{
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "1"], "]"}], " ", 
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "5"], "]"}]}]}], 
RowBox[{
RowBox[{
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "1"], "]"}], " ", 
RowBox[{"(", 
RowBox[{
RowBox[{"0.0855`", " ", 
RowBox[{"Cos", "[", 
RowBox[{
SubscriptBox["\[Theta]", "2"], "+", 
SubscriptBox["\[Theta]", "3"], "+", 
SubscriptBox["\[Theta]", "4"]}], "]"}], " ", 
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "5"], "]"}]}], "+", 
RowBox[{"0.185`", " ", 
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "2"], "]"}]}], "+", 
RowBox[{"0.17`", " ", 
RowBox[{"Sin", "[", 
RowBox[{
SubscriptBox["\[Theta]", "2"], "+", 
SubscriptBox["\[Theta]", "3"]}], "]"}]}], "+", 
RowBox[{"0.077`", " ", 
RowBox[{"Sin", "[", 
RowBox[{
SubscriptBox["\[Theta]", "2"], "+", 
SubscriptBox["\[Theta]", "3"], "+", 
SubscriptBox["\[Theta]", "4"]}], "]"}]}]}], ")"}]}], "+", 
RowBox[{
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "1"], "]"}], " ", 
RowBox[{"(", 
RowBox[{
RowBox[{"-", "0.023`"}], "-", 
RowBox[{"0.0855`", " ", 
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "5"], "]"}]}]}], ")"}]}]}]},
{
RowBox[{
RowBox[{
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "1"], "]"}], " ", 
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "5"], "]"}], " ", 
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "6"], "]"}]}], "+", 
RowBox[{
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "1"], "]"}], " ", 
RowBox[{"(", 
RowBox[{
RowBox[{
RowBox[{"-", 
RowBox[{"Cos", "[", 
RowBox[{
SubscriptBox["\[Theta]", "2"], "+", 
SubscriptBox["\[Theta]", "3"], "+", 
SubscriptBox["\[Theta]", "4"]}], "]"}]}], " ", 
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "6"], "]"}], " ", 
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "5"], "]"}]}], "+", 
RowBox[{
RowBox[{"Sin", "[", 
RowBox[{
SubscriptBox["\[Theta]", "2"], "+", 
SubscriptBox["\[Theta]", "3"], "+", 
SubscriptBox["\[Theta]", "4"]}], "]"}], " ", 
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "6"], "]"}]}]}], ")"}]}]}], 
RowBox[{
RowBox[{
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "6"], "]"}], " ", 
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "1"], "]"}], " ", 
RowBox[{"Sin", "[", 
RowBox[{
SubscriptBox["\[Theta]", "2"], "+", 
SubscriptBox["\[Theta]", "3"], "+", 
SubscriptBox["\[Theta]", "4"]}], "]"}]}], "+", 
RowBox[{
RowBox[{"(", 
RowBox[{
RowBox[{
RowBox[{"-", 
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "1"], "]"}]}], " ", 
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "5"], "]"}]}], "+", 
RowBox[{
RowBox[{"Cos", "[", 
RowBox[{
SubscriptBox["\[Theta]", "2"], "+", 
SubscriptBox["\[Theta]", "3"], "+", 
SubscriptBox["\[Theta]", "4"]}], "]"}], " ", 
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "1"], "]"}], " ", 
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "5"], "]"}]}]}], ")"}], " ", 
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "6"], "]"}]}]}], 
RowBox[{
RowBox[{
RowBox[{"Cos", "[", 
RowBox[{
SubscriptBox["\[Theta]", "2"], "+", 
SubscriptBox["\[Theta]", "3"], "+", 
SubscriptBox["\[Theta]", "4"]}], "]"}], " ", 
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "5"], "]"}], " ", 
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "1"], "]"}]}], "+", 
RowBox[{
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "1"], "]"}], " ", 
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "5"], "]"}]}]}], 
RowBox[{
RowBox[{
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "1"], "]"}], " ", 
RowBox[{"(", 
RowBox[{
RowBox[{"0.0855`", " ", 
RowBox[{"Cos", "[", 
RowBox[{
SubscriptBox["\[Theta]", "2"], "+", 
SubscriptBox["\[Theta]", "3"], "+", 
SubscriptBox["\[Theta]", "4"]}], "]"}], " ", 
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "5"], "]"}]}], "+", 
RowBox[{"0.185`", " ", 
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "2"], "]"}]}], "+", 
RowBox[{"0.17`", " ", 
RowBox[{"Sin", "[", 
RowBox[{
SubscriptBox["\[Theta]", "2"], "+", 
SubscriptBox["\[Theta]", "3"]}], "]"}]}], "+", 
RowBox[{"0.077`", " ", 
RowBox[{"Sin", "[", 
RowBox[{
SubscriptBox["\[Theta]", "2"], "+", 
SubscriptBox["\[Theta]", "3"], "+", 
SubscriptBox["\[Theta]", "4"]}], "]"}]}]}], ")"}]}], "+", 
RowBox[{
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "1"], "]"}], " ", 
RowBox[{"(", 
RowBox[{"0.023`", " ", "+", 
RowBox[{"0.0855`", " ", 
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "5"], "]"}]}]}], ")"}]}]}]},
{
RowBox[{
RowBox[{
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "6"], "]"}], " ", 
RowBox[{"Sin", "[", 
RowBox[{
SubscriptBox["\[Theta]", "2"], "+", 
SubscriptBox["\[Theta]", "3"], "+", 
SubscriptBox["\[Theta]", "4"]}], "]"}], " ", 
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "5"], "]"}]}], "+", 
RowBox[{
RowBox[{"Cos", "[", 
RowBox[{
SubscriptBox["\[Theta]", "2"], "+", 
SubscriptBox["\[Theta]", "3"], "+", 
SubscriptBox["\[Theta]", "4"]}], "]"}], " ", 
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "6"], "]"}]}]}], 
RowBox[{
RowBox[{
RowBox[{"Cos", "[", 
RowBox[{
SubscriptBox["\[Theta]", "2"], "+", 
SubscriptBox["\[Theta]", "3"], "+", 
SubscriptBox["\[Theta]", "4"]}], "]"}], " ", 
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "6"], "]"}]}], "-", 
RowBox[{
RowBox[{"Sin", "[", 
RowBox[{
SubscriptBox["\[Theta]", "2"], "+", 
SubscriptBox["\[Theta]", "3"], "+", 
SubscriptBox["\[Theta]", "4"]}], "]"}], " ", 
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "5"], "]"}], " ", 
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "6"], "]"}]}]}], 
RowBox[{
RowBox[{"-", 
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "5"], "]"}]}], " ", 
RowBox[{"Sin", "[", 
RowBox[{
SubscriptBox["\[Theta]", "2"], "+", 
SubscriptBox["\[Theta]", "3"], "+", 
SubscriptBox["\[Theta]", "4"]}], "]"}]}], 
RowBox[{"0.23000000000000004`", " ", "+", 
RowBox[{"0.185`", " ", 
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "2"], "]"}]}], "+", 
RowBox[{"0.17`", " ", 
RowBox[{"Cos", "[", 
RowBox[{
SubscriptBox["\[Theta]", "2"], "+", 
SubscriptBox["\[Theta]", "3"]}], "]"}]}], "+", 
RowBox[{"0.077`", " ", 
RowBox[{"Cos", "[", 
RowBox[{
SubscriptBox["\[Theta]", "2"], "+", 
SubscriptBox["\[Theta]", "3"], "+", 
SubscriptBox["\[Theta]", "4"]}], "]"}]}], "-", 
RowBox[{"0.0855`", " ", 
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "5"], "]"}], " ", 
RowBox[{"Sin", "[", 
RowBox[{
SubscriptBox["\[Theta]", "2"], "+", 
SubscriptBox["\[Theta]", "3"], "+", 
SubscriptBox["\[Theta]", "4"]}], "]"}]}]}]},
{"0.`", "0.`", "0.`", "1.`"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
Subscript[\[Theta], 1]=\[Theta][[1]];Subscript[\[Theta], 2]=\[Theta][[2]];Subscript[\[Theta], 3]=\[Theta][[3]];Subscript[\[Theta], 4]=\[Theta][[4]];Subscript[\[Theta], 5]=\[Theta][[5]];Subscript[\[Theta], 6]=\[Theta][[6]];eulerAngles=EulerAngles[T[[1;;3,1;;3]],{1,2,3}];
N[{T[[1,4]],T[[2,4]],T[[3,4]],eulerAngles[[1]],eulerAngles[[2]],eulerAngles[[3]]}]);


ForwardKinematicsTZJU[\[Theta]_]:=(
T=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{
RowBox[{
RowBox[{"-", 
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "6"], "]"}]}], " ", 
RowBox[{"(", 
RowBox[{
RowBox[{
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "5"], "]"}], " ", 
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "1"], "]"}]}], "+", 
RowBox[{
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "1"], "]"}], " ", 
RowBox[{"Cos", "[", 
RowBox[{
SubscriptBox["\[Theta]", "2"], "+", 
SubscriptBox["\[Theta]", "3"], "+", 
SubscriptBox["\[Theta]", "4"]}], "]"}], " ", 
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "5"], "]"}]}]}], ")"}]}], "+", 
RowBox[{
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "1"], "]"}], " ", 
RowBox[{"Sin", "[", 
RowBox[{
SubscriptBox["\[Theta]", "2"], "+", 
SubscriptBox["\[Theta]", "3"], "+", 
SubscriptBox["\[Theta]", "4"]}], "]"}], " ", 
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "6"], "]"}]}]}], 
RowBox[{
RowBox[{
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "5"], "]"}], " ", 
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "1"], "]"}], " ", 
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "6"], "]"}]}], "+", 
RowBox[{
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "1"], "]"}], " ", 
RowBox[{"(", 
RowBox[{
RowBox[{
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "6"], "]"}], " ", 
RowBox[{"Sin", "[", 
RowBox[{
SubscriptBox["\[Theta]", "2"], "+", 
SubscriptBox["\[Theta]", "3"], "+", 
SubscriptBox["\[Theta]", "4"]}], "]"}]}], "+", 
RowBox[{
RowBox[{"Cos", "[", 
RowBox[{
SubscriptBox["\[Theta]", "2"], "+", 
SubscriptBox["\[Theta]", "3"], "+", 
SubscriptBox["\[Theta]", "4"]}], "]"}], " ", 
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "5"], "]"}], " ", 
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "6"], "]"}]}]}], ")"}]}]}], 
RowBox[{
RowBox[{
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "1"], "]"}], " ", 
RowBox[{"Cos", "[", 
RowBox[{
SubscriptBox["\[Theta]", "2"], "+", 
SubscriptBox["\[Theta]", "3"], "+", 
SubscriptBox["\[Theta]", "4"]}], "]"}], " ", 
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "5"], "]"}]}], "-", 
RowBox[{
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "1"], "]"}], " ", 
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "5"], "]"}]}]}], 
RowBox[{
RowBox[{
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "1"], "]"}], " ", 
RowBox[{"(", 
RowBox[{
RowBox[{"0.0855`", " ", 
RowBox[{"Cos", "[", 
RowBox[{
SubscriptBox["\[Theta]", "2"], "+", 
SubscriptBox["\[Theta]", "3"], "+", 
SubscriptBox["\[Theta]", "4"]}], "]"}], " ", 
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "5"], "]"}]}], "+", 
RowBox[{"0.185`", " ", 
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "2"], "]"}]}], "+", 
RowBox[{"0.17`", " ", 
RowBox[{"Sin", "[", 
RowBox[{
SubscriptBox["\[Theta]", "2"], "+", 
SubscriptBox["\[Theta]", "3"]}], "]"}]}], "+", 
RowBox[{"0.077`", " ", 
RowBox[{"Sin", "[", 
RowBox[{
SubscriptBox["\[Theta]", "2"], "+", 
SubscriptBox["\[Theta]", "3"], "+", 
SubscriptBox["\[Theta]", "4"]}], "]"}]}]}], ")"}]}], "+", 
RowBox[{
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "1"], "]"}], " ", 
RowBox[{"(", 
RowBox[{
RowBox[{"-", "0.023`"}], "-", 
RowBox[{"0.0855`", " ", 
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "5"], "]"}]}]}], ")"}]}]}]},
{
RowBox[{
RowBox[{
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "1"], "]"}], " ", 
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "5"], "]"}], " ", 
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "6"], "]"}]}], "+", 
RowBox[{
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "1"], "]"}], " ", 
RowBox[{"(", 
RowBox[{
RowBox[{
RowBox[{"-", 
RowBox[{"Cos", "[", 
RowBox[{
SubscriptBox["\[Theta]", "2"], "+", 
SubscriptBox["\[Theta]", "3"], "+", 
SubscriptBox["\[Theta]", "4"]}], "]"}]}], " ", 
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "6"], "]"}], " ", 
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "5"], "]"}]}], "+", 
RowBox[{
RowBox[{"Sin", "[", 
RowBox[{
SubscriptBox["\[Theta]", "2"], "+", 
SubscriptBox["\[Theta]", "3"], "+", 
SubscriptBox["\[Theta]", "4"]}], "]"}], " ", 
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "6"], "]"}]}]}], ")"}]}]}], 
RowBox[{
RowBox[{
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "6"], "]"}], " ", 
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "1"], "]"}], " ", 
RowBox[{"Sin", "[", 
RowBox[{
SubscriptBox["\[Theta]", "2"], "+", 
SubscriptBox["\[Theta]", "3"], "+", 
SubscriptBox["\[Theta]", "4"]}], "]"}]}], "+", 
RowBox[{
RowBox[{"(", 
RowBox[{
RowBox[{
RowBox[{"-", 
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "1"], "]"}]}], " ", 
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "5"], "]"}]}], "+", 
RowBox[{
RowBox[{"Cos", "[", 
RowBox[{
SubscriptBox["\[Theta]", "2"], "+", 
SubscriptBox["\[Theta]", "3"], "+", 
SubscriptBox["\[Theta]", "4"]}], "]"}], " ", 
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "1"], "]"}], " ", 
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "5"], "]"}]}]}], ")"}], " ", 
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "6"], "]"}]}]}], 
RowBox[{
RowBox[{
RowBox[{"Cos", "[", 
RowBox[{
SubscriptBox["\[Theta]", "2"], "+", 
SubscriptBox["\[Theta]", "3"], "+", 
SubscriptBox["\[Theta]", "4"]}], "]"}], " ", 
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "5"], "]"}], " ", 
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "1"], "]"}]}], "+", 
RowBox[{
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "1"], "]"}], " ", 
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "5"], "]"}]}]}], 
RowBox[{
RowBox[{
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "1"], "]"}], " ", 
RowBox[{"(", 
RowBox[{
RowBox[{"0.0855`", " ", 
RowBox[{"Cos", "[", 
RowBox[{
SubscriptBox["\[Theta]", "2"], "+", 
SubscriptBox["\[Theta]", "3"], "+", 
SubscriptBox["\[Theta]", "4"]}], "]"}], " ", 
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "5"], "]"}]}], "+", 
RowBox[{"0.185`", " ", 
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "2"], "]"}]}], "+", 
RowBox[{"0.17`", " ", 
RowBox[{"Sin", "[", 
RowBox[{
SubscriptBox["\[Theta]", "2"], "+", 
SubscriptBox["\[Theta]", "3"]}], "]"}]}], "+", 
RowBox[{"0.077`", " ", 
RowBox[{"Sin", "[", 
RowBox[{
SubscriptBox["\[Theta]", "2"], "+", 
SubscriptBox["\[Theta]", "3"], "+", 
SubscriptBox["\[Theta]", "4"]}], "]"}]}]}], ")"}]}], "+", 
RowBox[{
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "1"], "]"}], " ", 
RowBox[{"(", 
RowBox[{"0.023`", " ", "+", 
RowBox[{"0.0855`", " ", 
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "5"], "]"}]}]}], ")"}]}]}]},
{
RowBox[{
RowBox[{
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "6"], "]"}], " ", 
RowBox[{"Sin", "[", 
RowBox[{
SubscriptBox["\[Theta]", "2"], "+", 
SubscriptBox["\[Theta]", "3"], "+", 
SubscriptBox["\[Theta]", "4"]}], "]"}], " ", 
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "5"], "]"}]}], "+", 
RowBox[{
RowBox[{"Cos", "[", 
RowBox[{
SubscriptBox["\[Theta]", "2"], "+", 
SubscriptBox["\[Theta]", "3"], "+", 
SubscriptBox["\[Theta]", "4"]}], "]"}], " ", 
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "6"], "]"}]}]}], 
RowBox[{
RowBox[{
RowBox[{"Cos", "[", 
RowBox[{
SubscriptBox["\[Theta]", "2"], "+", 
SubscriptBox["\[Theta]", "3"], "+", 
SubscriptBox["\[Theta]", "4"]}], "]"}], " ", 
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "6"], "]"}]}], "-", 
RowBox[{
RowBox[{"Sin", "[", 
RowBox[{
SubscriptBox["\[Theta]", "2"], "+", 
SubscriptBox["\[Theta]", "3"], "+", 
SubscriptBox["\[Theta]", "4"]}], "]"}], " ", 
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "5"], "]"}], " ", 
RowBox[{"Sin", "[", 
SubscriptBox["\[Theta]", "6"], "]"}]}]}], 
RowBox[{
RowBox[{"-", 
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "5"], "]"}]}], " ", 
RowBox[{"Sin", "[", 
RowBox[{
SubscriptBox["\[Theta]", "2"], "+", 
SubscriptBox["\[Theta]", "3"], "+", 
SubscriptBox["\[Theta]", "4"]}], "]"}]}], 
RowBox[{"0.23000000000000004`", " ", "+", 
RowBox[{"0.185`", " ", 
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "2"], "]"}]}], "+", 
RowBox[{"0.17`", " ", 
RowBox[{"Cos", "[", 
RowBox[{
SubscriptBox["\[Theta]", "2"], "+", 
SubscriptBox["\[Theta]", "3"]}], "]"}]}], "+", 
RowBox[{"0.077`", " ", 
RowBox[{"Cos", "[", 
RowBox[{
SubscriptBox["\[Theta]", "2"], "+", 
SubscriptBox["\[Theta]", "3"], "+", 
SubscriptBox["\[Theta]", "4"]}], "]"}]}], "-", 
RowBox[{"0.0855`", " ", 
RowBox[{"Cos", "[", 
SubscriptBox["\[Theta]", "5"], "]"}], " ", 
RowBox[{"Sin", "[", 
RowBox[{
SubscriptBox["\[Theta]", "2"], "+", 
SubscriptBox["\[Theta]", "3"], "+", 
SubscriptBox["\[Theta]", "4"]}], "]"}]}]}]},
{"0.`", "0.`", "0.`", "1.`"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
Subscript[\[Theta], 1]=\[Theta][[1]];Subscript[\[Theta], 2]=\[Theta][[2]];Subscript[\[Theta], 3]=\[Theta][[3]];Subscript[\[Theta], 4]=\[Theta][[4]];Subscript[\[Theta], 5]=\[Theta][[5]];Subscript[\[Theta], 6]=\[Theta][[6]];
T);


GetT[val_] :=
    (
        R = EulerMatrix[{val[[4]], val[[5]], val[[6]]}, {1, 2, 3}];
        ({{R[[1, 1]], R[[1, 2]], R[[1, 3]], val[[1]]}, {R[[2, 1]], R[[
            2, 2]], R[[2, 3]], val[[2]]}, {R[[3, 1]], R[[3, 2]], R[[3, 3]], val[[
            3]]}, {0, 0, 0, 1}})
    );


GetTheta1[T_] :=
    (
        m = T[[2, 4]] - 0.0855 * T[[2, 3]];
        n = 0.0855 * T[[1, 3]] - T[[1, 4]];
        {ArcTan[m, n] + ArcTan[0.023, Sqrt[m^2 + n^2 - 0.023^2]], ArcTan[
            m, n] - ArcTan[0.023, Sqrt[m^2 + n^2 - 0.023^2]]}
    );


GetTheta1And5[T_] :=
    (
        theta1List = GetTheta1[T];
        {{theta1List[[1]], ArcSin[-T[[1, 3]] * Sin[theta1List[[1]]] +
             T[[2, 3]] * Cos[theta1List[[1]]]]}, {theta1List[[1]], \[Pi] - ArcSin[-T[[
            1, 3]] * Sin[theta1List[[1]]] + T[[2, 3]] * Cos[theta1List[[1]]]]}, {
            theta1List[[2]], ArcSin[-T[[1, 3]] * Sin[theta1List[[2]]] + T[[2, 3]]
             * Cos[theta1List[[2]]]]}, {theta1List[[2]], \[Pi] - ArcSin[-T[[1, 3]] * 
            Sin[theta1List[[2]]] + T[[2, 3]] * Cos[theta1List[[2]]]]}}
    );


GetTheta1And5And6[T_] :=
    (
        theta1And5List = GetTheta1And5[T];
        len = Length[theta1And5List];
        For[i = 1, i <= len, i++,
            Subscript[\[Theta], 1] = theta1And5List[[i, 1]];
            Subscript[\[Theta], 5] = theta1And5List[[i, 2]];
            m = T[[2, 1]] * Cos[Subscript[\[Theta], 1]] - T[[1, 1]] * Sin[Subscript[
                \[Theta], 1]];
            n = -(T[[1, 2]] * Sin[Subscript[\[Theta], 1]] - T[[2, 2]] * Cos[
                Subscript[\[Theta], 1]]);
            AppendTo[theta1And5List[[i]], ArcTan[n, m] - ArcTan[0, Cos[
                Subscript[\[Theta], 5]]]]
        ];
        theta1And5List
    );


GetTheta1And5And6And3[T_] :=
    (
        theta1And5And6List = GetTheta1And5And6[T];
        len = Length[theta1And5And6List];
        res = {};
        For[i = 1, i <= len, i++,
            Subscript[\[Theta], 1] = theta1And5And6List[[i, 1]];
            Subscript[\[Theta], 5] = theta1And5And6List[[i, 2]];
            Subscript[\[Theta], 6] = theta1And5And6List[[i, 3]];
            m = T[[1, 4]] * Cos[Subscript[\[Theta], 1]] + T[[2, 4]] * Sin[Subscript[
                \[Theta], 1]] - 0.0855 * (T[[1, 3]] * Cos[Subscript[\[Theta], 1]] + T[[2, 3]] * Sin[
                Subscript[\[Theta], 1]]) - 0.077 * (Cos[Subscript[\[Theta], 6]] * (T[[1, 2]] * Cos[
                Subscript[\[Theta], 1]] + T[[2, 2]] * Sin[Subscript[\[Theta], 1]]) + Sin[Subscript[
                \[Theta], 6]] * (T[[1, 1]] * Cos[Subscript[\[Theta], 1]] + T[[2, 1]] * Sin[Subscript[
                \[Theta], 1]]));
            n = -0.23 - 0.0855 * T[[3, 3]] + T[[3, 4]] - 0.077 * (T[[
                3, 2]] * Cos[Subscript[\[Theta], 6]] + T[[3, 1]] * Sin[Subscript[\[Theta], 6]]);
            If[Abs[(m^2 + n^2 - 0.185^2 - 0.17^2) / (2 * 0.185 * 0.17
                )] <= 1,
                AppendTo[res, {Subscript[\[Theta], 1], Subscript[\[Theta], 5], Subscript[
                    \[Theta], 6], ArcCos[(m^2 + n^2 - 0.185^2 - 0.17^2) / (2 * 0.185 * 0.17)]}];
                    
                AppendTo[res, {Subscript[\[Theta], 1], Subscript[\[Theta], 5], Subscript[
                    \[Theta], 6], -ArcCos[(m^2 + n^2 - 0.185^2 - 0.17^2) / (2 * 0.185 * 0.17)]}]
                    
                ,
                Continue
            ];
        ];
        res
    );


GetTheta1And5And6And3And2[T_] :=
    (
        theta1And5And6And3List = GetTheta1And5And6And3[T];
        len = Length[theta1And5And6And3List];
        For[i = 1, i <= len, i++,
            Subscript[\[Theta], 1] = theta1And5And6And3List[[i, 1]];
            Subscript[\[Theta], 5] = theta1And5And6And3List[[i, 2]];
            Subscript[\[Theta], 6] = theta1And5And6And3List[[i, 3]];
            Subscript[\[Theta], 3] = theta1And5And6And3List[[i, 4]];
            m = T[[1, 4]] * Cos[Subscript[\[Theta], 1]] + T[[2, 4]] * Sin[Subscript[
                \[Theta], 1]] - 0.0855 * (T[[1, 3]] * Cos[Subscript[\[Theta], 1]] + T[[2, 3]] * Sin[
                Subscript[\[Theta], 1]]) - 0.077 * (Cos[Subscript[\[Theta], 6]] * (T[[1, 2]] * Cos[
                Subscript[\[Theta], 1]] + T[[2, 2]] * Sin[Subscript[\[Theta], 1]]) + Sin[Subscript[
                \[Theta], 6]] * (T[[1, 1]] * Cos[Subscript[\[Theta], 1]] + T[[2, 1]] * Sin[Subscript[
                \[Theta], 1]]));
            n = -0.23 - 0.0855 * T[[3, 3]] + T[[3, 4]] - 0.077 * (T[[
                3, 2]] * Cos[Subscript[\[Theta], 6]] + T[[3, 1]] * Sin[Subscript[\[Theta], 6]]);
            s = ((0.17 Cos[Subscript[\[Theta], 3]] + 0.185) * m - 0.17 * n *
                 Sin[Subscript[\[Theta], 3]]) / (0.185^2 + 0.17^2 + 2 * 0.185 * 0.17 * Cos[Subscript[
                \[Theta], 3]]);
            c = (n + 0.17 * s * Sin[Subscript[\[Theta], 3]]) / (0.17 * Cos[Subscript[
                \[Theta], 3]] + 0.185);
            AppendTo[theta1And5And6And3List[[i]], ArcTan[c, s]]
        ];
        theta1And5And6And3List
    );


GetTheta1And5And6And3And2And4[T_] :=
    (
        theta1And5And6And3And2List = GetTheta1And5And6And3And2[T];
        len = Length[theta1And5And6And3And2List];
        For[i = 1, i <= len, i++,
            Subscript[\[Theta], 1] = theta1And5And6And3And2List[[i, 1]];
            Subscript[\[Theta], 5] = theta1And5And6And3And2List[[i, 2]];
            Subscript[\[Theta], 6] = theta1And5And6And3And2List[[i, 3]];
            Subscript[\[Theta], 3] = theta1And5And6And3And2List[[i, 4]];
            Subscript[\[Theta], 2] = theta1And5And6And3And2List[[i, 5]];
            s = Cos[Subscript[\[Theta], 6]] * (T[[1, 2]] * Cos[Subscript[\[Theta], 
                1]] + T[[2, 2]] * Sin[Subscript[\[Theta], 1]]) + Sin[Subscript[\[Theta], 6]] * (T[[
                1, 1]] * Cos[Subscript[\[Theta], 1]] + T[[2, 1]] * Sin[Subscript[\[Theta], 1]]);
            c = T[[3, 2]] * Cos[Subscript[\[Theta], 6]] + T[[3, 1]] * Sin[Subscript[
                \[Theta], 6]];
            AppendTo[theta1And5And6And3And2List[[i]], ArcTan[c, s] - 
                Subscript[\[Theta], 2] - Subscript[\[Theta], 3]]
        ];
        theta1And5And6And3And2List
    );


GetTheta1And2And3And4And5And6[T_] :=
    (
        res = GetTheta1And5And6And3And2And4[T];
        len = Length[res];
        output = {};
        For[i = 1, i <= len, i++,
            AppendTo[output, {res[[i]][[1]], res[[i]][[5]], res[[i]][[
                4]], res[[i]][[6]], res[[i]][[2]], res[[i]][[3]]}]
        ];
        output
    );


BackwardKinematicsZJU[val_] :=
    (
        T = GetT[val];
        res = GetTheta1And2And3And4And5And6[T];
        output = {};
        len = Length[res];
        For[i = 1, i <= len, i++,
            For[j = 1, j <= 6, j++,
                If[res[[i, j]] > \[Pi],
                    res[[i, j]] -= 2 \[Pi]
                    ,
                    If[res[[i, j]] < -\[Pi],
                        res[[i, j]] += 2 \[Pi]
                    ]
                ]
            ]
        ];
        For[i = 1, i <= len, i++,
            If[Abs[res[[i,1]]]<=(5\[Pi])/6 && Abs[res[[i,2]]]<=\[Pi]/2 && Abs[res[[i,3]]]<=(2\[Pi])/3 && Abs[res[[i,4]]]<=(5\[Pi])/6 && Abs[res[[i,5]]]<=(5\[Pi])/6 && Abs[res[[i,6]]]<=\[Pi], AppendTo[output,res[[i]]]]
        ];
        output
    );


EndPackage[];
