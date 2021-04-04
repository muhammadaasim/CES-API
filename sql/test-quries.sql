SELECT DISTINCT f.session AS "Session", f.sem_id AS "semester", s.fullname AS "student", ml.mark AS "marks", t.fullname AS 'teacher' FROM mark_ladger ml 
			INNER JOIN teacher t ON ml.t_id=t.id 
			INNER JOIN student s ON ml.std_id = s.id 
			INNER JOIN subjects sb ON ml.sub_id=sb.id
			INNER JOIN form f ON  ml.f_id=f.id
			INNER JOIN f_form_subject ffs ON ml.f_id=ffs.f_id