local arrays = {}

function arrays.flatten(array2d)
  local array = {}
  for i = 1, #array2d do
    for j = 1, #array2d[i] do
      table.insert(array, array2d[i][j])
    end
  end
  return array
end

return arrays