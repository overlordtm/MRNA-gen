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

## tripLength

## Author: az <az@az-zeus>
## Created: 2012-05-11

function d = tripLength(mesta, trip)
	d = 0;
	n = size(trip,2);
	for i=2:n
		d = d + distanceFromTo(mesta, trip(i-1), trip(i));	
	end
	d = d + distanceFromTo(mesta, trip(n), trip(1));
endfunction

function d = distanceFromTo(mesta, i, j)
	a = mesta(i,:);
	b = mesta(j,:);
	d = norm(a-b);
endfunction
