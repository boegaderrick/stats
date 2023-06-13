#!/usr/bin/python3
"""This module contains the sport class"""
from src.base_class import BaseClass, DecBase
from sqlalchemy.orm import relationship


class Sport(BaseClass, DecBase):
    """Sport class definition"""
    # DB Mapping
    __tablename__ = 'sports'

    # DB relationships
    athletes = relationship('Athlete', back_populates='sport', lazy='joined')
    teams = relationship('Team', back_populates='sport', lazy='joined')

    def __init__(self, **kwargs):
        """Sport object instantiation"""
        super().__init__(**kwargs)
