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

## selectParents

## Author: az <az@az-zeus>
## Created: 2012-05-11

function [ parents ] = selectParents (grade, method)
	
	# turnirska izbira
	pairs = randperm(size(grade,1));

	parents = [];

	if strcmpi(method, 'roulette')
		n = size(grade, 1);
		total = sum(grade(:,1));
		cumSum = cumsum(grade(:, 1));
		rr = rand(size(grade, 1), 2) .* total;
		
		for i=1:n
			idx1 = find(cumSum > rr(1))(1);
			idx2 = find(cumSum > rr(2))(1);
			parents = [parents; grade(idx1, 2:end); grade(idx2, 2:end)];
		end

	elseif strcmpi(method, 'grade')

		for i=2:2:size(pairs,2)
			if (grade(i-1, 1) < grade(i, 1))
				parents = [parents; grade(i-1, 2:end)];
			else
				parents = [parents; grade(i, 2:end)];
			end
		end

	elseif strcmpi(method, 'tournament')
		n = size(grade, 1);
		
		for i=1:n
			j = ceil(rand(1)*n);
			if grade(i,1) > grade(j, 1)
				parents = [parents; grade(i, 2:end)];
			else
				parents = [parents; grade(j, 2:end)];
			endif
		end	

	elseif strcmpi(method, 'rang')
		n = size(grade, 1);
		grade(:, 1) = n:-1:1;
		total = sum(1:n);
		cumSum = cumsum(grade(:, 1));
		rr = rand(size(grade, 1), 2) .* total;
		
		for i=1:n
			idx1 = find(cumSum > rr(1))(1);
			idx2 = find(cumSum > rr(2))(1);
			parents = [parents; grade(idx1, 2:end); grade(idx2, 2:end)];
		end

	endif
endfunction
