--Sat�r Say�s� Ekleme ve S�ralama -- OVER(SIRALAMA BAZ ALINICAK ALAN),ROW NUMBER()
--Row number bir sql c�mlesi sonucu d�nen kay�t listesinde s�ralama kolonu yapmak i�in kullan�l�r. 
select *,ROW_NUMBER() over (order by TabloID) as SatirSayisi from GIYOTINTable

--RANK()  RANK fonksiyonun ROW_NUMBER fonksiyonundan tek fark� ayn� de�erli kay�tlara ayn� s�ra numaras�n� vermesidir
select *,RANK() over(order by OgrenciID) as Ogrenci from GIYOTINTable

--E�er numaralar�n kald��� yerden devam edilmesi isteniyorsa bu durumda DENSE_RANK fonksiyonu kullan�lmal�d�r.
select *,DENSE_RANK() over(order by OgrenciID) as Ogrenci from GIYOTINTable

--NTILE fonksiyonu ile verilen numara son kayd�n s�ra numaras� olmak kayd�yla s�raland�rma yap�l�r. 
select *,NTILE(2) over (order by TabloID) as ID from GIYOTINTable

--Ranking fonksiyonlar�nda her grubu kendi i�inde numaraland�rmak istersek PARTITION BY kullanabiliriz
select *,ROW_NUMBER() over (PARTITION BY OgrenciID order by TabloID) as ID from GIYOTINTable