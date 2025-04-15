function [u2d, x2d, y2d] = create2darray(x, y, u, delx, dely)
% It maps the coordinates and field values to a rectangular grid.
% Used for plotting.
%
%
% Copyright (C) 2018, Ozlem Ozgun, Mustafa Kuzuoglu
%
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.

% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.
%    
% Contact:
% Dr. Ozlem Ozgun
% email: ozgunozlem@gmail.com
% web: http://www.ee.hacettepe.edu.tr/~ozlem/

Nnode = length(x);

minx = min(x);
maxx = max(x);
miny = min(y);
maxy = max(y);

dx = abs(maxx-minx);
dy = abs(maxy-miny);
cx = .9; cy = .9;
nx = round(cx*dx/delx)+1;
ny = round(cy*dy/dely)+1;
x2d  = linspace(minx, maxx, nx);
y2d  = linspace(miny, maxy, ny);       

u2d = ones(ny,nx);
u2dt = zeros(ny,nx);

for i = 1:Nnode
    [~, indx] = min(abs(x2d-x(i)));
    [~, indy] = min(abs(y2d-y(i)));
    
    u2d(indy, indx) = u(i);
    u2dt(indy, indx) = u(i);
end

nx = size(u2d,1);
ny = size(u2d,2);

for i = 1:nx
    for j = 1:ny
        if u2d(i,j) == 1           
           if i == 1
              u2d(i,j) = u2dt(i+1,j);
            elseif i == nx
              u2d(i,j) = u2dt(i-1,j); 
            else
                 u2d(i,j) = 0.5*(u2dt(i+1,j)+u2dt(i-1,j));
           end
        end
    end
end