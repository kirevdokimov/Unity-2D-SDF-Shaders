float circle(float2 position, float radius){
    return step(length(position) - radius + 1, 1);
}