let max_dist = scanArray[0];
let max_dist_i = 0;

for (let i=1; i<17; i++) {
  if (max_dist < scanArray[i]) {
    max_dist = scanArray[i];
    max_dist_i = i;
  }
}
if (max_dist === scanArray[8] && max_dist === scanArray[7] && max_dist === scanArray[9]) {
return 0;
}

if (max_dist_i < 8) {
return -1;
}

if (max_dist_i > 8) {
return 1;
}

return 1;
