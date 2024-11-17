domains
	name = symbol 
database
	nondeterm human(name, name)
	nondeterm parent(name, name)
predicates
	nondeterm male(name)
	nondeterm female(name)
	nondeterm father(name, name)
	nondeterm mother(name, name) 
	nondeterm son(name, name)
	nondeterm daughter(name, name)
	nondeterm brother(name, name)
	nondeterm sister(name, name)
	nondeterm brothers(name, name)
	nondeterm sisters(name, name)
	nondeterm grandfather(name, name)
	nondeterm grandmother(name, name)
	nondeterm uncle(name, name)
	nondeterm aunt(name, name)
	nondeterm nephew(name, name)
	nondeterm niece(name, name)
	nondeterm ancestor(name, name)
	nondeterm offspring(name, name)
	nondeterm odnogodok(name, name)
	nondeterm adult(name)
	nondeterm child(name)
	nondeterm sibling(name, name)
	nondeterm odnogodokS(name, name)
	nondeterm odnogodokC(name, name)
	nondeterm odnogodokP(name, name)

	nondeterm menu
	nondeterm input(integer)
	nondeterm inputH(name)
	nondeterm process(integer)
 
	nondeterm addHuman(name, name)
	nondeterm addRelat(name, name) 
	nondeterm changeHuman(name, name)
	nondeterm changeRelat(name, name)
	nondeterm deleteHuman(name)
	nondeterm deleteRelat(name)
clauses
	male(Y) :- human(Y,m).
	female(X) :- human(X,f).
 
	father(X,Y) :- parent(X,Y), male(X).
	mother(X,Y) :- parent(X,Y), female(X).
 
	son(X,Y) :- parent(Y,X), male(X).
	daughter(X,Y) :- parent(Y,X), female(X).
 
	brother(X,Y) :- parent(Z,X), parent(Z,Y), male(X), X <> Y. 
	sister(X,Y) :- parent(Z,X), parent(Z,Y), female(X), X <> Y. 
 
	brothers(X,Y) :- brother(X,Y), male(Y).
	sisters(X,Y) :- sister(X,Y), female(Y).
 
	grandfather(X,Y) :- father(X,Z), parent(Z,Y).
	grandmother(X,Y) :- mother(X,Z), parent(Z,Y).
 
	uncle(X,Y) :- brother(X,Z), parent(Z,Y).
	aunt(X,Y) :- sister (X,Z), parent(Z,Y).
 
	nephew(X,Y) :- son(X,Z), brother(Y,Z); son(X,Z), sister(Y,Z).
	niece(X,Y) :- daughter(X,Z), brother(Y,Z); daughter(X,Z), sister(Y,Z).
 
	ancestor(X,Y) :- parent(X,Y).
	ancestor(X,Y) :- parent(X,Z), ancestor(Z,Y).
 
	offspring(X,Y) :- ancestor(Y,X).
 
	sibling(X,Y) :-  brother(X,Y), X <> Y; sister(X,Y), X <> Y.
 
	odnogodokS(X,Y) :- sibling(X,Y).
	odnogodokS(X,Y) :- sibling(Z,T), parent(Z,X), parent(T,Y), X <> Y.
	odnogodokS(X,Y) :- parent(X,Z), parent(T,Z), sibling(T,Y), X <> Y.
	odnogodokS(X,Y) :- parent(T,Z), parent(Y,Z), sibling(T,X), X <> Y.
	odnogodokS(X,Y) :- parent(W,Z), parent(T,Z), sibling(W,X), sibling(T,Y), X <> Y.
	odnogodokC(X,Y) :- parent(Z,X), parent(T,Y), odnogodokS(Z,T), X <> Y.
	odnogodokP(X,Y) :- parent(X,Z), parent(Y,T), odnogodokS(Z,T), X <> Y.
	odnogodok(X,Y) :- odnogodokS(X,Y); odnogodokC(X,Y); odnogodokP(X,Y).
   
	adult(X) :- parent(X,_); odnogodok(X,Y), parent(Y,_).
   
	child(X) :- not (adult(X)).



	input(X) :- readint(X).
 
	inputH(X) :- readln(X).
 
 
  
	addHuman(Name, Gender) :- human(Name, Gender). 
	addHuman(Name, Gender) :- assertz(human(Name, Gender)).
 
	addRelat(Parent, Child) :- parent(Parent, Child).
	addRelat(Parent, Child) :- assertz(parent(Parent, Child)). 
 
 
 
    changeHuman(Name1, Name2) :- retract(human(Name1, Gender)), assertz(human(Name2, Gender)).
 
 	changeRelat(Name1, Name2) :- retract(parent(Name1, Child)), assertz(parent(Name2, Child)), fail.
  	changeRelat(Name1, Name2) :- retract(parent(Parent, Name1)), assertz(parent(Parent, Name2)), fail.
  
 
 
	deleteHuman(Name) :- retract(human(Name,_)).
 
	deleteRelat(Parent) :- retract(parent(Parent, _)), fail.
	deleteRelat(Child) :- retract(parent(_, Child)), fail.


 
	menu :- write("--> Нажмите 1  - Сохранить БД"), nl,
		write("--> Нажмите 2  - Добавить данные в БД"), nl,
    		write("--> Нажмите 3  - Изменить данные в БД"), nl,
		write("--> Нажмите 4  - Удалить данные из БД"), nl,
		write("--> Нажмите 5  - Мужской"), nl,
		write("--> Нажмите 6  - Женский"), nl,
		write("--> Нажмите 7  - Отец"), nl,
		write("--> Нажмите 8  - Мать"), nl,
		write("--> Нажмите 9  - Сын"), nl,
		write("--> Нажмите 10 - Дочь"), nl,
		write("--> Нажмите 11 - Брат"), nl,
		write("--> Нажмите 12 - Сестра"), nl,
		write("--> Нажмите 13 - Братья"), nl,
		write("--> Нажмите 14 - Сестры"), nl,
		write("--> Нажмите 15 - Дедушка"), nl,
		write("--> Нажмите 16 - Бабушка"), nl,
		write("--> Нажмите 17 - Дядя"), nl,
		write("--> Нажмите 18 - Тетя"), nl,
		write("--> Нажмите 19 - Племянник"), nl,
		write("--> Нажмите 20 - Племянница"), nl,
		write("--> Нажмите 21 - Предок"), nl,
		write("--> Нажмите 22 - Потомок"), nl,
		write("--> Нажмите 23 - Люди одного поколения"), nl,
		write("--> Нажмите 24 - Взрослый"), nl,
		write("--> Нажмите 25 - Ребенок"), nl,
		write("--> Нажмите 26 - Выход"), nl, nl,


  
 	input(X), nl, process(X).
 
    	process(1) :- save("C:\\VIP52\\BIN\\WIN\\32\\relatives1.dba"), menu.
 
 	process(2) :- write("Введите имя родителя: "), inputH(X1), write("Введите пол родителя: "), inputH(Y1), addHuman(X1, Y1), 
        	      write("Введите имя ребенка: "), inputH(X2), write("Введите пол ребенка: "), inputH(Y2), nl, addHuman(X2, Y2), addRelat(X1, X2), menu.
 
 	process(3) :- write("Введите старое имя человека: "), inputH(X), write("Введите новое имя человека: "), inputH(Y), nl, changeHuman(X,Y), changeRelat(X,Y), menu; menu.
 
 	process(4) :- write("Введите имя человека: "), inputH(X), nl, deleteHuman(X), deleteRelat(X), menu; menu.
 
 	process(5) :- write("Введите имя: "), inputH(X), male(X), write("\nЯвляется мужским\n\n"), menu; write("\nНе является мужским\n\n"), menu.

 	process(6) :- write("Введите имя: "), inputH(X), female(X), write("\nЯвляется женским\n\n"), menu; write("\nНе является женским\n\n"), menu.
 
 	process(7) :- write("Введите имя отца: "), inputH(X), write("Введите имя ребенка: "), inputH(Y), father(X,Y), 
        	      write("\nЯвляется отцом\n\n"), menu; write("\nНе является отцом\n\n"), menu.
 
 	process(8) :- write("Введите имя матери: "), inputH(X), write("Введите имя ребенка: "), inputH(Y), mother(X,Y), 
                      write("\nЯвляется матерью\n\n"), menu; write("\nНе является матерью\n\n"), menu.
   
 	process(9) :- write("Введите имя сына: "), inputH(X), write("Введите имя родителя: "), inputH(Y), son(X,Y), 
                      write("\nЯвляется сыном\n\n"), menu; write("\nНе является сыном\n\n"), menu.
 
 	process(10) :- write("Введите имя дочери: "), inputH(X), write("Введите имя родителя: "), inputH(Y), daughter(X,Y), 
                       write("\nЯвляется дочерью\n\n"), menu; write("\nНе является дочерью\n\n"), menu.
 
 	process(11) :- write("Введите имя брата: "), inputH(X), write("Введите имя брата или сестры: "), inputH(Y), brother(X,Y), 
                       write("\nЯвляется братом\n\n"), menu; write("\nНе является братом\n\n"), menu.
 
 	process(12) :- write("Введите имя сестры: "), inputH(X), write("Введите имя брата или сестры: "), inputH(Y), sister(X,Y), 
                       write("\nЯвляется сестрой\n\n"), menu; write("\nНе является сестрой\n\n"), menu.
 
 	process(13) :- write("Введите имя брата: "), inputH(X), write("Введите имя брата: "), inputH(Y), brothers(X,Y), 
                       write("\nЯвляются братьями\n\n"), menu; write("\nНе являются братьями\n\n"), menu.
 
 	process(14) :- write("Введите имя сестры: "), inputH(X), write("Введите имя сестры: "), inputH(Y), sisters(X,Y), 
                       write("\nЯвляются сестрами\n\n"), menu; write("\nНе являются сестрами\n\n"), menu.
 
 	process(15) :- write("Введите имя дедушки: "), inputH(X), write("Введите имя внука или внучки: "), inputH(Y), grandfather(X,Y), 
                       write("\nЯвляется дедушкой\n\n"), menu; write("\nНе является дедушкой\n\n"), menu.
 
 	process(16) :- write("Введите имя бабушки: "), inputH(X), write("Введите имя внука или внучки: "), inputH(Y), grandmother(X,Y),
		       write("\nЯвляется бабушкой\n\n"), menu; write("\nНе является бабушкой\n\n"), menu.
 
 	process(17) :- write("Введите имя дяди: "), inputH(X), write("Введите имя племянника или племянницы: "), inputH(Y), uncle(X,Y), 
                       write("\nЯвляется дядей\n\n"), menu; write("\nНе является дядей\n\n"), menu.
 
 	process(18) :- write("Введите имя тети: "), inputH(X), write("Введите имя племянника или племянницы: "), inputH(Y), aunt(X,Y), 
                       write("\nЯвляется тетей\n\n"), menu; write("\nНе является тетей\n\n"), menu.
 
	process(19) :- write("Введите имя племянника: "), inputH(X), write("Введите имя дяди или тети: "), inputH(Y), nephew(X,Y), 
                       write("\nЯвляется племянником\n\n"), menu; write("\nНе является племянником\n\n"), menu.
 
	process(20) :- write("Введите имя племянницы: "), inputH(X), write("Введите имя дяди или тети: "), inputH(Y), niece(X,Y), 
                       write("\nЯвляется племянницей\n\n"), menu; write("\nНе является племянницей\n\n"), menu.
 
	process(21) :- write("Введите имя предка: "), inputH(X), write("Введите имя потомка: "), inputH(Y), ancestor(X,Y), 
                       write("\nЯвляется предком\n\n"), menu; write("\nНе является предком\n\n"), menu.
 
	process(22) :- write("Введите имя потомка: "), inputH(X), write("Введите имя предка: "), inputH(Y), offspring(X,Y), 
                       write("\nЯвляется потомком\n\n"), menu; write("\nНе является потомком\n\n"), menu.
 
	process(23) :- write("Введите имя человека: "), inputH(X), write("Введите имя человека: "), inputH(Y), odnogodok(X,Y), 
                       write("\nЯвляются людьми одного поколения\n\n"), menu; write("\nНе являются людьми одного поколения\n\n"), menu.
  
	process(24) :- write("Введите имя взрослого: "), inputH(X), adult(X), write("\nЯвляется взрослым\n\n"), menu; write("\nНе является взрослым\n\n"), menu.

	process(25) :- write("Введите имя ребенка: "), inputH(X), child(X), write("\nЯвляется ребенком\n\n"), menu; write("\nНе является ребонком\n\n"), menu.
 
	process(26) :- nl,nl, write("Конец!"), exit.
goal
	consult("C:\\VIP52\\BIN\\WIN\\32\\relatives.dba"), menu.
