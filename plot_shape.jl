
using LinearAlgebra
import PlotlyJS


"""
    plot_shape(shape;
        title          = "3D shape model",
        colorbar_title = nothing,
        colorscale     = "Viridis",
        intensity      = [norm(node) for node in shape.nodes],
        intensitymode  = "vertex",
        showscale      = true,
    )

Plot a 3D shape model using PlotlyJS.

# References
- https://plotly.com/julia/3d-mesh/
- https://plotly.com/julia/reference/mesh3d/
"""
function plot_shape(shape;
    title          = "3D shape model",
    colorbar_title = nothing,
    colorscale     = "Viridis",
    intensity      = [norm(node) for node in shape.nodes],
    intensitymode  = "vertex",
    showscale      = true,
)

    if length(intensity) == length(shape.nodes)
        intensitymode = "vertex"
        hovertext = ["Node #$(i), $(round.(shape.nodes[i], digits=1)), value = $(round(intensity[i], digits=1))" for i in eachindex(shape.nodes)]
    elseif length(intensity) == length(shape.faces)
        intensitymode = "cell"
        hovertext = ["Face #$(i), $(round.(shape.face_centers[i], digits=1)), value = $(round(intensity[i], digits=1))" for i in eachindex(shape.faces)]
    else
        error("The length of `intensity` must be equal to the number of nodes or faces.")
    end

    ##= Polyhedral mesh =##
    trace_mesh = PlotlyJS.mesh3d(
        ## Vertices
        x = [node[1] for node in shape.nodes],
        y = [node[2] for node in shape.nodes],
        z = [node[3] for node in shape.nodes],
        ## Triangles (0-index in PlotlyJS)
        i = [face[1] - 1 for face in shape.faces],
        j = [face[2] - 1 for face in shape.faces],
        k = [face[3] - 1 for face in shape.faces],
        colorbar_title = colorbar_title,
        colorscale     = colorscale,
        intensity      = intensity,
        intensitymode  = intensitymode,
        showscale      = showscale,
        hoverinfo      = "text",
        hovertext      = hovertext,
    )

    ##= Wireframe =##
    edges = extract_edges(shape)
        
    edge_nodes = Matrix{Float64}(undef, 3*length(edges), 3)
    for (i, edge) in enumerate(edges)
        edge_nodes[3i-2, :] .= shape.nodes[edge[1]]
        edge_nodes[3i-1, :] .= shape.nodes[edge[2]]
        edge_nodes[3i  , :] .= [NaN, NaN, NaN]  # To separate each edge
    end
        
    trace_wireframe = PlotlyJS.scatter3d(
        x = edge_nodes[:, 1],
        y = edge_nodes[:, 2],
        z = edge_nodes[:, 3],
        mode = "lines",
        line = PlotlyJS.attr(
            color = "black",
            width = 1,
        ),
    )

    ##= Layout =##
    layout = PlotlyJS.Layout(
        title  = title,
        width  = 1000,
        height = 800,
        scene  = PlotlyJS.attr(
            aspectmode="data",
        ),
    )
    
    PlotlyJS.plot([trace_mesh, trace_wireframe], layout)
end


function extract_edges(shape)
    edges = Set{SVector{2, Int64}}()

    for face in shape.faces
        ## Add each side of face in order of decreasing node ID
        push!(edges, [min(face[1], face[2]), max(face[1], face[2])])
        push!(edges, [min(face[2], face[3]), max(face[2], face[3])])
        push!(edges, [min(face[3], face[1]), max(face[3], face[1])])
    end

    return edges
end
