/*1)Αριθμός ταινιών ανά χρόνο*/
/*Η οπτικοποίση του ερωτήματος αυτού είναι στην φωτογραφία partb1.png*/

Select count(date_part('year',release_date)),date_part('year',release_date)
From Movies_Metadata
group by date_part('year',release_date)
order by date_part('year',release_date) asc;


/*2)Αριθμός ταινιών ανά είδος(genre)*/
/*Η οπτικοποίση του ερωτήματος αυτού είναι στην φωτογραφία partb2.png*/

Select count(genres),genres
From copymovies
Group By genres;

/*3)Αριθμός ταινιών ανά είδος(genre) και ανά χρόνο*/
/*Η οπτικοποίση του ερωτήματος αυτού είναι στην φωτογραφία partb3.png*/

Select count(genres), date_part('year',release_date),genres
From copymovies
Where date_part('year',release_date)=date_part('year',release_date)
Group by date_part('year',release_date), genres
Order by date_part('year',release_date) Desc;

/*4)Μέση βαθμολογία (rating) ανά είδος (ταινίας)*/
/*Η οπτικοποίση του ερωτήματος αυτού είναι στην φωτογραφία partb4.png*/

Select avg(cast(rating as float)),genres
From copymovies
Inner Join Ratings_Small
On movieId=id
Group By genres;

/*5)Αριθμός από ratings ανά χρήστη*/
/*Η οπτικοποίση του ερωτήματος αυτού είναι στην φωτογραφία partb5.png*/

select count(userid),userId
from ratings_small
group by userid
order by userid;

/*6)Μέση βαθμολογία (rating) ανά χρήστη*/
/*Η οπτικοποίση του ερωτήματος αυτού είναι στην φωτογραφία partb6.png*/

select avg(cast(rating as float)),userid
from ratings_small
group by userid
order by userid;



Create View partBView As(
Select userId, avg(cast(rating as float)) as userRatingsAVG ,count(userid) as totalUserRatings
From Ratings_Small
Group By userid
Order By userid ASC);

/*Το insight είναι γραμμένο στο ReportB.pdf*/