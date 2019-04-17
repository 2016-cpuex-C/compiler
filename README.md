# compiler

大学のCPU実験という講義で作成したコンパイラです．
[MinCaml](http://esumii.github.io/min-caml/)というOCamlのサブセットで書かれたプログラムをMipsライクなアセンブリにコンパイルします．
アセンブリの命令については[こちら](https://gist.github.com/Hogeyama/4ada42c79d37c908f6d7e2a95bf531a6)にありますが，チーム内部向けに書かれており不親切です．


## CPU実験について

4人チームで半年間かけてFPGA上で課題のレイトレーシングプログラムを動かす実験型講義です．
コンパイラ部分については全面的にHogeyamaが担当しました．

## 特徴

+ Haskell製（スクラッチ，本家MinCamlはOCaml製）
+ 途中でLLVM IRに変換してLLVMの最適化の恩恵を受けている
+ [グラフ彩色問題に帰着させる高度なレジスタ割当てのアルゴリズム](https://link.springer.com/chapter/10.1007/11688839_20)を実装
