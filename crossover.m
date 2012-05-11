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

## crossover

## Author: az <az@az-zeus>
## Created: 2012-05-11

function [ offspring ] = crossover (parents, pCross)
	
	nParents = size(parents, 1);	

	offspring =[];

	for i=2:2:nParents
		A = parents(i-1,:);
		B = parents(i, :);
		if(rand(1) < pCross)
			offspring = [offspring; crossover2(A, B); crossover2(B, A)];
		else
			offspring = [offspring; A; B];
		end
				
	end

endfunction
