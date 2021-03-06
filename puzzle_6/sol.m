grid = zeros(1000,1000);
fileID = fopen('input.txt','r');
figure;

line = fgetl(fileID);

while ischar(line)
    C = strsplit(line,{',',' '});

    if size(C,2) > 6
        % turn on or off C(3),C(4) thru C(6),C(7)
        if strcmp(C(2),'off')
            val = -1;
        elseif strcmp(C(2),'on')
            val = 1;
        end
        grid = turn(grid, [str2num(char(C(3))),str2num(char(C(4)))], [str2num(char(C(6))),str2num(char(C(7)))], val);
    elseif size(C,2) > 5
        % toggle C(2),C(3) thru C(5),C(6)
        grid = toggle(grid, [str2num(char(C(2))),str2num(char(C(3)))], [str2num(char(C(5))),str2num(char(C(6)))]);
    end

    % To visualize the progress, uncomment:
    imagesc(grid);
    pause(0.1);

    line = fgetl(fileID);
end

% Final number of lights on:
display(sum(sum(grid)));

