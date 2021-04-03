import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardOpenOption;

public class Floppy144 {
    byte[][] SECTORS = new byte[2880][512];
    byte[] fileBytes;

    public Floppy144() throws IOException {
        SECTORS[0][510] = 0x55;
        SECTORS[0][511] = (byte) 0xaa;

    }

    public Floppy144 writFile(String filename, String... appendix) throws IOException {
        fileBytes = Files.readAllBytes(new File(filename).toPath());
        System.out.printf("write SECTORS：%d SUCCEED\n",0);
        if (fileBytes.length > 510) {
            throw new IllegalArgumentException("boot lead too much");
        }
        System.arraycopy(fileBytes, 0, SECTORS[0], 0, fileBytes.length);
        for (String s : appendix) {
            fileBytes = Files.readAllBytes(new File(s).toPath());
            for (int i = 0; fileBytes.length - 512 * i > 0; i++) {
                System.arraycopy(fileBytes, 0, SECTORS[i+1], 0, fileBytes.length - 512 * i);
                System.out.printf("write SECTORS：%d SUCCEED\n",i+1);
            }

        }
        return this;
    }

    public void toFile(String file) throws IOException {
        Files.write(new File(file).toPath(), merge(), StandardOpenOption.CREATE);
        System.gc();
    }

    private byte[] merge() {
        byte[] las = new byte[1474560];
        for (int i = 0; i < 2880; i++) {
            System.arraycopy(SECTORS[i], 0, las, i * 512, 512);
        }
        return las;
    }

    public static void main(String[] args) throws IOException {
        new Floppy144().writFile("boot.bat", "start.bat").toFile("1.img");
    }
}
