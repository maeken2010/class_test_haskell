
--2014/09/09
--Haskellの型システムのお勉強．
--型クラス難しい

--味の型を定義．数値で表現．
data Flavor = Flavor { sweet::Int
                     ,saltiness::Int
                     ,acidity::Int
                     ,bitter::Int
                     ,umami::Int
                     }

--型クラス．とりあえずなんかを比較します
class Taste a where
  sweetTaste:: a -> a -> Ordering

--instance．TasteをFlavor型に対して定義．sweetの値を比較します
instance Taste Flavor where
  a `sweetTaste` b
    | (sweet a) > (sweet b) = GT
    | (sweet a) < (sweet b) = LT
    |otherwise = EQ

--でもこれぐらいだったら関数で済むよね！
sweetTaste :: Flavor -> Flavor -> Ordering
sweetTaste a b
  | (sweet a) > (sweet b) = GT
  | (sweet a) < (sweet b) = LT
  | otherwise = EQ

--テスト用の値
testa = Flavor {sweet=10,saltiness=4,acidity=7,bitter=2,umami=1}
testb = Flavor {sweet=5,saltiness=2,acidity=1,bitter=3,umami=10}
