with Ada.Text_IO;
with Ada.Command_Line;

procedure Main is
begin
   Ada.Text_IO.Put_Line (Ada.Text_IO.Standard_Error, "Logs from your program will appear here!");

   -- TODO: Uncomment the code below to pass the first stage
   -- Ada.Text_IO.Put_Line("TODO: Implement starter code\n");

   Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Success);
end Main;
