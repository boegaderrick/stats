#!/usr/bin/python3
"""This module defines the base class for all classes of the application"""
from datetime import datetime
from dateutil.relativedelta import relativedelta
from sqlalchemy import Column, String, Date, DateTime
from sqlalchemy.ext.declarative import declarative_base
from uuid import uuid4

DecBase = declarative_base()


class BaseClass:
    """BaseClass definition"""
    created_at = Column(DateTime, nullable=False, default=datetime.now())
    genesis = Column(Date, nullable=False)
    id = Column(String(60), primary_key=True, default=str(uuid4()))
    name = Column(String(120), nullable=False)
    updated_at = Column(DateTime, nullable=False, default=datetime.now())

    def __init__(self, **kwargs):
        """This method creates an instance of the class"""
        for key, value in kwargs.items():
            if not hasattr(self, key):
                raise AttributeError(f'Attr \'{key}\' doesn\'t exist')
            setattr(self, key, value)

    def age(self):
        """This method returns the object's age"""
        delta = relativedelta(datetime.now(), self.genesis)
        return f'{delta.years}Y {delta.months}M {delta.days}D'

    def set_genesis(self, year, month, day):
        """This method sets the birth/founding date"""
        self.genesis = datetime(year=year, month=month, day=day).date()
