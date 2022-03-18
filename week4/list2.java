import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.Scanner;

/**
 * DangNghiaA5Q1
 * <p>
 * Comp 2140 Section D01
 * Assignment: 5 Question 1;
 *
 * @author Nghia Dang( 7863117)
 *
 * <p>
 * thís program will simulate a ICU in the hospital
 */


//==============================================================
// DangNghiaA5Q1 class (main  class)
//
// PURPOSE: this will read a txt file from user and print out the icu
//
// METHODS: - main
//          - ICU read the file and procesing
//==============================================================
public class DangNghiaA5Q1 {
    public static void main(String[] args) {
        Scanner User;// get the file from the user input
        String filename = "";
        User = new Scanner(System.in);
        System.out.println("\nPlease enter the input file name (.txt files only): ");

        filename = User.nextLine();
        System.out.println("Procesing: " + filename);
        ICU(filename);


    }

    //==========================================================
    // ICU
    //
    // PURPOSE: read the file from user
    //
    // PARAMETERS:
    //   file name
    //
    //==========================================================
    public static void ICU(String filename) {

        // first we will read the file line by line
        String line = null;

        int BUFFER_SIZE = 1000;
        // a value to move to previos one step in the BufferedReader
        // using a normal try catch block
        try {
            BufferedReader in = new BufferedReader(new FileReader(new File(filename)));
            // open the file
            line = in.readLine();
            //read the first line
            int docTime = 0;// the time of the doctor
            MaxHeapclass WaitList = new MaxHeapclass(1);
            // a priority queue that using heap to do the file

            String[] Patient = null;
            // this will contain 3 information
            // first is the time Patien come
            // second is his urgency
            // and the last one is the time need to treat
            while (line != null) {
                // split the line based on the " "
                Patient = line.split(" ");

                System.out.println("Doctor is available at time = " + docTime);
                if (docTime < Integer.parseInt(Patient[0]))
                    docTime = Integer.parseInt(Patient[0]);
                //if anytime the doctor time smaller than the patien come
                // move the time 1 cycle


                while (Integer.parseInt(Patient[0]) <= docTime) {
                    //then if the doctor time is bigger than the paitent time
                    // then that person came when doctor is working
                    // then add that person to the waitng list

                    patient newPatient = new patient(Integer.parseInt(Patient[1]), Integer.parseInt(Patient[2]));
                    System.out.println("Patient " + newPatient.id() + " arrived at time " + Patient[0] + " with urgency" + "= " + newPatient.urgenecy() + " and treatment time= " +
                            newPatient.Treat_time());
                    // and then print all the info of the new person
                    WaitList.insert(newPatient);
                    // add that person in to the list
                    // in here we will move to the next line and check that if the person come before the doctor done
                    line = in.readLine();
                    in.mark(BUFFER_SIZE);
                    // mark in the BufferedReader that this line is currently check


                    if (line == null)
                        break;
                    // if the new line is over then just out the loop
                    if (Integer.parseInt(line.substring(0, line.indexOf(' '))) <= docTime) {
                        Patient = line.split(" ");
                        // if the patient come before the doctor time loop again and add that patien to the waiting list

                    } else {
                        // orther will we will come back to the line we already mark as checked
                        in.reset();
                        // after that exit the loop
                        break;
                    }
                }
                if (!WaitList.isEmpty()) {
                    // and if the wait list still have person waiting
                    System.out.println("Doctor is available at time = " + docTime);
                    System.out.println("Patient " + WaitList.peek().id() + " in for treatment at time " + docTime + " with urgency" + "= " + WaitList.peek().urgenecy() + " and treatment time= " +
                            WaitList.peek().Treat_time());
                    // make sure the doctor to treat that pearon
                    // and also update the doctor time
                    docTime += WaitList.peek().Treat_time();
                    WaitList.deleteMax();
                    // delete that paiten based on the urgency of the patient

                }

            }
            while (!WaitList.isEmpty()) {
                // and if the wait list still have person waiting
                System.out.println("Doctor is available at time = " + docTime);
                System.out.println("Patient " + WaitList.peek().id() + " in for treatment at time " + docTime + " with urgency" + "= " + WaitList.peek().urgenecy() + " and treatment time= " +
                        WaitList.peek().Treat_time());
                // make sure the doctor to treat that pearon
                // and also update the doctor time
                docTime += WaitList.peek().Treat_time();
                WaitList.deleteMax();
                // delete that paiten based on the urgency of the patient

            }
            System.out.println("Doctor is available at time = " + docTime);
        }//end try
        catch (IOException e) {
            System.out.println("File I/O Error");
        }//end catch

        System.out.println("Progam end normally");

    }
}

//==============================================================
// patient class
//
// PURPOSE: this class will contain the infor of the patient
//
// METHODS: - constructor
//          - id, urgenecy ,Treat_time
//          - toString()
//==============================================================
class patient {
    private static int count = 1;// this int will make sure everytime a new patient
    // come update that person id

    private final int id;// the id of the person
    private final int urgenecy;// the urgency of the person
    private final int Treat_time;// and the Treat_time time of that person

    ///==========================================================
    // patient constructor
    //
    // PURPOSE: Create a new patient.
    //
    // PARAMETERS:
    //   treatment time and urgency of that person
    //==========================================================
    public patient(int urg, int time) {
        urgenecy = urg;
        Treat_time = time;

        id = count;
        count++;
    }

    ///==========================================================
    // id
    //
    // PURPOSE: return the id of the person
    //
    // PARAMETERS:
    //   none
    //==========================================================
    public int id() {
        return id;

    }

    ///==========================================================
    // urgenecy
    //
    // PURPOSE: return the urgenecy of the person
    //
    // PARAMETERS:
    //   none
    //==========================================================
    public int urgenecy() {
        return urgenecy;
    }

    ///==========================================================
    // Treat_time
    //
    // PURPOSE: return the Treat_time of the person
    //
    // PARAMETERS:
    //   none
    //==========================================================
    public int Treat_time() {
        return Treat_time;
    }

    ///==========================================================
    // toString
    //
    // PURPOSE: return the string of the patient
    //
    // PARAMETERS:
    //   none
    //==========================================================
    public String toString() {
        return id + "" + urgenecy + "" + Treat_time;
    }
}

//==============================================================
// MaxHeapclass class
//
// PURPOSE: this class will be the prioruty queue of the waitlist
//
//
//==============================================================
class MaxHeapclass {
    /********************** Importance note this class is the same wil my lab 11 **************************************/////////////
    /********************** Importance note this class is the same wil my lab 11 **************************************/////////////
    /********************** Importance note this class is the same wil my lab 11 **************************************/////////////
    /********************** Importance note this class is the same wil my lab 11 **************************************/////////////
    /********************** Importance note this class is the same wil my lab 11 **************************************/////////////
    // for convinience I just reuse the code on the max heap section in the zybook
    int maxSizeheap;// the total sime of the heap
    private patient[] heap;// heap contain all the patient
    private int heapSize; // number of items currently in the heap

    public MaxHeapclass(int maxSize) {
        maxSizeheap = maxSize;
        heap = new patient[maxSize];
        heapSize = 0;
    } // end constructor

    /************************************************************
     * parent
     *
     * PURPOSE:
     *    Returns the index of the parent of the item at index i
     *    (doesn't check if there is a parent).
     *
     ************************************************************/
    public static int parent(int i) {
        return (i - 1) / 2;
    } // end parent

    /************************************************************
     * rightChild
     *
     * PURPOSE:
     *    Returns the index of the right child of the
     *    item at index i (doesn't check if there is a
     *    right child).
     ************************************************************/
    public static int rightChild(int i) {
        return 2 * i + 2;
    } // end rightChild

    /************************************************************
     * leftChild
     *
     * PURPOSE:
     *    Returns the index of the left child of the
     *    item at index i (doesn't check if there is a
     *    left child).
     ************************************************************/
    public static int leftChild(int i) {
        return 2 * i + 1;
    } // end leftChild

    public boolean isEmpty() {
        return heapSize == 0;
    } // end isEmpty

    public boolean isFull() {
        return heapSize >= heap.length;
    } // end isFull

    /*************************************************************
     *
     * insert
     *
     * PURPOSE: Add a new item to the heap.
     *
     ******************************************************************/
    public void insert(patient priority) {

        if (isFull()) {
            patient[] temp = new patient[maxSizeheap];
            for (int i = 0; i < heapSize; i++) {
                temp[i] = heap[i];
            }
            maxSizeheap = maxSizeheap * 2;

            heap = new patient[maxSizeheap];
            for (int i = 0; i < temp.length; i++) {
                heap[i] = temp[i];
            }

        }
        heap[heapSize] = priority;
        heapSize++;
        siftUp(heapSize - 1);

    } // end insert

    /*************************************************************
     *
     * siftUp
     *
     * PURPOSE:
     *    The item at heap[index] may have higher priority
     *    than its parent, but no other problems exist in the heap.
     *    Restore heap order by repeatedly moving its parent down
     *    until either:
     *    (1) the root was moved down, or
     *    (2) its parent's priority is >= its priority.
     *    Put the item into the "hole" created by the item last
     *    moved down.
     *
     ******************************************************************/
    private void siftUp(int index) {
        patient toSift = heap[index]; // make a "hole" in the heap
        int i = index;
        int iParent = parent(index);

        while (i > 0 && heap[iParent].urgenecy() < toSift.urgenecy()) {
            heap[i] = heap[iParent]; // move the "hole" up to the parent
            i = iParent;
            iParent = parent(i);
        } // end while
        heap[i] = toSift; // put the sifted item into the correct position

    } // end siftUp

    /*************************************************************
     *
     * siftDown
     *
     * PURPOSE:
     *       sift the itme that we reamoved in the root down to the
     *       right positon
     *
     ******************************************************************/
    private void siftDown(int at) {
        int curr = at;
        int l = leftChild(at);// the left child of the node
        int r = rightChild(at);// the right child
        if (l < heapSize && heap[l].urgenecy() > heap[curr].urgenecy())
            curr = l;// if the left node is mor importance then the right move to the left
        if (r < heapSize && heap[r].urgenecy() > heap[curr].urgenecy())
            curr = r;
        // orther wise move to the right
        if (curr != at) {
            // if the curr is not the same with with the  at
            // then swap it
            patient temp = heap[at];
            heap[at] = heap[curr];
            heap[curr] = temp;

            siftDown(curr);//recresive untill it is the same
        }

    }
    /*************************************************************
     *
     * peek
     *
     * PURPOSE:
     *       return the first person that has the most priority in the array
     *
     ******************************************************************/
    public patient peek() {
        return heap[0];
    }
    /*************************************************************
     *
     * deleteMax
     *
     * PURPOSE:
     *       delete the array 0
     *       and move orther to that new biggest
     *
     ******************************************************************/

    public patient deleteMax() {
        patient result = heap[0];
        if (!isEmpty()) {
            heap[0] = heap[heapSize - 1];
            heapSize--;
            // remove that value wil the last positon at the
            // array
            siftDown(0);//also sift taht value down the array
        }
        else
            heap = new patient[maxSizeheap];// this is just a safe way to clean up array
        return result;
        // after all return the patient

    }
    /*************************************************************
     *
     * Printarr
     *
     * PURPOSE:
     *       print all the value in the array
     *
     ******************************************************************/

    public void Printarr() {
        String s = "";
        if (!isEmpty())
            for (int i = 0; i < heap.length; i++) {
                if (heap[i] != null)
                    s += heap[i] + " ";
                else s += " null ";
            }
        System.out.println(s);

    }


} //

