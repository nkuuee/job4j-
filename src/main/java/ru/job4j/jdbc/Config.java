package ru.job4j.jdbc;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class Config {
    private final Properties properties = new Properties();

    public Config(String path) {
        try (InputStream inputStream = Config.class.getClassLoader().getResourceAsStream(path)) {
            if (inputStream == null) {
                throw new IllegalArgumentException("Указанный файл не найден: " + path);
            }
            properties.load(inputStream);
        } catch (IOException e) {
            throw new IllegalStateException(e);
        }
    }

    public String get(String key) {
        return properties.getProperty(key);
    }
}
