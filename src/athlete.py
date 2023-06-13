#!/usr/bin/python3
"""This module contains athlete class definition"""
from src.base_class import BaseClass, DecBase
from sqlalchemy import Column, ForeignKey, Integer, String
from sqlalchemy.orm import relationship


class Athlete(BaseClass, DecBase):
    """Athlete class definition"""
    # DB Mapping
    __tablename__ = 'athletes'
    type = Column(String(30))
    __mapper_args__ = {
        'polymorphic_identity': 'Athlete',
        'polymorphic_on': type
    }

    # Class Attributes
    championships = Column(Integer, default=0)
    country = Column(String(60), nullable=False)
    gender = Column(String(60), nullable=False)
    salary = Column(String(60))
    sport_id = Column(String(60), ForeignKey('sports.id'), nullable=False)
    team_id = Column(String(60), ForeignKey('teams.id'))

    # DB Relationships
    sport = relationship('Sport', back_populates='athletes', lazy='joined')
    team = relationship('Team', back_populates='members', lazy='joined')

    def __init__(self, **kwargs):
        """Athlete object instantiation"""
        super().__init__(**kwargs)
