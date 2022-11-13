## Total Time Visualizations in R
### Description
Draws a visualizations of total time spent on different activities in the sample as percent of total time.

### Usage
```
totals(df, act)
totals(df, act, colors)
```
### Arguments
*df*
json data with keys as numbers (as characters) and values for percent of total time.

*colors*
3 x n (number of activities) json array of colors for the graph. Each hex color in sub-array (e.g., ["#4e52e9", "#f9cb94", "#0f57f5"]) represents:
1. color for the wave and border, 
2. color for text when under the wave, 
3. color for the text.

*act*
json array of the names of activities.

### How it looks like

You can try the interactive demo here: (https://kolpashnikova.github.io/totals)

![Transitions](https://github.com/Kolpashnikova/package_R_totals/blob/main/examples/totals.png)


### References
Kolpashnikova, Kamila. (2022). Total Time Visualizations in R. Toronto,ON: York University.
