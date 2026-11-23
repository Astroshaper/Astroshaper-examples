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
    
    ## In a Jupyter notebook, return a wrapper that is displayed as HTML (see `InlinePlot`).
    _in_ijulia() && return InlinePlot(PlotlyJS.Plot([trace_mesh, trace_wireframe], layout), 820)

    PlotlyJS.plot([trace_mesh, trace_wireframe], layout)
end


# ╔═══════════════════════════════════════════════════════════════════╗
# ║                 Inline display in Jupyter notebooks               ║
# ╚═══════════════════════════════════════════════════════════════════╝

"""
    InlinePlot

Wrapper of a `PlotlyJS.Plot` that is displayed in a Jupyter notebook as a self-contained HTML page
inside an `<iframe>`. plotly.js is loaded from the CDN, so an internet connection is required.

A bare PlotlyJS plot cannot be displayed with recent versions of IJulia (observed with IJulia
v1.34.4 and PlotlyJS v0.18.18): IJulia fails to serialize the `application/vnd.plotly.v1+json`
output that PlotlyJS passes to it. Showing the plot as HTML avoids that output and needs no
Jupyter extension.

The wrapped plot is available as `inline_plot.plot`.
"""
struct InlinePlot
    plot   ::PlotlyJS.Plot
    height ::Int  # Height of the `<iframe>` [px]
end

# True when the code is running in a Jupyter kernel.
_in_ijulia() = isdefined(Main, :IJulia) && isdefined(Main.IJulia, :inited) && Main.IJulia.inited

function Base.show(io::IO, ::MIME"text/html", p::InlinePlot)
    html = sprint(show, MIME("text/html"), p.plot)
    html = replace(html, "&" => "&amp;", "\"" => "&quot;")  # Escape for the `srcdoc` attribute
    print(io, "<iframe srcdoc=\"", html, "\" style=\"width: 100%; height: $(p.height)px; border: none;\"></iframe>")
end

Base.show(io::IO, ::MIME"text/plain", p::InlinePlot) = print(io, "InlinePlot (shown as HTML in a Jupyter notebook)")


"""
    save_html(filepath, plot)

Save a plot made by `plot_shape` as a standalone HTML file, which can be opened in a web browser.
"""
save_html(filepath, p::InlinePlot) = save_html(filepath, p.plot)
save_html(filepath, p::PlotlyJS.SyncPlot) = save_html(filepath, p.plot)

function save_html(filepath, p::PlotlyJS.Plot)
    open(filepath, "w") do io
        show(io, MIME("text/html"), p)
    end
    return filepath
end


function extract_edges(shape)
    edges = Set{Tuple{Int64, Int64}}()

    for face in shape.faces
        ## Add each side of face in order of decreasing node ID
        push!(edges, (min(face[1], face[2]), max(face[1], face[2])))
        push!(edges, (min(face[2], face[3]), max(face[2], face[3])))
        push!(edges, (min(face[3], face[1]), max(face[3], face[1])))
    end

    return edges
end
