#!/usr/bin/python3
"""This module contains the team class"""
from sqlalchemy import Column, ForeignKey, Integer, String
from sqlalchemy.orm import relationship
from src.base_class import BaseClass, DecBase


class Team(BaseClass, DecBase):
    """Team class definition"""
    # DB Mapping
    __tablename__ = 'teams'
    championships = Column(Integer, default=0)
    country = Column(String(60), nullable=False)
    sport_id = Column(String(60), ForeignKey('sports.id'), nullable=False)

    # DB Relationships
    members = relationship('Athlete', back_populates='team', lazy='joined')
    sport = relationship('Sport', back_populates='teams', lazy='joined')

    def __init__(self, **kwargs):
        """Team object instantiation"""
        super().__init__(**kwargs)
