DROP PROCEDURE IF EXISTS dbo.sp_GetAccountByEmail;
GO
CREATE PROCEDURE dbo.sp_GetAccountByEmail
    @email NVARCHAR(100)
AS
BEGIN
    SELECT a.*, r.roleId, r.roleName FROM Accounts a
    JOIN AccountRoles ar ON a.accountId = ar.accountId
    JOIN Roles r ON ar.roleId = r.roleId
    WHERE email = @email
END
GO

roleId	roleName
1	Customers
2	Admin
3	Seller
4	Marketing Staff
5	Shipper

select GETDATE()

insert into AccountRoles values (9,2, GETDATE(), GETDATE())

update AccountRoles
set roleId = 2
where accountId = 9

customer1433@gmail.com 

USE [SWP391_Project_SQLShoes]
GO

INSERT INTO [dbo].[Blogs]
           ([title]
           ,[blogContent]
           ,[blogImage]
           ,[createDate]
           ,[lastUpdate]
           ,[employeeId])
     VALUES
           ('All THINGS NIKE AIR MAX DAWN'
           ,'“The Nike Air Max line is nothing short of iconic and will transcend into generations to come.” – OFFICE Trend Analysis

Last month, OFFICE and Nike collaborated on arguably our most exciting project to date – launching the Air Max Dawn. We headed to an eclectic studio in Dalston, East London with a very talented crew and three creators making waves in the industry to talk all things Nike Air Max Dawn.

It was important to us that all three creators had their own distinct style and relationship with the  Nike Air Max to authentically discuss creative culture, fashion, and looking to the future 🌟.
So what IS the Air Max Dawn you ask?

It is the newest Nike silhouette to drop at OFFICE, the perfect example of drawing on the past with a modern outlook. This fresh silhouette echoes the running shoes of the 90s, elevated with contemporary details. Fave features are the classic Air-sole unit with that retro pill-shaped window and the plush foam midsole that serves aaaaall the cushioning and style for all day wearing☁️.
ump from day to night activity thanks to the Dawn’s outsole’s seesaw pattern which adds traction and durability – think cloud nine levels of comfort. Dreamy. Oh and did you know that the #Nike ‘Air Max Dawn’ is made with at least 20% recycled material by weight. We sustainably stan ♻️.'
           ,'blog-id8.jpg'
           ,GETDATE()
           ,GETDATE()
           ,1)
GO

INSERT INTO [dbo].[Blogs]
           ([title]
           ,[blogContent]
           ,[blogImage]
           ,[createDate]
           ,[lastUpdate]
           ,[employeeId])
     VALUES
           ('ADIDAS OPEN FORUM IS IN SEASON'
           ,'Originally designed in 1983 for play on basketball hardcourts by French designer Jacques Chassaing, the adidas Forum stood its ground with ease. In 1984, new NBA player Michael Jordan wore Forum’s in the Team USA Olympic trials. The comfort and success achieved by individuals and teams wearing the sneakers, placed the adidas Forums on the map as a sneaker of choice for athletes. Soon, these basketball sneakers moved up the ranks, becoming adidas’ top basketball shoe. It’s popularity has not waned and they continue to be in demand to this day. The Forum was one of the first silhouettes to come in low, mid and high-tops versions. Its signature cross-cross hook-and-loop strap provided ankle stabilisation and support whilst giving the sneaker a unique design signature.
		   Today, the Forum is experiencing yet another revival, this time by street culture, skate, artists, dirt bikers, and celebrities, all claiming that the sneaker is their sneaker of choice. The sneakers’ comfort and cushioning design that made it ideal for the hardcourt of basketball finds favour with those looking for durability and day-long comfort. These sneakers are ideal for tackling the challenges of everyday life. For the fashionistas, the retro design of the adidas Forum, has made them highly popular with sub-cultures across the globe. Whether worn with casual staples like tracksuits, hoodies, sweatpants and t-shirts or paired with baggy jeans and crop tops, these sneakers are a must-have for anyone with an appreciation for solid old school design.'
           ,'blog-id9.jpg'
           ,GETDATE()
           ,GETDATE()
           ,2)
GO

INSERT INTO [dbo].[Blogs]
           ([title]
           ,[blogContent]
           ,[blogImage]
           ,[createDate]
           ,[lastUpdate]
           ,[employeeId])
     VALUES
           ('BENEFITS OF GOOD ATHLETIC FOOTWEAR'
           ,'Good athletic footwear is an essential piece of equipment for any athlete, regardless of the sport or activity they participate in. It provides support, protection, and stability, which can help improve performance and reduce the risk of injury. Here are some specific benefits of good athletic footwear:

Support: Good athletic shoes have a supportive structure that helps to stabilize the foot and ankle, which is especially important during high-impact activities such as running or jumping. A supportive shoe can help prevent overpronation (excessive inward rolling of the foot) and supination (excessive outward rolling of the foot), which can lead to pain and injuries such as shin splints and plantar fasciitis.

Protection: Athletic shoes also provide protection for the feet and ankles from the impact of the ground, as well as from sharp or hard objects that may be present in certain environments (e.g., rocks or debris on a trail). This can help prevent cuts, scrapes, and bruises, as well as more serious injuries such as sprains or fractures.

Stability: Good athletic footwear helps to keep the feet and ankles stable during movement, which can improve balance and coordination. This is especially important in sports that involve sudden changes in direction, such as basketball or soccer. A stable shoe can also help prevent slips and falls, which can be particularly hazardous in wet or slippery conditions.

Comfort: Comfort is an important factor in athletic footwear, as it can affect an athlete''s performance and enjoyment of the activity. Shoes that are too tight or too loose can cause blisters, foot fatigue, and discomfort, while shoes that fit properly and offer good cushioning can help prevent these issues.

Performance: In addition to providing support, protection, and stability, good athletic footwear can also improve an athlete''s performance. Shoes with specific features (e.g., spikes for track and field, cleats for soccer) can help improve traction and increase speed and agility. Shoes with proper cushioning can help reduce the impact on the joints, which can help prevent fatigue and allow for longer, more enjoyable workouts or competitions.

Durability: Good athletic shoes are also built to withstand the wear and tear of regular use. Investing in a quality pair of shoes can save money in the long run, as they will last longer and need to be replaced less frequently.

In conclusion, good athletic footwear is an important investment for any athlete. It provides support, protection, stability, comfort, and can improve performance and reduce the risk of injury. While it may be tempting to skimp on footwear, the benefits of good athletic shoes far outweigh the initial cost.

'
           ,'blog-id7.jpg'
           ,GETDATE()
           ,GETDATE()
           ,2)
GO

INSERT INTO [dbo].[Blogs]
           ([title]
           ,[blogContent]
           ,[blogImage]
           ,[createDate]
           ,[lastUpdate]
           ,[employeeId])
     VALUES
           ('HOW TO CHOOSE THE RIGHT SHOES:TIPS AND TRICKS'
           ,'Nowadays, many of us use the shoes not only for running, fitness or sports, but also in everyday life, they are a fixture in every human being.

Manufacturers often seek not simply to satisfy our need to create different kinds of shoes, depending on the purpose of their further use, but also use all kinds of marketing moves to boost sales of its brand.

We offer all the same to find out what are the shoes, what is the difference between them, and also help you choose the best option for each of us.

What should be the athletic shoes

Fitness shoes should be selected more carefully than clothes. sneaker model must strictly correspond to the type of fitness that you are doing – universal models “for all” does not happen!

True, there may be trade-offs – fitness cardio training shoes for quite “allowed” in the gym.

The general rule for fitness shoes – it should be easy, convenient, accurate fit your size and fitness for mobile species – good to keep the ankle.

Running shoes



The main task of these trainers is to mitigate the impacts of the foot on the surface, they should be well-amortize “extinguish” the force of impact of the foot to minimize the destructive impact of running on the spine and knee joints.

Yes, yes, running – it’s not just pumped cardiovascular system. If you select the wrong shoes, and, of course, unpointed technology, vertical impact load on the intervertebral discs, foot and knee joints leads to their destruction and the emergence of unpleasant symptoms.

Basic requirements for such shoes: lightness, breathability, good shock absorption

Appearance: Low, with a massive heel and upturned toe cap for easy rolling from heel to toe while running low backdrop.

The top is made usually of a grid with inserts made of artificial or genuine leather.

jogging shoes provided with exaggerated roller, which prevents the ankle from rubbing.

Advice in the selection: Put on your favorite pair of rolls and the feet back and forth. If outsole helps guide the movement – a pair for you.

Fitness Trainers



The main objective of this type of shoe is to protect the ankle joint at loads.

Basic requirements: sufficient altitude, weightlessness, flexibility and availability of air bags in the toe portion of the sole.

Appearance: similar to closed shoes with solid soles thick with softly expressed relief. In special sole figure is possible, for example, a circle in the center of the bow, for easier rotation.

The top should be made of tight material, but with ventilation. Such shoes for tap dance, aerobics, strength training, and interval training.

The Council reached by selecting as fitness activities involve large muscle activity and frequent changes of position, make sure that the shoes helps you keep your balance. When buying a vote hardness of the sole – too soft soles can not ensure the stability of the foot.

Casual shoes



The main task of such shoes is reduced to the fact that its owner should experience maximum convenience and comfort of wearing it.

While walking one foot always touching the ground. It affects the effort in two directions: the heel strike the ground and move forward. Experiencing such a load, the foot should not be tired even after hours of continuous walking.

Basic requirements: user-friendliness, ease and practicality. Trainers should be well withstand any type of road surface.

Appearance: ventilation openings at the top and on the sides. This will help the feet to “breathe” and will not even tired feet after a long walk. Tread soles should be shallow and flexible, this will avoid the ingress of small stones and other road debris into the tread.

The top of such shoes often made of textiles or a combination of leather and synthetic high-tech.

Advice in the selection: buy shoes in the afternoon or evening, as by this time a little leg swells, and sneakers not prove you are small on the following day. This advice is applicable to any type of shoe.'
           ,'blog-id6.png'
           ,GETDATE()
           ,GETDATE()
           ,4)
GO

USE [SWP391_Project_SQLShoes]
GO

INSERT INTO [dbo].[Blogs]
           ([title]
           ,[blogContent]
           ,[blogImage]
           ,[createDate]
           ,[lastUpdate]
           ,[employeeId])
     VALUES
           ('NEW REFLECTIVE GOLDEN AIR MAX 1 PRINT '
           ,'Attention sneakerheads! We just released a very special, limited edition sneaker art print in our web store: The reflective golden Nike Air Max 1 print. In the fast-changing landscape of sneakers  where new silhouettes, daring colourways, collabs with celebrities, and the latest innovations are presented to you by the day  its easy to forget the classics. The ones that got you hooked to the game, paved the way for its successors, and got it all started.The new Reflective Golden Nike Air Max 1 Hyprint is a celebration of one of the most iconic sneakers out there. When legendary designer Tinker Hatfield introduced the AM1 back in 1987, the model caused a shift in the sneaker market. It was the first sneaker with a visible Air unit and quickly became famous on the streets. These kicks have a rich history, with some incredibly well-received colourways, like the OG varsity red and blues, the Kidrobot edition from 05, the Elephants by atmos from 07, and the Cherrywoods by Patta and Parra from 10 (my personal favourite).
The Air Max 1 on this print however, has been deprived of all the madness. There are no crazy patterns, no striking colours, and no missing swooshes. Instead, it portrays the icon as it is: a winner. The design is printed on 380 g/m² heavyweight white matte art paper and is laminated with a reflective golden foil. The Golden Air Max 1 print is limited to 60 copies and are hand numbered on the back.'
		   ,'blog-id1.png'
           ,GETDATE()
           ,GETDATE()
           ,2)
GO

INSERT INTO [dbo].[Blogs]
           ([title]
           ,[blogContent]
           ,[blogImage]
           ,[createDate]
           ,[lastUpdate]
           ,[employeeId])
     VALUES
           ('COLLABORATION: FAWL CUSTOMS X HYPRINTS'
           ,'The first collaboration of 2019 is a fact! Hyprints has created personalized prints for FAWL Customs that will be sold as an unique package deal on their webshop. We met the Dutch sneaker customizer during Sneakerness Rotterdam and talked about possible collaborations. We stayed in touch after the event and worked out the details of the project, resulting in an this awesome collaboration.

FAWL Customs used NikeID to create the base of the sneaker, which he then customized by hand, resulting in a bespoke pink alteration of the popular Atmos x Nike Air Max 1 Elephant sneaker. Hyprints made, in turn, an illustrated version of the shoe and immortalized it by turning it into printed sneaker art. Rock these babies on your feet and on your wall! The FAWL Customs Pink Elephant Air Max 1s are now available online. Check out the pictures below and expect more collaborations soon!'
           ,'blog-id2.jpg'
           ,GETDATE()
           ,GETDATE()
           ,2)
GO

INSERT INTO [dbo].[Blogs]
           ([title]
           ,[blogContent]
           ,[blogImage]
           ,[createDate]
           ,[lastUpdate]
           ,[employeeId])
     VALUES
           ('HOW TO WASH SPORT SHOES IN THE WASHING MACHINE?'
           ,'Whether you play sports or not, you are sure to have sports shoes at home. Their use ends up making it inevitable. Although manufacturers do not recommend washing sports shoes a lot in the washing machine, it is advisable to follow these tips when washing them:

Tips for washing your sports shoes step by step
Remove the laces and insoles if possible. This will prevent these parts from coming loose or getting tangled in the wash.
Try to brush away the embedded dirt. Leave only the dirt that you cannot completely remove from the shoes, making washing as easy as possible.
Put your shoes in a special bag for washing delicate items.
Select a short wash programme without spin. The less time the shoes are in the washing machine the less time they will be exposed to possible knocks or excess water, which can damage them.
Use a moderate temperature and add Sanytol Disinfectant Stain Remover. This disinfectant additive, apart from removing the most stubborn stains, will help you finish the washing process, which will never be complete without good disinfection.
Bear in mind that while we do sports our feet sweat abundantly, and this sweat serves as food for the bacteria there may be in the shoes, thus causing the frequent appearance of a bad smell in the feet and in the footwear.
Let the shoes dry completely. If possible, drying should be done outdoors in the sun.
We recommend that you wash the laces with your laundry, or if you want to do it with the sports shoes, it is best to put them in another bag.
The insoles are always better washed by hand to prevent them from losing their shape and becoming useless.
If your shoes are not washable, follow these tips:

1.Brush off the remains of dirt and clean the outside with a damp cloth.
2.Remove the insoles. Wash them by hand and let them dry in the air.
3.Once dry, spray them with Sanytol shoe disinfectant to remove the bacteria and smells
4.Also spray the inside of the shoe before replacing the insoles
If you are always unsure about washing your sports shoes in the washing machine, we recommend you follow these tips step by step to leave them perfect. Remember that before storing and arranging your shoes, they must be clean and disinfected. We will thus reduce the chance of catching micro-organisms from their direct contact with the dirt on the street floor.'
           ,'blog-id3.jpg'
           ,GETDATE()
           ,GETDATE()
           ,3)
GO

INSERT INTO [dbo].[Blogs]
           ([title]
           ,[blogContent]
           ,[blogImage]
           ,[createDate]
           ,[lastUpdate]
           ,[employeeId])
     VALUES
           ('WHICH RUNNING SHOES TO CHOOSE?'
           ,'Running is one of the most easily accessible sports disciplines, which has a sensational effect not only on the physique but first and foremost on fitness, body performance and mental health. Almost anyone can do it, regardless of age, lifestyle or weight, and you need neither a gym membership nor special equipment. The only exception is good running shoes. Why invest in them? The right footwear will significantly increase your comfort and efficiency and, most importantly, help you avoid serious injury.

Contrary to appearances, its purchase does not have to involve a large expense. Among the thousands of proposals, we can find running shoes for up to PLN 200 or PLN 300, which will provide an optimal level of comfort and appropriate support. But how do you find the best model when the huge choice of footwear makes you feel overwhelmed? Just pay attention to a few considerations:

The weight of the runner  the heavier the runner, the more important good cushioning will be in running shoes. It relieves the joints and ligaments when the foot lands on the ground and adds energy to the rebound. And, as you know, the more you weigh, the greater the pressure during running.

Type of ground  different running shoes will work on a paved road and others on soft, marshy or boggy surfaces in the forest.

Exercise intensity  it will affect how quickly the footwear wears out. If you plan to run every day, high-quality models with soles made of premium abrasion-resistant rubber will be a good choice.'
		   ,'blog-id5.jpg'
           ,GETDATE()
           ,GETDATE()
           ,1)
GO

INSERT INTO [dbo].[Blogs]
           ([title]
           ,[blogContent]
           ,[blogImage]
           ,[createDate]
           ,[lastUpdate]
           ,[employeeId])
     VALUES
           ('EXPLORING THE REDESIGNED NEW BALANCE 1080V13: A COMPREHENSIVE REVIEW'
           ,'Today, our spotlight is on the recently revamped New Balance 1080v13. Well also draw comparisons with the Vongo V6 and touch on the New Balance More V4. Lace-up your shoes, and lets hit the ground running!

 



The 1080 Series: A Staple in New Balances Lineup
New Balances 1080 series stands as one of their most sought-after running shoe lines, serving as the flagship premium neutral daily trainer. Tailored for runners seeking versatility across various terrains and substantial mileage absorption, the 1080 series has also gained popularity among walkers and individuals who spend extended hours on their feet. Despite the dad shoe stereotype, New Balance has been elevating its style game, and the 1080v13 is no exception.

Comparisons: Vongo V6 and More V4

If youre eyeing stability, the Vongo V6 steps in as the 1080s stability counterpart. On the other hand, for those craving extra cushioning, the More V4 beckons. With the 1080v13s recent update, its positioned itself closer to the More V4, creating an intriguing dynamic in the New Balance lineup.

 

Price and Weight Breakdown
In terms of pricing, both the Vongo and the 1080 come in at $165, while the More surprisingly undercuts them at $150. Weight-wise, the Vongo is at 10.7oz, the More V4 at 10.5oz, and the 1080v13 has shed almost a full ounce, weighing in at 9.3ozan appreciable reduction for a more manageable daily trainer.



Stack Heights and Drop Differences
Delving into stack heights, the Vongo boasts 30mm in the heel with a 6mm drop, the More V4 goes up to 34mm with a 4mm drop, and the 1080v13 sports a redesigned 33mm heel with an updated 6mm drop. The increase in stack height for the 1080, accompanied by a weight decrease, marks a positive shift, offering runners more midsole support.'
           ,'blog-id4.jpg'
           ,GETDATE()
           ,GETDATE()
           ,3)
GO


