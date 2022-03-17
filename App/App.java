package App;

public class App {
    public static void main(String[] args) {
        System.out.println("App running...");
        try {
            while(true) {
                System.out.println("App running...");
                Thread.sleep(1000);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}