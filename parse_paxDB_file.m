%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function goal is to parse pax db file. 
% files can be downloaded from: https://pax-db.org/download.
% 
% INPUT:	paxDB_file_nm: paxDB file name
% 
% OUTPUT: 	PA_table: hold set of genes sorted alphabetically 
%           and their protein abundance level.
% 
% EXAMPLE:  
%    for E. coli:
%    [PA_table] = pars_paxDB_file('511145-WHOLE_ORGANISM-integrated.txt')  
%           
% @ Maya Galili. Dec 2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [PA_table] = parse_paxDB_file(paxDB_file_nm)

% read PA file
PA_table = readtable(paxDB_file_nm);
PA_table.x_internal_id=[];

% parse gene names
PA_table.string_external_id=regexprep(PA_table.string_external_id, '\d*\.', '');

% sort by genes names
PA_table = sortrows(PA_table,'string_external_id');
end
