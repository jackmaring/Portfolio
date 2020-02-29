public class FlourPacker {

    public static boolean canPack(int bigCount, int smallCount, int goal) {

        if(bigCount < 0 || smallCount < 0 || goal < 0) {
            return false;
        }

        for(int i=0; i<bigCount; i++) {
            if(goal >= 5) {
                goal -= 5;
            }
        }

        if(goal <= smallCount) {
            return true;
        }

        return false;

    }

}
