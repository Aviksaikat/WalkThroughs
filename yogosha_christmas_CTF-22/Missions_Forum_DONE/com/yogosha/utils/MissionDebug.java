package com.yogosha.utils;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.Serializable;

public class MissionDebug implements Serializable {
    private static final long serialVersionUID = 298788778888997655L;
    private String debug;

    private void readObject(ObjectInputStream ois) throws IOException, ClassNotFoundException {
        try {
            ois.defaultReadObject();
            Runtime runtime = Runtime.getRuntime();
            runtime.exec((String) this.debug);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}