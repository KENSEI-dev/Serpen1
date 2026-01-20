import java.util.Scanner;
public class quick_sort {
    int [] lamuto(int arr[],int low,int high){
        if(low >= high)
            return arr;
        int pivot=arr[high];
        int j=low;
        for(int i=low;i<high;i++){
            if(arr[i]<=pivot){
                int temp=arr[i];
                arr[i]=arr[j];
                arr[j]=temp;
                j+=1;
            }
        }
        int temp=arr[high];
        arr[high]=arr[j];
        arr[j]=temp;
        lamuto(arr, low, j-1);
        lamuto(arr, j+1, high);
        return arr;        
    }
    public static void main(String args[]){
        quick_sort ob=new quick_sort();
        Scanner sc=new Scanner(System.in);
        System.out.println("ENter size of array:");
        int size=sc.nextInt();
        int test[]=new int[size];
        for(int i=0;i<size;i++){
            System.out.print("Enter "+(i+1)+" element: ");
            test[i]=sc.nextInt();
            
        }
        int[] sorted = ob.lamuto(test,0,size-1);
        // Print sorted array
        for(int i=0; i<sorted.length; i++) {
            System.out.print(sorted[i] + " ");
        }
        System.out.println();
    }    
}
