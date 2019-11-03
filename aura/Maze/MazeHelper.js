({
    SolveMaze : function(component, event) {
        try{
            let coordinates = component.get("v.coordinates");
            let MazeMap = [];
            let EndIndex = {};
            let StartIndex = {};
            for(let i = 0; i < coordinates.length; i++) {
                MazeMap[i] = [];
                for(let j = 0; j < coordinates[i].length; j++){
                    MazeMap[i][j] = coordinates[i][j].isObstacle ? 0 : 1;
                    if(coordinates[i][j].isEnd)
                        EndIndex = coordinates[i][j];
                    if(coordinates[i][j].isStart)
                        StartIndex = coordinates[i][j];
                } 
            }
            var action = component.get("c.solveMaze");
            action.setParams({ maze : MazeMap, row : component.get("v.rows"), column : component.get("v.columns"), startX : StartIndex.x, startY : StartIndex.y, endX : EndIndex.x , endY : EndIndex.y});
            
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (state === "SUCCESS") {
                    let resultMap = response.getReturnValue();
                    if(resultMap.length > 0){
                        for(let i = 0; i < coordinates.length; i++) {
                            for(let j = 0; j < coordinates[i].length; j++)
                                coordinates[i][j].isPath = resultMap[i][j] == 1;
                        }
                        component.set("v.coordinates", coordinates);
                    }
                    else
                        alert('No possible path found');
                }
                else
                    alert('Error occured while finding path.');
            });
            $A.enqueueAction(action);
        }
        catch(err) {
            console.log(err.message);
        }
    },
    initialiseMaze : function(component, event){
        let coordinates = new Array([]);
        for(let i = 0 ; i < component.get("v.rows"); i++){
            coordinates[i] = [];
            for(let j = 0 ; j < component.get("v.columns"); j++)
                coordinates[i][j] = { 'x' : i, 'y' : j, 'isStart' : false, 'isEnd' : false, 'isObstacle' : false, 'isPath' : false};
        }
        component.set("v.coordinates", coordinates);
    }
})