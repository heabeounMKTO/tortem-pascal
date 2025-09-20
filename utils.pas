unit utils;

{$mode objfpc}   
{$H+}           { long strings }

interface

uses
	SysUtils,
	vec3;



function Clamp(x, min_val, max_val: Double): Double;
function ToColor(v: Double): Integer;
function WriteColor(v: specialize TVector3<Double>): specialize TVector3<Integer>;

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

function WriteColor(v: specialize TVector3<Double>) : specialize TVector3<Integer>;
begin
	WriteColor := specialize TVector3<Integer>.Create(ToColor(v.x), ToColor(v.y), ToColor(v.z));	
end;


end. {utils}
