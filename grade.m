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

## grade

## Author: az <az@az-zeus>
## Created: 2012-05-11

function [ ret ] = grade (mesta, pop)
	popSize = size(pop, 1);
	grd = [zeros(popSize, 1), pop];
	for i=1:popSize
		dst = tripLength(mesta, pop(i, :));
		grd(i, 1) = dst;
	end
	ret = sortrows(grd);
endfunction
