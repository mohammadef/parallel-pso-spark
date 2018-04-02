function save_data(cf_params, test_params, algo_params, opt_res, folder)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
% Save Data Generated by the Optimization Algorithm on the Given Optimization Function for all Tests.
%
% -------------------
% || INPUT  ||   <---
% -------------------
%   cf_params    <--- struct, parameters for the optimization function optimized
%   test_params  <--- struct, parameters for all tests
%   algo_params  <--- struct, parameters for the optimization algorithm selected
%   opt_res      <--- struct, optimization results returned
%   folder       <--- char, the folder name for saving all the data
%                     (default: the current working directory)
% -------------------
% || OUTPUT ||   --->
% -------------------
%   * save data into the external local file system *
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
iscell(opt_res);

switch nargin
    case 5
        if ~ischar(folder)
            error('Please correctly set the *folder* parameter -> ' + ...
                'it must be char.');
        end
    case 4
        folder = '.';
    otherwise
        error('Please correctly set all the parameters -> ' + ...
            'provide at least four parameters.');
end

data_folder = [folder '/' algo_params.algo_name '--' int2str(test_params.test_seed)];
if ~exist(data_folder, 'dir')
    mkdir(data_folder);
end
data_filename = sprintf('./%s/%s-%d-%s-%d.mat', ...
    data_folder, ...
    cf_params.func_name, cf_params.func_dim, ...
    algo_params.algo_name, algo_params.algo_fe_max);
save(data_filename, 'cf_params', 'test_params', 'algo_params', 'opt_res');
end