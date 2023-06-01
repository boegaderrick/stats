#!/usr/bin/python3
"""This module contains the team class"""
from src.base_class import BaseClass, DecBase
from sqlalchemy import Column, ForeignKey, Integer, String
from sqlalchemy.orm import relationship


class Team(BaseClass, DecBase):
    """Team class definition"""
    # DB Mapping
    __tablename__ = 'teams'
    championships = Column(Integer, default=0)
    country = Column(String(60), nullable=False)
    sport_id = Column(String(60), ForeignKey('sports.id'), nullable=False)

    # DB Relationships
    members = relationship('Athlete', backref='team')

    def __init__(self, **kwargs):
        """Team object instantiation"""
        super().__init__(**kwargs)
