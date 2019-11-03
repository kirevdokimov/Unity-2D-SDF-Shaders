float rectangleNaive(float2 position, float2 halfSize){
    float2 xy = abs(position) - halfSize;
    return max(xy.x, xy.y);
    //float2 componentWiseEdgeDistance = ;
    //float outsideDistance = length(max(componentWiseEdgeDistance, 0));
    //float insideDistance = min(max(componentWiseEdgeDistance.x, componentWiseEdgeDistance.y), 0);
    //return step(outsideDistance + insideDistance,0);
}

float rectangle(float2 position, float2 halfSize){
    float2 xy = abs(position) - halfSize;
    return length(max(xy,0));
}