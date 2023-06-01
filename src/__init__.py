#!/usr/bin/python3
"""Reload data from database"""
from src.engine.database import Database

storage = Database()
storage.reload()
