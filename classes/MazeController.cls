/*****************************************************
 * Name : MazeController
 * Developer: Vinay Vernekar
 * Reference: https://www.fiverr.com/kingofwebhost/do-standard-or-custom-development-in-salesforce
 * Website: https://sfdcdevelopers.com
 * LinkedIn: https://www.linkedin.com/in/vinayvernakar/
 * Email: support@sfdcdevelopers.com, vernekarvinay93@gmail.com
 * Algorithm: https://www.geeksforgeeks.org/rat-in-a-maze-backtracking-2/
 * Purpose: Quiz Solution
 * Date: 3rd Nov 2019
 * Last Modified Date: 3rd Nov 2019
*******************************************************/
public class MazeController{

	@AuraEnabled
    public static list<list<integer>> solveMaze(list<list<integer>> maze, integer row, integer column, integer startX, integer startY, integer endX, integer endY){ 
        list<list<integer>> sol = new list<list<integer>>(); 
        //initialising sol 2d array as 0
        for(Integer i = 0; i < row; i++) {
            List<Integer> columns = new List<Integer>();
            for(Integer j = 0; j < column; j++)
                columns.add(0);
            sol.add(columns);
        }
        //if starting coordinates are greater than finishing end points, swap them
        if(startX > endX && startY > endY){
            integer tempStartX = endX;
            integer tempStartY = endY;
            endX = startX;
            endY = startY;
            startX = tempStartX;
            startY = tempStartY;
        }
        if (!solveMazeUtil(maze, startX, startY, sol, row, column, endX, endY, 'down')) { 
            System.debug('Solution doesn\'t exist'); 
            return new list<list<integer>>(); 
        }
        
        return sol; 
    } 
    
    public static boolean solveMazeUtil(list<list<integer>> maze, integer startX, integer startY, list<list<integer>> sol, integer row, integer column, integer endX, integer endY, string direction) 
    {  
        //if reached to destination, return solution
        if (startX == endX && startY == endY) { 
            sol[startX][startY] = 1; 
            return true; 
        } 
        //test each move if valid or not
        if (startX >= 0 && startX < row && startY >= 0 && startY < column && maze[startX][startY] == 1) { 
            sol[startX][startY] = 1; 
            
            if ( direction!= 'up' && solveMazeUtil(maze, startX + 1, startY, sol, row, column, endX , endY, 'down')) 
                return true; 
            
            if (direction!= 'left' && solveMazeUtil(maze, startX, startY + 1, sol, row, column, endX , endY, 'right')) 
                return true; 
            
            if (direction!= 'down' && solveMazeUtil(maze, startX - 1, startY, sol, row, column, endX , endY, 'up')) 
                return true; 
            
            if (direction!= 'right' && solveMazeUtil(maze, startX, startY - 1, sol, row, column, endX , endY, 'left')) 
                return true; 
            
            sol[startX][startY] = 0; 
            return false; 
        } 
        return false; 
    }
}