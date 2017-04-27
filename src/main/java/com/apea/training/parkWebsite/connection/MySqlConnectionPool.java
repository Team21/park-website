package com.apea.training.parkWebsite.connection;

import com.apea.training.parkWebsite.dao.DaoException;
import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

public class MySqlConnectionPool implements ConnectionPool<MySqlDaoConnection> {

    private static final String DB_CONFIG_FILENAME = "/webProject/config/dbConfig.properties";
    private static final String DB_CONFIG_PARAM_URL = "database.url";
    private static final String DB_CONFIG_PARAM_DB_NAME = "database.dbName";
    private static final String DB_CONFIG_PARAM_USER_NAME = "database.userName";
    private static final String DB_CONFIG_PARAM_USER_PASSWORD = "database.userPassword";

    private static MysqlDataSource mysqlDS;

    static {
        Properties props = new Properties();
        mysqlDS = null;
        try (FileInputStream fis = new FileInputStream(DB_CONFIG_FILENAME)){
            props.load(fis);
            mysqlDS = new MysqlDataSource();
            mysqlDS.setUrl(props.getProperty(DB_CONFIG_PARAM_URL));
            mysqlDS.setDatabaseName(props.getProperty(DB_CONFIG_PARAM_DB_NAME));
            mysqlDS.setUser(props.getProperty(DB_CONFIG_PARAM_USER_NAME));
            mysqlDS.setPassword(props.getProperty(DB_CONFIG_PARAM_USER_PASSWORD));
        } catch (IOException e) {
            throw new DaoException(e);
        }
    }

    private static MySqlConnectionPool instance = new MySqlConnectionPool();

    private MySqlConnectionPool() {}

    public static MySqlConnectionPool getInstance() {
        return instance;
    }

    @Override
    public MySqlDaoConnection getConnection() {
        try {
            return new MySqlDaoConnection(mysqlDS.getConnection());
        } catch (SQLException e) {
            throw new DaoException("Can't get dao connection", e);
        }
    }

    @Override
    public Connection getSqlConnectionFrom(MySqlDaoConnection connection) {
        return connection.getConnection();
    }
}
