function [x] = pegboard(Nballs, Nlayers)
    %% Calculate a position of the ball after running inside the beg board
    % imagine a ball dropped on a nail
    %            o
    %            |
    %            |
    %            V
    %            *
    %           / \  50/50 chance to deflect left or right
    %          /   \ 
    %
    % now we make a peg board with Nlayers of nails and run Nballs 
    %            *
    %           * *
    %          * * *
    %         * * * *
    % the resulting distribution of final balls positions should be Gaussian
    x = zeros(1, Nballs);
    for b = 1:Nballs
        for i = 1:Nlayers
            if (rand() < .5)
                % bounce left
                x(b) = x(b) - 1;
            else
                % bounce right
                x(b) = x(b) + 1;
            end
        end
    end
end
