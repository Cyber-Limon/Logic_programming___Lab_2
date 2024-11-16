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
	
	menu :- write("--> ������� 1   -  ��������� ��"), nl,
		write("--> ������� 2   -  �������� ������ � ��"), nl,
		write("--> ������� 3   -  �������� ������ � ��"), nl,
		write("--> ������� 4   -  ������� ������ �� ��"), nl,
		write("--> ������� 5   -  �������"), nl,
		write("--> ������� 6   -  �������"), nl,
		write("--> ������� 7   -  ����"), nl,
		write("--> ������� 8   -  ����"), nl,
		write("--> ������� 9   -  ���"), nl,
		write("--> ������� 10 -  ����"), nl,
		write("--> ������� 11 -  ����"), nl,
		write("--> ������� 12 -  ������"), nl,
		write("--> ������� 13 -  ������"), nl,
		write("--> ������� 14 -  ������"), nl,
		write("--> ������� 15 -  �������"), nl,
		write("--> ������� 16 -  �������"), nl,
		write("--> ������� 17 -  ����"), nl,
		write("--> ������� 18 -  ����"), nl,
		write("--> ������� 19 -  ���������"), nl,
		write("--> ������� 20 -  ����������"), nl,
		write("--> ������� 21 -  ������"), nl,
		write("--> ������� 22 -  �������"), nl,
		write("--> ������� 23 -  ���� ������ ���������"), nl,
		write("--> ������� 24 -  ��������"), nl,
		write("--> ������� 25 -  �������"), nl,
		write("--> ������� 26 -  �����"), nl, nl,
		
		input(X), nl, process(X).
	
	process(1) :- save("C:\\VIP52\\BIN\\WIN\\32\\relatives1.dba"), menu.
	
	process(2) :- write("������� ��� ��������: "), inputH(X1), write("������� ��� ��������: "), inputH(Y1), addHuman(X1, Y1), 
		      write("������� ��� �������: "), inputH(X2), write("������� ��� �������: "), inputH(Y2), nl, addHuman(X2, Y2), addRelat(X1, X2), menu.
	
	process(3) :- write("������� ������ ��� ��������: "), inputH(X), write("������� ����� ��� ��������: "), inputH(Y), nl, changeHuman(X,Y), changeRelat(X,Y), menu; menu.
	
	process(4) :- write("������� ��� ��������: "), inputH(X), nl, deleteHuman(X), deleteRelat(X), menu; menu.
	
	process(5) :- write("������� ���: "), inputH(X), male(X), write("\n�������� �������\n\n"), menu; write("\n�� �������� �������\n\n"), menu.

	process(6) :- write("������� ���: "), inputH(X), female(X), write("\n�������� �������\n\n"), menu; write("\n�� �������� �������\n\n"), menu.
	
	process(7) :- write("������� ��� ����: "), inputH(X), write("������� ��� �������: "), inputH(Y), father(X,Y), 
		      write("\n�������� �����\n\n"), menu; write("\n�� �������� �����\n\n"), menu.
	
	process(8) :- write("������� ��� ������: "), inputH(X), write("������� ��� �������: "), inputH(Y), mother(X,Y), 
	              write("\n�������� �������\n\n"), menu; write("\n�� �������� �������\n\n"), menu.
			
	process(9) :- write("������� ��� ����: "), inputH(X), write("������� ��� ��������: "), inputH(Y), son(X,Y), 
	              write("\n�������� �����\n\n"), menu; write("\n�� �������� �����\n\n"), menu.
	
	process(10) :- write("������� ��� ������: "), inputH(X), write("������� ��� ��������: "), inputH(Y), daughter(X,Y), 
	               write("\n�������� �������\n\n"), menu; write("\n�� �������� �������\n\n"), menu.
	
	process(11) :- write("������� ��� �����: "), inputH(X), write("������� ��� ����� ��� ������: "), inputH(Y), brother(X,Y), 
	               write("\n�������� ������\n\n"), menu; write("\n�� �������� ������\n\n"), menu.
	
	process(12) :- write("������� ��� ������: "), inputH(X), write("������� ��� ����� ��� ������: "), inputH(Y), sister(X,Y), 
	               write("\n�������� �������\n\n"), menu; write("\n�� �������� �������\n\n"), menu.
	
	process(13) :- write("������� ��� �����: "), inputH(X), write("������� ��� �����: "), inputH(Y), brothers(X,Y), 
	               write("\n�������� ��������\n\n"), menu; write("\n�� �������� ��������\n\n"), menu.
	
	process(14) :- write("������� ��� ������: "), inputH(X), write("������� ��� ������: "), inputH(Y), sisters(X,Y), 
	               write("\n�������� ��������\n\n"), menu; write("\n�� �������� ��������\n\n"), menu.
	
	process(15) :- write("������� ��� �������: "), inputH(X), write("������� ��� ����� ��� ������: "), inputH(Y), grandfather(X,Y), 
	               write("\n�������� ��������\n\n"), menu; write("\n�� �������� ��������\n\n"), menu.
	
	process(16) :- write("������� ��� �������: "), inputH(X), write("������� ��� ����� ��� ������: "), inputH(Y), grandmother(X,Y), 
	               write("\n�������� ��������\n\n"), menu; write("\n�� �������� ��������\n\n"), menu.
	
	process(17) :- write("������� ��� ����: "), inputH(X), write("������� ��� ���������� ��� ����������: "), inputH(Y), uncle(X,Y), 
	               write("\n�������� �����\n\n"), menu; write("\n�� �������� �����\n\n"), menu.
	
	process(18) :- write("������� ��� ����: "), inputH(X), write("������� ��� ���������� ��� ����������: "), inputH(Y), aunt(X,Y), 
	               write("\n�������� �����\n\n"), menu; write("\n�� �������� �����\n\n"), menu.
	
	process(19) :- write("������� ��� ����������: "), inputH(X), write("������� ��� ���� ��� ����: "), inputH(Y), nephew(X,Y), 
	               write("\n�������� �����������\n\n"), menu; write("\n�� �������� �����������\n\n"), menu.
	
	process(20) :- write("������� ��� ����������: "), inputH(X), write("������� ��� ���� ��� ����: "), inputH(Y), niece(X,Y), 
	               write("\n�������� �����������\n\n"), menu; write("\n�� �������� �����������\n\n"), menu.
	
	process(21) :- write("������� ��� ������: "), inputH(X), write("������� ��� �������: "), inputH(Y), ancestor(X,Y), 
	               write("\n�������� �������\n\n"), menu; write("\n�� �������� �������\n\n"), menu.
	
	process(22) :- write("������� ��� �������: "), inputH(X), write("������� ��� ������: "), inputH(Y), offspring(X,Y), 
	               write("\n�������� ��������\n\n"), menu; write("\n�� �������� ��������\n\n"), menu.
	
	process(23) :- write("������� ��� ��������: "), inputH(X), write("������� ��� ��������: "), inputH(Y), odnogodok(X,Y), 
	               write("\n�������� ������ ������ ���������\n\n"), menu; write("\n�� �������� ������ ������ ���������\n\n"), menu.
		
	process(24) :- write("������� ��� ���������: "), inputH(X), adult(X), write("\n�������� ��������\n\n"), menu; write("\n�� �������� ��������\n\n"), menu.

	process(25) :- write("������� ��� �������: "), inputH(X), child(X), write("\n�������� ��������\n\n"), menu; write("\n�� �������� ��������\n\n"), menu.
	
	process(26):-nl,nl, write("�����!"), exit.
goal
	consult("C:\\VIP52\\BIN\\WIN\\32\\relatives.dba"), menu.
