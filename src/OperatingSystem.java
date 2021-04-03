import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;


public class OperatingSystem {

    private final Floppy floppyDisk = new Floppy();

    private final String outFileName;
    private final String inFileName;




    public OperatingSystem(String inFileName, String outFineName) {
        this.inFileName = inFileName;
        this.outFileName = outFineName;
    }

    public void makeFloppy() {
        floppyDisk.writeFileToFloppy(this.inFileName);
        floppyDisk.makeFloppy(outFileName);
    }

    public static void main(String[] args) {
        OperatingSystem op = new OperatingSystem("boot.bat", "system.img");
        op.makeFloppy();
    }
}
