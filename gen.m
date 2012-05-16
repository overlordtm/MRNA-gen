## Copyright (C) 2012 az
## 
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 2 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with Octave; see the file COPYING.  If not, see
## <http://www.gnu.org/licenses/>.

## gen

## Author: az <az@az-zeus>
## Created: 2012-05-11

function [ dist best all ] = gen ()

	popSize = 50;
	pCross = 0.95;
	pMutt = 0.1;

	mesta = load("mesta");

	pop = population(mesta, popSize);

	n = 0;

	hist = [];

	while(n < 1500)
		# ocena vseh osebkov
		grd = grade(mesta, pop);

		hist= [hist grd(1,1)];

		# izbira starsev
		parents = selectParents(grd, 'tournament');

		# krizanje
		offspring = crossover(parents, pCross);
		
		# mutacija
		for i=1:size(offspring,1)
			muttant =  muttate(offspring(i, :), pMutt, 'swap');
			if isvalid(muttant) == 0
				disp("mutacia proizvedla invalida")
			else 
				offspring(i, :) = muttate(offspring(i, :), pMutt, 'swap');
			endif
		end
	
		# izbor nove populacije
		pop = selection(mesta, popSize, pop, offspring, "best");
		n++;
	end

	clf
	plot(hist);
	all = grade(mesta, pop);
	dist = all(1, 1);
	best = all(1,:);
endfunction
