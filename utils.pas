unit utils;

{$mode objfpc}   
{$H+}           { long strings }

interface

uses
	SysUtils;



function Clamp(x, min_val, max_val: Double): Double;
function ToColor(v: Double): Integer;
function WriteColor(v: TVector3): TVector3;

implementation

function Clamp(x, min_val, max_val: Double): Double;
begin
	if x < min_val then
		Clamp := min_val
	else if x > max_val then
		Clamp := max_val
	else
		Clamp := x;
end;

function ToColor(v: Double): Integer;
begin 
	ToColor := Round(Clamp(v, 0.0, 1.0) * 255);
end;

end. {utils}
