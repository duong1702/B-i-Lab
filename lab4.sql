--bài 1
select iif(LUONG>=ltb, 'Khong tăng lương','tang luong')
as THUONG,TENNV,LUONG,ltb
from
(select TENNV,LUONG,ltb from NHANVIEN,
(select PHG,AVG(LUONG) AS 'ltb' from NHANVIEN group by PHG) AS temp
where NHANVIEN.PHG=temp.PHG) as abc

select * from NHANVIEN
select PHG,AVG(LUONG) AS 'ltb' from NHANVIEN group by PHG

------------------------------------------------------------

declare @tbThongKe table(MaPB int, ltb float)

insert into @tbThongKe
	select PHG, AVG(Luong) from NHANVIEN group by PHG

select * from @tbThongKe

select TENNV,PHG, LUONG, ltb, 
TinhTrang = case
when LUONG > ltb then 'Truong Phong'
else 'Nhan VIen'
end
	from NHANVIEN a 
inner join @tbThongKe b
on a.PHG = b.MaPB

--Viết chương trình hiển thị tenNV như hình 
select TENNV = case Phai
when 'nam' then 'Mr. ' + [TENNV]
--when 'nu' then 'Ms. ' + [TENNV]
else 'Ms. ' + [TENNV]
end
from NHANVIEN

select TENNV,LUONG,THUE=CASE
WHEN LUONG BETWEEN 0 AND 25000 THEN LUONG*0.1
WHEN LUONG BETWEEN 25000 AND 30000 THEN LUONG*0.12
WHEN LUONG BETWEEN 30000 AND 40000 THEN LUONG*0.15
WHEN LUONG BETWEEN 40000 AND 50000 THEN LUONG*0.2
ELSE LUONG*0.25
END
FROM NHANVIEN

--BÀI 2
--SELECT * FROM NHANVIEN
declare @dem int=2;
while @dem<(select count(MANV) FROM NHANVIEN)
    begin
	    select*from NHANVIEN where cast(MANV as int)=@dem
		set @dem=@dem+2;
	end

--bài 3a
begin try
     insert into PHONGBAN(TENPHG, MAPHG,TRPHG, NG_NHANCHUC) VALUES ('Nhân sự', 7, '009', '2020-02-09' )
	 print 'them du lieu thanh cong'
end try

begin catch
     print 'insert that bai'
end catch

begin try
     declare @chia int;
	 set @chia = 55 / 0;
end try
 --bài 3b
begin catch
      declare @ErrorMessage nvarchar(2048), @ErrorSeverity int, @ErrorState int;

	 select @ErrorMessage = ERROR_MESSAGE(),
	        @ErrorSeverity = ERROR_SEVERITY(),
			@ErrorState = ERROR_STATE();
	 Raiserror (@ErrorMessage, @ErrorSeverity, @ErrorState );
end catch;