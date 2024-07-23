function A = addRowToMatrix(A, v1)
    % This function adds a row vector v1 to the matrix A

    % Check if v1 is a row vector
    if size(v1, 1) ~= 1
        error('Input v1 must be a row vector.');
    end

    % Check if the length of v1 matches the number of columns in A
    if size(A, 2) ~= length(v1)
        error('The length of vector v1 must match the number of columns in matrix A.');
    end

    % Add v1 as a new row to the matrix A
    A = [A; v1];
end