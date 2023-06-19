#!/usr/bin/python3
"""This module contains the storage class"""
from os import getenv
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, scoped_session
from src.athlete import Athlete
from src.base_class import BaseClass, DecBase
from src.f1_driver import F1Driver
from src.sport import Sport
from src.team import Team


classes = {'Athlete': Athlete, 'F1Driver': F1Driver, 'Sport': Sport, 'Team': Team}


class Database:
    """Database class definition"""
    __engine = None
    __session = None

    def __init__(self):
        """Database object instantiation"""
        user = getenv('STATS_USER')
        password = getenv('STATS_PASS')
        if user is None or password is None:
            print('Env [STATS_USER, STATS_PASS] missing')
            exit(1)

        url = f'mysql+mysqldb://{user}:{password}@localhost/stats'
        self.__engine = create_engine(url)

    def save(self, obj=None):
        """Saves object to database"""
        if self.__session is None:
            self.reload()
        if obj is not None:
            self.__session.add(obj)

        self.__session.commit()

    def reload(self):
        """Reloads data"""
        DecBase.metadata.create_all(self.__engine)
        factory = sessionmaker(bind=self.__engine, expire_on_commit=False)
        self.__session = scoped_session(factory)

    def close(self):
        """Ends a session"""
        if self.__session:
            self.__session.remove()

    def get(self, clss=None, obj_id=None, all=False):
        """This method retrieves data from the database"""
        if all:
            objs = []
            for c in classes.values():
                objs.extend(self.__session.query(c).all())
            return objs

        if clss:
            if obj_id:
                return self.__session.query(classes[clss]).filter_by(id=obj_id).first()
            else:
                return self.__session.query(classes[clss]).all()

    def delete(self, obj=None):
        """This method deletes an object from the database"""
        if obj is not None:
            self.__session.delete(obj)
            self.save()
