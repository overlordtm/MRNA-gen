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

## muttate

## Author: az <az@az-zeus>
## Created: 2012-05-11

function [ M ] = muttate (A, pMutt, method)

	if nargin() < 3
		method = 'swap';
	endif

	
	if (rand(1) < pMutt)
		
		siz = size(A, 2);
		
		if strcmpi(method, 'inversion')
			r = randperm(42);
			start = min(r(1:2));
			stop = max(r(1:2));
			# inversion muttation
			if (start != 1 && stop != siz)
				M = [A(1:start-1) fliplr(A(start:stop)) A(stop+1:siz)];
				#if isvalid(M) == 0
				#	disp("nacin 1")
				#endif
			elseif (start == 1)
				M = [fliplr(A(1:stop)) A(stop+1:siz)];
				#if isvalid(M) == 0
				#	disp("nacin 2")
				#endif
			elseif (stop == siz)
				M = [A(1:start-1) fliplr(A(start:siz))];
				#if isvalid(M) == 0
				#	disp("nacin 3")
				#endif
			endif
		elseif strcmpi(method, 'swap')
			# swap muttation
			a = ceil(rand(1) * siz);
			b = ceil(rand(1) * siz);
			M = A;
			M(a) = A(b);
			M(b) = A(a);
		
		elseif strcmpi(method, 'insert')
			# insert muttaion
		
			a = ceil((siz-2)*rand(1));
			b = a + ceil((siz-a-1)*rand(1)) + 1;
		
			if(b != siz)
				M = [A(1:a) A(b) A(a+1:b-1) A(b+1:siz) ];
			else
				M = [A(1:a) A(b) A(a+1:b-1) ];
			endif
		endif
	else
		M = A;
	endif

	if (isvalid(M) == 0)
		disp("mutacija naredila invalida")
	endif
	

endfunction
