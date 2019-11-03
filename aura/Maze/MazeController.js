({
    selectCell : function(component, event, helper) {
        let coordinates = component.get("v.coordinates");
        const x = parseInt(event.currentTarget.dataset.row);
        const y = parseInt(event.currentTarget.dataset.column);
        if(component.get("v.step") == 1){
            for(let i = 0 ; i < component.get("v.rows"); i++){
                for(let j = 0 ; j < component.get("v.columns"); j++)
                    coordinates[i][j].isStart = false;
            }
            coordinates[x][y].isStart = !coordinates[x][y].isStart;
        } 
        else if(component.get("v.step") == 2){
            for(let i = 0 ; i < component.get("v.rows"); i++){
                for(let j = 0 ; j < component.get("v.columns"); j++)
                    coordinates[i][j].isEnd = false;
            }
            coordinates[x][y].isEnd = !coordinates[x][y].isEnd; 
        } 
        else if(component.get("v.step") == 3)
            coordinates[x][y].isObstacle = !coordinates[x][y].isObstacle; 
        component.set("v.coordinates", coordinates);
    },
    next : function(component, event, helper) {
        if(component.get("v.step") == 0)
            helper.initialiseMaze(component, event);
        else if(component.get("v.step") == 4)
            component.set("v.step", -1);
            
        component.set("v.step", component.get("v.step") + 1);
        if(component.get("v.step") == 4)
            helper.SolveMaze(component, event);  
    }
})