CFLAGS = -std=c++17 -O2
LDFLAGS = -lglfw -lvulkan -ldl -lpthread -lX11 -lXxf86vm -lXrandr -lXi
SHADERS = shaders/vert.spv shaders/frag.spv

all: shaders HelloTriangle

HelloTriangle: main.cpp
	g++ $(CFLAGS) -o HelloTriangle main.cpp $(LDFLAGS)

shaders/vert.spv: shader.vert
	@mkdir -p shaders
	glslc shader.vert -o shaders/vert.spv

shaders/frag.spv: shader.frag
	@mkdir -p shaders
	glslc shader.frag -o shaders/frag.spv

.PHONY: shaders test clean

shaders: $(SHADERS)

test: HelloTriangle
	./HelloTriangle

clean:
	rm -f HelloTriangle $(SHADERS)
