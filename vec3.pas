unit vec3;

{$mode objfpc}   
{$H+}           

interface

type
  generic TVector3<T> = class
  public
    x, y, z: T;
    constructor Create(ax, ay, az: T);
    function Length: Double;
    function Normalize: specialize TVector3<Double>;
    function Add(v: specialize TVector3<T>): specialize TVector3<T>;
    function Scale(f: Double): specialize TVector3<Double>;
    procedure Print;
  end;

implementation

uses
  Math;  { for Sqrt }

constructor TVector3.Create(ax, ay, az: T);
begin
  x := ax;
  y := ay;
  z := az;
end;

function TVector3.Length: Double;
begin
  Length := Sqrt(x*x + y*y + z*z);
end;

function TVector3.Normalize: specialize TVector3<Double>;
var
  len: Double;
begin
  len := Sqrt(x*x + y*y + z*z);  { cast T to Double automatically }
  if len <> 0 then
    Normalize := specialize TVector3<Double>.Create(x/len, y/len, z/len)
  else
    Normalize := specialize TVector3<Double>.Create(0,0,0);
end;

function TVector3.Add(v: specialize TVector3<T>): specialize TVector3<T>;
begin
  Add := specialize TVector3<T>.Create(x + v.x, y + v.y, z + v.z);
end;

function TVector3.Scale(f: Double): specialize TVector3<Double>;
begin
  Scale := specialize TVector3<Double>.Create(x * f, y * f, z * f);
end;

procedure TVector3.Print;
begin
  writeln('(', x, ', ', y, ', ', z, ')');
end;

end.  { Vector3 unit }

