#!/usr/bin/python3
"""This module contains the storage class"""
from base_class import BaseClass, DecBase
from sport import Sport
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, scoped_session


class Database:
    """Database class definition"""
    __engine = None
    __session = None

    def __init__(self):
        """Database object instantiation"""
        self.__engine = create_engine('mysql+mysqldb://root@localhost/rankd')

    def save(self, obj=None):
        """Saves object to database"""
        if obj is not None:
            if self.__session is None:
                self.reload()
            self.__session.add(obj)
            self.__session.commit()

    def reload(self):
        """Reloads data"""
        DecBase.metadata.create_all(self.__engine)
        factory = sessionmaker(bind=self.__engine, expire_on_commit=False)
        self.__session = scoped_session(factory)()

    def close(self):
        """Ends a session"""
        if self.__session:
            self.__session.close()

    def get(self, clss=None, obj_id=None):
        """This method retrieves data from the database"""
        return self.__session.query(clss).filter_by(id=obj_id).first()
