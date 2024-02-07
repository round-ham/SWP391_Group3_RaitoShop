SET IDENTITY_INSERT [dbo].[Brands] ON 


INSERT [dbo].[Brands] ([brandId], [brandName], [CreateDate], [lastUpdate]) VALUES (1, N'Adidas', CAST(N'2024-01-14' AS Date), CAST(N'2024-02-01' AS Date))
INSERT [dbo].[Brands] ([brandId], [brandName], [CreateDate], [lastUpdate]) VALUES (2, N'Converse', CAST(N'2024-01-14' AS Date), CAST(N'2024-02-01' AS Date))
INSERT [dbo].[Brands] ([brandId], [brandName], [CreateDate], [lastUpdate]) VALUES (3, N'Nike', CAST(N'2024-01-14' AS Date), CAST(N'2024-02-01' AS Date))
INSERT [dbo].[Brands] ([brandId], [brandName], [CreateDate], [lastUpdate]) VALUES (4, N'Vans', CAST(N'2024-01-14' AS Date), CAST(N'2024-02-01' AS Date))
INSERT [dbo].[Brands] ([brandId], [brandName], [CreateDate], [lastUpdate]) VALUES (5, N'Timberland', CAST(N'2024-01-14' AS Date), CAST(N'2024-02-01' AS Date))

SET IDENTITY_INSERT [dbo].[Brands] OFF

SET IDENTITY_INSERT [dbo].[Size] ON 

INSERT [dbo].[Size] ([sizeId], [size]) VALUES (1, 36)
INSERT [dbo].[Size] ([sizeId], [size]) VALUES (2, 37)
INSERT [dbo].[Size] ([sizeId], [size]) VALUES (3, 38)
INSERT [dbo].[Size] ([sizeId], [size]) VALUES (4, 39)
INSERT [dbo].[Size] ([sizeId], [size]) VALUES (5, 40)
INSERT [dbo].[Size] ([sizeId], [size]) VALUES (6, 41)
INSERT [dbo].[Size] ([sizeId], [size]) VALUES (7, 42)
INSERT [dbo].[Size] ([sizeId], [size]) VALUES (8, 43)
INSERT [dbo].[Size] ([sizeId], [size]) VALUES (9, 44)
SET IDENTITY_INSERT [dbo].[Size] OFF


SET IDENTITY_INSERT [dbo].[Colors] ON 

INSERT [dbo]. [Colors]([colorId], [color]) VALUES (1, N'Black')
INSERT [dbo]. [Colors]([colorId], [color]) VALUES (2, N'Blue')
INSERT [dbo]. [Colors]([colorId], [color]) VALUES (3, N'Red')
INSERT [dbo]. [Colors]([colorId], [color]) VALUES (4, N'Cloud White')
INSERT [dbo]. [Colors]([colorId], [color]) VALUES (5, N'Metallic Silver')
INSERT [dbo]. [Colors]([colorId], [color]) VALUES (6, N'Brown')
INSERT [dbo]. [Colors]([colorId], [color]) VALUES (7, N'Yellow')
INSERT [dbo]. [Colors]([colorId], [color]) VALUES (8, N'Preloved Green')
INSERT [dbo]. [Colors]([colorId], [color]) VALUES (9, N'Grey')
INSERT [dbo]. [Colors]([colorId], [color]) VALUES (10, N'Gold Metallic')



SET IDENTITY_INSERT [dbo].[Colors] OFF

insert into Categories values (1,N'Giày thể thao',CAST (N'2024-01-14' as date), CAST (N'2024-01-14' as date))
insert into Categories values (2,N'Giày chạy bộ',CAST (N'2024-01-14' as date), CAST (N'2024-01-14' as date))
insert into Categories values (3,N'Giày dã ngoại',CAST (N'2024-01-14' as date), CAST (N'2024-01-14' as date))
insert into Categories values (4,N'Giày thời trang',CAST (N'2024-01-14' as date), CAST (N'2024-01-14' as date))
insert into Categories values (5,N'Giày tennis',CAST (N'2024-01-14' as date), CAST (N'2024-01-14' as date))




SET IDENTITY_INSERT [dbo].[Products] ON 
--Mẫu  insert 
--INSERT [dbo].[Products] (productId,brandId,categoryId,productName,productDescription,unitPrice,productImage,totalQuantity,quantitySold,[status],createDate,lastUpdate) values (6,2,4,N'',N'',1600000,N'',99,1,1, CAST (N'2024-01-14' as date), CAST (N'2024-01-14' as date))



INSERT [dbo].[Products] (productId,brandId,categoryId,productName,productDescription,unitPrice,productImage,totalQuantity,quantitySold,[status],createDate,lastUpdate) 
values (1,1,1, N'GIÀY HIKING TERREX FREE HIKER 2.0 LOW GORE-TEX',N'Thân giày bằng vải lưới chống mài mòn với các chi tiết phủ ngoài không đường may và lớp màng GORE-TEX cùng với ẹp gót bên ngoài và khung ổn định bằng chất liệu EVA', 4400000, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/d63aa4322cbe43b1a02a306d618c4087_9366/Giay_Hiking_TERREX_Free_Hiker_2.0_Low_GORE-TEX_Xam_IF6658_01_standard.jpg',99,1,1, CAST (N'2024-01-14' as date), CAST (N'2024-01-14' as date))
INSERT [dbo].[Products] (productId,brandId,categoryId,productName,productDescription,unitPrice,productImage,totalQuantity,quantitySold,[status],createDate,lastUpdate) 
values (2,1,2, N'GIÀY PUREBOOST 23',N'Làm từ một loạt chất liệu tái chế, thân giày có chứa tối thiểu 50% thành phần tái chế. Sản phẩm này đại diện cho một trong số rất nhiều các giải pháp của chúng tôi hướng tới chấm dứt rác thải nhựa.', 3650000, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/b21a897034754050ac76376f9b113405_9366/Giay_Pureboost_23_Be_IF1547_01_standard.jpg,99,1,1,',99,1,1, CAST (N'2024-01-14' as date), CAST (N'2024-01-14' as date))
INSERT [dbo].[Products] (productId,brandId,categoryId,productName,productDescription,unitPrice,productImage,totalQuantity,quantitySold,[status],createDate,lastUpdate) 
values (3,1,3, N'GIÀY HYPERTURF',N'Làm từ một loạt chất liệu tái chế, thân giày có chứa tối thiểu 50% thành phần tái chế. Sản phẩm này đại diện cho một trong số rất nhiều các giải pháp của chúng tôi hướng tới chấm dứt rác thải nhựa.', 3650000, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/b21a897034754050ac76376f9b113405_9366/Giay_Pureboost_23_Be_IF1547_01_standard.jpg,99,1,1,',99,1,1, CAST (N'2024-01-14' as date), CAST (N'2024-01-14' as date))
INSERT [dbo].[Products] (productId,brandId,categoryId,productName,productDescription,unitPrice,productImage,totalQuantity,quantitySold,[status],createDate,lastUpdate) 
values (4,1,4,N'GIÀY SUPERSTAR XLG',N'Tỷ lệ thiết kế oversize và cá tính mạnh mẽ không kém thể hiện rõ ràng qua 3 Sọc răng cưa biểu tượng. Thân giày hoàn toàn bằng da trung thành với chất vintage, đồng thời biến hóa kiểu dáng cho phong cách mới mẻ',3000000,N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/81c4e7e639bc46858f26b7291d9ec5b0_9366/Giay_Superstar_XLG_DJen_IG9777.jpg',99,1,1, CAST (N'2024-01-14' as date), CAST (N'2024-01-14' as date))
INSERT [dbo].[Products] (productId,brandId,categoryId,productName,productDescription,unitPrice,productImage,totalQuantity,quantitySold,[status],createDate,lastUpdate) 
values (5,1,5,N'GIÀY TENNIS COURT SPEC 2',N'Với đế ngoài bằng cao su phù hợp mọi kiểu sân và đế giữa Bounce linh hoạt, đôi giày siêu nhẹ này đảm bảo hiệu năng trên mọi bề mặt sân.',1600000,N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/da8d07d3313a4784b0c9578461a577bf_9366/Giay_Tennis_Court_Spec_2_DJen_ID2471_01_standard.jpg',99,1,1, CAST (N'2024-01-14' as date), CAST (N'2024-01-14' as date))
INSERT [dbo].[Products] (productId,brandId,categoryId,productName,productDescription,unitPrice,productImage,totalQuantity,quantitySold,[status],createDate,lastUpdate) 
values (6,2,4,N'GIÀY CHUCK 70',N'Giày cổ thấp có thân trên bằng vải canvas theo màu sắc theo mùa.Khâu lưỡi có cánh giúp khóa nó đúng vị trí',1900000,N'https://www.converse.vn/media/catalog/product/cache/e81e4f913a1cad058ef66fea8e95c839/0/8/0882-CON162058C000007-1.jpg',99,1,1, CAST (N'2024-01-14' as date), CAST (N'2024-01-14' as date)) 




SET IDENTITY_INSERT [dbo].[Products] OFF


INSERT into ProductDetails values (1,1,1,11)
INSERT into ProductDetails values (1,2,1,11)
INSERT into ProductDetails values (1,3,1,11)
INSERT into ProductDetails values (1,4,1,11)
INSERT into ProductDetails values (1,5,9,11)
INSERT into ProductDetails values (1,6,9,11)
INSERT into ProductDetails values (1,7,9,11)
INSERT into ProductDetails values (1,8,9,11)
INSERT into ProductDetails values (1,9,1,11)

INSERT into ProductDetails values (2,1,1,11)
INSERT into ProductDetails values (2,2,2,11)
INSERT into ProductDetails values (2,3,4,11)
INSERT into ProductDetails values (2,4,7,11)
INSERT into ProductDetails values (2,5,9,11)
INSERT into ProductDetails values (2,6,1,11)
INSERT into ProductDetails values (2,7,2,11)
INSERT into ProductDetails values (2,8,4,11)
INSERT into ProductDetails values (2,9,9,11)
------------------------
--insert thêm thuộc tính id với ảnh giày với color tương ứng
ALTER TABLE ProductDetails
ADD 
    id INT IDENTITY(1,1) PRIMARY KEY,
    productImage VARCHAR(3000);

update ProductDetails 
set productImage = N'https://drake.vn/image/catalog/H%C3%ACnh%20content/gi%C3%A0y-Converse-n%E1%BB%AF-m%C3%A0u-%C4%91en/giay-converse-nu-mau-den-111.jpg'
where productId = 1 and colorId = 1

update ProductDetails 
set productImage = N'https://www.gitana.vn/image/cache/catalog/san-pham/8053%20SVN/giay-dr-martens-nam-thai-lan-8053-sap-vuong-mau-nau-01-1000x667.jpg'
where productId = 1 and colorId = 9

update ProductDetails
set productImage = N'https://badmintonw.com/uploads/gallery/Lefus%20L010%20-%20Xanh.png'
where colorId = 2 and productId = 2


update Colors
set color = 'White'
where colorId = 4

insert into Accounts values ('Duc Thien', 'thien123@gmail.com', '123', 1, 'VN','123456789', N'https://icons.iconarchive.com/icons/papirus-team/papirus-status/512/avatar-default-icon.png',cast(N'2024-01-01' as date),cast(N'2024-01-01' as date),1)

insert into Blogs values ('Title 1, Today is Monday', 'Li K Ba Ca Na Mg Al', N'https://images.pexels.com/photos/36478/amazing-beautiful-beauty-blue.jpg?cs=srgb&dl=pexels-pixabay-36478.jpg&fm=jpg', cast(N'2024-01-01' as date), cast(N'2024-01-01' as date), 1)

insert into Blogs values ('Title 2, Today is Monday', 'Li K Ba Ca Na Mg Al', N'https://images.pexels.com/photos/36478/amazing-beautiful-beauty-blue.jpg?cs=srgb&dl=pexels-pixabay-36478.jpg&fm=jpg', cast(N'2024-01-01' as date), cast(N'2024-01-01' as date), 1)

insert into Blogs values ('Title 3, Today is Monday', 'Li K Ba Ca Na Mg Al', N'https://images.pexels.com/photos/36478/amazing-beautiful-beauty-blue.jpg?cs=srgb&dl=pexels-pixabay-36478.jpg&fm=jpg', cast(N'2024-01-01' as date), cast(N'2024-01-01' as date), 1)


update Colors
set color = 'Silver'
where colorId = 5

update Colors
set color = 'Green'
where colorId = 8

update Colors
set color = 'Gold'
where colorId = 10


