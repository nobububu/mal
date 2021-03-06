function step1_read_print(varargin), main(varargin), end

% read
function ret = READ(str)
    ret = reader.read_str(str);
end

% eval
function ret = EVAL(ast, env)
    ret = ast;
end

% print
function ret = PRINT(ast)
    ret = printer.pr_str(ast, true);
end

% REPL
function ret = rep(str, env)
    ret = PRINT(EVAL(READ(str), env));
end

function main(args)
    %cleanObj = onCleanup(@() disp('*** here1 ***'));
    while (true)
        line = input('user> ', 's');
        if strcmp(strtrim(line),''), continue, end
        try
            fprintf('%s\n', rep(line, ''));
        catch err
            fprintf('Error: %s\n', err.message);
            %fprintf('%s\n', getReport(err, 'extended'));
            fprintf('%s\n', lasterror(err).stack.file);
        end
    end
end
main(argv());
