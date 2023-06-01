#!/usr/bin/python3
"""This module contains athlete class definition"""
from base_class import BaseClass, DecBase
from sqlalchemy import Column, ForeignKey, Integer, String
from sqlalchemy.orm import relationship


class Athlete(BaseClass, DecBase):
    """Athlete class definition"""
    __tablename__ = 'athletes'
    championships = Column(Integer, default=0)
    country = Column(String(60), nullable=False)
    gender = Column(String(60), nullable=False)
    salary = Column(String(60))
    sport_id = Column(String(60), ForeignKey('sports.id'), nullable=False)
    team_id = Column(String(60), ForeignKey('teams.id'))

    def __init__(self, **kwargs):
        """Athlete object instantiation"""
        super().__init__(**kwargs)
