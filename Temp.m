function [output] = readTemp(s,command)

fprintf(s,command);  

output = fscanf(s,'%f');

end
