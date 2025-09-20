unit vec3;

{$mode objfpc}   
{$H+}           

interface

type
  TVector3 = class
  public
    x, y, z: Double;

    constructor Create(ax, ay, az: Double);
    function Length: Double;
    procedure Normalize;
    function Add(v: TVector3): TVector3;
    function Scale(f: Double): TVector3;
    procedure Print;
  end;

implementation

uses
  Math;  { for Sqrt }

constructor TVector3.Create(ax, ay, az: Double);
begin
  x := ax;
  y := ay;
  z := az;
end;

function TVector3.Length: Double;
begin
  Length := Sqrt(x*x + y*y + z*z);
end;

procedure TVector3.Normalize;
var
  len: Double;
begin
  len := Length;
  if len <> 0 then
  begin
    x := x / len;
    y := y / len;
    z := z / len;
  end;
end;

function TVector3.Add(v: TVector3): TVector3;
begin
  Add := TVector3.Create(x + v.x, y + v.y, z + v.z);
end;

function TVector3.Scale(f: Double): TVector3;
begin
  Scale := TVector3.Create(x * f, y * f, z * f);
end;

procedure TVector3.Print;
begin
  writeln('(', x:0:2, ', ', y:0:2, ', ', z:0:2, ')');
end;

end.  { Vector3 unit }

