unit ray;

{$mode objfpc}
{$H+}

interface 
uses 
	SysUtils, 
	vec3;

type
	TRay = class;
	public
		origin, dir: TVector3<Double>;
		function at(t: Double): specialize TVector3<Double>;
	end;


end.
