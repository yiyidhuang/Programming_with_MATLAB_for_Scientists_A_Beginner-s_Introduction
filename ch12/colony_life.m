Ncycles = 50;
Nmembers = 200;
Ndiseases = 4;

% diseases to number its index translation
death = 1;
hard_to_heal_weakly_contagious = 2;
easy_to_heal_very_contagious = 3;
alive = 4;

member_stat = zeros(1, Nmembers);
% let's make them all live
member_stat(:) = alive;

% here we will keep the map of disease spread
member_stat_map = zeros(Ncycles,Nmembers); 

% here we will death toll stats for each of the disease
killed_by_disease = zeros(Ncycles, Ndiseases); % so far no one is killed

% let's infect a few unlucky individuals
Ndiseased_hard_to_heal_weakly_contagious = 20;
for i = 1:Ndiseased_hard_to_heal_weakly_contagious
    m = ceil(Nmembers * rand());    % which member in the array
    member_stat(m) = hard_to_heal_weakly_contagious;
end

% note that below loop might overwrite one disease with another.
Ndiseased_easy_to_heal_very_contagious = 20;
for i = 1:Ndiseased_easy_to_heal_very_contagious
    m = ceil(Nmembers * rand());
    member_stat(m) = easy_to_heal_very_contagious;
end

% day one stats assignment
member_stat_map(1, :) = member_stat;    % first day situation recorded

for c = 2:Ncycles % on cycle one we just initialize the colony
    if c ~= 1
        killed_by_disease(c, :) = killed_by_disease(c - 1, :);  % accumulative count
    end
    % spread diseases
    for i = 1:Nmembers
        disease = member_stat(i);
        [self_acting_disease, ...
            infect_left_neighbor, ...
            infect_right_neighbor] = disease_outcome(disease);
        if (i - 1 >= 1)
            % we have left neighbor
            if (infect_left_neighbor == true)
                if (member_stat(i - 1) ~= death)
                    % only alive guys can catch a disease
                    member_stat(i - 1) = disease;
                end
            end
        end

        if (i + 1 <= Nmembers)
            % we have right neighbor
            if (infect_right_neighbor == true)
                if (member_stat(i + 1) ~= death)
                    % only alive guys can catch a disease
                    member_stat(i + 1) = disease;
                end
            end
        end

        if ((self_acting_disease == death) && (disease ~= death)) % we should not count already dead
            % add to death toll
            killed_by_disease(c, disease) = killed_by_disease(c, disease) + 1;
        end

        member_stat(i) = self_acting_disease;
    end

    % update member stat vs day map
    member_stat_map(c, :) = member_stat;
end
