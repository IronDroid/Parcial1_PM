select materia, count(nota) 
from notas 
where nota > 50 
group by materia;