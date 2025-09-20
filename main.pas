program RayTrace;
uses 
	SysUtils,
	utils,
	vec3;

const 
  width = 400;
  height = 400;
  grid_spacing=40;

var 
  i,j: Integer;
  r,g,b: Integer;
	final_color: specialize TVector3<Double>;
	rgb: specialize TVector3<LongInt>;
  f: TextFile;


begin
  Assign(f, 'uv_test.ppm');
  Rewrite(f);
  writeln(f, 'P3');           { ASCII PPM format }
  writeln(f, width, ' ', height);
  writeln(f, 255);            { max color value }
  { Generate UV grid }
  for j := 0 to height - 1 do
  begin
    for i := 0 to width - 1 do
    begin
				final_color := specialize TVector3<Double>.Create((Double(i) / Double(width - 1)), (Double(j) / Double(height - 1)), 0);
        // r := Round((Double(i) / Double(width - 1))* Double(255));
        // g := Round((Double(j) / Double(height - 1)) * Double(255));
        // b := 0;
				rgb := WriteColor(final_color);
      write(f, rgb.x, ' ', rgb.y, ' ', rgb.z, ' ');
    end;
    writeln(f);  { end of row }
  end;
  Close(f);
  writeln('UV grid PPM image generated as uv_grid.ppm');
end.

