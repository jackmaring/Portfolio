public class PaintJob {

    public static int getBucketCount(double width, double height, double areaPerBucket, int extraBuckets) {

        if((isNotValid(width) || isNotValid(height) || isNotValid(areaPerBucket) || extraBuckets < 0)) {
            return -1;
        }

        double bucketsNeeded = Math.ceil((width * height) / areaPerBucket);

        return (int) (bucketsNeeded - extraBuckets);

    }

    public static int getBucketCount(double width, double height, double areaPerBucket) {

        if((isNotValid(width) || isNotValid(height) || isNotValid(areaPerBucket))) {
            return -1;
        }

        double bucketsNeeded = Math.ceil((width * height) / areaPerBucket);

        return (int) bucketsNeeded;

    }

    public static int getBucketCount(double area, double areaPerBucket) {

        if(isNotValid(area) || isNotValid(areaPerBucket)) {
            return -1;
        }

        double bucketsNeeded = Math.ceil(area / areaPerBucket);

        return (int) bucketsNeeded;

    }

    public static boolean isNotValid(double num) {
        if(num <= 0) {
            return true;
        }
        return false;
    }

}


