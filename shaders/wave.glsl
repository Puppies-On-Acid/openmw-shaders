#include "config.glsl"
#include "rand.glsl"

uniform float osg_SimulationTime;

float doWave(vec2 pos, float time_off, float fizzle) {
    #if (WAVES == 1)
        float nz = noise(pos.xy * 0.3) * 2.0 - 1.0;
        return sin((osg_SimulationTime + time_off + nz * fizzle) * 1.0 + dot(sin(pos * 0.01), vec2(1.0)) * 1.0) * 8.0 + nz * 1.0;
    #else
        return 0.0;
    #endif
}

float doWave(vec2 pos) {
    return doWave(pos, 0.0, 1.0);
}
