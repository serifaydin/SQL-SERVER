--Satýr Sayýsý Ekleme ve Sýralama -- OVER(SIRALAMA BAZ ALINICAK ALAN),ROW NUMBER()
--Row number bir sql cümlesi sonucu dönen kayýt listesinde sýralama kolonu yapmak için kullanýlýr. 
select *,ROW_NUMBER() over (order by TabloID) as SatirSayisi from GIYOTINTable

--RANK()  RANK fonksiyonun ROW_NUMBER fonksiyonundan tek farký ayný deðerli kayýtlara ayný sýra numarasýný vermesidir
select *,RANK() over(order by OgrenciID) as Ogrenci from GIYOTINTable

--Eðer numaralarýn kaldýðý yerden devam edilmesi isteniyorsa bu durumda DENSE_RANK fonksiyonu kullanýlmalýdýr.
select *,DENSE_RANK() over(order by OgrenciID) as Ogrenci from GIYOTINTable

--NTILE fonksiyonu ile verilen numara son kaydýn sýra numarasý olmak kaydýyla sýralandýrma yapýlýr. 
select *,NTILE(2) over (order by TabloID) as ID from GIYOTINTable

--Ranking fonksiyonlarýnda her grubu kendi içinde numaralandýrmak istersek PARTITION BY kullanabiliriz
select *,ROW_NUMBER() over (PARTITION BY OgrenciID order by TabloID) as ID from GIYOTINTable