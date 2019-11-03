/*****************************************************
 * Name : Test_MazeController
 * Developer: Vinay Vernekar
 * Reference: https://www.fiverr.com/kingofwebhost/do-standard-or-custom-development-in-salesforce
 * Website: https://sfdcdevelopers.com
 * LinkedIn: https://www.linkedin.com/in/vinayvernakar/
 * Email: support@sfdcdevelopers.com, vernekarvinay93@gmail.com
 * Algorithm: https://www.geeksforgeeks.org/rat-in-a-maze-backtracking-2/
 * Purpose: Test class for MazeController
 * Date: 3rd Nov 2019
 * Last Modified Date: 3rd Nov 2019
*******************************************************/
@isTest
public class Test_MazeController {
    static testmethod void CoverClass(){
        list<list<integer>> mat = new list<list<integer>>{
        new list<integer>{1, 0, 1, 1, 1},
        new list<integer>{1, 1, 1, 0, 1},
        new list<integer>{0, 0, 0, 0, 1},
        new list<integer>{1, 0, 1, 0, 1},
        new list<integer>{0, 0, 1, 1, 1}};

            
        MazeController.solveMaze(mat, 5, 5, 4 , 4, 0 , 0);
    }
}