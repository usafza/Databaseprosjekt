

/**
 *
 * @author sveinbra
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        System.out.println("AAA");
       
        ResultCtrl t= new ResultCtrl ();
        t.connect();
        //t.printTabell();
        
        // TESTING
        //t.FlimselskapMedFlestISjanger();
        
        
        // WORKING!
        t.RolleGittSkuespiller("'Christian Bale'");
        //t.FilmGittSkuespiller("'Christian Bale'");
        
        
        /*
        maalCtrl.regPost(0, 0, 70);
        maalCtrl.regPost(1, 31, 100);
        maalCtrl.regPost(2, 32, 120);
        maalCtrl.regPost(3, 33, 140);
        maalCtrl.regPost(4, 34, 160);
        maalCtrl.regPost(5, 35, 180);
        maalCtrl.regPost(6, 36, 200);
        maalCtrl.regPost(7, 37, 220);
        maalCtrl.regPost(8, 150, 230);
        maalCtrl.regPost(9, 175, 245);
        if (maalCtrl.sluttReg()) {
            System.out.println("Profit!!");
        }

        ResultatCtrl resultatCtrl = new ResultatCtrl ();
        resultatCtrl.connect();
        resultatCtrl.printKlasseResultat("H50");
       */
       
        
        
        
       
    }

}