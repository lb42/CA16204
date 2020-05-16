select genres.genre_name,genres_titles.title_id from genres, genres_titles where genres_titles.genre_id = genres.genre_id order by genres_titles.title_id;

 select eltec_titles.eltec_id,  genres_titles.title_id , genres.genre_name from eltec_titles, genres, genres_titles where genres_titles.title_id = eltec_titles.title_id and genres_titles.genre_id = genres.genre_id order by genres.genre_name;
