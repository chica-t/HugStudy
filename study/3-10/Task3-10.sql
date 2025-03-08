/* ■ [回答]と記載のある箇所へ、1〜8の各課題内容に沿ったSQL文を記述しなさい。 */

-- 1. Staffテーブルから「経理部」に所属する社員の情報をすべて抽出してください。

SELECT * FROM staff WHERE section = '経理部';

-- 2. 在庫(Stocksテーブル)の在庫数(Quantity)が10以上25未満のものを抽出して下さい。

SELECT quantity FROM stocks WHERE quantity BETWEEN 10 AND 24;

-- 3. INTERSECT演算子を使用して、Order_Headerテーブルで合計値(Total)が5000以上10000未満のものを抽出して下さい。

SELECT total FROM order_header WHERE  total >= 5000
INTERSECT 
SELECT total FROM order_header WHERE  total < 10000;

-- 4. 「関東」エリアの全店舗情報を抽出して下さい。

SELECT * FROM shop WHERE areacode = '04';

-- 5. 在庫(Stocksテーブル)内の各商品の合計数量を抽出して下さい。

SELECT quantity,SUM(quantity) FROM stocks GROUP BY goodscode;

-- 6. 商品（Gods）テーブルから単価（UnitPrice)が5000円より高い商品の情報を全て抽出して下さい。

SELECT * FROM goods WHERE unitprice > 5000;

-- 7. Shopテーブルの全ての店舗コード（Shopcode）、店舗名（Shopname）を、所在地（areaname）とあわせて抽出してください。

SELECT TBL1.shopcode,TBL1.shopname,TBL2.areaname FROM shop TBL1,area TBL2
LEFT JOIN areaname ON TBL1.areacode = TBL2.areacode;


-- 8. 「新宿」店の在庫数が10以上の商品の商品コード（GoodsCode）、商品名（GoodsName）、在庫数（quantity）を抽出して下さい。

SELECT TBL1.goodscode,TBL1.goodsname,TBL2.quantity FROM goods TBL1
JOIN stocks TBL2 ON TBL1.shopcode = TBL2.shopcode AND shopcode = '001';