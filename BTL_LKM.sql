CREATE DATABASE BTL_PTTM
GO 
USE BTL_PTTM
GO

-- tạo bảng loại hàng 
CREATE TABLE tbl_LoaiHang (
    MaLoaiHang char(10) PRIMARY KEY not null,
    TenLoaiHang VARCHAR(50) not null, 
);
GO
-- tạo bảng hàng hóa 
CREATE TABLE tbl_HangHoa (
    MaHang char(10) CONSTRAINT PK_MH PRIMARY KEY (MaHang) not null,
    TenHang NVARCHAR(50) null,
    MaLoaiHang char(10) not null,
    SoLuong INT not null,
    DonGiaNhap FLOAT not null,
	DonGiaBan float not null,
	MoTa VARCHAR(100)not null
    FOREIGN KEY (MaLoaiHang) REFERENCES tbl_LoaiHang(MaLoaiHang) on delete cascade on update cascade,
);
GO
-- tạo bảng nhân viên 
CREATE TABLE tbl_NhanVien (
    MaNhanVien char(10) not null CONSTRAINT PK_MNV PRIMARY KEY (MaNhanVien),
    TenNhanVien NVARCHAR(50) not null,
	GioiTinh NVARCHAR(10),
    DiaChi VARCHAR(100) not null,
    SoDienThoai VARCHAR(15) not null ,
	Email char(30) not null,
    NgaySinh DATE not null,
);
GO
CREATE TABLE LoaiTaiKhoan (
    LoaiTaiKhoanID int PRIMARY KEY,
    TenLoaiTaiKhoan nvarchar(50)
);

-- Tạo bảng tbl_TaiKhoan với khóa ngoại trỏ đến LoaiTaiKhoan
CREATE TABLE tbl_TaiKhoan (
    MaTaiKhoan int PRIMARY KEY,
    LoaiTaiKhoanID int, -- Khóa ngoại trỏ đến LoaiTaiKhoan
    TenTaiKhoan nvarchar(50),
    Matkhau nvarchar(50),
    Email nvarchar(50),  
    FOREIGN KEY (LoaiTaiKhoanID) REFERENCES LoaiTaiKhoan (LoaiTaiKhoanID)
);

-- Tạo bảng ChiTietTaiKhoan để lưu thông tin chi tiết về tài khoản
CREATE TABLE ChiTietTaiKhoan (
    MaChiTietTaiKhoan int PRIMARY KEY,
    MaTaiKhoan int, -- Khóa ngoại trỏ đến MaTaiKhoan trong tbl_TaiKhoan
    HoTen nvarchar(100),
    DiaChi nvarchar(200),
    SoDienThoai nvarchar(20),
    
    FOREIGN KEY (MaTaiKhoan) REFERENCES tbl_TaiKhoan (MaTaiKhoan)
);


-- tạo bảng khách hàng 
CREATE TABLE tbl_KhachHang (
    MaKhachHang char(10) CONSTRAINT PK_MKH PRIMARY KEY (MaKhachHang) not null,
    TenKhachHang NVARCHAR(50) null,	
	GioiTinh NVARCHAR(10) not null,
    DiaChi VARCHAR(100) not null,
    SoDienThoai VARCHAR(10) not null CONSTRAINT chk_SoDienThoai CHECK(SoDienThoai LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
);
GO
create table tbl_HoaDonBan(
MaHoaDonBan int identity(1,1) not null primary key,
MaKhachHang char(10),
NgayBan datetime,
ThanhTien float,
FOREIGN KEY (MaKhachHang) REFERENCES tbl_KhachHang(MaKhachHang) ON DELETE CASCADE ON UPDATE CASCADE,
);
create table tbl_ChiTietHoaDonBan(
MaChiTietHoaDonBan int identity(1,1) not null primary key,
MaHoaDonBan int,
MaHang char(10),
SoLuong int, 
GiaBan float,
FOREIGN KEY (MaHoaDonBan) REFERENCES tbl_HoaDonBan (MaHoaDonBan) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (MaHang) REFERENCES tbl_HangHoa(MaHang) ON DELETE CASCADE ON UPDATE CASCADE,
);
create table NhaCC
(
	NhaCCID char(10) primary key,
	TenNCC nvarchar(30),
	DiaChiNCC nvarchar(50),
	SdtNCC char(10)	
)
go
--create table DonHangNhap
--(
--	DonHangNhapID char(10) primary key,
--	MaNhanVien char(10) foreign key references tbl_NhanVien(MaNhanVien) on delete cascade on update cascade,
--	NhaCCID char(10) foreign key references NhaCC(NhaCCID) on delete cascade on update cascade,
--	NgayNhap date,
--	TrietKhauNhap float
--)
--create table ChiTietDHN
--(
--	DonHangNhapID char(10) primary key,
--	MaHang char(10) foreign key references TenHang(MaHang) on delete cascade on update cascade,
--	SLNhap tinyint,
--	DGNhap float
	
--)
GO




-- Thêm nhân viên 
INSERT INTO tbl_NhanVien (MaNhanVien, TenNhanVien, GioiTinh, DiaChi, SoDienThoai, Email, NgaySinh)VALUES 
('NV001', 'Nguyen Van An', 'Nam', '123 Nguyen Du, Hanoi', '0123456789', 'nv.a@example.com', '2000-01-01'),
('NV002', 'Tran Thi Binh', N'Nữ', '456 Le Loi, Ho Chi Minh City', '0987654321', 'nv.b@example.com', '1995-05-10'),
('NV003', 'Pham Van Chien', 'Nam', '789 Nguyen Trai, Da Nang', '0369876543', 'nv.c@example.com', '1998-12-25'),
('NV004', 'Hoang Thi Duyen', N'Nữ', '321 Tran Hung Dao, Hai Phong', '0543216789', 'nv.d@example.com', '1992-07-15'),
('NV005', 'Le Van Nam', 'Nam', '654 Nguyen Thi Minh Khai, Can Tho', '0765432109', 'nv.e@example.com', '1994-03-05'),
('NV006', 'Nguyen Thi Hanh', N'Nữ', '987 Hoang Van Thu, Hue', '0912345678', 'nv.f@example.com', '1997-09-20'),
('NV007', 'Tran Van Thinh', 'Nam', '258 Vo Thi Sau, Nha Trang', '0887654321', 'nv.g@example.com', '1990-11-30'),
('NV008', 'Pham Thi Huyen', N'Nữ', '753 Le Lai, Da Lat', '0332145678', 'nv.h@example.com', '1993-08-18'),
('NV009', 'Hoang Van Trung', 'Nam', '159 Tran Phu, Quy Nhon', '0598765432', 'nv.i@example.com', '1999-02-28'),
('NV010', 'Le Thi Nho', N'Nữ', '852 Hoang Dieu, Vung Tau', '0945678901', 'nv.j@example.com', '1996-06-08');
GO
-- Thêm khách hàng 
INSERT INTO tbl_KhachHang (MaKhachHang, TenKhachHang, GioiTinh, DiaChi, SoDienThoai)
VALUES
    ('KH001', 'Nguyen Van A', 'Nam', '123 Nguyen Du, Hanoi', '0123456789'),
    ('KH002', 'Tran Thi B', N'Nữ', '456 Le Loi, Ho Chi Minh City', '0987654321'),
    ('KH003', 'Pham Van C', 'Nam', '789 Nguyen Trai, Da Nang', '0369876543'),
    ('KH004', 'Hoang Thi D', N'Nữ', '321 Tran Hung Dao, Hai Phong', '0543216789'),
    ('KH005', 'Le Van E', 'Nam', '654 Nguyen Thi Minh Khai, Can Tho', '0765432109'),
    ('KH006', 'Nguyen Thi F', N'Nữ', '987 Hoang Van Thu, Hue', '0912345678'),
    ('KH007', 'Tran Van G', 'Nam', '258 Vo Thi Sau, Nha Trang', '0887654321'),
    ('KH008', 'Pham Thi H', N'Nữ', '753 Le Lai, Da Lat', '0332145678'),
    ('KH009', 'Hoang Van I', 'Nam', '159 Tran Phu, Quy Nhon', '0598765432'),
    ('KH010', 'Le Thi J', N'Nữ', '852 Hoang Dieu, Vung Tau', '0945678901');
GO
INSERT INTO tbl_LoaiHang (MaLoaiHang, TenLoaiHang)
VALUES 
    ('LH001', 'Dienthoai'),
    ('LH002', N'Laptop'),
    ('LH003', N'Phu kien'),
    ('LH004', N'Linh kien'),
	('LH005', N'May in'),
    ('LH006', N'May scan'),
    ('LH007', N'May chieu'),
    ('LH008', N'Thiet be lưu tru'),
    ('LH009', N'Phan mem'),
    ('LH010', N'Gaming');
GO
INSERT INTO tbl_HangHoa (MaHang, TenHang, MaLoaiHang, SoLuong, DonGiaNhap,DonGiaBan,MoTa)
VALUES 
('HH001', 'IPhone14', 'LH001', 10, 20000000, 25000000,'Dienthoai'),
('HH002', 'Ihone13', 'LH002', 20, 15000000,250000000,'Dienthoai'),
('HH003', 'Iphone12', 'LH003', 20, 15000000,20000000,'Dienthoai'),
('HH004', 'Samsung', 'LH004', 20, 15000000,20000000,'Dienthoai'),
('HH005', 'Xiao mi', 'LH005', 20, 15000000,20000000,'Dienthoai'),
('HH006', 'Samsung s23 ', 'LH006', 20, 15000000,20000000,'Dienthoai'),
('HH007', 'Laptop Acer', 'LH007', 20, 15000000,20000000,'Laptop'),
('HH008', 'Laptop Macbook', 'LH008', 20, 15000000,20000000,'Laptop'),
('HH009', 'Laptop Samsung', 'LH009', 20, 15000000,20000000,'Laptop'),
('HH010', 'Laptop Macbook', 'LH010', 20, 15000000,20000000,'Laptop');

GO
INSERT INTO tbl_HoaDonBan (MaKhachHang, NgayBan, ThanhTien)
VALUES
('KH001', '2023-10-24 08:00:00', 1000.50),
('KH002', '2023-10-25 14:30:00', 750.25),
('KH003', '2023-10-26 10:15:00', 1200.75);
go
-- Chèn dữ liệu vào bảng ChiTietHoaDonBan
INSERT INTO tbl_ChiTietHoaDonBan (MaHoaDonBan, MaHang, SoLuong, GiaBan)
VALUES
(1, 'HH001', 5, 50.00),
(1, 'HH002', 3, 30.00),
(2, 'HH003', 2, 50.00),
(3, 'HH004', 4, 45.50);

INSERT INTO tbl_TaiKhoan 
VALUES
('1','1','admin','admin','manh1003@gmail.com'),
('2','1','user','user','manh10032003@gmail.com')

INSERT INTO LoaiTaiKhoan (LoaiTaiKhoanID, TenLoaiTaiKhoan)
VALUES (1, N'Admin'),
       (2, N'Người dùng');

GO

/*Thủ tục thêm khách hàng */
CREATE PROC Proc_themkh
@MaKhachHang char(10),
@TenKhachHang Nvarchar(50),
@GioiTinh nvarchar(10),
@DiaChi Nvarchar(10),
@SoDienThoai varchar(15)
AS
BEGIN
    INSERT INTO tbl_KhachHang
    VALUES(  @MaKhachHang,@TenKhachHang,@GioiTinh,@DiaChi,@SoDienThoai)
END
GO

create proc Proc_getkh 
@MaKhachHang nvarchar(10)
as
BEGIN
    select* FROM tbl_KhachHang WHERE MaKhachHang =@MaKhachHang
END
GO
-----gọi thủ tục
exec Proc_themkh'KH012',N'Le Thi Thuy Duong','Nu',N'Ha noi','0987654321';
SELECT * FROM tbl_KhachHang
SELECT * FROM tbl_ChiTietHoaDonBan

/*Sửa khách hàng */
CREATE PROC Proc_suakh
@MaKhachHang char(10),
@TenKhachHang Nvarchar(50),
@GioiTinh nvarchar(10),
@DiaChi Nvarchar(10),
@SoDienThoai varchar(15)
AS
BEGIN
    UPDATE tbl_KhachHang SET TenKhachHang = @TenKhachHang, GioiTinh = @GioiTinh,DiaChi = @DiaChi, SoDienThoai = @SoDienThoai
    WHERE MaKhachHang = @MaKhachHang
END
GO
-----gọi thủ tục sửa 
exec Proc_suakh 'KH012',N'Nguyen Hoang Minh Duc','Nam',N'Hung Yen ','0123456789'
SELECT * FROM tbl_KhachHang

/*Xóa khách hàng */
CREATE PROC Proc_xoakh
@MaKhachHang nvarchar(10)
AS
BEGIN
    DELETE FROM tbl_KhachHang WHERE MaKhachHang =@MaKhachHang
END
GO
----gọi thủ tục xoá mã khách “KH012”
exec Proc_xoakh 'KH012'
SELECT * FROM tbl_KhachHang

/*Tim kiem khach hang*/
CREATE PROC Proc_tkkh
@TUKHOA NVARCHAR(50)
AS
BEGIN
    SELECT * FROM tbl_KhachHang WHERE tbl_KhachHang.TenKhachHang = @TUKHOA OR TenKhachHang LIKE @TUKHOA OR SoDienThoai LIKE @TUKHOA OR TenKhachHang LIKE '%'+@TUKHOA+'%'
END
GO

Create PROCEDURE [dbo].[sp_login](@taikhoan nvarchar(50), @matkhau nvarchar(50))
AS
    BEGIN
      SELECT  *
      FROM TaiKhoans
      where TenTaiKhoan= @taikhoan and MatKhau = @matkhau;
    END;
CREATE PROCEDURE Proc_login(@taikhoan nvarchar(50), @matkhau nvarchar(50))
AS
    BEGIN
      SELECT  *
      FROM tbl_TaiKhoan
      where TenTaiKhoan= @taikhoan and MatKhau = @matkhau;
    END;

	exec Proc_login 'admin','admin';
	exec Proc_login 'user','user'
GO



--tạo thủ tục hóa đơn--
create PROCEDURE hoadonID
(
    @MaHoaDonBan CHAR(10)
)
AS
BEGIN
    SELECT h.*, 
    (
        SELECT c.*
        FROM tbl_ChiTietHoaDonBan AS c
        WHERE h.MaHoaDonBan = c.MaHoaDonBan FOR JSON PATH
    ) AS list_json_chitietdonhangban
    FROM tbl_HoaDonBan AS h
    WHERE h.MaHoaDonBan = @MaHoaDonBan;
END;

exec hoadonID '1'

create PROCEDURE hoadonCreate
(@MaKhachHang        CHAR(10),
@NgayBan			datetime,
 @ThanhTien          float,
 @list_json_chitietdonhangban NVARCHAR(MAX)
)
AS
    BEGIN
		DECLARE @MaHoaDonBan INT;
        INSERT INTO tbl_HoaDonBan
                (MaKhachHang , 
				NgayBan,
                 ThanhTien             
                )
                VALUES
                (@MaKhachHang, 
				@NgayBan, 
                 @ThanhTien
                );

				SET @MaHoaDonBan = (SELECT SCOPE_IDENTITY());
                IF(@list_json_chitietdonhangban IS NOT NULL)
                    BEGIN
                        INSERT INTO tbl_ChiTietHoaDonBan
						 (MaHang, 
						  MaHoaDonBan,
                          SoLuong, 
                          GiaBan               
                        )
                    SELECT JSON_VALUE(p.value, '$.MaHang'), 
                            @MaHoaDonBan, 
                            JSON_VALUE(p.value, '$.soLuong'), 
                            JSON_VALUE(p.value, '$.giaBan')    
                    FROM OPENJSON(@list_json_chitietdonhangban) AS p;
                END;
        SELECT '';
    END;

	select * from tbl_HoaDonBan
		select * from C


create PROCEDURE hoadonUpdate
(@MaHoaDonBan        int, 
 @MaKhachHang       CHAR(10), 
 @NgayBan          datetime, 
 @ThanhTien        float,  
 @list_json_chitietdonhangban NVARCHAR(MAX)
)
AS
    BEGIN
		UPDATE tbl_HoaDonBan
		SET
			MaKhachHang  = @MaKhachHang ,
			NgayBan = @NgayBan,
			ThanhTien = @ThanhTien
		WHERE MaHoaDonBan = @MaHoaDonBan;
		
		IF(@list_json_chitietdonhangban IS NOT NULL) 
		BEGIN
			 -- Insert data to temp table 
		   SELECT
			  JSON_VALUE(p.value, '$.maChiTietHoaDon') as maChiTietHoaDonBan,
			  JSON_VALUE(p.value, '$.maHoaDonBan') as maHoaDonBan,
			  JSON_VALUE(p.value, '$.MaHang') as MaHang,
			  JSON_VALUE(p.value, '$.soLuong') as soLuong,
			  JSON_VALUE(p.value, '$.giaBan') as giaBan,
			  JSON_VALUE(p.value, '$.status') as status
			  INTO #Results 
		   FROM OPENJSON(@list_json_chitietdonhangban) AS p;
		 
		 -- Insert data to table with STATUS = 1;
			INSERT INTO tbl_ChiTietHoaDonBan 
						(MaHang, 
						  MaHoaDonBan,
                          SoLuong, 
                          GiaBan ) 
			   SELECT
				  #Results.MaHang,
				  @MaHoaDonBan,
				  #Results.soLuong,
				  #Results.GiaBan			 
			   FROM  #Results 
			   WHERE #Results.status = '1' 
			
			-- Update data to table with STATUS = 2
			  UPDATE tbl_ChiTietHoaDonBan 
			  SET
				 SoLuong = #Results.soLuong,
				 GiaBan = #Results.giaBan
			  FROM #Results 
			  WHERE  tbl_ChiTietHoaDonBan.maChiTietHoaDonBan = #Results.maChiTietHoaDonban AND #Results.status = '2';
			
			-- Delete data to table with STATUS = 3
			DELETE C
			FROM tbl_ChiTietHoaDonBan C
			INNER JOIN #Results R
				ON C.maChiTietHoaDonBan=R.maChiTietHoaDonBan
			WHERE R.status = '3';
			DROP TABLE #Results;
		END;
        SELECT '';
    END;

	-- Tạo thủ tục xóa HoaDonBan
CREATE PROCEDURE XoaHoaDonBan
    @MaHoaDonBan int
AS
BEGIN
    -- Kiểm tra xem MaHoaDonBan có tồn tại không
    IF EXISTS (SELECT 1 FROM tbl_HoaDonBan WHERE MaHoaDonBan = @MaHoaDonBan)
    BEGIN
        -- Xóa chi tiết hóa đơn bán liên quan
        DELETE FROM tbl_ChiTietHoaDonBan WHERE MaHoaDonBan = @MaHoaDonBan;
        
        -- Xóa hóa đơn bán
        DELETE FROM tbl_HoaDonBan WHERE MaHoaDonBan = @MaHoaDonBan;
        
        PRINT 'Hóa đơn bán đã được xóa thành công.';
    END
    ELSE
    BEGIN
        PRINT 'Không tìm thấy hóa đơn bán có MaHoaDonBan = ' + CAST(@MaHoaDonBan AS nvarchar);
    END
END

exec XoaHoaDonBan'5'

--hang hoa---

--CREATE PROCEDURE Proc_ThemHangHoa
--(
--    @MaHang CHAR(10),
--    @TenHang NVARCHAR(50),
--    @MaLoaiHang CHAR(10),
--    @SoLuong INT,
--    @DonGiaNhap FLOAT,
--    @DonGiaBan FLOAT,
--    @MoTa VARCHAR(100)
--)
--AS
--BEGIN
--    INSERT INTO tbl_HangHoa (MaHang, TenHang, MaLoaiHang, SoLuong, DonGiaNhap, DonGiaBan, MoTa)
--    VALUES (@MaHang, @TenHang, @MaLoaiHang, @SoLuong, @DonGiaNhap, @DonGiaBan, @MoTa);
--END

--CREATE PROCEDURE Proc_SuaHangHoa
--(
--    @MaHang CHAR(10),
--    @TenHang NVARCHAR(50),
--    @MaLoaiHang CHAR(10),
--    @SoLuong INT,
--    @DonGiaNhap FLOAT,
--    @DonGiaBan FLOAT,
--    @MoTa VARCHAR(100)
--)
--AS
--BEGIN
--    UPDATE tbl_HangHoa
--    SET TenHang = @TenHang, MaLoaiHang = @MaLoaiHang, SoLuong = @SoLuong, DonGiaNhap = @DonGiaNhap, DonGiaBan = @DonGiaBan, MoTa = @MoTa
--    WHERE MaHang = @MaHang;
--END
--CREATE PROCEDURE Proc_XoaHangHoa
--(
--    @MaHang CHAR(10)
--)
--AS
--BEGIN
--    DELETE FROM tbl_HangHoa
--    WHERE MaHang = @MaHang;
--END
---- Create a stored procedure for searching HangHoa
--CREATE PROCEDURE Proc_TimKiemHangHoa
--(
--    @TUKHOA NVARCHAR(50)
--)
--AS
--BEGIN
--    SELECT *
--    FROM tbl_HangHoa
--    WHERE TenHang = @TUKHOA OR TenHang LIKE @TUKHOA OR MoTa LIKE @TUKHOA OR TenHang LIKE '%' + @TUKHOA + '%';
--END
--EXEC Proc_ThemHangHoa 'HH011', 'New Product', 'LH001', 50, 100.00, 150.00, 'Description';

---- Update an existing HangHoa
--EXEC Proc_SuaHangHoa 'HH011', 'Updated Product', 'LH002', 60, 120.00, 170.00, 'Updated Description';

---- Delete a HangHoa
--EXEC Proc_XoaHangHoa 'HH011';
--EXEC Proc_TimKiemHangHoa 'iPhone';
CREATE PROCEDURE TKHH
    @TenSanPham nvarchar(250)
AS
BEGIN
    SELECT *
    FROM tbl_HangHoa
    WHERE TenHang = @TenSanPham;
END;



--Thêm
CREATE PROCEDURE ThemSanPham
    @MaHang CHAR(10),
    @MaLoaiHang CHAR(10),
    @TenHang NVARCHAR(250),
    @SoLuong INT,
    @DonGiaNhap INT,
	@DonGiaBan INT

AS
BEGIN
    INSERT INTO tbl_HangHoa( MaLoaiHang, TenHang, SoLuong, DonGiaNhap,DonGiaBan)
    VALUES (@MaLoaiHang, @TenHang, @SoLuong, @DonGiaNhap,@DonGiaBan);
END;

--Sửa
CREATE PROCEDURE SuaSanPham
     @MaHang CHAR(10),
    @MaLoaiHang CHAR(10),
    @TenHang NVARCHAR(250),
    @SoLuong INT,
    @DonGiaNhap INT,
	@DonGiaBan INT
AS
BEGIN
    UPDATE tbl_HangHoa
    SET Tenhang = @TenHang, MaLoaiHang=@MaLoaiHang, SoLuong = @SoLuong, DonGiaBan = @DonGiaBan,DonGiaNhap =@DonGiaNhap
    WHERE MaHang = @MaHang;
END;


--Xóa
CREATE PROCEDURE XoaSanPham
    @MaSanPham CHAR(10)
AS
BEGIN
    DELETE FROM tbl_HangHoa
    WHERE MaHang = @MaSanPham
END;



create procedure HangHoa_getAll
as
	begin
		select * from tbl_HangHoa
	end;
go
CREATE PROCEDURE TimMatHangTheoTenHang
    @TenHang nvarchar(50)
AS
BEGIN
    SELECT *
    FROM tbl_HangHoa
    WHERE TenHang = @TenHang;
END;
select * from tbl_HangHoa
exec TimMatHangTheoTenHang N'IPHONE'