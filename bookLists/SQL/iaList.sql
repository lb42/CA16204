 select eltec_titles.eltec_id, IA_titles.IA_id, IA_titles.title_key, eltec_titles.title_id from IA_titles, eltec_titles where eltec_titles.title_id = IA_titles.title_id and eltec_titles.title_id > 0;
