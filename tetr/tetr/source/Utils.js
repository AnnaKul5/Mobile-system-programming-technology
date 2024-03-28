.pragma library

function rotateFigure(matrix) {
    var result = [];
    var matrix_width = matrix[0].length;
    var matrix_height = matrix.length;
    for(var i = 0; i !== matrix_width; ++i) {
        result.push([]);
        for(var j = 0; j !== matrix_height; ++j) {
            result[i].push(matrix[j][matrix_width - i - 1]);
        }
    }

    return result;
}
