#!/usr/bin/python3
"""This module contains the formula 1 athletes class"""
from sqlalchemy import Column, ForeignKey, Integer, String
from src.athlete import Athlete, DecBase


class F1Driver(Athlete):
    """F1 driver class definition"""
    __tablename__ = 'f1_drivers'
    __mapper_args__ = {
        'polymorphic_identity': 'F1Driver'
    }
    id = Column(String(60), ForeignKey('athletes.id'), primary_key=True)
    podiums = Column(Integer, default=0)
    poles = Column(Integer, default=0)
    race_entries = Column(Integer, default=0)
    races_won = Column(Integer, default=0)
    racing_number = Column(Integer, nullable=False)

    def __init__(self, **kwargs):
        """F1 athlete object instantiation method"""
        super().__init__(**kwargs)
