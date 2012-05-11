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

function [ ret ] = gen ()

	popSize = 42;
	pCross = 0.95;
	pMutt = 0.01;

	mesta = load("mesta");

	pop = population(mesta, popSize);
	n = 0;
	while(n < 250)
		# ocena vseh osebkov
		grd = grade(mesta, pop);

		# izbira starsev
		parents = selectParents(grd);

		# krizanje
		offspring = crossover(parents, pCross);

		# mutacija
		for i=1:size(offspring,1)
			offspring(i, :) = muttate(offspring(i, :), pMutt);
		end
	
		# izbor nove populacije
		pop = selection(mesta, popSize, pop, offspring, "best");
		n++;
	end

	ret = grade(mesta, pop);
endfunction
