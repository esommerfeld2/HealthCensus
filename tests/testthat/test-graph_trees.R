test_that("graph_trees works", {
# test that each plot type returns a ggplot graphics object
expect_s3_class(graph_trees(data21, plot_type = "crown_position"), "ggplot")
expect_s3_class(graph_trees(data21, plot_type = "biodiv_mortality", biodiv_metric = "shannon"), "ggplot")
expect_s3_class(graph_trees(data21, plot_type = "health_dist", health_tree = "percentage_of_crown_living"), "ggplot")
expect_s3_class(graph_trees(data21, plot_type = "status_bar"), "ggplot")
expect_s3_class(graph_trees(data21, plot_type = "fad_dist"), "ggplot")

# test that function throws error for invalid inputs for plot type
expect_error(graph_trees(data21, plot_type = "invalid_plot"))

# test that function throws error for invalid biodiversity metric/index input
expect_error(graph_trees(data21, plot_type = "biodiv_mortality", biodiv_metric = "shanon"))

# test that function throws error if more than one health_tree variabel provided
expect_error(graph_trees(data21, plot_type = "health_dist", health_tree = c("percentage_of_crown_living", "percentage_of_crown_intact")),
             "Please select only one health_tree variable.")
# test that function throws error for invalid health_tree variable input
expect_error(graph_trees(data21, plot_type = "health_dist", health_tree = "status"))
})
